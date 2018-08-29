﻿using System.Collections.Generic;
using EventRegistrar.Backend.Authorization;
using MediatR;

namespace EventRegistrar.Backend.Mailing.Templates
{
    public class MailTypesQuery : IRequest<IEnumerable<MailTypeItem>>, IEventBoundRequest
    {
        public string EventAcronym { get; set; }
    }
}