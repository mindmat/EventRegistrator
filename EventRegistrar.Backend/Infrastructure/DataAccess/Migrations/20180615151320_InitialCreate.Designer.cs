﻿// <auto-generated />
using System;
using EventRegistrar.Backend.Infrastructure.DataAccess;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace EventRegistrar.Backend.Infrastructure.DataAccess.Migrations
{
    [DbContext(typeof(EventRegistratorDbContext))]
    [Migration("20180615151320_InitialCreate")]
    partial class InitialCreate
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "2.1.0-rtm-30799")
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("EventRegistrar.Backend.Authentication.Users.User", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("FirstName");

                    b.Property<int>("IdentityProvider");

                    b.Property<string>("IdentityProviderUserIdentifier");

                    b.Property<string>("LastName");

                    b.Property<byte[]>("RowVersion")
                        .IsConcurrencyToken()
                        .ValueGeneratedOnAddOrUpdate();

                    b.HasKey("Id");

                    b.ToTable("Users");
                });

            modelBuilder.Entity("EventRegistrar.Backend.Events.Event", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("AccountIban");

                    b.Property<string>("Acronym");

                    b.Property<string>("Currency");

                    b.Property<string>("Name");

                    b.Property<byte[]>("RowVersion")
                        .IsConcurrencyToken()
                        .ValueGeneratedOnAddOrUpdate();

                    b.Property<int>("State");

                    b.Property<string>("TwilioAccountSid");

                    b.HasKey("Id");

                    b.ToTable("Events");
                });

            modelBuilder.Entity("EventRegistrar.Backend.Events.UsersInEvents.UserInEvent", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<Guid>("EventId");

                    b.Property<int>("Role");

                    b.Property<byte[]>("RowVersion")
                        .IsConcurrencyToken()
                        .ValueGeneratedOnAddOrUpdate();

                    b.Property<Guid>("UserId");

                    b.HasKey("Id");

                    b.HasIndex("EventId");

                    b.HasIndex("UserId");

                    b.ToTable("UsersInEvents");
                });

            modelBuilder.Entity("EventRegistrar.Backend.Registrables.Registrable", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("CheckinListColumn");

                    b.Property<Guid>("EventId");

                    b.Property<bool>("HasWaitingList");

                    b.Property<bool>("IsCore");

                    b.Property<int?>("MaximumAllowedImbalance");

                    b.Property<int?>("MaximumDoubleSeats");

                    b.Property<int?>("MaximumSingleSeats");

                    b.Property<string>("Name");

                    b.Property<decimal?>("Price");

                    b.Property<byte[]>("RowVersion")
                        .IsConcurrencyToken()
                        .ValueGeneratedOnAddOrUpdate();

                    b.Property<int?>("ShowInMailListOrder");

                    b.HasKey("Id");

                    b.ToTable("Registrables");
                });

            modelBuilder.Entity("EventRegistrar.Backend.RegistrationForms.RegistrationForm", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<Guid?>("EventId");

                    b.Property<string>("ExternalIdentifier");

                    b.Property<string>("Language");

                    b.Property<Guid?>("QuestionId_FirstName");

                    b.Property<Guid?>("QuestionId_LastName");

                    b.Property<Guid?>("QuestionId_Phone");

                    b.Property<Guid?>("QuestionId_Remarks");

                    b.Property<byte[]>("RowVersion")
                        .IsConcurrencyToken()
                        .ValueGeneratedOnAddOrUpdate();

                    b.Property<int>("State");

                    b.Property<string>("Title");

                    b.HasKey("Id");

                    b.HasIndex("EventId");

                    b.ToTable("RegistrationForms");
                });

            modelBuilder.Entity("EventRegistrar.Backend.Registrations.Registration", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime?>("AdmittedAt");

                    b.Property<string>("ExternalIdentifier");

                    b.Property<DateTime>("ExternalTimestamp");

                    b.Property<bool>("FallbackToPartyPass");

                    b.Property<bool?>("IsWaitingList");

                    b.Property<string>("Language");

                    b.Property<string>("Phone");

                    b.Property<string>("PhoneNormalized");

                    b.Property<decimal?>("Price");

                    b.Property<DateTime>("ReceivedAt");

                    b.Property<Guid>("RegistrationFormId");

                    b.Property<string>("Remarks");

                    b.Property<bool>("RemarksProcessed");

                    b.Property<int>("ReminderLevel");

                    b.Property<string>("RespondentEmail");

                    b.Property<string>("RespondentFirstName");

                    b.Property<string>("RespondentLastName");

                    b.Property<byte[]>("RowVersion")
                        .IsConcurrencyToken()
                        .ValueGeneratedOnAddOrUpdate();

                    b.Property<string>("SoldOutMessage");

                    b.Property<int>("State");

                    b.HasKey("Id");

                    b.HasIndex("RegistrationFormId");

                    b.ToTable("Registrations");
                });

            modelBuilder.Entity("EventRegistrar.Backend.Seats.Seat", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("FirstPartnerJoined");

                    b.Property<bool>("IsCancelled");

                    b.Property<bool>("IsWaitingList");

                    b.Property<string>("PartnerEmail");

                    b.Property<Guid>("RegistrableId");

                    b.Property<Guid?>("RegistrationId");

                    b.Property<Guid?>("RegistrationId_Follower");

                    b.Property<byte[]>("RowVersion")
                        .IsConcurrencyToken()
                        .ValueGeneratedOnAddOrUpdate();

                    b.HasKey("Id");

                    b.HasIndex("RegistrableId");

                    b.HasIndex("RegistrationId");

                    b.HasIndex("RegistrationId_Follower");

                    b.ToTable("Seats");
                });

            modelBuilder.Entity("EventRegistrar.Backend.Events.UsersInEvents.UserInEvent", b =>
                {
                    b.HasOne("EventRegistrar.Backend.Events.Event", "Event")
                        .WithMany("Users")
                        .HasForeignKey("EventId")
                        .OnDelete(DeleteBehavior.Cascade);

                    b.HasOne("EventRegistrar.Backend.Authentication.Users.User", "User")
                        .WithMany("Events")
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade);
                });

            modelBuilder.Entity("EventRegistrar.Backend.RegistrationForms.RegistrationForm", b =>
                {
                    b.HasOne("EventRegistrar.Backend.Events.Event", "Event")
                        .WithMany()
                        .HasForeignKey("EventId");
                });

            modelBuilder.Entity("EventRegistrar.Backend.Registrations.Registration", b =>
                {
                    b.HasOne("EventRegistrar.Backend.RegistrationForms.RegistrationForm", "RegistrationForm")
                        .WithMany()
                        .HasForeignKey("RegistrationFormId")
                        .OnDelete(DeleteBehavior.Cascade);
                });

            modelBuilder.Entity("EventRegistrar.Backend.Seats.Seat", b =>
                {
                    b.HasOne("EventRegistrar.Backend.Registrables.Registrable", "Registrable")
                        .WithMany("Seats")
                        .HasForeignKey("RegistrableId")
                        .OnDelete(DeleteBehavior.Cascade);

                    b.HasOne("EventRegistrar.Backend.Registrations.Registration", "Registration")
                        .WithMany("Seats_AsLeader")
                        .HasForeignKey("RegistrationId");

                    b.HasOne("EventRegistrar.Backend.Registrations.Registration", "Registration_Follower")
                        .WithMany("Seats_AsFollower")
                        .HasForeignKey("RegistrationId_Follower");
                });
#pragma warning restore 612, 618
        }
    }
}
