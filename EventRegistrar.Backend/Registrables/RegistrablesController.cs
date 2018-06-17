﻿using System.Collections.Generic;
using System.Threading.Tasks;
using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace EventRegistrar.Backend.Registrables
{
    public class RegistrablesController : Controller
    {
        private readonly IMediator _mediator;

        public RegistrablesController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpGet("api/events/{eventAcronym}/DoubleRegistrableOverview")]
        public Task<IEnumerable<DoubleRegistrableDisplayItem>> GetDoubleRegistrablesOverivew(string eventAcronym)
        {
            return _mediator.Send(new DoubleRegistrablesOverviewQuery { EventAcronym = eventAcronym });
        }

        [HttpGet("api/events/{eventAcronym}/SingleRegistrableOverview")]
        public Task<IEnumerable<SingleRegistrableDisplayItem>> GetSingleRegistrablesOverivew(string eventAcronym)
        {
            return _mediator.Send(new SingleRegistrablesOverviewQuery { EventAcronym = eventAcronym });
        }
    }
}