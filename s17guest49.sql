USE [s17guest49]
GO
DROP PROCEDURE IF EXISTS [dbo].[selectBudapest]
GO
DROP PROCEDURE IF EXISTS [dbo].[insertStoredP]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[presentation_backup]') AND type in (N'U'))
ALTER TABLE [dbo].[presentation_backup] DROP CONSTRAINT IF EXISTS [FK_presentation_track]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[presentation_backup]') AND type in (N'U'))
ALTER TABLE [dbo].[presentation_backup] DROP CONSTRAINT IF EXISTS [FK_presentation_room]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[presentation_backup]') AND type in (N'U'))
ALTER TABLE [dbo].[presentation_backup] DROP CONSTRAINT IF EXISTS [FK_presentation_event]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[schedule]') AND type in (N'U'))
ALTER TABLE [dbo].[schedule] DROP CONSTRAINT IF EXISTS [FK_schedule_room]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[schedule]') AND type in (N'U'))
ALTER TABLE [dbo].[schedule] DROP CONSTRAINT IF EXISTS [FK_schedule_presentation]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[schedule]') AND type in (N'U'))
ALTER TABLE [dbo].[schedule] DROP CONSTRAINT IF EXISTS [FK_schedule_person]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[room]') AND type in (N'U'))
ALTER TABLE [dbo].[room] DROP CONSTRAINT IF EXISTS [FK_room_building]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[presentation]') AND type in (N'U'))
ALTER TABLE [dbo].[presentation] DROP CONSTRAINT IF EXISTS [FK_presentation_track1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[presentation]') AND type in (N'U'))
ALTER TABLE [dbo].[presentation] DROP CONSTRAINT IF EXISTS [FK_presentation_room1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[presentation]') AND type in (N'U'))
ALTER TABLE [dbo].[presentation] DROP CONSTRAINT IF EXISTS [FK_presentation_person]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[presentation]') AND type in (N'U'))
ALTER TABLE [dbo].[presentation] DROP CONSTRAINT IF EXISTS [FK_presentation_event1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[personRole]') AND type in (N'U'))
ALTER TABLE [dbo].[personRole] DROP CONSTRAINT IF EXISTS [FK_personRole_role1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[personRole]') AND type in (N'U'))
ALTER TABLE [dbo].[personRole] DROP CONSTRAINT IF EXISTS [FK_personRole_role]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[personRole]') AND type in (N'U'))
ALTER TABLE [dbo].[personRole] DROP CONSTRAINT IF EXISTS [FK_personRole_person]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[personPresentation]') AND type in (N'U'))
ALTER TABLE [dbo].[personPresentation] DROP CONSTRAINT IF EXISTS [FK_personPresentation_presentation1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[personPresentation]') AND type in (N'U'))
ALTER TABLE [dbo].[personPresentation] DROP CONSTRAINT IF EXISTS [FK_personPresentation_presentation]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[personPresentation]') AND type in (N'U'))
ALTER TABLE [dbo].[personPresentation] DROP CONSTRAINT IF EXISTS [FK_personPresentation_person]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[personEmail]') AND type in (N'U'))
ALTER TABLE [dbo].[personEmail] DROP CONSTRAINT IF EXISTS [FK_personEmail_person]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[personEmail]') AND type in (N'U'))
ALTER TABLE [dbo].[personEmail] DROP CONSTRAINT IF EXISTS [FK_personEmail_email]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[personAddress]') AND type in (N'U'))
ALTER TABLE [dbo].[personAddress] DROP CONSTRAINT IF EXISTS [FK_personAddress_person]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[personAddress]') AND type in (N'U'))
ALTER TABLE [dbo].[personAddress] DROP CONSTRAINT IF EXISTS [FK_personAddress_address]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[eventSponsor]') AND type in (N'U'))
ALTER TABLE [dbo].[eventSponsor] DROP CONSTRAINT IF EXISTS [FK_eventSponsor_sponsor]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[eventSponsor]') AND type in (N'U'))
ALTER TABLE [dbo].[eventSponsor] DROP CONSTRAINT IF EXISTS [FK_eventSponsor_event]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[building]') AND type in (N'U'))
ALTER TABLE [dbo].[building] DROP CONSTRAINT IF EXISTS [FK_building_address]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[class]') AND type in (N'U'))
ALTER TABLE [dbo].[class] DROP CONSTRAINT IF EXISTS [DF_class_length]
GO
DROP TABLE IF EXISTS [dbo].[presentation_backup]
GO
DROP TABLE IF EXISTS [dbo].[track]
GO
DROP TABLE IF EXISTS [dbo].[sponsor]
GO
DROP TABLE IF EXISTS [dbo].[schedule]
GO
DROP TABLE IF EXISTS [dbo].[room]
GO
DROP TABLE IF EXISTS [dbo].[role]
GO
DROP TABLE IF EXISTS [dbo].[presentation]
GO
DROP TABLE IF EXISTS [dbo].[personRole]
GO
DROP TABLE IF EXISTS [dbo].[personPresentation]
GO
DROP TABLE IF EXISTS [dbo].[personEmail]
GO
DROP TABLE IF EXISTS [dbo].[personAddress]
GO
DROP TABLE IF EXISTS [dbo].[person]
GO
DROP TABLE IF EXISTS [dbo].[eventSponsor]
GO
DROP TABLE IF EXISTS [dbo].[event]
GO
DROP TABLE IF EXISTS [dbo].[email]
GO
DROP TABLE IF EXISTS [dbo].[class]
GO
DROP TABLE IF EXISTS [dbo].[building]
GO
DROP TABLE IF EXISTS [dbo].[address]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[address]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[address](
	[address_id] [int] IDENTITY(1,1) NOT NULL,
	[street] [varchar](90) NULL,
	[city] [varchar](50) NULL,
	[zip] [varchar](12) NULL,
	[state] [varchar](30) NULL,
 CONSTRAINT [PK_address] PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[building]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[building](
	[building_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](70) NULL,
	[address_id] [int] NULL,
 CONSTRAINT [PK_building] PRIMARY KEY CLUSTERED 
(
	[building_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[class]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[class](
	[class_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](90) NULL,
	[length] [smallint] NULL,
	[desription] [varchar](255) NULL,
	[presenation_id] [int] NULL,
 CONSTRAINT [PK_class] PRIMARY KEY CLUSTERED 
(
	[class_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[email]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[email](
	[email_id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](255) NULL,
 CONSTRAINT [PK_email] PRIMARY KEY CLUSTERED 
(
	[email_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[event]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[event](
	[event_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](90) NULL,
	[region] [varchar](30) NULL,
	[date] [date] NULL,
	[building_id] [int] NULL,
 CONSTRAINT [PK_event] PRIMARY KEY CLUSTERED 
(
	[event_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[eventSponsor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[eventSponsor](
	[event_sponsor_id] [int] IDENTITY(1,1) NOT NULL,
	[event_id] [int] NULL,
	[sponsor_id] [int] NULL,
 CONSTRAINT [PK_eventSponsor] PRIMARY KEY CLUSTERED 
(
	[event_sponsor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[person]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[person](
	[person_ID] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NULL,
	[last_name] [varchar](50) NULL,
 CONSTRAINT [PK_person] PRIMARY KEY CLUSTERED 
(
	[person_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[personAddress]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[personAddress](
	[person_address_id] [int] IDENTITY(1,1) NOT NULL,
	[person_id] [int] NULL,
	[address_id] [int] NULL,
 CONSTRAINT [PK_personAddress] PRIMARY KEY CLUSTERED 
(
	[person_address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[personEmail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[personEmail](
	[person_email_id] [int] IDENTITY(1,1) NOT NULL,
	[peson_id] [int] NULL,
	[email_id] [int] NULL,
 CONSTRAINT [PK_personEmail] PRIMARY KEY CLUSTERED 
(
	[person_email_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[personPresentation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[personPresentation](
	[person_presentation_id] [int] IDENTITY(1,1) NOT NULL,
	[person_id] [int] NULL,
	[presentation_id] [int] NULL,
 CONSTRAINT [PK_personPresentation] PRIMARY KEY CLUSTERED 
(
	[person_presentation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[personRole]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[personRole](
	[person_role_id] [int] IDENTITY(1,1) NOT NULL,
	[person_id] [int] NULL,
	[role_id] [int] NULL,
 CONSTRAINT [PK_personRole] PRIMARY KEY CLUSTERED 
(
	[person_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[presentation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[presentation](
	[presentation_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](145) NULL,
	[speaker] [varchar](82) NULL,
	[level] [varchar](58) NULL,
	[event] [varchar](45) NULL,
	[track_id] [int] NULL,
	[speeaker_id] [int] NULL,
	[room_id] [int] NULL,
	[event_id] [int] NULL,
 CONSTRAINT [PK_Presentations] PRIMARY KEY CLUSTERED 
(
	[presentation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[role]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NULL,
 CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[room]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[room](
	[room_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[occupancy] [smallint] NULL,
	[location] [varchar](50) NULL,
	[building_id] [int] NULL,
 CONSTRAINT [PK_oom] PRIMARY KEY CLUSTERED 
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[schedule]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[schedule](
	[schedule_id] [int] IDENTITY(1,1) NOT NULL,
	[presentation_id] [int] NULL,
	[person_id] [int] NULL,
	[room_id] [int] NULL,
 CONSTRAINT [PK_schedule] PRIMARY KEY CLUSTERED 
(
	[schedule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sponsor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sponsor](
	[sponsor_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](70) NULL,
	[contribution] [varchar](50) NULL,
 CONSTRAINT [PK_sponsor] PRIMARY KEY CLUSTERED 
(
	[sponsor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[track]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[track](
	[track_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](70) NULL,
 CONSTRAINT [PK_track] PRIMARY KEY CLUSTERED 
(
	[track_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[presentation_backup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[presentation_backup](
	[presentation_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[difficulty] [varchar](15) NULL,
	[city] [varchar](50) NULL,
	[event_id] [int] NULL,
	[speaker_id] [int] NULL,
	[room_id] [int] NULL,
	[track_id] [int] NULL,
 CONSTRAINT [PK_presentation] PRIMARY KEY CLUSTERED 
(
	[presentation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[address] ON 

INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (1, N'10 Napa Ct.', N'Lebanon', N'97355', N'Oregon')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (2, N'1000 Bidweld Street', N'Haney', N'V2W 1W2', N'British Columbia')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (3, N'1002 N. Spoonwood Court', N'Hervey Bay', N'4655', N'Queensland')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (4, N'1003 Matterhorn Ct', N'Lebanon', N'97355', N'Oregon')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (5, N'1005 Matterhorn Ct.', N'Cambridge', N'CB4 4BZ', N'England')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (6, N'1005 Matterhorn Ct.', N'Mill Valley', N'94941', N'California')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (7, N'1005 Tanager Court', N'Corvallis', N'97330', N'Oregon')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (8, N'1005 Tanager Court', N'Milsons Point', N'2061', N'New South Wales')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (9, N'1006 Deercreek Ln', N'Bellflower', N'90706', N'California')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (10, N'1006 Deercreek Ln', N'Torrance', N'90505', N'California')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (11, N'101 Adobe Dr', N'Coffs Harbour', N'2450', N'New South Wales')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (12, N'101 Adobe Dr', N'Puyallup', N'98371', N'Washington')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (13, N'101, avenue de la Gare', N'Peterborough', N'PB12', N'England')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (14, N'1010 Maple', N'Baltimore', N'21201', N'Maryland')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (15, N'1011 Yolanda Circle', N'Berkeley', N'94704', N'California')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (16, N'1011 Yolanda Circle', N'N. Vancouver', N'V7L 4J4', N'British Columbia')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (17, N'1013 Holiday Hills Dr.', N'Bremerton', N'98312', N'Washington')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (18, N'1013 Holiday Hills Dr.', N'Gateshead', N'GA10', N'England')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (19, N'1015 Lynwood Drive', N'Metchosin', N'V9', N'British Columbia')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (20, N'1019 Carletto Drive', N'Berkeley', N'94704', N'California')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (21, N'1019 Mt. Davidson Court', N'Burien', N'98168', N'Washington')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (22, N'1019 Mt. Davidson Court', N'London', N'SW8 4BG', N'England')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (23, N'102 Vista Place', N'Santa Monica', N'90401', N'California')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (24, N'1020 Book Road', N'Bremerton', N'98312', N'Washington')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (25, N'1020 Carletto Drive', N'Matraville', N'2036', N'New South Wales')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (26, N'1020 Carletto Drive', N'Santa Cruz', N'95062', N'California')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (27, N'1023 Hawkins Street', N'Lebanon', N'97355', N'Oregon')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (28, N'1024 Walnut Blvd.', N'Colma', N'94014', N'California')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (29, N'1025 Holly Oak Drive', N'Leeds', N'LE18', N'England')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (30, N'1025 R St.', N'Kirkland', N'98033', N'Washington')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (31, N'1025 Yosemite Dr.', N'Oregon City', N'97045', N'Oregon')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (32, N'1028 Green View Court', N'Chula Vista', N'91910', N'California')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (33, N'1028 Green View Court', N'Oregon City', N'97045', N'Oregon')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (34, N'1037 Hayes Court', N'Stoke-on-Trent', N'AS23', N'England')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (35, N'1039 Adelaide St.', N'West Covina', N'91791', N'California')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (36, N'104 Hilltop Dr.', N'Springwood', N'2777', N'New South Wales')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (37, N'104 Kaski Ln.', N'Portland', N'97205', N'Oregon')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (38, N'1040 Greenbush Drive', N'Silverwater', N'2264', N'New South Wales')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (39, N'1040 Northridge Road', N'London', N'W1X3SE', N'England')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (40, N'1044 San Carlos', N'Cincinnati', N'45202', N'Ohio')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (41, N'1045 Lolita Drive', N'Torrance', N'90505', N'California')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (42, N'1045 Lolita Drive', N'Townsville', N'4810', N'Queensland')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (43, N'1047 Las Quebradas Lane', N'North Sydney', N'2055', N'New South Wales')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (44, N'1048 Burwood Way', N'Hervey Bay', N'4655', N'Queensland')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (45, N'1048 Las Quebradas Lane', N'Walla Walla', N'99362', N'Washington')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (46, N'1048 Las Quebradas Lane', N'Wollongong', N'2500', N'New South Wales')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (47, N'105 Clark Creek Lane', N'Port Macquarie', N'2444', N'New South Wales')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (48, N'105 Woodruff Ln.', N'Bellingham', N'98225', N'Washington')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (49, N'1050 Creed Ave', N'London', N'W10 6BL', N'England')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (50, N'081, boulevard du Montparnasse', N'Seattle', N'98104', N'Washington')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (51, N'1 Smiling Tree Court', N'Los Angeles', N'90012', N'California')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (52, N'100, rue des Rosiers', N'Everett', N'98201', N'Washington')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (53, N'1002 N. Spoonwood Court', N'Berkeley', N'94704', N'California')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (54, N'1005 Fremont Street', N'Colma', N'94014', N'California')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (55, N'1005 Valley Oak Plaza', N'Langley', N'V3A 4R2', N'British Columbia')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (56, N'1005 Valley Oak Plaza', N'London', N'SW6 SBY', N'England')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (57, N'1007 Cardinet Dr.', N'El Cajon', N'92020', N'California')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (58, N'1008 Lydia Lane', N'Burbank', N'91502', N'California')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (59, N'101 Candy Rd.', N'Redmond', N'98052', N'Washington')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (60, N'1011 Green St.', N'Bellingham', N'98225', N'Washington')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (61, N'1013 Buchanan Rd', N'Port Macquarie', N'2444', N'New South Wales')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (62, N'1013 Buchanan Rd', N'Yakima', N'98901', N'Washington')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (63, N'1016 Park Avenue', N'Burbank', N'91502', N'California')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (64, N'1019 Book Road', N'Rhodes', N'2138', N'New South Wales')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (65, N'1019 Buchanan Road', N'Woodland Hills', N'91364', N'California')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (66, N'1019 Candy Rd.', N'Coffs Harbour', N'2450', N'New South Wales')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (67, N'1019 Chance Drive', N'Sedro Woolley', N'98284', N'Washington')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (68, N'1019 Kenwal Rd.', N'Lake Oswego', N'97034', N'Oregon')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (69, N'1019 Pennsylvania Blvd', N'Marysville', N'98270', N'Washington')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (70, N'102 Vista Place', N'Milton Keynes', N'MK8 8DF', N'England')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (71, N'10203 Acorn Avenue', N'Calgary', N'T2P 2G8', N'Alberta')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (72, N'1023 Hawkins Street', N'Townsville', N'4810', N'Queensland')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (73, N'1023 Riveria Way', N'Burbank', N'91502', N'California')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (74, N'1023 Riviera Way', N'Oxford', N'OX1', N'England')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (75, N'1025 Yosemite Dr.', N'Townsville', N'4810', N'Queensland')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (76, N'1026 Mt. Wilson Pl.', N'Lynnwood', N'98036', N'Washington')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (77, N'1026 Mt. Wilson Pl.', N'South Melbourne', N'3205', N'Victoria')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (78, N'1028 Indigo Ct.', N'Issaquah', N'98027', N'Washington')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (79, N'1028 Indigo Ct.', N'Warrnambool', N'3280', N'Victoria')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (80, N'1028 Royal Oak Rd.', N'Burlingame', N'94010', N'California')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (81, N'1029 Birchwood Dr', N'Burien', N'98168', N'Washington')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (82, N'1029 Birchwood Dr', N'Olympia', N'98501', N'Washington')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (83, N'1030 Ambush Dr.', N'Bury', N'PE17', N'England')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (84, N'1032 Buena Vista', N'North Ryde', N'2113', N'New South Wales')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (85, N'1032 Coats Road', N'Stoke-on-Trent', N'AS23', N'England')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (86, N'1035 Arguello Blvd.', N'San Diego', N'92102', N'California')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (87, N'1036 Mason Dr', N'Port Orchard', N'98366', N'Washington')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (88, N'1039 Adelaide St.', N'Port Macquarie', N'2444', N'New South Wales')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (89, N'104 Hilltop Dr.', N'Concord', N'94519', N'California')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (90, N'1040 Greenbush Drive', N'Newton', N'V2L3W8', N'British Columbia')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (91, N'1040 Northridge Road', N'Woodland Hills', N'91364', N'California')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (92, N'1042 Hooftrail Way', N'Newcastle', N'2300', N'New South Wales')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (93, N'1046 Cloverleaf Circle', N'Shawnee', N'V8Z 4N5', N'British Columbia')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (94, N'1046 San Carlos Avenue', N'Colma', N'94014', N'California')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (95, N'1047 Las Quebradas Lane', N'Oak Bay', N'V8P', N'British Columbia')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (96, N'1048 Burwood Way', N'Haney', N'V2W 1W2', N'British Columbia')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (97, N'105 Woodruff Ln.', N'Oakland', N'94611', N'California')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (98, N'1050 Creed Ave', N'Lebanon', N'97355', N'Oregon')
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (99, N'1050 Greenhills Circle', N'Lane Cove', N'1597', N'New South Wales')
GO
INSERT [dbo].[address] ([address_id], [street], [city], [zip], [state]) VALUES (100, N'1050 Greenhills Circle', N'Langley', N'V3A 4R2', N'British Columbia')
SET IDENTITY_INSERT [dbo].[address] OFF
SET IDENTITY_INSERT [dbo].[email] ON 

INSERT [dbo].[email] ([email_id], [email]) VALUES (1, N'ALong@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (2, N'CShan@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (3, N'TSara@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (4, N'KBaker@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (5, N'SMa@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (6, N'AJones@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (7, N'CBaker@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (8, N'TMunoz@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (9, N'TGill@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (10, N'ALee@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (11, N'ESuri@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (12, N'MEvans@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (13, N'MClark@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (14, N'GXu@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (15, N'PRubio@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (16, N'JIsla@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (17, N'JScott@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (18, N'NSanz@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (19, N'ILee@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (20, N'DYuan@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (21, N'OBlue@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (22, N'ELopez@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (23, N'NYang@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (24, N'GWood@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (25, N'KAnand@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (26, N'AJones@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (27, N'NReed@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (28, N'DRoss@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (29, N'SGoel@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (30, N'NDiaz@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (31, N'WDavis@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (32, N'CHuang@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (33, N'SEvans@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (34, N'KBaker@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (35, N'EWood@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (36, N'JRai@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (37, N'EMoore@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (38, N'RYang@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (39, N'RRuiz@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (40, N'MSun@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (41, N'GPerez@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (42, N'EGill@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (43, N'KShen@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (44, N'SYuan@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (45, N'VLee@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (46, N'BArun@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (47, N'AScott@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (48, N'YLuo@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (49, N'MVance@gmail.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (50, N'JRoberts@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (51, N'ARamirez@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (52, N'JNelson@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (53, N'HWright@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (54, N'SWright@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (55, N'SSimmons@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (56, N'MSamant@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (57, N'IRogers@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (58, N'IFoster@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (59, N'BMiller@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (60, N'SBarnes@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (61, N'CMartin@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (62, N'VMurphy@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (63, N'SRogers@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (64, N'MHernandez@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (65, N'CCarter@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (66, N'RGarcia@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (67, N'HHenderson@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (68, N'JTaylor@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (69, N'SMartin@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (70, N'LSuarez@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (71, N'GVargas@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (72, N'AMartinez@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (73, N'JThomas@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (74, N'EMartinez@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (75, N'PChapman@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (76, N'KGriffin@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (77, N'JNavarro@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (78, N'NWalker@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (79, N'TMoreno@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (80, N'MSanchez@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (81, N'NNavarro@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (82, N'KRussell@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (83, N'KRivera@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (84, N'AOrtega@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (85, N'ACampbell@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (86, N'JPeterson@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (87, N'ARamirez@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (88, N'MSharma@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (89, N'ACollins@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (90, N'TMartin@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (91, N'GCollins@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (92, N'RMartin@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (93, N'SJenkins@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (94, N'JSimmons@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (95, N'EWinston@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (96, N'HRoberts@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (97, N'NMurphy@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (98, N'CWilson@yahoo.com')
INSERT [dbo].[email] ([email_id], [email]) VALUES (99, N'CAlvarez@yahoo.com')
GO
INSERT [dbo].[email] ([email_id], [email]) VALUES (100, N'PAlexander@yahoo.com')
SET IDENTITY_INSERT [dbo].[email] OFF
SET IDENTITY_INSERT [dbo].[event] ON 

INSERT [dbo].[event] ([event_id], [name], [region], [date], [building_id]) VALUES (1, N'SQLSaturday #626 - Budapest 2017', N'Europe/Middle East/Africa', CAST(N'2017-05-06' AS Date), NULL)
INSERT [dbo].[event] ([event_id], [name], [region], [date], [building_id]) VALUES (2, N'SQLSaturday #615 - Baltimore 2017', N'Canada/US', CAST(N'2017-05-06' AS Date), NULL)
INSERT [dbo].[event] ([event_id], [name], [region], [date], [building_id]) VALUES (3, N'SQLSaturday #608 - Bogota 2017', N'Latin America', CAST(N'2017-05-13' AS Date), NULL)
INSERT [dbo].[event] ([event_id], [name], [region], [date], [building_id]) VALUES (4, N'SQLSaturday #616 - Kyiv 2017', N'Europe/Middle East/Africa', CAST(N'2017-05-20' AS Date), NULL)
INSERT [dbo].[event] ([event_id], [name], [region], [date], [building_id]) VALUES (5, N'SQLSaturday #588 - New York City 2017', N'Canada/US', CAST(N'2017-05-20' AS Date), NULL)
INSERT [dbo].[event] ([event_id], [name], [region], [date], [building_id]) VALUES (6, N'SQLSaturday #630 - Brisbane 2017', N'Asia Pacific', CAST(N'2017-05-27' AS Date), NULL)
INSERT [dbo].[event] ([event_id], [name], [region], [date], [building_id]) VALUES (7, N'SQLSaturday #599 - Plovdiv 2017', N'Europe/Middle East/Africa', CAST(N'2017-05-27' AS Date), NULL)
INSERT [dbo].[event] ([event_id], [name], [region], [date], [building_id]) VALUES (8, N'SQLSaturday #638 - Philadelphia 2017', N'Canada/US', CAST(N'2017-06-03' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[event] OFF
SET IDENTITY_INSERT [dbo].[person] ON 

INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (1, N'Amanda', N'Long')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (2, N'Christian', N'Shan')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (3, N'Troy', N'Sara')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (4, N'Kaitlyn', N'Baker')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (5, N'Suzanne', N'Ma')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (6, N'Anna', N'Jones')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (7, N'Carlos', N'Baker')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (8, N'Tanya', N'Munoz')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (9, N'Tabitha', N'Gill')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (10, N'Alexis', N'Lee')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (11, N'Erick', N'Suri')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (12, N'Marcus', N'Evans')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (13, N'Marcus', N'Clark')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (14, N'Gilbert', N'Xu')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (15, N'Paula', N'Rubio')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (16, N'Julian', N'Isla')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (17, N'Jesse', N'Scott')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (18, N'Naomi', N'Sanz')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (19, N'Isabella', N'Lee')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (20, N'Dawn', N'Yuan')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (21, N'Olivia', N'Blue')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (22, N'Emmanuel', N'Lopez')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (23, N'Nathan', N'Yang')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (24, N'Gabrielle', N'Wood')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (25, N'Katrina', N'Anand')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (26, N'Anthony', N'Jones')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (27, N'Natalie', N'Reed')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (28, N'Dakota', N'Ross')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (29, N'Shawn', N'Goel')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (30, N'Nicole', N'Diaz')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (31, N'Wyatt', N'Davis')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (32, N'Christy', N'Huang')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (33, N'Sydney', N'Evans')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (34, N'Katherine', N'Baker')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (35, N'Edward', N'Wood')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (36, N'Johnny', N'Rai')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (37, N'Emily', N'Moore')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (38, N'Randy', N'Yang')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (39, N'Roy', N'Ruiz')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (40, N'Marshall', N'Sun')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (41, N'Gabriella', N'Perez')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (42, N'Erika', N'Gill')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (43, N'Kathryn', N'Shen')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (44, N'Sharon', N'Yuan')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (45, N'Victoria', N'Lee')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (46, N'Brenda', N'Arun')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (47, N'Alex', N'Scott')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (48, N'Yolanda', N'Luo')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (49, N'Martin', N'Vance')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (50, N'Jeremy', N'Roberts')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (51, N'Amanda', N'Ramirez')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (52, N'Jada', N'Nelson')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (53, N'Hunter', N'Wright')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (54, N'Sierra', N'Wright')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (55, N'Sarah', N'Simmons')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (56, N'Mandar', N'Samant')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (57, N'Isaiah', N'Rogers')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (58, N'Ian', N'Foster')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (59, N'Ben', N'Miller')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (60, N'Sarah', N'Barnes')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (61, N'Casey', N'Martin')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (62, N'Victoria', N'Murphy')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (63, N'Sydney', N'Rogers')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (64, N'Marvin', N'Hernandez')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (65, N'Carlos', N'Carter')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (66, N'Rebekah', N'Garcia')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (67, N'Haley', N'Henderson')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (68, N'Jacob', N'Taylor')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (69, N'Seth', N'Martin')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (70, N'Larry', N'Suarez')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (71, N'Garrett', N'Vargas')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (72, N'Abby', N'Martinez')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (73, N'Justin', N'Thomas')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (74, N'Evelyn', N'Martinez')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (75, N'Pamela', N'Chapman')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (76, N'Kayla', N'Griffin')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (77, N'Jill', N'Navarro')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (78, N'Nathan', N'Walker')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (79, N'Tabitha', N'Moreno')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (80, N'Mason', N'Sanchez')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (81, N'Natasha', N'Navarro')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (82, N'Kevin', N'Russell')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (83, N'Katelyn', N'Rivera')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (84, N'Alfredo', N'Ortega')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (85, N'Andrea', N'Campbell')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (86, N'Jeremy', N'Peterson')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (87, N'Arianna', N'Ramirez')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (88, N'Mario', N'Sharma')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (89, N'Adam', N'Collins')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (90, N'Taylor', N'Martin')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (91, N'Gabriel', N'Collins')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (92, N'Randall', N'Martin')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (93, N'Samantha', N'Jenkins')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (94, N'Justin', N'Simmons')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (95, N'Ethan', N'Winston')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (96, N'Hunter', N'Roberts')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (97, N'Nathaniel', N'Murphy')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (98, N'Charles', N'Wilson')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (99, N'Carrie', N'Alvarez')
GO
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (100, N'Paige', N'Alexander')
INSERT [dbo].[person] ([person_ID], [first_name], [last_name]) VALUES (102, N'Armenak', N'Mazmanyan')
SET IDENTITY_INSERT [dbo].[person] OFF
SET IDENTITY_INSERT [dbo].[personAddress] ON 

INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (1, 1, 1)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (2, 2, 2)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (3, 3, 3)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (4, 4, 4)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (5, 5, 5)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (6, 6, 6)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (7, 7, 7)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (8, 8, 8)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (9, 9, 9)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (10, 10, 10)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (11, 11, 11)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (12, 12, 12)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (13, 13, 13)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (14, 14, 14)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (15, 15, 15)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (16, 16, 16)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (17, 17, 17)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (18, 18, 18)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (19, 19, 19)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (20, 20, 20)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (21, 21, 21)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (22, 22, 22)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (23, 23, 23)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (24, 24, 24)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (25, 25, 25)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (26, 26, 26)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (27, 27, 27)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (28, 28, 28)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (29, 29, 29)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (30, 30, 30)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (31, 31, 31)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (32, 32, 32)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (33, 33, 33)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (34, 34, 34)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (35, 35, 35)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (36, 36, 36)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (37, 37, 37)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (38, 38, 38)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (39, 39, 39)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (40, 40, 40)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (41, 41, 41)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (42, 42, 42)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (43, 43, 43)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (44, 44, 44)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (45, 45, 45)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (46, 46, 46)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (47, 47, 47)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (48, 48, 48)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (49, 49, 49)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (50, 50, 50)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (51, 51, 51)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (52, 52, 52)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (53, 53, 53)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (54, 54, 54)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (55, 55, 55)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (56, 56, 56)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (57, 57, 57)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (58, 58, 58)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (59, 59, 59)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (60, 60, 60)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (61, 61, 61)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (62, 62, 62)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (63, 63, 63)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (64, 64, 64)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (65, 65, 65)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (66, 66, 66)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (67, 67, 67)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (68, 68, 68)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (69, 69, 69)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (70, 70, 70)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (71, 71, 71)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (72, 72, 72)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (73, 73, 73)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (74, 74, 74)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (75, 75, 75)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (76, 76, 76)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (77, 77, 77)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (78, 78, 78)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (79, 79, 79)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (80, 80, 80)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (81, 81, 81)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (82, 82, 82)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (83, 83, 83)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (84, 84, 84)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (85, 85, 85)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (86, 86, 86)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (87, 87, 87)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (88, 88, 88)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (89, 89, 89)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (90, 90, 90)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (91, 91, 91)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (92, 92, 92)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (93, 93, 93)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (94, 94, 94)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (95, 95, 95)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (96, 96, 96)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (97, 97, 97)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (98, 98, 98)
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (99, 99, 99)
GO
INSERT [dbo].[personAddress] ([person_address_id], [person_id], [address_id]) VALUES (100, 100, 100)
SET IDENTITY_INSERT [dbo].[personAddress] OFF
SET IDENTITY_INSERT [dbo].[personEmail] ON 

INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (1, 1, 1)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (2, 2, 2)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (3, 3, 3)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (4, 4, 4)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (5, 5, 5)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (6, 6, 6)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (7, 7, 7)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (8, 8, 8)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (9, 9, 9)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (10, 10, 10)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (11, 11, 11)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (12, 12, 12)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (13, 13, 13)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (14, 14, 14)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (15, 15, 15)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (16, 16, 16)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (17, 17, 17)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (18, 18, 18)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (19, 19, 19)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (20, 20, 20)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (21, 21, 21)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (22, 22, 22)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (23, 23, 23)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (24, 24, 24)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (25, 25, 25)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (26, 26, 26)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (27, 27, 27)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (28, 28, 28)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (29, 29, 29)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (30, 30, 30)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (31, 31, 31)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (32, 32, 32)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (33, 33, 33)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (34, 34, 34)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (35, 35, 35)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (36, 36, 36)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (37, 37, 37)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (38, 38, 38)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (39, 39, 39)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (40, 40, 40)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (41, 41, 41)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (42, 42, 42)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (43, 43, 43)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (44, 44, 44)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (45, 45, 45)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (46, 46, 46)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (47, 47, 47)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (48, 48, 48)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (49, 49, 49)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (50, 50, 50)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (51, 51, 51)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (52, 52, 52)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (53, 53, 53)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (54, 54, 54)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (55, 55, 55)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (56, 56, 56)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (57, 57, 57)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (58, 58, 58)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (59, 59, 59)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (60, 60, 60)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (61, 61, 61)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (62, 62, 62)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (63, 63, 63)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (64, 64, 64)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (65, 65, 65)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (66, 66, 66)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (67, 67, 67)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (68, 68, 68)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (69, 69, 69)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (70, 70, 70)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (71, 71, 71)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (72, 72, 72)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (73, 73, 73)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (74, 74, 74)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (75, 75, 75)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (76, 76, 76)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (77, 77, 77)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (78, 78, 78)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (79, 79, 79)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (80, 80, 80)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (81, 81, 81)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (82, 82, 82)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (83, 83, 83)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (84, 84, 84)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (85, 85, 85)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (86, 86, 86)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (87, 87, 87)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (88, 88, 88)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (89, 89, 89)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (90, 90, 90)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (91, 91, 91)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (92, 92, 92)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (93, 93, 93)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (94, 94, 94)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (95, 95, 95)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (96, 96, 96)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (97, 97, 97)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (98, 98, 98)
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (99, 99, 99)
GO
INSERT [dbo].[personEmail] ([person_email_id], [peson_id], [email_id]) VALUES (100, 100, 100)
SET IDENTITY_INSERT [dbo].[personEmail] OFF
SET IDENTITY_INSERT [dbo].[presentation] ON 

INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (1, N'A dive into Data Quality Services', N'Steve Simon', N'Intermediate', N'New York', 1, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (2, N'A Dynamic World Demands Dynamic SQL', N'Jeremiah Peschka', N'Intermediate', N'Kiyv', 2, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (3, N'A Dynamic World Demands Dynamic SQL', N'Jeremiah Peschka', N'Intermediate', N'Kiyv', 3, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (4, N'Absolute Introductory Session on SQL Server 2014 In-Memory Optimized Databases (Hekaton)', N'Kevin Goff', N'Beginner', N'Budapest', 4, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (5, N'AlwaysOn: Improve reliability and reporting performance with one cool tech', N'Chris Seferlis', N'Beginner', N'New York', 5, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (6, N'An introduction to Data Mining', N'Steve Simon', N'Intermediate', N'Kiyv', 1, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (7, N'An Introduction to Database Design', N'Mohammad Yusuf', N'Beginner', N'New York', 2, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (8, N'Autogenerating a process data warehouse', N'Kennie Pontoppidan', N'Advanced', N'New York', 3, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (9, N'Automate your daily checklist with PBM and CMS', N'John Sterrett', N'Intermediate', N'Budapest', 4, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (10, N'Automated Installing and Configuration of SQL2014/SQL2012 AlwaysOn Across Multiple Datacenters', N'Thomas Grohser', N'Intermediate', N'New York', 5, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (11, N'Automated Installing and Configuration of SQL2014/SQL2012 AlwaysOn Across Multiple Datacenters', N'Thomas Grohser', N'Intermediate', N'Kiev', 5, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (12, N'Automating Execution Plan Analysis', N'Joe Chang', N'Advanced', N'Kiev', 4, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (13, N'Automating Execution Plan Analysis', N'Joe Chang', N'Advanced', N'New York', 3, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (14, N'Automating SQL Server using PowerShell', N'Michael Wharton', N'Intermediate', N'New York', 2, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (15, N'Balanced Scorecards using SSRS', N'Sunil Kadimdiwan', N'Intermediate', N'Budapest', 1, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (16, N'Baselines and Performance Monitoring with PAL', N'Mike Walsh', N'Beginner', N'New York', 3, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (17, N'Basic Database Design', N'John Miner', N'Beginner', N'New York', 2, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (18, N'Basic Database Programming', N'John Miner', N'Beginner', N'Kiev', 4, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (19, N'Become a BI Independent Consultant!', N'James Serra', N'Beginner', N'Budapest', 5, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (20, N'Becoming a Top DBA--Learning Automation in SQL Server', N'Joseph D''Antoni', N'Beginner', N'Kiev', 2, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (21, N'Best Practices Document', N'Paresh Motiwala', N'Intermediate', N'Kiev', 3, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (22, N'Best Practices for Efficient SSRS Report Creation', N'Mickey Stuewe', N'Beginner', N'New York', 4, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (23, N'Biggest Loser: Database Edition', N'John Miner', N'Intermediate', N'New York', 5, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (24, N'Building a BI Solution in the Cloud', N'Stacia Misner', N'Intermediate', N'Budapest', 1, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (25, N'Building an Effective Data Warehouse Architecture', N'James Serra', N'Beginner', N'New York', 2, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (26, N'Building an Effective Data Warehouse Architecture with the cloud and MPP', N'James Serra', N'Beginner', N'New York', 1, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (27, N'Bulk load and minimal logged inserts', N'David Peter Hansen', N'Advanced', N'New York', 4, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (28, N'Business Analytics with SQL Server & Power Map:Everything you want to know but were afraid to ask', N'Steve Simon', N'Intermediate', N'New York', 5, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (29, N'Challenges to designing financial warehouses, lessons learnt', N'Steve Simon', N'Intermediate', N'New York', 2, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (30, N'Change Data Capture in SQL Server 2008/2012', N'Kevin Goff', N'Intermediate', N'New York', 3, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (31, N'Changing Your Habits to Improve the Performance of Your T-SQL', N'Mickey Stuewe', N'Beginner', N'Kiev', 3, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (32, N'Clusters Your Way: #SANLess Clusters for Physical, Virtual, and Cloud Environments', N'Allan Hirt and SIOS Technology', N'Beginner', N'Kiev', 2, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (33, N'Clusters Your Way: #SANLess Clusters for Physical, Virtual, and Cloud Environments', N'Allan Hirt', N'Non-Technical', N'Kiev', 2, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (34, N'Coffee Break', N'SQLSatruday 364', N'Non-Technical', N'Budapest', 4, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (35, N'Creating A Performance Health Repository - using MDW', N'Robert Pearl', N'Beginner', N'Kiev', 5, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (36, N'Creating efficient and effective SSRS BI Solutions', N'Steve Simon', N'Intermediate', N'Kiev', 1, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (37, N'Creating efficient and effective SSRS BI Solutions', N'Steve Simon', N'Intermediate', N'New York', 3, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (38, N'Data Partitioning', N'John Flannery', N'Intermediate', N'New York', 5, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (39, N'Data Tier Application Testing with NUnit and Distributed Replay', N'John Flannery', N'Intermediate', N'New York', 3, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (40, N'Database design for mere developers', N'Steve Simon', N'Intermediate', N'Budapest', 2, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (41, N'Database design for mere developers', N'Steve Simon', N'Intermediate', N'New York', 3, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (42, N'Database Design: Solving Problems Before they Start!', N'Edward Pollack', N'Beginner', N'New York', 2, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (43, N'Database Modeling and Design', N'Mohammad Yusuf', N'Intermediate', N'New York', 5, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (44, N'Database Virtualization and Drinking out of the Fire Hose', N'Michael Corey', N'Intermediate', N'New York', 1, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (45, N'DAX and the tabular model', N'Steve Simon', N'Intermediate', N'Kiev', 3, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (46, N'DBA FOR DUMMIES', N'Robert Pearl', N'Beginner', N'Budapest', 4, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (47, N'Dealing With Difficult People', N'Gigi Bell', N'Beginner', N'Kiev', 1, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (48, N'Development Lifecycle with SQL Server Data Tools and DACFx', N'John Flannery', N'Intermediate', N'Kiev', 4, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (49, N'Did You Vote Today? A DBAs Guide to Cluster Quorum', N'Allan Hirt', N'Advanced', N'Kiev', 1, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (50, N'Dimensional Modeling Design Patterns: Beyond Basics', N'Jason Horner', N'Intermediate', N'Kiev', 4, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (51, N'Dimensional Modeling Design Patterns: Beyond Basics', N'Jason Horner', N'Intermediate', N'Budapest', 3, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (52, N'Diving Into Query Execution Plans', N'Edward Pollack', N'Intermediate', N'New York', 2, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (53, N'Dynamic SQL: Writing Efficient Queries on the Fly', N'Edward Pollack', N'Beginner', N'Kiev', 4, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (54, N'Easy Architecture Design for HA and DR', N'Brent Ozar', N'Intermediate', N'New York', 2, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (55, N'Enhancing your career: Building your personal brand', N'James Serra', N'Beginner', N'New York', 4, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (56, N'Establishing a SLA', N'Thomas Grohser', N'Intermediate', N'New York', 1, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (57, N'ETL not ELT! Common mistakes and misconceptions about SSIS', N'Paul Rizza', N'Advanced', N'Budapest', 4, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (58, N'Event Kickoff and Networking', N'SQLSaturday 364', N'Non-Technical', N'New York', 2, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (59, N'Execution Plans: What Can You Do With Them?', N'Grant Fritchey', N'Intermediate', N'New York', 1, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (60, N'Faster, Better Decisions with Self Service Business Analytics', N'Sayed Saeed', N'Intermediate', N'New York', 1, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (61, N'Full Text Indexing Basics', N'John Miner', N'Beginner', N'Budapest', 5, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (62, N'Get your Mining Model Predictions out to all', N'Steve Simon', N'Intermediate', N'New York', 3, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (63, N'Getting a job with Microsoft', N'Paul Rizza', N'Non-Technical', N'New York', 5, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (64, N'Graph Databases for SQL Server Professionals', N'Stéphane Fréchette', N'Intermediate', N'New York', 2, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (65, N'Hacking Exposé - Using SSL to Protect SQL Connections', N'Chris Bell', N'Intermediate', N'New York', 1, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (66, N'Hacking the SSIS 2012 Catalog', N'Andy Leonard', N'Beginner', N'Budapest', 2, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (67, N'Hidden in plain sight: master your tools', N'Varsham Papikian', N'Intermediate', N'New York', 1, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (68, N'Highly Available SQL Server in Windows Azure IaaS', N'David Bermingham', N'Intermediate', N'New York', 4, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (69, N'How to Make a LOT More Money as a Consultant', N'James Serra', N'Beginner', N'New York', 2, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (70, N'How to Think Like the Engine', N'Brent Ozar', N'Intermediate', N'New York', 1, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (71, N'Hybrid Cloud Scenarios with SQL Server 2014', N'George Walters', N'Intermediate', N'Budapest', 1, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (72, N'Hybrid Solutions: The Future of SQL Server Disaster Recovery', N'Allan Hirt', N'Intermediate', N'Budapest', 1, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (73, N'Implementing Data Warehouse Patterns with the Microsoft BI Tools', N'Kevin Goff', N'Intermediate', N'Budapest', 1, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (74, N'Inroduction to Triggers', N'Jack Corbett', N'Beginner', N'Budapest', 1, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (75, N'Integrating Reporting Services with SharePoint', N'Kevin Goff', N'Intermediate', N'New York', 1, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (76, N'Integration Services (SSIS) for the DBA', N'David Peter Hansen', N'Intermediate', N'New York', 1, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (77, N'Introducing Power BI', N'Stacia Misner', N'Beginner', N'New York', 1, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (78, N'Introduction to Database Recovery', N'John Flannery', N'Beginner', N'New York', 1, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (79, N'Introduction to High Availability with SQL Server', N'John Sterrett', N'Beginner', N'New York', 1, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (80, N'Introduction to Powershell for DBA''s', N'John Sterrett', N'Beginner', N'New York', 2, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (81, N'Introduction to SQL Server - Part 1', N'Brandon Leach', N'Beginner', N'New York', 2, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (82, N'Introduction to SQL Server - Part 2', N'Brandon Leach', N'Beginner', N'New York', 3, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (83, N'Is That A Failover Cluster On Your Laptop/Desktop?', N'Allan Hirt', N'Intermediate', N'New York', 3, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (84, N'Leaving the Windows Open', N'Jeremiah Peschka', N'Intermediate', N'New York', 3, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (85, N'Lunch Break', N'SQLSaturday 364', N'Non-Technical', N'New York', 3, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (86, N'Lunchtime Keynote', N'SQLSaturday 364', N'Non-Technical', N'New York', 3, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (87, N'Master Data Services Best Practices', N'Steve Simon', N'Intermediate', N'New York', 3, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (88, N'Master Data Services Disaster Recovery', N'Steve Simon', N'Intermediate', N'New York', 4, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (89, N'Mind your language!! Cursors are a dirty word', N'Steve Simon', N'Intermediate', N'New York', 4, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (90, N'Modern Data Warehousing', N'James Serra', N'Beginner', N'New York', 4, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (91, N'Monitoring Server health via Reporting Services dashboards', N'Steve Simon', N'Intermediate', N'New York', 4, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (92, N'Monitoring SQL Server using Extended Events', N'Hilary Cotter', N'Beginner', N'New York', 4, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (93, N'Multidimensional vs Tabular - May the Best Model Win', N'Stacia Misner', N'Intermediate', N'New York', 4, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (94, N'Murder They Wrote', N'Jason Brimhall', N'Intermediate', N'New York', 4, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (95, N'Never Have to Say "Mayday!!!" Again', N'Mike Walsh', N'Beginner', N'New York', 5, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (96, N'Now you see it! Now you don’t! Conjuring many reports utilizing only one SSRS report.', N'Steve Simon', N'Intermediate', N'New York', 2, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (97, N'Optimal Infrastructure Strategies for Cisco UCS, Nexus and SQL Server', N'Kevin Schenega', N'Non-Technical', N'Budapest', 1, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (98, N'Optimizing Protected Indexes', N'Chris Bell', N'Intermediate', N'Budapest', 2, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (99, N'Partitioning as a design pattern', N'Kennie Pontoppidan', N'Advanced', N'Budapest', 3, NULL, NULL, NULL)
GO
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (100, N'Power BI Components in Microsoft''s Self-Service BI Suite', N'Todd Chittenden', N'Beginner', N'New York', 4, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (101, N'Power to the people!!', N'Steve Simon', N'Intermediate', N'Kiyv', 5, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (102, N'PowerShell Basics for SQLServer', N'Michael Wharton', N'Beginner', N'Kiyv', 1, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (103, N'PowerShell for the Reluctant DBA / Developer', N'Jason Horner', N'Beginner', N'Kiyv', 2, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (104, N'Prevent Recovery Amnesia – Forget the Backups', N'Chris Bell', N'Beginner', N'Kiyv', 3, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (105, N'Query Optimization Crash Course', N'Edward Pollack', N'Beginner', N'Kiyv', 5, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (106, N'Raffle', N'SQLSaturday 364', N'Non-Technical', N'', 2, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (107, N'Rapid Application Development with Master Data Services', N'Steve Simon', N'Intermediate', N'Kiyv', 1, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (108, N'Recovery and Backup for Beginners', N'Mike Hillwig', N'Beginner', N'Kiyv', 4, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (109, N'Reduce, Reuse, Recycle: Automating Your BI Framework', N'Stacia Misner', N'Intermediate', N'Kiyv', 4, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (110, N'Registrations', N'SQLSaturday 364', N'Non-Technical', N'', NULL, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (111, N'Replicaton Technologies', N'Hilary Cotter', N'Advanced', N'Kiyv', NULL, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (112, N'Reporting Services for Mere DBAs', N'Jason Brimhall', N'Intermediate', N'Kiyv', NULL, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (113, N'Scaling with SQL Server Service Broker', N'Hilary Cotter', N'Advanced', N'Kiyv', NULL, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (114, N'Scaling with SQL Server Service Broker', N'Hilary Cotter', N'Advanced', N'Kiyv', NULL, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (115, N'Self-Service Data Integration with Power Query', N'Stéphane Fréchette', N'Beginner', N'Kiyv', NULL, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (116, N'Shortcuts to Building SSIS in .Net', N'Paul Rizza', N'Beginner', N'Kiyv', NULL, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (117, N'So You Want To Be A Consultant?', N'Allan Hirt', N'Beginner', N'Kiyv', NULL, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (118, N'SQL anti patterns', N'Kennie Pontoppidan', N'Advanced', N'Kiyv', NULL, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (119, N'SQL Server 2012/2014 Columnstore index', N'Kevin Goff', N'Intermediate', N'Kiyv', 3, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (120, N'SQL Server 2012/2014 Performance Tuning All Up', N'George Walters', N'Intermediate', N'Kiyv', 5, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (121, N'SQL Server 2014 Data Access Layers', N'Steve Simon', N'Intermediate', N'Kiyv', 2, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (122, N'SQL Server 2014 New Features', N'George Walters', N'Intermediate', N'Kiyv', 3, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (123, N'SQL Server AlwaysOn Availability Groups', N'George Walters', N'Beginner', N'Kiyv', 4, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (124, N'SQL Server and the Cloud', N'David Peter Hansen', N'Beginner', N'Kiyv', 1, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (125, N'SQL Server Compression and what it can do for you', N'Jason Brimhall', N'Advanced', N'Kiyv', 3, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (126, N'SQL Server Reporting Services 2014 on Steroids!!', N'Steve Simon', N'Intermediate', N'Kiyv', 2, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (127, N'SQL Server Reporting Services Best Practices', N'Steve Simon', N'Intermediate', N'Kiyv', 2, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (128, N'SQL Server Reporting Services, attendees choose', N'Kevin Goff', N'Intermediate', N'Kiyv', 5, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (129, N'SQL Server Storage Engine under the hood', N'Thomas Grohser', N'Intermediate', N'Kiyv', 3, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (130, N'SQL Server Storage internals: Looking under the hood.', N'Brandon Leach', N'Advanced', N'Kiyv', 5, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (131, N'SSIS 2014 Data Flow Tuning Tips and Tricks', N'Andy Leonard', N'Beginner', N'Kiyv', 2, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (132, N'Standalone to High-Availability Clusters over Lunch—with Time to Spare', N'Carl Berglund', N'Intermediate', N'Budapest', 1, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (133, N'Stress testing SQL Server', N'Hilary Cotter', N'Advanced', N'Kiyv', 2, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (134, N'Table partitioning for Azure SQL Databases', N'John Miner', N'Beginner', N'Kiyv', 3, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (135, N'Testing', N'Melissa Riley', N'Beginner', N'Kiyv', 2, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (136, N'The future of the data professional', N'Adam Jorgensen', N'Beginner', N'Kiyv', 2, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (137, N'The Quest for the Golden Record:MDM Best Practices', N'Dennis Messina', N'Beginner', N'Budapest', 5, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (138, N'The Quest to Find Bad Data With Data Profiling', N'Richie Rump', N'Intermediate', N'Budapest', 1, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (139, N'The Spy Who Loathed Me - An Intro to SQL Security', N'Chris Bell', N'Beginner', N'Budapest', 2, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (140, N'Tired of the CRUD? Automate it!', N'Jack Corbett', N'Intermediate', N'Budapest', 3, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (141, N'Top 5 Ways to Improve Your triggers', N'Aaron Bertrand', N'Intermediate', N'Budapest', 4, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (142, N'Tricks that have saved my bacon', N'Greg Moore', N'Beginner', N'Budapest', 1, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (143, N'T-SQL : Bad Habits & Best Practices', N'Aaron Bertrand', N'Beginner', N'Budapest', 2, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (144, N'T-SQL for Application Developers - Attendees chose', N'Kevin Goff', N'Intermediate', N'Budapest', 1, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (145, N'Tune Queries By Fixing Bad Parameter Sniffing', N'Grant Fritchey', N'Intermediate', N'Budapest', 4, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (146, N'Using Extended Events in SQL Server', N'Jason Brimhall', N'Advanced', N'Budapest', 3, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (147, N'Watch Brent Tune Queries', N'Brent Ozar', N'Intermediate', N'Budapest', 2, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (148, N'What every SQL Server DBA needs to know about Windows Server 10 Technical Preview', N'David Bermingham', N'Intermediate', N'Budapest', 4, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (149, N'What exactly is big data and why should I care?', N'James Serra', N'Beginner', N'Budapest', 2, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (150, N'What is it like to work for Microsoft?', N'James Serra', N'Beginner', N'Budapest', 4, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (151, N'What’s new in SQL Server Integration Services 2012', N'Kevin Goff', N'Intermediate', N'Budapest', 5, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (152, N'Why do we shun using tools for DBA job?', N'Paresh Motiwala', N'Intermediate', N'Budapest', 1, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (153, N'Why OLAP? Building SSAS cubes and benefits of OLAP', N'Kevin Goff', N'Intermediate', N'Budapest', 5, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (154, N'You''re Doing It Wrong!!', N'Mike Walsh', N'Intermediate', N'Budapest', 2, NULL, NULL, NULL)
INSERT [dbo].[presentation] ([presentation_id], [title], [speaker], [level], [event], [track_id], [speeaker_id], [room_id], [event_id]) VALUES (155, N'Working with stored procedures.', N'Armenak Mazmanyan', NULL, NULL, 5, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[presentation] OFF
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([role_id], [name]) VALUES (1, N'Presenter')
INSERT [dbo].[role] ([role_id], [name]) VALUES (2, N'Attendee')
INSERT [dbo].[role] ([role_id], [name]) VALUES (3, N'Organizer')
INSERT [dbo].[role] ([role_id], [name]) VALUES (4, N'Volunteer')
INSERT [dbo].[role] ([role_id], [name]) VALUES (5, N'Sponsor')
SET IDENTITY_INSERT [dbo].[role] OFF
SET IDENTITY_INSERT [dbo].[sponsor] ON 

INSERT [dbo].[sponsor] ([sponsor_id], [name], [contribution]) VALUES (1, N'VMWare', N'Platinum Sponsor')
INSERT [dbo].[sponsor] ([sponsor_id], [name], [contribution]) VALUES (2, N'Verizon Digital Media Services', N'Platinum Sponsor')
INSERT [dbo].[sponsor] ([sponsor_id], [name], [contribution]) VALUES (3, N'Microsoft Corporation (GAP) (GAP Sponsor)', N'Platinum Sponsor')
INSERT [dbo].[sponsor] ([sponsor_id], [name], [contribution]) VALUES (4, N'Tintri', N'Platinum Sponsor')
INSERT [dbo].[sponsor] ([sponsor_id], [name], [contribution]) VALUES (5, N'Amazon Web Services, LLC', N'Gold Sponsor')
INSERT [dbo].[sponsor] ([sponsor_id], [name], [contribution]) VALUES (6, N'Pyramid Analytics (GAP Sponsor)', N'Gold Sponsor')
INSERT [dbo].[sponsor] ([sponsor_id], [name], [contribution]) VALUES (7, N'Pure Storage', N'Gold Sponsor')
INSERT [dbo].[sponsor] ([sponsor_id], [name], [contribution]) VALUES (8, N'Profisee', N'Gold Sponsor')
INSERT [dbo].[sponsor] ([sponsor_id], [name], [contribution]) VALUES (9, N'NetLib Security', N'Silver Sponsor')
INSERT [dbo].[sponsor] ([sponsor_id], [name], [contribution]) VALUES (10, N'Melissa Data Corp.', N'Silver Sponsor')
INSERT [dbo].[sponsor] ([sponsor_id], [name], [contribution]) VALUES (11, N'Red Gate Software', N'Silver Sponsor')
INSERT [dbo].[sponsor] ([sponsor_id], [name], [contribution]) VALUES (12, N'SentryOne', N'Silver Sponsor')
INSERT [dbo].[sponsor] ([sponsor_id], [name], [contribution]) VALUES (13, N'Hush Hush', N'Bronze Sponsor')
INSERT [dbo].[sponsor] ([sponsor_id], [name], [contribution]) VALUES (14, N'COZYROC', N'Bronze Sponsor')
INSERT [dbo].[sponsor] ([sponsor_id], [name], [contribution]) VALUES (15, N'SQLDocKit by Acceleratio Ltd.', N'Bronze Sponsor')
SET IDENTITY_INSERT [dbo].[sponsor] OFF
SET IDENTITY_INSERT [dbo].[track] ON 

INSERT [dbo].[track] ([track_id], [name]) VALUES (1, N'Administración 01 ')
INSERT [dbo].[track] ([track_id], [name]) VALUES (2, N'Administración 02 ')
INSERT [dbo].[track] ([track_id], [name]) VALUES (3, N'NULAdministración 03L')
INSERT [dbo].[track] ([track_id], [name]) VALUES (4, N'BI 01 ')
INSERT [dbo].[track] ([track_id], [name]) VALUES (5, N'BI 02')
SET IDENTITY_INSERT [dbo].[track] OFF
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_class_length]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[class] ADD  CONSTRAINT [DF_class_length]  DEFAULT ((60)) FOR [length]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_building_address]') AND parent_object_id = OBJECT_ID(N'[dbo].[building]'))
ALTER TABLE [dbo].[building]  WITH CHECK ADD  CONSTRAINT [FK_building_address] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([address_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_building_address]') AND parent_object_id = OBJECT_ID(N'[dbo].[building]'))
ALTER TABLE [dbo].[building] CHECK CONSTRAINT [FK_building_address]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_eventSponsor_event]') AND parent_object_id = OBJECT_ID(N'[dbo].[eventSponsor]'))
ALTER TABLE [dbo].[eventSponsor]  WITH CHECK ADD  CONSTRAINT [FK_eventSponsor_event] FOREIGN KEY([event_id])
REFERENCES [dbo].[event] ([event_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_eventSponsor_event]') AND parent_object_id = OBJECT_ID(N'[dbo].[eventSponsor]'))
ALTER TABLE [dbo].[eventSponsor] CHECK CONSTRAINT [FK_eventSponsor_event]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_eventSponsor_sponsor]') AND parent_object_id = OBJECT_ID(N'[dbo].[eventSponsor]'))
ALTER TABLE [dbo].[eventSponsor]  WITH CHECK ADD  CONSTRAINT [FK_eventSponsor_sponsor] FOREIGN KEY([event_sponsor_id])
REFERENCES [dbo].[sponsor] ([sponsor_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_eventSponsor_sponsor]') AND parent_object_id = OBJECT_ID(N'[dbo].[eventSponsor]'))
ALTER TABLE [dbo].[eventSponsor] CHECK CONSTRAINT [FK_eventSponsor_sponsor]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_personAddress_address]') AND parent_object_id = OBJECT_ID(N'[dbo].[personAddress]'))
ALTER TABLE [dbo].[personAddress]  WITH CHECK ADD  CONSTRAINT [FK_personAddress_address] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([address_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_personAddress_address]') AND parent_object_id = OBJECT_ID(N'[dbo].[personAddress]'))
ALTER TABLE [dbo].[personAddress] CHECK CONSTRAINT [FK_personAddress_address]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_personAddress_person]') AND parent_object_id = OBJECT_ID(N'[dbo].[personAddress]'))
ALTER TABLE [dbo].[personAddress]  WITH CHECK ADD  CONSTRAINT [FK_personAddress_person] FOREIGN KEY([person_id])
REFERENCES [dbo].[person] ([person_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_personAddress_person]') AND parent_object_id = OBJECT_ID(N'[dbo].[personAddress]'))
ALTER TABLE [dbo].[personAddress] CHECK CONSTRAINT [FK_personAddress_person]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_personEmail_email]') AND parent_object_id = OBJECT_ID(N'[dbo].[personEmail]'))
ALTER TABLE [dbo].[personEmail]  WITH CHECK ADD  CONSTRAINT [FK_personEmail_email] FOREIGN KEY([email_id])
REFERENCES [dbo].[email] ([email_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_personEmail_email]') AND parent_object_id = OBJECT_ID(N'[dbo].[personEmail]'))
ALTER TABLE [dbo].[personEmail] CHECK CONSTRAINT [FK_personEmail_email]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_personEmail_person]') AND parent_object_id = OBJECT_ID(N'[dbo].[personEmail]'))
ALTER TABLE [dbo].[personEmail]  WITH CHECK ADD  CONSTRAINT [FK_personEmail_person] FOREIGN KEY([peson_id])
REFERENCES [dbo].[person] ([person_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_personEmail_person]') AND parent_object_id = OBJECT_ID(N'[dbo].[personEmail]'))
ALTER TABLE [dbo].[personEmail] CHECK CONSTRAINT [FK_personEmail_person]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_personPresentation_person]') AND parent_object_id = OBJECT_ID(N'[dbo].[personPresentation]'))
ALTER TABLE [dbo].[personPresentation]  WITH CHECK ADD  CONSTRAINT [FK_personPresentation_person] FOREIGN KEY([person_id])
REFERENCES [dbo].[person] ([person_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_personPresentation_person]') AND parent_object_id = OBJECT_ID(N'[dbo].[personPresentation]'))
ALTER TABLE [dbo].[personPresentation] CHECK CONSTRAINT [FK_personPresentation_person]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_personPresentation_presentation]') AND parent_object_id = OBJECT_ID(N'[dbo].[personPresentation]'))
ALTER TABLE [dbo].[personPresentation]  WITH CHECK ADD  CONSTRAINT [FK_personPresentation_presentation] FOREIGN KEY([presentation_id])
REFERENCES [dbo].[presentation_backup] ([presentation_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_personPresentation_presentation]') AND parent_object_id = OBJECT_ID(N'[dbo].[personPresentation]'))
ALTER TABLE [dbo].[personPresentation] CHECK CONSTRAINT [FK_personPresentation_presentation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_personPresentation_presentation1]') AND parent_object_id = OBJECT_ID(N'[dbo].[personPresentation]'))
ALTER TABLE [dbo].[personPresentation]  WITH CHECK ADD  CONSTRAINT [FK_personPresentation_presentation1] FOREIGN KEY([presentation_id])
REFERENCES [dbo].[presentation] ([presentation_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_personPresentation_presentation1]') AND parent_object_id = OBJECT_ID(N'[dbo].[personPresentation]'))
ALTER TABLE [dbo].[personPresentation] CHECK CONSTRAINT [FK_personPresentation_presentation1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_personRole_person]') AND parent_object_id = OBJECT_ID(N'[dbo].[personRole]'))
ALTER TABLE [dbo].[personRole]  WITH CHECK ADD  CONSTRAINT [FK_personRole_person] FOREIGN KEY([person_id])
REFERENCES [dbo].[person] ([person_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_personRole_person]') AND parent_object_id = OBJECT_ID(N'[dbo].[personRole]'))
ALTER TABLE [dbo].[personRole] CHECK CONSTRAINT [FK_personRole_person]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_personRole_role]') AND parent_object_id = OBJECT_ID(N'[dbo].[personRole]'))
ALTER TABLE [dbo].[personRole]  WITH CHECK ADD  CONSTRAINT [FK_personRole_role] FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([role_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_personRole_role]') AND parent_object_id = OBJECT_ID(N'[dbo].[personRole]'))
ALTER TABLE [dbo].[personRole] CHECK CONSTRAINT [FK_personRole_role]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_personRole_role1]') AND parent_object_id = OBJECT_ID(N'[dbo].[personRole]'))
ALTER TABLE [dbo].[personRole]  WITH CHECK ADD  CONSTRAINT [FK_personRole_role1] FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([role_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_personRole_role1]') AND parent_object_id = OBJECT_ID(N'[dbo].[personRole]'))
ALTER TABLE [dbo].[personRole] CHECK CONSTRAINT [FK_personRole_role1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_presentation_event1]') AND parent_object_id = OBJECT_ID(N'[dbo].[presentation]'))
ALTER TABLE [dbo].[presentation]  WITH CHECK ADD  CONSTRAINT [FK_presentation_event1] FOREIGN KEY([event_id])
REFERENCES [dbo].[event] ([event_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_presentation_event1]') AND parent_object_id = OBJECT_ID(N'[dbo].[presentation]'))
ALTER TABLE [dbo].[presentation] CHECK CONSTRAINT [FK_presentation_event1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_presentation_person]') AND parent_object_id = OBJECT_ID(N'[dbo].[presentation]'))
ALTER TABLE [dbo].[presentation]  WITH CHECK ADD  CONSTRAINT [FK_presentation_person] FOREIGN KEY([speeaker_id])
REFERENCES [dbo].[person] ([person_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_presentation_person]') AND parent_object_id = OBJECT_ID(N'[dbo].[presentation]'))
ALTER TABLE [dbo].[presentation] CHECK CONSTRAINT [FK_presentation_person]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_presentation_room1]') AND parent_object_id = OBJECT_ID(N'[dbo].[presentation]'))
ALTER TABLE [dbo].[presentation]  WITH CHECK ADD  CONSTRAINT [FK_presentation_room1] FOREIGN KEY([room_id])
REFERENCES [dbo].[room] ([room_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_presentation_room1]') AND parent_object_id = OBJECT_ID(N'[dbo].[presentation]'))
ALTER TABLE [dbo].[presentation] CHECK CONSTRAINT [FK_presentation_room1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_presentation_track1]') AND parent_object_id = OBJECT_ID(N'[dbo].[presentation]'))
ALTER TABLE [dbo].[presentation]  WITH CHECK ADD  CONSTRAINT [FK_presentation_track1] FOREIGN KEY([track_id])
REFERENCES [dbo].[track] ([track_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_presentation_track1]') AND parent_object_id = OBJECT_ID(N'[dbo].[presentation]'))
ALTER TABLE [dbo].[presentation] CHECK CONSTRAINT [FK_presentation_track1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_room_building]') AND parent_object_id = OBJECT_ID(N'[dbo].[room]'))
ALTER TABLE [dbo].[room]  WITH CHECK ADD  CONSTRAINT [FK_room_building] FOREIGN KEY([building_id])
REFERENCES [dbo].[building] ([building_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_room_building]') AND parent_object_id = OBJECT_ID(N'[dbo].[room]'))
ALTER TABLE [dbo].[room] CHECK CONSTRAINT [FK_room_building]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_schedule_person]') AND parent_object_id = OBJECT_ID(N'[dbo].[schedule]'))
ALTER TABLE [dbo].[schedule]  WITH CHECK ADD  CONSTRAINT [FK_schedule_person] FOREIGN KEY([person_id])
REFERENCES [dbo].[person] ([person_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_schedule_person]') AND parent_object_id = OBJECT_ID(N'[dbo].[schedule]'))
ALTER TABLE [dbo].[schedule] CHECK CONSTRAINT [FK_schedule_person]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_schedule_presentation]') AND parent_object_id = OBJECT_ID(N'[dbo].[schedule]'))
ALTER TABLE [dbo].[schedule]  WITH CHECK ADD  CONSTRAINT [FK_schedule_presentation] FOREIGN KEY([presentation_id])
REFERENCES [dbo].[presentation_backup] ([presentation_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_schedule_presentation]') AND parent_object_id = OBJECT_ID(N'[dbo].[schedule]'))
ALTER TABLE [dbo].[schedule] CHECK CONSTRAINT [FK_schedule_presentation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_schedule_room]') AND parent_object_id = OBJECT_ID(N'[dbo].[schedule]'))
ALTER TABLE [dbo].[schedule]  WITH CHECK ADD  CONSTRAINT [FK_schedule_room] FOREIGN KEY([room_id])
REFERENCES [dbo].[room] ([room_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_schedule_room]') AND parent_object_id = OBJECT_ID(N'[dbo].[schedule]'))
ALTER TABLE [dbo].[schedule] CHECK CONSTRAINT [FK_schedule_room]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_presentation_event]') AND parent_object_id = OBJECT_ID(N'[dbo].[presentation_backup]'))
ALTER TABLE [dbo].[presentation_backup]  WITH CHECK ADD  CONSTRAINT [FK_presentation_event] FOREIGN KEY([event_id])
REFERENCES [dbo].[event] ([event_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_presentation_event]') AND parent_object_id = OBJECT_ID(N'[dbo].[presentation_backup]'))
ALTER TABLE [dbo].[presentation_backup] CHECK CONSTRAINT [FK_presentation_event]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_presentation_room]') AND parent_object_id = OBJECT_ID(N'[dbo].[presentation_backup]'))
ALTER TABLE [dbo].[presentation_backup]  WITH CHECK ADD  CONSTRAINT [FK_presentation_room] FOREIGN KEY([room_id])
REFERENCES [dbo].[room] ([room_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_presentation_room]') AND parent_object_id = OBJECT_ID(N'[dbo].[presentation_backup]'))
ALTER TABLE [dbo].[presentation_backup] CHECK CONSTRAINT [FK_presentation_room]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_presentation_track]') AND parent_object_id = OBJECT_ID(N'[dbo].[presentation_backup]'))
ALTER TABLE [dbo].[presentation_backup]  WITH CHECK ADD  CONSTRAINT [FK_presentation_track] FOREIGN KEY([track_id])
REFERENCES [dbo].[track] ([track_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_presentation_track]') AND parent_object_id = OBJECT_ID(N'[dbo].[presentation_backup]'))
ALTER TABLE [dbo].[presentation_backup] CHECK CONSTRAINT [FK_presentation_track]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[insertStoredP]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[insertStoredP] AS' 
END
GO
ALTER PROCEDURE [dbo].[insertStoredP]
  @name  VARCHAR(150)  ,
  @title VARCHAR(255)
  AS
        IF NOT EXISTS(SELECT presentation.title FROM presentation WHERE title = @title)
          BEGIN TRY
          INSERT INTO presentation
            (title, speaker)
          VALUES
            (@title, @name)
            END TRY
            BEGIN CATCH
              PRINT 'Error inserting Presentation'
            END CATCH
        IF NOT EXISTS (SELECT person.person_ID From person
        WHERE first_name = SUBSTRING(@name, 1, CHARINDEX(' ', @name) - 1)
          AND last_Name = REVERSE(SUBSTRING(REVERSE(@name), 1, CHARINDEX(' ', REVERSE(@name)) - 1)))
          BEGIN TRY
            INSERT INTO person
            (first_name, last_name)
            VALUES
              (SUBSTRING(@name, 1, CHARINDEX(' ', @name) - 1), REVERSE(SUBSTRING(REVERSE(@name), 1, CHARINDEX(' ', REVERSE(@name)) - 1)))
          END TRY 
            BEGIN CATCH 
              PRINT 'Error inserting Speaker' 
            END CATCH

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[selectBudapest]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[selectBudapest] AS' 
END
GO
ALTER PROCEDURE [dbo].[selectBudapest]
@track VARCHAR(150)
AS
BEGIN TRY
SELECT event, title as pesentaion, track.name as track FROM presentation
	INNER JOIN track ON presentation.track_id = track.track_id
	WHERE event = 'Budapest' AND track.name = @track
	END TRY
	BEGIN CATCH
	PRINT 'Could not find matching presentations'
	END CATCH

GO
