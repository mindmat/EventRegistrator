﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using EventRegistrar.Backend.Infrastructure.DataAccess;
using EventRegistrar.Backend.Infrastructure.ServiceBus;
using EventRegistrar.Backend.Mailing;
using EventRegistrar.Backend.Mailing.Compose;
using EventRegistrar.Backend.RegistrationForms.Questions.Mappings;
using EventRegistrar.Backend.Registrations.Price;
using EventRegistrar.Backend.Spots;

using Microsoft.EntityFrameworkCore;

namespace EventRegistrar.Backend.Registrations.Register
{
    public class PartnerRegistrationProcessor
    {
        private readonly IQueryable<QuestionOptionToRegistrableMapping> _optionToRegistrableMappings;
        private readonly PhoneNormalizer _phoneNormalizer;
        private readonly PriceCalculator _priceCalculator;
        private readonly IRepository<Registration> _registrations;
        private readonly SeatManager _seatManager;
        private readonly ServiceBusClient _serviceBusClient;

        public PartnerRegistrationProcessor(PhoneNormalizer phoneNormalizer,
                                           IQueryable<QuestionOptionToRegistrableMapping> optionToRegistrableMappings,
                                           SeatManager seatManager,
                                           IRepository<Registration> registrations,
                                           PriceCalculator priceCalculator,
                                           ServiceBusClient serviceBusClient)
        {
            _phoneNormalizer = phoneNormalizer;
            _optionToRegistrableMappings = optionToRegistrableMappings;
            _seatManager = seatManager;
            _registrations = registrations;
            _priceCalculator = priceCalculator;
            _serviceBusClient = serviceBusClient;
        }

