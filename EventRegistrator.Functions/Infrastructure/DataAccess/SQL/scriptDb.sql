/*    ==Scripting Parameters==

    Source Database Engine Edition : Microsoft Azure SQL Database Edition
    Source Database Engine Type : Microsoft Azure SQL Database

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [EventRegistrator]    Script Date: 14.11.2017 01:04:06 ******/
CREATE DATABASE [EventRegistrator]
GO
ALTER DATABASE [EventRegistrator] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EventRegistrator].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EventRegistrator] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EventRegistrator] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EventRegistrator] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EventRegistrator] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EventRegistrator] SET ARITHABORT OFF 
GO
ALTER DATABASE [EventRegistrator] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EventRegistrator] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EventRegistrator] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EventRegistrator] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EventRegistrator] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EventRegistrator] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EventRegistrator] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EventRegistrator] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EventRegistrator] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EventRegistrator] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EventRegistrator] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [EventRegistrator] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EventRegistrator] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [EventRegistrator] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EventRegistrator] SET  MULTI_USER 
GO
ALTER DATABASE [EventRegistrator] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EventRegistrator] SET ENCRYPTION ON
GO
ALTER DATABASE [EventRegistrator] SET QUERY_STORE = ON
GO
ALTER DATABASE [EventRegistrator] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 7), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 10, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO)
GO
USE [EventRegistrator]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [EventRegistrator]
GO
/****** Object:  User [eventregistrator]    Script Date: 14.11.2017 01:04:06 ******/
CREATE USER [eventregistrator] FOR LOGIN [eventregistrator] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [eventregistrator]
GO
ALTER ROLE [db_datareader] ADD MEMBER [eventregistrator]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [eventregistrator]
GO
/****** Object:  Table [dbo].[DomainEvents]    Script Date: 14.11.2017 01:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DomainEvents](
	[Id] [uniqueidentifier] NOT NULL,
	[AggregateId] [uniqueidentifier] NULL,
	[Timestamp] [datetime2](7) NOT NULL,
	[Sequence] [bigint] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
	[Data] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_DomainEvents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[Events]    Script Date: 14.11.2017 01:04:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[RowVersion] [timestamp] NOT NULL,
	[AccountIban] [nvarchar](50) NULL,
	[Currency] [nchar](3) NULL,
 CONSTRAINT [PK_dbo.Events] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[Mails]    Script Date: 14.11.2017 01:04:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mails](
	[Id] [uniqueidentifier] NOT NULL,
	[SenderMail] [nvarchar](200) NULL,
	[SenderName] [nvarchar](200) NULL,
	[Subject] [nvarchar](300) NULL,
	[ContentHtml] [nvarchar](max) NULL,
	[ContentPlainText] [nvarchar](max) NULL,
	[RowVersion] [timestamp] NOT NULL,
	[Type] [int] NULL,
	[Recipients] [nvarchar](max) NULL,
	[Created] [datetime2](7) NULL,
	[Withhold] [bit] NOT NULL,
 CONSTRAINT [PK_Mails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[MailTemplates]    Script Date: 14.11.2017 01:04:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MailTemplates](
	[Id] [uniqueidentifier] NOT NULL,
	[EventId] [uniqueidentifier] NOT NULL,
	[Language] [nchar](2) NOT NULL,
	[Subject] [nvarchar](max) NOT NULL,
	[SenderMail] [nvarchar](200) NOT NULL,
	[SenderName] [nvarchar](200) NOT NULL,
	[Type] [int] NOT NULL,
	[ContentType] [int] NOT NULL,
	[Template] [nvarchar](max) NOT NULL,
	[RowVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_MailTemplates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[MailToRegistrations]    Script Date: 14.11.2017 01:04:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MailToRegistrations](
	[Id] [uniqueidentifier] NOT NULL,
	[MailId] [uniqueidentifier] NOT NULL,
	[RegistrationId] [uniqueidentifier] NOT NULL,
	[RowVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_MailsToRegistrations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[PaymentAssignments]    Script Date: 14.11.2017 01:04:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentAssignments](
	[Id] [uniqueidentifier] NOT NULL,
	[RegistrationId] [uniqueidentifier] NOT NULL,
	[ReceivedPaymentId] [uniqueidentifier] NOT NULL,
	[Amount] [money] NOT NULL,
	[RowVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_PaymentAssignments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[PaymentFiles]    Script Date: 14.11.2017 01:04:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentFiles](
	[Id] [uniqueidentifier] NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[FileId] [nvarchar](200) NULL,
	[AccountIban] [nvarchar](100) NULL,
	[RowVersion] [timestamp] NOT NULL,
	[EventId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_PaymentFiles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[QuestionOptions]    Script Date: 14.11.2017 01:04:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionOptions](
	[Id] [uniqueidentifier] NOT NULL,
	[QuestionId] [uniqueidentifier] NOT NULL,
	[Answer] [varchar](max) NOT NULL,
	[RowVersion] [timestamp] NOT NULL,
	[TemplateKey] [nvarchar](200) NULL,
 CONSTRAINT [PK_QuestionOptions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[QuestionOptionToRegistrableMappings]    Script Date: 14.11.2017 01:04:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionOptionToRegistrableMappings](
	[Id] [uniqueidentifier] NOT NULL,
	[QuestionOptionId] [uniqueidentifier] NOT NULL,
	[QuestionId_PartnerEmail] [uniqueidentifier] NULL,
	[QuestionOptionId_Leader] [uniqueidentifier] NULL,
	[QuestionOptionId_Follower] [uniqueidentifier] NULL,
	[RegistrableId] [uniqueidentifier] NOT NULL,
	[RowVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_QuestionOptionToRegistrableMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 14.11.2017 01:04:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[Id] [uniqueidentifier] NOT NULL,
	[RegistrationFormId] [uniqueidentifier] NOT NULL,
	[ExternalId] [int] NULL,
	[Index] [int] NULL,
	[Title] [nvarchar](max) NULL,
	[TemplateKey] [nvarchar](200) NULL,
	[Type] [int] NULL,
	[RowVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[ReceivedPayments]    Script Date: 14.11.2017 01:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReceivedPayments](
	[Id] [uniqueidentifier] NOT NULL,
	[Amount] [money] NOT NULL,
	[Currency] [nchar](3) NULL,
	[BookingDate] [datetime2](7) NOT NULL,
	[Info] [nvarchar](200) NULL,
	[Reference] [nvarchar](100) NULL,
	[RecognizedEmail] [nvarchar](100) NULL,
	[RegistrationId_Payer] [uniqueidentifier] NULL,
	[RowVersion] [timestamp] NOT NULL,
	[PaymentFileId] [uniqueidentifier] NULL,
	[Settled] [bit] NOT NULL,
 CONSTRAINT [PK_ReceivedPayments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[Reductions]    Script Date: 14.11.2017 01:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reductions](
	[Id] [uniqueidentifier] NOT NULL,
	[RegistrableId] [uniqueidentifier] NOT NULL,
	[RegistrableId1_ReductionActivatedIfCombinedWith] [uniqueidentifier] NULL,
	[RegistrableId2_ReductionActivatedIfCombinedWith] [uniqueidentifier] NULL,
	[QuestionOptionId_ActivatesReduction] [uniqueidentifier] NULL,
	[Amount] [money] NOT NULL,
	[RowVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_Reductions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[Registrables]    Script Date: 14.11.2017 01:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registrables](
	[Id] [uniqueidentifier] NOT NULL,
	[EventId] [uniqueidentifier] NOT NULL,
	[QuestionOptionId] [uniqueidentifier] NULL,
	[Name] [nvarchar](200) NOT NULL,
	[MaximumSingleSeats] [int] NULL,
	[MaximumDoubleSeats] [int] NULL,
	[MaximumAllowedImbalance] [int] NULL,
	[ShowInMailListOrder] [int] NULL,
	[RowVersion] [timestamp] NOT NULL,
	[Price] [money] NULL,
	[HasWaitingList] [bit] NOT NULL,
	[IsCore] [bit] NOT NULL,
 CONSTRAINT [PK_LimitedResource] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[RegistrationForms]    Script Date: 14.11.2017 01:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistrationForms](
	[Id] [uniqueidentifier] NOT NULL,
	[EventId] [uniqueidentifier] NULL,
	[ExternalIdentifier] [varchar](50) NULL,
	[Title] [varchar](50) NULL,
	[State] [int] NOT NULL,
	[RowVersion] [timestamp] NULL,
	[QuestionId_FirstName] [uniqueidentifier] NULL,
	[Language] [nchar](2) NULL,
 CONSTRAINT [PK_RegistrationForm] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[Registrations]    Script Date: 14.11.2017 01:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registrations](
	[Id] [uniqueidentifier] NOT NULL,
	[RegistrationFormId] [uniqueidentifier] NOT NULL,
	[ExternalIdentifier] [varchar](100) NULL,
	[RespondentEmail] [nvarchar](200) NULL,
	[RespondentFirstName] [nvarchar](100) NULL,
	[ReceivedAt] [datetime2](7) NOT NULL,
	[ExternalTimestamp] [datetime2](7) NULL,
	[RowVersion] [timestamp] NOT NULL,
	[Language] [nchar](2) NULL,
	[Price] [money] NULL,
	[IsWaitingList] [bit] NULL,
	[SoldOutMessage] [nvarchar](max) NULL,
	[State] [int] NOT NULL,
 CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[Responses]    Script Date: 14.11.2017 01:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Responses](
	[Id] [uniqueidentifier] NOT NULL,
	[RegistrationId] [uniqueidentifier] NULL,
	[QuestionId] [uniqueidentifier] NULL,
	[ResponseString] [varchar](max) NULL,
	[QuestionOptionId] [uniqueidentifier] NULL,
	[RowVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_Responses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[Seats]    Script Date: 14.11.2017 01:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seats](
	[Id] [uniqueidentifier] NOT NULL,
	[RegistrableId] [uniqueidentifier] NOT NULL,
	[RegistrationId] [uniqueidentifier] NULL,
	[RegistrationId_Follower] [uniqueidentifier] NULL,
	[PartnerEmail] [nvarchar](200) NULL,
	[FirstPartnerJoined] [datetime2](7) NULL,
	[IsWaitingList] [bit] NOT NULL,
	[RowVersion] [timestamp] NOT NULL,
	[IsCancelled] [bit] NOT NULL,
 CONSTRAINT [PK_Seats] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[Translations]    Script Date: 14.11.2017 01:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Translations](
	[Id] [uniqueidentifier] NOT NULL,
	[EventId] [uniqueidentifier] NULL,
	[EntityId] [uniqueidentifier] NOT NULL,
	[FieldName] [nvarchar](200) NOT NULL,
	[Language] [nchar](2) NOT NULL,
	[RowVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_Translations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
ALTER TABLE [dbo].[Mails] ADD  CONSTRAINT [DF_Mails_Withhold]  DEFAULT ((0)) FOR [Withhold]
GO
ALTER TABLE [dbo].[ReceivedPayments] ADD  CONSTRAINT [DF_ReceivedPayments_Settled]  DEFAULT ((0)) FOR [Settled]
GO
ALTER TABLE [dbo].[Registrables] ADD  CONSTRAINT [DF_Registrables_HasWaitingList]  DEFAULT ((0)) FOR [HasWaitingList]
GO
ALTER TABLE [dbo].[Registrables] ADD  CONSTRAINT [DF_Registrables_IsCore]  DEFAULT ((0)) FOR [IsCore]
GO
ALTER TABLE [dbo].[Registrations] ADD  CONSTRAINT [DF_Registrations_IsWaitingList]  DEFAULT ((0)) FOR [IsWaitingList]
GO
ALTER TABLE [dbo].[Seats] ADD  CONSTRAINT [DF_Seats_IsCancelled]  DEFAULT ((0)) FOR [IsCancelled]
GO
USE [master]
GO
ALTER DATABASE [EventRegistrator] SET  READ_WRITE 
GO
