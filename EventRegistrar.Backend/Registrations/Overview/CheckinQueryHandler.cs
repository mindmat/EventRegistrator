﻿using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using EventRegistrar.Backend.Events.Context;
using EventRegistrar.Backend.Infrastructure;
using EventRegistrar.Backend.Registrables;
using MediatR;
using Microsoft.EntityFrameworkCore;

namespace EventRegistrar.Backend.Registrations.Overview
{
    public class CheckinQueryHandler : IRequestHandler<CheckinQuery, CheckinView>
    {
        private readonly EventContext _eventContext;
        private readonly IQueryable<Registrable> _registrables;
        private readonly IQueryable<Registration> _registrations;

        public CheckinQueryHandler(IQueryable<Registration> registrations,
                                   IQueryable<Registrable> registrables,
                                   EventContext eventContext)
        {
            _registrations = registrations;
            _registrables = registrables;
            _eventContext = eventContext;
        }

        public async Task<CheckinView> Handle(CheckinQuery query, CancellationToken cancellationToken)
        {
            var columns = await _registrables.Where(rbl => rbl.EventId == _eventContext.EventId
                                                        && rbl.CheckinListColumn != null)
                                             .GroupBy(rbl => rbl.CheckinListColumn)
                                             .ToDictionaryAsync(grp => grp.Key, grp => grp.Select(rbl => new { rbl.Id, rbl.Name }), cancellationToken);
            var registrations = await _registrations
                                      .Where(reg => reg.RegistrationForm.EventId == _eventContext.EventId
                                                 && reg.IsWaitingList == false
                                                 && reg.State != RegistrationState.Cancelled)
                                      .Select(reg => new
                                      {
                                          RegistrationId = reg.Id,
                                          Email = reg.RespondentEmail,
                                          FirstName = reg.RespondentFirstName,
                                          LastName = reg.RespondentLastName,
                                          reg.State,
                                          reg.AdmittedAt,
                                          Price = reg.Price ?? 0m,
                                          Paid = reg.Payments.Select(ass => ass.Amount).DefaultIfEmpty(0m).Sum(),
                                          SeatsAsLeader = reg.Seats_AsLeader.Where(seat => !seat.IsCancelled),
                                          SeatsAsFollower = reg.Seats_AsFollower.Where(seat => !seat.IsCancelled)
                                      })
                                      .ToListAsync(cancellationToken);
            var items = registrations
                        .Select(reg => new CheckinViewItem
                        {
                            RegistrationId = reg.RegistrationId,
                            Email = reg.Email,
                            FirstName = reg.FirstName,
                            LastName = reg.LastName,
                            Status = reg.State.ToString(),
                            AdmittedAt = reg.AdmittedAt,
                            UnsettledAmount = reg.Price - reg.Paid,
                            Columns = columns
                                      .ToDictionary(col => col.Key,
                                                    col => col.Value.Where(rbl => reg.SeatsAsLeader.Any(seat => seat.RegistrableId == rbl.Id)
                                                                               || reg.SeatsAsFollower.Any(seat => seat.RegistrableId == rbl.Id))
                                                                    .Select(rbl => rbl.Name)
                                                                    .StringJoin()),
                        })
                        .OrderBy(reg => reg.AdmittedAt)
                        .ToList();

            return new CheckinView
            {
                DynamicHeaders = columns.Keys,
                Items = items
            };
        }
    }
}