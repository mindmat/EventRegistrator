﻿using System;
using EventRegistrar.Backend.RegistrationForms;

namespace EventRegistrar.Backend.Events
{
    public class EventDetails
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Acronym { get; set; }
        public State State { get; set; }
    }
}
