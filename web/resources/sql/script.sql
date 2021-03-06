USE [eAdministration]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/21/2014 11:41:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Role] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Birthday] [datetime] NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Phone] [varchar](20) NOT NULL,
	[DepartmentId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Department]    Script Date: 7/21/2014 11:41:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Lab]    Script Date: 7/21/2014 11:41:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lab](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Type] [int] NOT NULL,
	[Status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LabSchedule]    Script Date: 7/21/2014 11:41:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabSchedule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Slot] [int] NULL,
	[Date] [date] NULL,
	[LabId] [int] NULL,
	[SequenceId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Request]    Script Date: 7/21/2014 11:41:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Request](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [text] NOT NULL,
	[Status] [int] NULL,
	[RequestAccount] [varchar](50) NULL,
	[ResolveAccount] [varchar](50) NULL,
	[Type] [int] NOT NULL,
	[Time] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Resource]    Script Date: 7/21/2014 11:41:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Resource](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NULL,
	[Title] [varchar](300) NOT NULL,
	[Content] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ScheduleSequence]    Script Date: 7/21/2014 11:41:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ScheduleSequence](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Detail] [varchar](50) NULL,
	[RequestAccount] [varchar](50) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_ScheduleSequence] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Account] ([Username], [Password], [Role], [Name], [Birthday], [Email], [Phone], [DepartmentId]) VALUES (N'abcdef', N'123456789', 1, N'1351435453', CAST(0x0000A12500000000 AS DateTime), N'13514531@dasdasda.adsdas', N'0904614075', 1)
INSERT [dbo].[Account] ([Username], [Password], [Role], [Name], [Birthday], [Email], [Phone], [DepartmentId]) VALUES (N'admin', N'admin', 1, N'A Nguyen', CAST(0x0000000000000000 AS DateTime), N'anguyen@LabAdministration.com', N'0901234567', NULL)
INSERT [dbo].[Account] ([Username], [Password], [Role], [Name], [Birthday], [Email], [Phone], [DepartmentId]) VALUES (N'bnguyen', N'123456789', 4, N'B Nguyen', CAST(0x0000000000000000 AS DateTime), N'bnguyen@LabAdministration.com', N'0902358947', 1)
INSERT [dbo].[Account] ([Username], [Password], [Role], [Name], [Birthday], [Email], [Phone], [DepartmentId]) VALUES (N'cnguyen', N'technician', 3, N'C Nguyen', CAST(0x0000000000000000 AS DateTime), N'cnguyen@LabAdministration.com', N'0974583489', NULL)
INSERT [dbo].[Account] ([Username], [Password], [Role], [Name], [Birthday], [Email], [Phone], [DepartmentId]) VALUES (N'dnguyen', N'instructor', 2, N'D Nguyen', CAST(0x0000000000000000 AS DateTime), N'dnguyen@LabAdministration.com', N'0938956735', 1)
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [Name]) VALUES (3, N'123456')
INSERT [dbo].[Department] ([Id], [Name]) VALUES (1, N'Economics')
INSERT [dbo].[Department] ([Id], [Name]) VALUES (2, N'Politics')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Lab] ON 

INSERT [dbo].[Lab] ([Id], [Name], [Type], [Status]) VALUES (1, N'Lab1', 1, 1)
INSERT [dbo].[Lab] ([Id], [Name], [Type], [Status]) VALUES (2, N'Lab2', 1, 1)
SET IDENTITY_INSERT [dbo].[Lab] OFF
SET IDENTITY_INSERT [dbo].[LabSchedule] ON 

INSERT [dbo].[LabSchedule] ([Id], [Slot], [Date], [LabId], [SequenceId]) VALUES (1, 1, CAST(0xC1380B00 AS Date), 1, 1)
INSERT [dbo].[LabSchedule] ([Id], [Slot], [Date], [LabId], [SequenceId]) VALUES (2, 2, CAST(0xC0380B00 AS Date), 1, 1)
INSERT [dbo].[LabSchedule] ([Id], [Slot], [Date], [LabId], [SequenceId]) VALUES (4, 2, CAST(0xC1380B00 AS Date), 2, 1)
INSERT [dbo].[LabSchedule] ([Id], [Slot], [Date], [LabId], [SequenceId]) VALUES (19, 2, CAST(0xC1380B00 AS Date), 1, 1)
INSERT [dbo].[LabSchedule] ([Id], [Slot], [Date], [LabId], [SequenceId]) VALUES (20, 3, CAST(0xC1380B00 AS Date), 1, 1)
INSERT [dbo].[LabSchedule] ([Id], [Slot], [Date], [LabId], [SequenceId]) VALUES (21, 4, CAST(0xC0380B00 AS Date), 1, 1)
INSERT [dbo].[LabSchedule] ([Id], [Slot], [Date], [LabId], [SequenceId]) VALUES (22, 5, CAST(0xC1380B00 AS Date), 1, 1)
INSERT [dbo].[LabSchedule] ([Id], [Slot], [Date], [LabId], [SequenceId]) VALUES (23, 1, CAST(0xC2380B00 AS Date), 2, 1)
INSERT [dbo].[LabSchedule] ([Id], [Slot], [Date], [LabId], [SequenceId]) VALUES (24, 2, CAST(0xCE380B00 AS Date), 1, 9)
SET IDENTITY_INSERT [dbo].[LabSchedule] OFF
SET IDENTITY_INSERT [dbo].[Request] ON 

