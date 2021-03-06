﻿using System;
using EventRegistrator.Functions.Infrastructure.DataAccess;

namespace EventRegistrator.Functions.Registrations.Cancellation
{
    public class RegistrationCancellation : Entity
    {
        public Guid RegistrationId  { get; set; }
        public string Reason { get; set; }
        public decimal Refund { get; set; }
        public DateTime Created { get; set; }
        public decimal RefundPercentage { get; set; }
    }
}