﻿using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using EventRegistrar.Backend.Infrastructure.DataAccess;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;

namespace EventRegistrar.Backend.Mailing.Feedback
{
    public class ProcessMailEventsCommandHandler : IRequestHandler<ProcessMailEventsCommand>
    {
        private readonly ILogger _log;
        private readonly IRepository<MailEvent> _mailEvents;
        private readonly IRepository<Mail> _mails;
        private readonly IRepository<RawMailEvents> _rawMailEvents;

        public ProcessMailEventsCommandHandler(IRepository<RawMailEvents> rawMailEvents,
                                               IRepository<Mail> mails,
                                               IRepository<MailEvent> mailEvents,
                                               ILogger log)
        {
            _rawMailEvents = rawMailEvents;
            _mails = mails;
            _mailEvents = mailEvents;
            _log = log;
        }

        public async Task<Unit> Handle(ProcessMailEventsCommand command, CancellationToken cancellationToken)
        {
            var rawMailEvents = await _rawMailEvents.FirstAsync(mev => mev.Id == command.RawMailEventsId, cancellationToken);
            if (rawMailEvents.Processed)
            {
                _log.LogWarning("RawMailEvents with id {0} have already been processed", rawMailEvents.Id);
                return Unit.Value;
            }

            var events = JsonConvert.DeserializeObject<IEnumerable<SendGridEvent>>(rawMailEvents.Body);
            foreach (var sendGridEvent in events)
            {
                var mail = await GetMail(sendGridEvent);
                if (mail == null)
                {
                    continue;
                }

                // deduplication
                if (!string.IsNullOrEmpty(sendGridEvent.Sg_event_id))
                {
                    var existingEvent = await _mailEvents.FirstOrDefaultAsync(mev => mev.ExternalIdentifier == sendGridEvent.Sg_event_id, cancellationToken);
                    if (existingEvent != null)
                    {
                        _log.LogWarning("MailEvent {0} already exists", sendGridEvent.Sg_event_id);
                    }
                }

                if (!Enum.TryParse(sendGridEvent.Event, out MailState state))
                {
                    state = MailState.Unknown;
                }
                else
                {
                    mail.State = state;
                }

                var mailEvent = new MailEvent
                {
                    Id = Guid.NewGuid(),
                    Created = DateTime.UtcNow,
                    ExternalIdentifier = sendGridEvent.Sg_event_id,
                    MailId = mail.Id,
                    RawEvent = JsonConvert.SerializeObject(sendGridEvent),
                    State = state
                };
                await _mailEvents.InsertOrUpdateEntity(mailEvent, cancellationToken);
            }

            rawMailEvents.Processed = true;
            return Unit.Value;
        }

        /// <summary>
        /// example of a smtp-id: "<wRf27Si1SgOQhqYl0Iu4_A@ismtpd0002p1lon1.sendgrid.net>"
        /// extract wRf27Si1SgOQhqYl0Iu4_A
        /// </summary>
        private string ExtractMessageId(string smtp_Id)
        {
            if (smtp_Id == null)
            {
                return null;
            }

            var id = smtp_Id?.TrimStart('<');
            id = id.Substring(0, id.IndexOf('@'));
            return id;
        }

        private async Task<Mail> GetMail(SendGridEvent sendGridEvent)
        {
            if (Guid.TryParse(sendGridEvent.MailId, out var mailId))
            {
                var mail = await _mails.FirstOrDefaultAsync(mil => mil.Id == mailId);
                if (mail != null)
                {
                    return mail;
                }
            }
            // fallback to smtp-id
            var messageId = ExtractMessageId(sendGridEvent.Smtp_id);
            return await _mails.FirstOrDefaultAsync(mil => mil.SendGridMessageId == messageId);
        }
    }
}