INSERT [dbo].[Request] ([Id], [Content], [Status], [RequestAccount], [ResolveAccount], [Type], [Time]) VALUES (2, N'12312', 0, N'dnguyen', N'cnguyen', 2, CAST(0x0000A36400135962 AS DateTime))
INSERT [dbo].[Request] ([Id], [Content], [Status], [RequestAccount], [ResolveAccount], [Type], [Time]) VALUES (3, N'123123123', 1, N'cnguyen', NULL, 3, CAST(0x0000A36500135962 AS DateTime))
INSERT [dbo].[Request] ([Id], [Content], [Status], [RequestAccount], [ResolveAccount], [Type], [Time]) VALUES (4, N'131231231', 0, N'cnguyen', N'dnguyen', 2, CAST(0x0000A36500187978 AS DateTime))
INSERT [dbo].[Request] ([Id], [Content], [Status], [RequestAccount], [ResolveAccount], [Type], [Time]) VALUES (5, N'12312', 0, N'dnguyen', N'cnguyen', 2, CAST(0x0000A36400135962 AS DateTime))
INSERT [dbo].[Request] ([Id], [Content], [Status], [RequestAccount], [ResolveAccount], [Type], [Time]) VALUES (6, N'123123123', 1, N'cnguyen', NULL, 3, CAST(0x0000A36500135962 AS DateTime))
INSERT [dbo].[Request] ([Id], [Content], [Status], [RequestAccount], [ResolveAccount], [Type], [Time]) VALUES (7, N'131231231', 0, N'cnguyen', N'dnguyen', 2, CAST(0x0000A36500187978 AS DateTime))
INSERT [dbo].[Request] ([Id], [Content], [Status], [RequestAccount], [ResolveAccount], [Type], [Time]) VALUES (8, N'12312', 0, N'dnguyen', N'cnguyen', 2, CAST(0x0000A36400135962 AS DateTime))
INSERT [dbo].[Request] ([Id], [Content], [Status], [RequestAccount], [ResolveAccount], [Type], [Time]) VALUES (9, N'123123123', 1, N'cnguyen', NULL, 3, CAST(0x0000A36500135962 AS DateTime))
INSERT [dbo].[Request] ([Id], [Content], [Status], [RequestAccount], [ResolveAccount], [Type], [Time]) VALUES (10, N'131231231', 0, N'cnguyen', N'dnguyen', 2, CAST(0x0000A36500187978 AS DateTime))
SET IDENTITY_INSERT [dbo].[Request] OFF
SET IDENTITY_INSERT [dbo].[ScheduleSequence] ON 

INSERT [dbo].[ScheduleSequence] ([Id], [Detail], [RequestAccount], [Status]) VALUES (1, N'1231315', N'cnguyen', 1)
INSERT [dbo].[ScheduleSequence] ([Id], [Detail], [RequestAccount], [Status]) VALUES (2, N'3123112', NULL, 0)
INSERT [dbo].[ScheduleSequence] ([Id], [Detail], [RequestAccount], [Status]) VALUES (3, N'3123112', NULL, 0)
INSERT [dbo].[ScheduleSequence] ([Id], [Detail], [RequestAccount], [Status]) VALUES (4, N'31231', NULL, 0)
INSERT [dbo].[ScheduleSequence] ([Id], [Detail], [RequestAccount], [Status]) VALUES (5, N'31231', NULL, 0)
INSERT [dbo].[ScheduleSequence] ([Id], [Detail], [RequestAccount], [Status]) VALUES (6, N'3123123', NULL, 0)
INSERT [dbo].[ScheduleSequence] ([Id], [Detail], [RequestAccount], [Status]) VALUES (7, N'31231', NULL, 0)
INSERT [dbo].[ScheduleSequence] ([Id], [Detail], [RequestAccount], [Status]) VALUES (8, N'adsadsadá', NULL, 0)
INSERT [dbo].[ScheduleSequence] ([Id], [Detail], [RequestAccount], [Status]) VALUES (9, N'3131231', NULL, 0)
SET IDENTITY_INSERT [dbo].[ScheduleSequence] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Departme__737584F677365959]    Script Date: 7/21/2014 11:41:34 AM ******/
ALTER TABLE [dbo].[Department] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Lab__737584F6BEB68AA4]    Script Date: 7/21/2014 11:41:34 AM ******/
ALTER TABLE [dbo].[Lab] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Resource__2CB664DC343935C7]    Script Date: 7/21/2014 11:41:34 AM ******/
ALTER TABLE [dbo].[Resource] ADD UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Lab] ADD  CONSTRAINT [DF_Lab_Type]  DEFAULT ((1)) FOR [Type]
GO
ALTER TABLE [dbo].[Lab] ADD  CONSTRAINT [DF_Lab_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Request] ADD  CONSTRAINT [DF_Request_Type]  DEFAULT ((1)) FOR [Type]
GO
ALTER TABLE [dbo].[Request] ADD  CONSTRAINT [DF_Request_Time]  DEFAULT (getdate()) FOR [Time]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[LabSchedule]  WITH CHECK ADD  CONSTRAINT [FK_LabSchedule_Lab] FOREIGN KEY([LabId])
REFERENCES [dbo].[Lab] ([Id])
GO
ALTER TABLE [dbo].[LabSchedule] CHECK CONSTRAINT [FK_LabSchedule_Lab]
GO
ALTER TABLE [dbo].[LabSchedule]  WITH CHECK ADD  CONSTRAINT [FK_LabSchedule_ScheduleSequence] FOREIGN KEY([SequenceId])
REFERENCES [dbo].[ScheduleSequence] ([Id])
GO
ALTER TABLE [dbo].[LabSchedule] CHECK CONSTRAINT [FK_LabSchedule_ScheduleSequence]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD FOREIGN KEY([RequestAccount])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD FOREIGN KEY([ResolveAccount])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[ScheduleSequence]  WITH CHECK ADD  CONSTRAINT [FK_ScheduleSequence_Account] FOREIGN KEY([RequestAccount])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[ScheduleSequence] CHECK CONSTRAINT [FK_ScheduleSequence_Account]
GO
