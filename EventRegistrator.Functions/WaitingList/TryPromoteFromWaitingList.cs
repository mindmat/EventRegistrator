using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using EventRegistrator.Functions.Infrastructure.Bus;
using EventRegistrator.Functions.Infrastructure.DataAccess;
using EventRegistrator.Functions.Mailing;
using EventRegistrator.Functions.Registrables;
using EventRegistrator.Functions.Seats;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Host;
using Microsoft.ServiceBus.Messaging;

namespace EventRegistrator.Functions.WaitingList
{
    public static class TryPromoteFromWaitingList
    {
        public const string TryPromoteFromWaitingListQueueName = "TryPromoteFromWaitingList";

        [FunctionName("TryPromoteFromWaitingList")]
        public static async Task Run([ServiceBusTrigger(TryPromoteFromWaitingListQueueName, AccessRights.Listen, Connection = "ServiceBusEndpoint")]
         TryPromoteFromWaitingListCommand command,
           TraceWriter log)
        {
            log.Info($"TryPromoteFromWaitingList triggered: registrableId {command.RegistrableId}");

            var registrationIdsToCheck = new List<Guid?>();
            using (var context = new EventRegistratorDbContext())
            {
                var registrableToCheck = await context.Registrables.Where(rbl => rbl.Id == command.RegistrableId)
                                                                   .Include(rbl => rbl.Seats)
                                                                   .FirstOrDefaultAsync();
                registrationIdsToCheck.AddRange(await TryPromoteFromRegistrableWaitingList(registrableToCheck, context, log));
                await context.SaveChangesAsync();
            }

            foreach (var registrationId in registrationIdsToCheck.Where(id => id.HasValue))
            {
                await ServiceBusClient.SendEvent(new ComposeAndSendMailCommand { RegistrationId = registrationId.Value, Withhold = true }, ComposeAndSendMailCommandHandler.ComposeAndSendMailCommandsQueueName);
                await ServiceBusClient.SendEvent(new CheckIsWaitingListCommand { RegistrationId = registrationId.Value }, CheckIsWaitingListCommandHandler.CheckIsWaitingListCommandsQueueName);
            }
        }

        private static async Task<IEnumerable<Guid?>> TryPromoteFromRegistrableWaitingList(Registrable registrable, EventRegistratorDbContext dbContext, TraceWriter log)
        {
            var registrationIdsToCheck = new List<Guid?>();
            var seats = registrable.Seats.Where(seat => !seat.IsCancelled).ToList();
            if (registrable.MaximumSingleSeats.HasValue)
            {
                var acceptedSeatCount = seats.Count(seat => !seat.IsWaitingList);
                var seatsLeft = registrable.MaximumSingleSeats.Value - acceptedSeatCount;
                if (seatsLeft > 0)
                {
                    return await AcceptSingleSeatsFromWaitingList(seats.Where(seat => seat.IsWaitingList).OrderBy(seat => seat.FirstPartnerJoined).Take(seatsLeft), dbContext, log);
                }
            }
            else if (registrable.MaximumDoubleSeats.HasValue)
            {
                // try match single leaders and followers
                var singleSeats = seats.Where(seat => seat.PartnerEmail == null).ToList();
                var acceptedSingleLeaders = singleSeats.Where(seat => !seat.IsWaitingList &&
                                                                      !seat.RegistrationId_Follower.HasValue)
                                                       .ToList();
                var acceptedSingleFollowers = singleSeats.Where(seat => !seat.IsWaitingList &&
                                                                        !seat.RegistrationId.HasValue)
                                                         .ToList();

                var waitingFollowers = new Queue<Seat>(singleSeats.Where(seat => seat.IsWaitingList &&
                                                                                 !seat.RegistrationId.HasValue)
                                                                  .OrderBy(seat => seat.FirstPartnerJoined)
                                                                  .ToList());
                var waitingLeaders = new Queue<Seat>(singleSeats.Where(seat => seat.IsWaitingList &&
                                                                               !seat.RegistrationId_Follower.HasValue)
                                                                .OrderBy(seat => seat.FirstPartnerJoined)
                                                                .ToList());
                log.Info($"Registrable {registrable.Name}, single leaders in {acceptedSingleLeaders.Count}, single followers in {acceptedSingleFollowers.Count}, single leaders waiting {waitingLeaders.Count}, single followers waiting {waitingFollowers.Count}");
                var singleRegistrationsPromoted = false;
                if (acceptedSingleLeaders.Any() && waitingFollowers.Any())
                {
                    foreach (var acceptedSingleLeader in acceptedSingleLeaders)
                    {
                        if (!waitingFollowers.Any())
                        {
                            // no more waiting followers
                            break;
                        }
                        var waitingFollower = waitingFollowers.Dequeue();
                        var registrationId = waitingFollower.RegistrationId_Follower;
                        acceptedSingleLeader.RegistrationId_Follower = registrationId;
                        dbContext.Seats.Remove(waitingFollower);
                        registrationIdsToCheck.Add(registrationId);
                        await SetRegistrationNotOnWaitingListAnymore(registrationId, dbContext, log);
                        singleRegistrationsPromoted = true;
                    }
                }

                if (acceptedSingleFollowers.Any() && waitingLeaders.Any())
                {
                    foreach (var acceptedSingleFollower in acceptedSingleFollowers)
                    {
                        if (!waitingLeaders.Any())
                        {
                            // no more waiting followers
                            break;
                        }
                        var waitingLeader = waitingLeaders.Dequeue();
                        var registrationId = waitingLeader.RegistrationId;
                        acceptedSingleFollower.RegistrationId = registrationId;
                        dbContext.Seats.Remove(waitingLeader);
                        registrationIdsToCheck.Add(registrationId);
                        await SetRegistrationNotOnWaitingListAnymore(registrationId, dbContext, log);
                        singleRegistrationsPromoted = true;
                    }
                }

                // be defenisve - registrable.Seats might be inconsistent with the actual seats on the db
                if (!singleRegistrationsPromoted)
                {
                    // try promote partner registration
                    // ToDo: precedence partner vs. single registrations
                    var acceptedSeatCount = seats.Count(seat => !seat.IsWaitingList);
                    var seatsLeft = registrable.MaximumDoubleSeats.Value - acceptedSeatCount;
                    if (seatsLeft > 0)
                    {
                        return AcceptPartnerSeatsFromWaitingList(registrable, seatsLeft, log);
                    }
                }
            }
            return registrationIdsToCheck;
        }

