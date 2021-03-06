﻿using EventRegistrator.Functions.Payments;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Shouldly;

namespace EventRegistrator.Functions.Test.Payment
{
    [TestClass]
    public class EmailExtractorTest
    {
        private const string Email1 = "PAPA.SCHLUMPF@GOOGLE.COM";
        private const string Email2 = "donald.duck@outlook.com";

        [TestMethod]
        [DataRow(Email1, Email1)]
        [DataRow(Email2, Email2)]
        [DataRow("Payment Leapin' Lindy for " + Email1, Email1)]
        [DataRow("Payment for both " + Email1 + " and " + Email2, Email1 + ";" + Email2)]
        public void ExtractPureEmail(string input, string expectedResult)
        {
            var result = string.Join(";", EmailExtractor.TryExtractEmailFromInfo(input));
            result.ShouldBe(expectedResult.ToLowerInvariant());
        }
    }
}