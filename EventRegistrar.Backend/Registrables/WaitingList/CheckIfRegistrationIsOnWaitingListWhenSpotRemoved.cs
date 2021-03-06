﻿using System.Collections.Generic;

using EventRegistrar.Backend.Infrastructure.DomainEvents;
using EventRegistrar.Backend.Spots;

using MediatR;

namespace EventRegistrar.Backend.Registrables.WaitingList
{
    public class CheckIfRegistrationIsOnWaitingListWhenSpotRemoved : IEventToCommandTranslation<SpotRemoved>
    {
        public IEnumerable<IRequest> Translate(SpotRemoved e)
        {
            if (e.Reason == RemoveSpotReason.Modification)
            {
                yield return new CheckIfRegistrationIsPromotedCommand { RegistrationId = e.RegistrationId };
            }
        }
    }
}