﻿using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

using EventRegistrar.Backend.Authorization;
using EventRegistrar.Backend.Registrables;
using EventRegistrar.Backend.Registrations;
using EventRegistrar.Backend.Registrations.Register;

using MediatR;

using Microsoft.EntityFrameworkCore;

namespace EventRegistrar.Backend.Spots
{
    public class AddSpotCommand : IRequest, IEventBoundRequest
    {
        public bool AsFollower { get; set; }
        public Guid EventId { get; set; }
        public Guid RegistrableId { get; set; }
        public Guid RegistrationId { get; set; }
    }

    public class AddSpotCommandHandler : IRequestHandler<AddSpotCommand>
    {
        private readonly IQueryable<Registrable> _registrables;
        private readonly IQueryable<Registration> _registrations;
        private readonly SpotManager _spotManager;

        public AddSpotCommandHandler(IQueryable<Registration> registrations,
                                     IQueryable<Registrable> registrables,
                                     SpotManager spotManager)
        {
            _registrations = registrations;
            _registrables = registrables;
            _spotManager = spotManager;
        }

        public async Task<Unit> Handle(AddSpotCommand command, CancellationToken cancellationToken)
        {
            var registration = await _registrations.FirstAsync(reg => reg.Id == command.RegistrationId
                                                                   && reg.EventId == command.EventId,
                                                               cancellationToken);
            var registrable = await _registrables.Where(rbl => rbl.Id == command.RegistrableId
                                                            && rbl.EventId == command.EventId)
                                                 .Include(rbl => rbl.Spots)
                                                 .FirstAsync(cancellationToken);
            if (registrable.MaximumDoubleSeats.HasValue)
            {
                await _spotManager.ReserveSinglePartOfPartnerSpot(command.EventId,
                                                                  registrable.Id,
                                                                  registration.Id,
                                                                  new RegistrationIdentification(registration),
                                                                  null,
                                                                  command.AsFollower ? Role.Follower : Role.Leader,
                                                                  false);
            }
            else
            {
                await _spotManager.ReserveSingleSpot(command.EventId,
                                                     registrable.Id,
                                                     registration.Id,
                                                     false);
            }

            return Unit.Value;
        }
    }
}