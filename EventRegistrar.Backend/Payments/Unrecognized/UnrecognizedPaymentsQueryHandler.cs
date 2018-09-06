﻿using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using EventRegistrar.Backend.Events;
using MediatR;
using Microsoft.EntityFrameworkCore;

namespace EventRegistrar.Backend.Payments.Unrecognized
{
    public class UnrecognizedPaymentsQueryHandler : IRequestHandler<UnrecognizedPaymentsQuery, IEnumerable<PaymentDisplayItem>>
    {
        private readonly IEventAcronymResolver _acronymResolver;
        private readonly IQueryable<ReceivedPayment> _payments;

        public UnrecognizedPaymentsQueryHandler(IQueryable<ReceivedPayment> payments,
                                                IEventAcronymResolver acronymResolver)
        {
            _payments = payments;
            _acronymResolver = acronymResolver;
        }

        public async Task<IEnumerable<PaymentDisplayItem>> Handle(UnrecognizedPaymentsQuery request, CancellationToken cancellationToken)
        {
            var eventId = await _acronymResolver.GetEventIdFromAcronym(request.EventAcronym);
            var payments = await _payments
                                 .Where(rpy => rpy.PaymentFile.EventId == eventId &&
                                               rpy.RecognizedEmail == null && rpy.Amount - (rpy.Repaid ?? 0m) > 0)
                                 .Select(rpy => new PaymentDisplayItem
                                 {
                                     Id = rpy.Id,
                                     Amount = rpy.Amount,
                                     Assigned = rpy.Assignments.Sum(ass => ass.Amount),
                                     BookingDate = rpy.BookingDate,
                                     Currency = rpy.Currency,
                                     Info = rpy.Info,
                                     Reference = rpy.Reference,
                                     Repaid = rpy.Repaid,
                                     Settled = rpy.Settled
                                 })
                                 .ToListAsync(cancellationToken);
            return payments;
        }
    }
}