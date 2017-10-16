﻿using EventRegistrator.Functions.Infrastructure.DataAccess;
using EventRegistrator.Functions.Registrables;
using System;

namespace EventRegistrator.Functions.Seats
{
    public class Seat : Entity
    {
        public Guid RegistrableId { get; set; }
        public Guid? RegistrationId { get; set; }
        public Guid? RegistrationId_Follower { get; set; }
        public Registrable Registrable { get; set; }
        public string PartnerEmail { get; set; }
        public DateTime FirstPartnerJoined { get; set; }
        public bool IsWaitingList { get; set; }
    }
}