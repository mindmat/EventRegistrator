﻿using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

using EventRegistrar.Backend.Authorization;
using EventRegistrar.Backend.Infrastructure.DataAccess;
using EventRegistrar.Backend.Infrastructure.ServiceBus;
using EventRegistrar.Backend.Mailing;
using EventRegistrar.Backend.Mailing.Compose;
using EventRegistrar.Backend.Payments.Refunds;
using EventRegistrar.Backend.Registrations;

using MediatR;

using Microsoft.EntityFrameworkCore;

namespace EventRegistrar.Backend.Payments.Differences
{
    public class RefundDifferenceCommand : IRequest, IEventBoundRequest
    {
        public Guid RegistrationId { get; set; }
        public Guid EventId { get; set; }
        public string Reason { get; set; }
    }

    public class RefundDifferenceCommandHandler : IRequestHandler<RefundDifferenceCommand>
    {
        private readonly ServiceBusClient _serviceBusClient;
        private readonly IQueryable<Registration> _registrations;
        private readonly IRepository<PayoutRequest> _payoutRequests;

        public RefundDifferenceCommandHandler(ServiceBusClient serviceBusClient,
                                              IQueryable<Registration> registrations,
                                              IRepository<PayoutRequest> payoutRequests)
        {
            _serviceBusClient = serviceBusClient;
            _registrations = registrations;
            _payoutRequests = payoutRequests;
        }

        public async Task<Unit> Handle(RefundDifferenceCommand command, CancellationToken cancellationToken)
        {
            var registration = await _registrations.Where(reg => reg.Id == command.RegistrationId)
                                                   .Include(reg => reg.Payments)
                                                   .FirstAsync(cancellationToken);
            var data = new TooMuchPaidMailData
            {
                Price = registration.Price ?? 0m,
                AmountPaid = registration.Payments.Sum(asn => asn.PayoutRequestId == null ? asn.Amount : -asn.Amount),
            };
            data.RefundAmount = data.AmountPaid - data.Price;
            if (data.RefundAmount <= 0m)
            {
                throw new Exception("Not too much paid");
            }

            var payoutRequest = new PayoutRequest
            {
                RegistrationId = command.RegistrationId,
                Amount = data.RefundAmount,
                Reason = command.Reason ?? "Refund of difference",
                State = PayoutState.Requested,
                Created = DateTimeOffset.Now
            };
            await _payoutRequests.InsertOrUpdateEntity(payoutRequest, cancellationToken);

            var sendMailCommand = new ComposeAndSendMailCommand
            {
                MailType = MailType.TooMuchPaid,
                RegistrationId = command.RegistrationId,
                Data = data
            };
            _serviceBusClient.SendMessage(sendMailCommand);

            return Unit.Value;
        }
    }

    public class TooMuchPaidMailData
    {
        public decimal Price { get; set; }
        public decimal AmountPaid { get; set; }
        public decimal RefundAmount { get; set; }
    }
}