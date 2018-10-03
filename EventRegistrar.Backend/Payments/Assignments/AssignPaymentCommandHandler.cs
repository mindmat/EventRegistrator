﻿using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using EventRegistrar.Backend.Events.UsersInEvents;
using EventRegistrar.Backend.Infrastructure.DataAccess;
using EventRegistrar.Backend.Infrastructure.Events;
using EventRegistrar.Backend.Registrations;
using EventRegistrar.Backend.Registrations.IndividualReductions;
using MediatR;
using Microsoft.EntityFrameworkCore;

namespace EventRegistrar.Backend.Payments.Assignments
{
    public class AssignPaymentCommandHandler : IRequestHandler<AssignPaymentCommand>
    {
        private readonly IRepository<PaymentAssignment> _assignments;
        private readonly EventBus _eventBus;
        private readonly IRepository<IndividualReduction> _individualReductions;
        private readonly IQueryable<ReceivedPayment> _payments;
        private readonly IQueryable<Registration> _registrations;
        private readonly AuthenticatedUserId _userId;

        public AssignPaymentCommandHandler(IQueryable<Registration> registrations,
                                           IQueryable<ReceivedPayment> payments,
                                           IRepository<PaymentAssignment> assignments,
                                           IRepository<IndividualReduction> individualReductions,
                                           EventBus eventBus,
                                           AuthenticatedUserId userId)
        {
            _registrations = registrations;
            _payments = payments;
            _assignments = assignments;
            _individualReductions = individualReductions;
            _eventBus = eventBus;
            _userId = userId;
        }

        public async Task<Unit> Handle(AssignPaymentCommand command, CancellationToken cancellationToken)
        {
            var registration = await _registrations.Where(reg => reg.Id == command.RegistrationId)
                                                   .Include(reg => reg.Payments)
                                                   .Include(reg => reg.IndividualReductions)
                                                   .FirstAsync(cancellationToken);
            var payment = await _payments.FirstAsync(pmt => pmt.Id == command.PaymentId, cancellationToken);

            var assignment = new PaymentAssignment
            {
                Id = Guid.NewGuid(),
                RegistrationId = registration.Id,
                ReceivedPaymentId = payment.Id,
                Amount = command.Amount
            };
            await _assignments.InsertOrUpdateEntity(assignment, cancellationToken);

            if (command.AcceptDifference)
            {
                var difference = (registration.Price ?? 0m)
                                 - registration.Payments.Sum(pmt => pmt.Amount)
                                 - registration.IndividualReductions.Sum(pmt => pmt.Amount);
                await _individualReductions.InsertOrUpdateEntity(new IndividualReduction
                {
                    Id = Guid.NewGuid(),
                    RegistrationId = registration.Id,
                    Amount = difference,
                    Reason = command.AcceptDifferenceReason,
                    UserId = _userId.UserId ?? Guid.Empty
                }, cancellationToken);
            }

            _eventBus.Publish(new PaymentAssignedEvent
            {
                RegistrationId = assignment.RegistrationId,
                PaymentId = assignment.ReceivedPaymentId
            });

            return Unit.Value;
        }
    }
}