﻿using System;

namespace EventRegistrar.Backend.Payments.Assignments
{
    public class AssignedPaymentDisplayItem
    {
        public decimal Amount { get; set; }
        public DateTime BookingDate { get; set; }
        public string Currency { get; set; }
        public Guid PaymentAssignmentId { get; set; }
        public Guid? PaymentAssignmentId_Counter { get; set; }
        public Guid? PaymentId_Repayment { get; set; }
    }
}