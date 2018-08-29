﻿using System.Collections.Generic;
using System.Threading.Tasks;
using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace EventRegistrar.Backend.Mailing.Templates
{
    public class MailTemplatesController : Controller
    {
        private readonly IMediator _mediator;

        public MailTemplatesController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpGet("api/events/{eventAcronym}/mails/languages")]
        public Task<IEnumerable<LanguageItem>> GetLanguages(string eventAcronym)
        {
            return _mediator.Send(new LanguagesQuery { EventAcronym = eventAcronym });
        }

        [HttpGet("api/events/{eventAcronym}/mailTemplates")]
        public Task<IEnumerable<MailTemplateItem>> GetMailTemplatesOfRegistration(string eventAcronym)
        {
            return _mediator.Send(new MailTemplatesQuery { EventAcronym = eventAcronym });
        }

        [HttpGet("api/events/{eventAcronym}/mails/types")]
        public Task<IEnumerable<MailTypeItem>> GetMailTypes(string eventAcronym)
        {
            return _mediator.Send(new MailTypesQuery { EventAcronym = eventAcronym });
        }

        [HttpPost("api/events/{eventAcronym}/mailTemplates")]
        public Task SaveMailTemplate(string eventAcronym, [FromBody]MailTemplateItem template)
        {
            return _mediator.Send(new SaveMailTemplateCommand { EventAcronym = eventAcronym, Template = template });
        }
    }
}