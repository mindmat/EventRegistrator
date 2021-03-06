﻿using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using EventRegistrar.Backend.Infrastructure;
using MediatR;
using Microsoft.EntityFrameworkCore;

namespace EventRegistrar.Backend.Mailing.Templates
{
    public class MailTemplatesQueryHandler : IRequestHandler<MailTemplatesQuery, IEnumerable<MailTemplateItem>>
    {
        private readonly IQueryable<MailTemplate> _mailTemplates;

        public MailTemplatesQueryHandler(IQueryable<MailTemplate> mailTemplates)
        {
            _mailTemplates = mailTemplates;
        }

        public async Task<IEnumerable<MailTemplateItem>> Handle(MailTemplatesQuery query, CancellationToken cancellationToken)
        {
            var templates = await _mailTemplates
                                  .Where(mtp => mtp.EventId == query.EventId
                                             && !mtp.IsDeleted)
                                  .WhereIf(query.TemplateGroup == TemplateGroup.BulkMail, mtp => mtp.BulkMailKey != null)
                                  .WhereIf(query.TemplateGroup == TemplateGroup.AutoGenerated, mtp => mtp.Type != 0)
                                  .OrderBy(mtp => mtp.Type)
                                  .ThenBy(mtp => mtp.Language)
                                  .Select(mtp => new MailTemplateItem
                                  {
                                      Id = mtp.Id,
                                      Key = mtp.BulkMailKey,
                                      Language = mtp.Language,
                                      Template = mtp.Template,
                                      SenderMail = mtp.SenderMail,
                                      SenderName = mtp.SenderName,
                                      Subject = mtp.Subject,
                                      Audience = mtp.MailingAudience,
                                      Type = mtp.Type,
                                      ReleaseImmediately = mtp.ReleaseImmediately,
                                      MailsReadyCount = mtp.Mails.Count(mail => mail.Sent == null),
                                      MailsSentCount = mtp.Mails.Count(mail => mail.Sent != null)
                                  })
                                  .ToListAsync(cancellationToken);

            return templates;
        }
    }
}