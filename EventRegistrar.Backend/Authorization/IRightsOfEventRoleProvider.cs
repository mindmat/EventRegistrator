﻿using System;
using System.Collections.Generic;
using EventRegistrar.Backend.Events.UsersInEvents;
using EventRegistrar.Backend.Registrables;

namespace EventRegistrar.Backend.Authorization
{
    internal interface IRightsOfEventRoleProvider
    {
        IEnumerable<string> GetRightsOfEventRoles(Guid eventId, ICollection<UserInEventRole> usersRolesInEvent);
    }

    internal class RightsOfEventRoleProvider : IRightsOfEventRoleProvider
    {
        /// <summary>
        /// hook for dynamic setup of rights in roles per event
        /// hardcoded to start
        /// </summary>
        /// <param name="eventId"></param>
        /// <param name="usersRolesInEvent"></param>
        /// <returns></returns>
        public IEnumerable<string> GetRightsOfEventRoles(Guid eventId, ICollection<UserInEventRole> usersRolesInEvent)
        {
            if (usersRolesInEvent.Contains(UserInEventRole.Reader) ||
                usersRolesInEvent.Contains(UserInEventRole.Writer) ||
                usersRolesInEvent.Contains(UserInEventRole.Admin))
            {
                yield return typeof(SingleRegistrablesOverviewQuery).Name;
                yield return typeof(DoubleRegistrablesOverviewQuery).Name;
            }

            if (usersRolesInEvent.Contains(UserInEventRole.Admin))
            {
                yield return typeof(UsersOfEventQuery).Name;
                yield return typeof(SetUserRoleInEventCommand).Name;
            }
        }
    }
}