﻿using System;

using EventRegistrar.Backend.Infrastructure.DataAccess;
using EventRegistrar.Backend.Registrables;
using EventRegistrar.Backend.Registrations;

using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace EventRegistrar.Backend.Spots
{
    public class Seat : Entity
    {
        public Guid RegistrableId { get; set; }
        public Registrable? Registrable { get; set; }

        public Guid? RegistrationId { get; set; }
        public Registration? Registration { get; set; }

        public Guid? RegistrationId_Follower { get; set; }
        public Registration? Registration_Follower { get; set; }

        public DateTime FirstPartnerJoined { get; set; }
        public bool IsCancelled { get; set; }
        public bool IsPartnerSpot { get; set; }
        public bool IsWaitingList { get; set; }
        public string? PartnerEmail { get; set; }
    }

    public class SeatMap : EntityTypeConfiguration<Seat>
    {
        public override void Configure(EntityTypeBuilder<Seat> builder)
        {
            base.Configure(builder);
            builder.ToTable("Seats");
            builder.HasOne(seat => seat.Registrable)
                   .WithMany(rbl => rbl!.Spots)
                   .HasForeignKey(rbl => rbl.RegistrableId)
                   .OnDelete(DeleteBehavior.Cascade);

            builder.HasOne(seat => seat.Registration)
                   .WithMany(reg => reg!.Seats_AsLeader)
                   .HasForeignKey(seat => seat.RegistrationId);

            builder.HasOne(seat => seat.Registration_Follower)
                   .WithMany(reg => reg!.Seats_AsFollower)
                   .HasForeignKey(seat => seat.RegistrationId_Follower);
        }
    }
}