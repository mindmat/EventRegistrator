﻿using System;

namespace EventRegistrar.Backend.RegistrationForms.Questions.Mappings
{
    public class QuestionToRegistrablesDisplayItem
    {
        public Guid MappingId { get; set; }
        public string? Section { get; set; }
        public string? Question { get; set; }
        public string? Answer { get; set; }
        public Guid QuestionOptionId { get; set; }
        public Guid? RegistrableId { get; set; }
        public string? RegistrableName { get; set; }
        public Guid? QuestionId_Partner { get; set; }
        public Guid? QuestionOptionId_Leader { get; set; }
        public Guid? QuestionOptionId_Follower { get; set; }
        public bool IsPartnerRegistrable { get; set; }
    }
}