        public async Task<IEnumerable<Seat>> Process(Registration registration, PartnerRegistrationProcessConfiguration config)
        {
            registration.RespondentFirstName = registration.Responses.FirstOrDefault(rsp => rsp.QuestionId == config.QuestionId_Leader_FirstName)?.ResponseString;
            registration.RespondentLastName = registration.Responses.FirstOrDefault(rsp => rsp.QuestionId == config.QuestionId_Leader_LastName)?.ResponseString;
            registration.RespondentEmail = registration.Responses.FirstOrDefault(rsp => rsp.QuestionId == config.QuestionId_Leader_Email)?.ResponseString;
            if (config.LanguageMappings != null)
            {
                registration.Language = config.LanguageMappings.FirstOrDefault(map => registration.Responses.Any(rsp => rsp.QuestionOptionId == map.QuestionOptionId)).Language;
            }

            if (config.QuestionId_Leader_Phone.HasValue)
            {
                registration.Phone = registration.Responses.FirstOrDefault(rsp => rsp.QuestionId == config.QuestionId_Leader_Phone.Value)?.ResponseString;
                registration.PhoneNormalized = _phoneNormalizer.NormalizePhone(registration.Phone);
            }

            var followerRegistration = new Registration
            {
                Id = Guid.NewGuid(),
                EventId = registration.EventId,
                ExternalTimestamp = registration.ExternalTimestamp,
                RespondentFirstName = registration.Responses.FirstOrDefault(rsp => rsp.QuestionId == config.QuestionId_Follower_FirstName)?.ResponseString,
                RespondentLastName = registration.Responses.FirstOrDefault(rsp => rsp.QuestionId == config.QuestionId_Follower_LastName)?.ResponseString,
                RespondentEmail = registration.Responses.FirstOrDefault(rsp => rsp.QuestionId == config.QuestionId_Follower_Email)?.ResponseString,
                ExternalIdentifier = registration.ExternalIdentifier,
                ReceivedAt = registration.ReceivedAt,
                RegistrationFormId = registration.RegistrationFormId,
                RegistrationId_Partner = registration.Id,
                Language = registration.Language,
                State = RegistrationState.Received
            };
            if (config.QuestionId_Follower_Phone.HasValue)
            {
                followerRegistration.Phone = registration.Responses.FirstOrDefault(rsp => rsp.QuestionId == config.QuestionId_Follower_Phone.Value)?.ResponseString;
                followerRegistration.PhoneNormalized = _phoneNormalizer.NormalizePhone(followerRegistration.Phone);
            }

            registration.RegistrationId_Partner = followerRegistration.Id;

            var spots = new List<Seat>();

            var questionOptionIds = new HashSet<Guid>(registration.Responses.Where(rsp => rsp.QuestionOptionId.HasValue).Select(rsp => rsp.QuestionOptionId.Value));
            var roleSpecificRegistrableIds = config.RoleSpecificMappings?.Select(rsm => rsm.RegistrableId).ToHashSet();
            var registrables = await _optionToRegistrableMappings
                                            .Where(map => map.Registrable.EventId == registration.EventId
                                                       && (questionOptionIds.Contains(map.QuestionOptionId)
                                                        || roleSpecificRegistrableIds != null && roleSpecificRegistrableIds.Contains(map.RegistrableId)))
                                            .Include(map => map.Registrable)
                                            .Include(map => map.Registrable.Seats)
                                            .ToListAsync();
            foreach (var response in registration.Responses.Where(rsp => rsp.QuestionOptionId.HasValue))
            {
                foreach (var registrable in registrables.Where(rbl => rbl.QuestionOptionId == response.QuestionOptionId))
                {
                    var seat = registrable.Registrable.MaximumDoubleSeats.HasValue
                        ? await _seatManager.ReservePartnerSpot(registration.EventId, registrable.Registrable, registration.Id, followerRegistration.Id, true)
                        : await _seatManager.ReserveSingleSpot(registration.EventId, registrable.Registrable, registration.Id, true);

                    if (seat == null)
                    {
                        registration.SoldOutMessage = (registration.SoldOutMessage == null ? string.Empty : registration.SoldOutMessage + Environment.NewLine) +
                                                      string.Format(Properties.Resources.RegistrableSoldOut, registrable.Registrable.Name);
                    }
                    else
                    {
                        spots.Add(seat);
                    }
                }
            }
            if (config.RoleSpecificMappings != null)
            {
                foreach (var roleSpecificMapping in config.RoleSpecificMappings.Where(rsm => registration.Responses.Any(rsp => rsp.QuestionOptionId == rsm.QuestionOptionId)))
                {
                    var registrable = registrables.First(rbl => rbl.RegistrableId == roleSpecificMapping.RegistrableId);
                    var registrationId = roleSpecificMapping.Role == Role.Leader
                                         ? registration.Id
                                         : followerRegistration.Id;
                    var seat = await _seatManager.ReserveSingleSpot(registration.EventId, registrable.Registrable, registrationId, false);
                    if (seat == null)
                    {
                        registration.SoldOutMessage = (registration.SoldOutMessage == null ? string.Empty : registration.SoldOutMessage + Environment.NewLine) +
                                                      string.Format(Properties.Resources.RegistrableSoldOut, registrable.Registrable.Name);
                    }
                    else
                    {
                        spots.Add(seat);
                    }
                }
            }

            var isOnWaitingList = spots.Any(seat => seat.IsWaitingList);

            // finalize follower registration
            followerRegistration.IsWaitingList = isOnWaitingList;
            if (followerRegistration.IsWaitingList == false && !followerRegistration.AdmittedAt.HasValue)
            {
                followerRegistration.AdmittedAt = DateTime.UtcNow;
            }

            followerRegistration.OriginalPrice = await _priceCalculator.CalculatePrice(followerRegistration, registration.Responses, spots);
            followerRegistration.Price = followerRegistration.OriginalPrice;

            await _registrations.InsertOrUpdateEntity(followerRegistration);

            // finalize leader registration
            registration.IsWaitingList = isOnWaitingList;
            if (registration.IsWaitingList == false && !registration.AdmittedAt.HasValue)
            {
                registration.AdmittedAt = DateTime.UtcNow;
            }

            registration.OriginalPrice = await _priceCalculator.CalculatePrice(registration, registration.Responses, spots);
            registration.Price = registration.OriginalPrice;

            await _registrations.InsertOrUpdateEntity(registration);

            // send mail
            var mailType = isOnWaitingList
                ? MailType.PartnerRegistrationMatchedOnWaitingList
                : MailType.PartnerRegistrationMatchedAndAccepted;
            _serviceBusClient.SendMessage(new ComposeAndSendMailCommand
            {
                MailType = mailType,
                RegistrationId = registration.Id,
                //Withhold = true,
                AllowDuplicate = false
            });

            return spots;
        }
    }
}