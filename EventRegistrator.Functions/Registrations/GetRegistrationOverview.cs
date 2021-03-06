using System;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using EventRegistrator.Functions.Infrastructure.DataAccess;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Azure.WebJobs.Host;

namespace EventRegistrator.Functions.Registrations
{
    public static class GetRegistrationOverview
    {
        [FunctionName("GetRegistrationOverview")]
        public static async Task<HttpResponseMessage> Run(
            [HttpTrigger(AuthorizationLevel.Anonymous, "get", Route = "registrations/{registrationIdString:guid}")]
            HttpRequestMessage req,
            string registrationIdString,
            TraceWriter log)
        {
            if (!Guid.TryParse(registrationIdString, out var registrationId))
            {
                return req.CreateErrorResponse(HttpStatusCode.NotFound, $"{registrationIdString} is not a guid");
            }

            using (var dbContext = new EventRegistratorDbContext())
            {
                var registration = await dbContext.Registrations.Where(reg => reg.Id == registrationId)
                    .Select(reg => new
                    {
                        reg.Id,
                        reg.IsWaitingList,
                        reg.Price,
                        Status = reg.State,
                        StatusText = reg.State.ToString(),
                        Paid = (decimal?)reg.Payments.Sum(ass => ass.Amount),
                        reg.Language,
                        reg.ReceivedAt,
                        reg.ReminderLevel,
                        reg.Remarks,
                        Email = reg.RespondentEmail, 
                        FirstName = reg.RespondentFirstName,
                        LastName = reg.RespondentLastName,
                        reg.SoldOutMessage,
                        reg.FallbackToPartyPass,
                        SmsCount = reg.Sms.Count,
                        reg.PhoneNormalized
                    })
                    .FirstOrDefaultAsync();

                return req.CreateResponse(HttpStatusCode.OK, registration);
            }
        }
    }
}