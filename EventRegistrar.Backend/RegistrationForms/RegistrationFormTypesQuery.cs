﻿using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;

using MediatR;

namespace EventRegistrar.Backend.RegistrationForms
{
    public enum FormType
    {
        Single = 1,
        Partner = 2
    }
    public class RegistrationFormType
    {
        public FormType Type { get; set; }
        public string Name { get; set; }
    }

    public class RegistrationFormTypesQuery : IRequest<IEnumerable<RegistrationFormType>> { }

    public class RegistrationFormTypesQueryHandler : IRequestHandler<RegistrationFormTypesQuery, IEnumerable<RegistrationFormType>>
    {
        public Task<IEnumerable<RegistrationFormType>> Handle(RegistrationFormTypesQuery request, CancellationToken cancellationToken)
        {
            var items = new[]
            {
                new RegistrationFormType { Type = FormType.Single, Name = "Einzelanmeldung"},
                new RegistrationFormType { Type = FormType.Partner, Name = "Partneranmeldung" },
            } as IEnumerable<RegistrationFormType>;
            return Task.FromResult(items);
        }
    }
}