        private static IEnumerable<Guid?> AcceptPartnerSeatsFromWaitingList(Registrable registrable, int seatsLeft, TraceWriter log)
        {
            var seatsToAccept = registrable.Seats
                                           .Where(seat => seat.IsWaitingList && !seat.IsCancelled)
                                           .OrderByDescending(seat => seat.RegistrationId.HasValue && seat.RegistrationId_Follower.HasValue)
                                           .ThenBy(seat => seat.FirstPartnerJoined);
            foreach (var seat in seatsToAccept)
            {
                if (seat.PartnerEmail == null)
                {
                    // single registration, check imbalance
                    var ownRole = seat.RegistrationId.HasValue ? Role.Leader : Role.Follower;
                    if (!ImbalanceManager.CanAddNewDoubleSeatForSingleRegistration(registrable, ownRole))
                    {
                        continue;
                    }
                }
                seat.IsWaitingList = false;
                if (seat.RegistrationId.HasValue)
                {
                    yield return seat.RegistrationId;
                }
                if (seat.RegistrationId_Follower.HasValue)
                {
                    yield return seat.RegistrationId_Follower;
                }
                if (--seatsLeft <= 0)
                {
                    yield break;
                }
            }
        }

        private static async Task<IEnumerable<Guid?>> AcceptSingleSeatsFromWaitingList(IEnumerable<Seat> seatsToAccept, EventRegistratorDbContext dbContext, TraceWriter log)
        {
            var registrationIdsToCheck = new List<Guid?>();
            foreach (var seat in seatsToAccept)
            {
                seat.IsWaitingList = false;
                await SetRegistrationNotOnWaitingListAnymore(seat.RegistrationId, dbContext, log);
                registrationIdsToCheck.Add(seat.RegistrationId);
            }
            return registrationIdsToCheck;
        }

        private static async Task SetRegistrationNotOnWaitingListAnymore(Guid? registrationId, EventRegistratorDbContext dbContext, TraceWriter log)
        {
            if (!registrationId.HasValue)
            {
                return;
            }

            var registration = await dbContext.Registrations.FirstOrDefaultAsync(reg => reg.Id == registrationId);

            if (registration == null)
            {
                log.Info($"No registration found with id {registrationId}");
            }
            else
            {
                registration.IsWaitingList = false;
                if (!registration.AdmittedAt.HasValue)
                {
                    registration.AdmittedAt = DateTime.UtcNow;
                }

            }
        }
    }
}