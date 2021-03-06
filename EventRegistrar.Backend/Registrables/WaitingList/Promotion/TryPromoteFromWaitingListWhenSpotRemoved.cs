﻿using System.Collections.Generic;
using EventRegistrar.Backend.Infrastructure.DomainEvents;
using EventRegistrar.Backend.Infrastructure.ServiceBus;
using EventRegistrar.Backend.Spots;
using MediatR;

namespace EventRegistrar.Backend.Registrables.WaitingList
{
    public class TryPromoteFromWaitingListWhenSpotRemoved : IEventToCommandTranslation<SpotRemoved>
    {
        public IEnumerable<IRequest> Translate(SpotRemoved e)
        {
            if (e.WasSpotOnWaitingList && e.Reason == RemoveSpotReason.Modification)
            {
                yield return new TryPromoteFromWaitingListCommand { RegistrableId = e.RegistrableId };
            }
        }
    }
}