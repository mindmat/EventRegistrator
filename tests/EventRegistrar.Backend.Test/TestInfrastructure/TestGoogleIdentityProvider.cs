﻿using EventRegistrar.Backend.Authentication;
using EventRegistrar.Backend.Events.UsersInEvents;
using EventRegistrar.Backend.Infrastructure.DataAccess.Migrations;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;

namespace EventRegistrar.Backend.Test.TestInfrastructure
{
    public class TestGoogleIdentityProvider : IIdentityProvider
    {
        public const string TestHeaderUserId = "TestHeaderUserId";
        public const string TestInjectedUser = "TestInjectedUser";
        private readonly TestScenario _testScenario;

        public TestGoogleIdentityProvider(TestScenario testScenario)
        {
            _testScenario = testScenario;
        }

        public IdentityProvider Provider => IdentityProvider.Google;

        public string GetIdentifier(IHttpContextAccessor contextAccessor)
        {
            return contextAccessor.HttpContext?.Request?.Headers?[TestHeaderUserId];
        }

        public AuthenticatedUser GetUser(IHttpContextAccessor contextAccessor)
        {
            var identifier = GetIdentifier(contextAccessor);
            if (identifier == _testScenario.Administrator.IdentityProviderUserIdentifier)
            {
                return new AuthenticatedUser(Provider,
                                             _testScenario.Administrator.IdentityProviderUserIdentifier,
                                             _testScenario.Administrator.FirstName,
                                             _testScenario.Administrator.LastName,
                                             _testScenario.Administrator.Email);
            }

            if (identifier == _testScenario.Reader.IdentityProviderUserIdentifier)
            {
                return new AuthenticatedUser(Provider,
                                             _testScenario.Reader.IdentityProviderUserIdentifier,
                                             _testScenario.Reader.FirstName,
                                             _testScenario.Reader.LastName,
                                             _testScenario.Reader.Email);
            }

            var injectedUser = contextAccessor.HttpContext?.Request?.Headers?[TestInjectedUser];
            if (injectedUser.HasValue)
            {
                return JsonConvert.DeserializeObject<AuthenticatedUser>(injectedUser);
            }

            return AuthenticatedUser.None;
        }
    }
}