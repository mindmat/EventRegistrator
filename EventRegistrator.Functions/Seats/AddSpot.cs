using System;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using EventRegistrator.Functions.Infrastructure.Bus;
using EventRegistrator.Functions.Infrastructure.DataAccess;
using EventRegistrator.Functions.WaitingList;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Azure.WebJobs.Host;

namespace EventRegistrator.Functions.Seats
{
    public static class AddSpot
    {
        [FunctionName("AddSpot")]
        public static async Task<HttpResponseMessage> Run([HttpTrigger(AuthorizationLevel.Anonymous, "post", Route = "registrations/{registrationIdString:guid}/addSpot")]
        HttpRequestMessage req,
          string registrationIdString,
          TraceWriter log)
        {
            var registrationId = Guid.Parse(registrationIdString);
            var registrableId = Guid.Parse(req.GetQueryNameValuePairs().FirstOrDefault(kvp => string.Compare(kvp.Key, "registrableId", StringComparison.OrdinalIgnoreCase) == 0).Value);

            using (var dbContext = new EventRegistratorDbContext())
            {
                var registration = await dbContext.Registrations.FirstOrDefaultAsync(reg => reg.Id == registrationId);
                var spot = new Seat
                {
                    Id = Guid.NewGuid(),
                    FirstPartnerJoined = registration.ReceivedAt,
                    RegistrableId = registrableId,
                    RegistrationId = registrationId
                };
                dbContext.Seats.Add(spot);
                await dbContext.SaveChangesAsync();

                await PriceCalculator.CalculatePrice(registrationId, true, log);
                await ServiceBusClient.SendEvent(new CheckIsWaitingListCommand { RegistrationId = registrationId }, CheckIsWaitingListCommandHandler.CheckIsWaitingListCommandsQueueName);

                return req.CreateResponse(HttpStatusCode.OK);
            }
        }
    }
}
