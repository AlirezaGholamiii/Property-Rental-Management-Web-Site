USE [master]
GO
/****** Object:  Database [PropertyRentalManagementWebSiteDB]    Script Date: 12/10/2021 11:08:04 PM ******/
CREATE DATABASE [PropertyRentalManagementWebSiteDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PropertyRentalManagementWebSiteDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PropertyRentalManagementWebSiteDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PropertyRentalManagementWebSiteDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PropertyRentalManagementWebSiteDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PropertyRentalManagementWebSiteDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PropertyRentalManagementWebSiteDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PropertyRentalManagementWebSiteDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebSiteDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebSiteDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebSiteDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebSiteDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebSiteDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebSiteDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebSiteDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PropertyRentalManagementWebSiteDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebSiteDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PropertyRentalManagementWebSiteDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebSiteDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebSiteDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebSiteDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebSiteDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PropertyRentalManagementWebSiteDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebSiteDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebSiteDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebSiteDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebSiteDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PropertyRentalManagementWebSiteDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebSiteDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebSiteDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PropertyRentalManagementWebSiteDB] SET  MULTI_USER 
GO
ALTER DATABASE [PropertyRentalManagementWebSiteDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PropertyRentalManagementWebSiteDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PropertyRentalManagementWebSiteDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PropertyRentalManagementWebSiteDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PropertyRentalManagementWebSiteDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PropertyRentalManagementWebSiteDB] SET QUERY_STORE = OFF
GO
USE [PropertyRentalManagementWebSiteDB]
GO
/****** Object:  Table [dbo].[Adminstrator]    Script Date: 12/10/2021 11:08:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adminstrator](
	[AdminstratorID] [nchar](20) NOT NULL,
	[UserID] [nchar](20) NOT NULL,
	[FirstName] [nchar](20) NULL,
	[LastName] [nchar](20) NOT NULL,
	[Email] [nchar](30) NULL,
	[UserName] [nchar](20) NOT NULL,
	[Password] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Adminstrator] PRIMARY KEY CLUSTERED 
(
	[AdminstratorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Apartment]    Script Date: 12/10/2021 11:08:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartment](
	[ApartmentID] [nchar](20) NOT NULL,
	[BuildingID] [nchar](20) NULL,
	[OwnerID] [nchar](20) NULL,
	[ManagerID] [nchar](20) NULL,
	[TenentID] [nchar](20) NULL,
	[AoartmentNumber] [nchar](20) NULL,
	[Status] [nchar](10) NULL,
	[Price] [decimal](18, 2) NULL,
	[Bedrooms] [smallint] NULL,
	[Image] [image] NULL,
 CONSTRAINT [PK_Apartment] PRIMARY KEY CLUSTERED 
(
	[ApartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 12/10/2021 11:08:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[AppointmentID] [nchar](20) NOT NULL,
	[AppointmentDate] [date] NULL,
	[ScheduleID] [nchar](20) NOT NULL,
	[Status] [nchar](10) NULL,
	[ManagerID] [nchar](20) NULL,
	[Username] [nchar](20) NULL,
 CONSTRAINT [PK_Appointments] PRIMARY KEY CLUSTERED 
(
	[AppointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Building]    Script Date: 12/10/2021 11:08:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Building](
	[BuildingID] [nchar](20) NOT NULL,
	[Country] [nchar](10) NOT NULL,
	[City] [nchar](10) NOT NULL,
	[StreetNumber] [nchar](10) NOT NULL,
	[Address] [nchar](20) NOT NULL,
	[PostalCode] [nchar](6) NULL,
	[ManagerID] [nchar](20) NOT NULL,
	[OwnerID] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Building] PRIMARY KEY CLUSTERED 
(
	[BuildingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 12/10/2021 11:08:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[ManagerID] [nchar](20) NOT NULL,
	[UserID] [nchar](20) NOT NULL,
	[FirsName] [nchar](20) NOT NULL,
	[LastName] [nchar](20) NOT NULL,
	[Email] [nchar](30) NULL,
	[PhoneNumber] [nchar](12) NULL,
	[UserName] [nchar](15) NOT NULL,
	[Password] [nchar](15) NOT NULL,
 CONSTRAINT [PK_Manager] PRIMARY KEY CLUSTERED 
(
	[ManagerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 12/10/2021 11:08:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[MessageID] [nchar](10) NOT NULL,
	[Details] [nchar](200) NOT NULL,
	[Sender] [nchar](20) NOT NULL,
	[Recever] [nchar](20) NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Owner]    Script Date: 12/10/2021 11:08:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Owner](
	[OwnerID] [nchar](20) NOT NULL,
	[UserID] [nchar](20) NOT NULL,
	[FirstName] [nchar](20) NOT NULL,
	[LastName] [nchar](20) NOT NULL,
	[Email] [nchar](30) NULL,
	[PhoneNumber] [nchar](12) NULL,
	[UserName] [nchar](15) NOT NULL,
	[Password] [nchar](15) NOT NULL,
 CONSTRAINT [PK_Owner] PRIMARY KEY CLUSTERED 
(
	[OwnerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/10/2021 11:08:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [nchar](10) NOT NULL,
	[RoleName] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedules]    Script Date: 12/10/2021 11:08:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedules](
	[ScheduleID] [nchar](20) NOT NULL,
	[DayOfTheWeek] [nchar](10) NULL,
	[StartTime] [time](7) NULL,
	[EndTime] [time](7) NULL,
 CONSTRAINT [PK_Schedules] PRIMARY KEY CLUSTERED 
(
	[ScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tenent]    Script Date: 12/10/2021 11:08:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tenent](
	[TenentID] [nchar](20) NOT NULL,
	[UserID] [nchar](20) NOT NULL,
	[FirstName] [nchar](20) NOT NULL,
	[LastName] [nchar](20) NOT NULL,
	[PhoneNumber] [nchar](12) NULL,
	[Messages] [nchar](200) NULL,
 CONSTRAINT [PK_Tenent] PRIMARY KEY CLUSTERED 
(
	[TenentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoleMappings]    Script Date: 12/10/2021 11:08:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoleMappings](
	[ID] [nchar](10) NOT NULL,
	[UserID] [nchar](20) NOT NULL,
	[RoleID] [nchar](10) NOT NULL,
 CONSTRAINT [PK_UserRoleMappings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/10/2021 11:08:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UseName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[UserID] [nchar](20) NOT NULL,
	[Role] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Adminstrator] ([AdminstratorID], [UserID], [FirstName], [LastName], [Email], [UserName], [Password]) VALUES (N'01                  ', N'1                   ', N'kasrkasragholami    ', N'Gholami             ', N'kasragholami47@yahoo.com      ', N'kasragholami        ', N'kasraya1377         ')
INSERT [dbo].[Adminstrator] ([AdminstratorID], [UserID], [FirstName], [LastName], [Email], [UserName], [Password]) VALUES (N'02                  ', N'2                   ', N'mojtaba             ', N'gholami             ', N'Moji@gmail.com                ', N'mojtaba             ', N'moji                ')
GO
INSERT [dbo].[Apartment] ([ApartmentID], [BuildingID], [OwnerID], [ManagerID], [TenentID], [AoartmentNumber], [Status], [Price], [Bedrooms], [Image]) VALUES (N'01                  ', N'01                  ', N'02                  ', N'01                  ', N'01                  ', N'1014                ', N'Available ', CAST(560000.00 AS Decimal(18, 2)), 2, NULL)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildingID], [OwnerID], [ManagerID], [TenentID], [AoartmentNumber], [Status], [Price], [Bedrooms], [Image]) VALUES (N'02                  ', N'02                  ', N'02                  ', N'21                  ', N'02                  ', N'313                 ', N'Not       ', CAST(102000.00 AS Decimal(18, 2)), 3, NULL)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildingID], [OwnerID], [ManagerID], [TenentID], [AoartmentNumber], [Status], [Price], [Bedrooms], [Image]) VALUES (N'03                  ', N'03                  ', N'01                  ', N'01                  ', N'01                  ', N'9674                ', N'Available ', CAST(6900000.00 AS Decimal(18, 2)), 4, NULL)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildingID], [OwnerID], [ManagerID], [TenentID], [AoartmentNumber], [Status], [Price], [Bedrooms], [Image]) VALUES (N'04                  ', N'04                  ', N'02                  ', N'21                  ', N'02                  ', N'7845                ', N'Available ', CAST(1560000.00 AS Decimal(18, 2)), 1, NULL)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildingID], [OwnerID], [ManagerID], [TenentID], [AoartmentNumber], [Status], [Price], [Bedrooms], [Image]) VALUES (N'05                  ', N'05                  ', N'01                  ', N'21                  ', N'02                  ', N'9534                ', N'Available ', CAST(9800000.00 AS Decimal(18, 2)), 3, NULL)
INSERT [dbo].[Apartment] ([ApartmentID], [BuildingID], [OwnerID], [ManagerID], [TenentID], [AoartmentNumber], [Status], [Price], [Bedrooms], [Image]) VALUES (N'06                  ', N'06                  ', N'02                  ', N'01                  ', N'01                  ', N'32                  ', N'Not       ', CAST(7800000.00 AS Decimal(18, 2)), 2, NULL)
GO
INSERT [dbo].[Appointments] ([AppointmentID], [AppointmentDate], [ScheduleID], [Status], [ManagerID], [Username]) VALUES (N'01                  ', CAST(N'2121-12-09' AS Date), N'02                  ', N'process   ', N'01                  ', N'kasragholami        ')
INSERT [dbo].[Appointments] ([AppointmentID], [AppointmentDate], [ScheduleID], [Status], [ManagerID], [Username]) VALUES (N'02                  ', CAST(N'2121-12-15' AS Date), N'04                  ', N'process   ', N'21                  ', N'maryam              ')
GO
INSERT [dbo].[Building] ([BuildingID], [Country], [City], [StreetNumber], [Address], [PostalCode], [ManagerID], [OwnerID]) VALUES (N'01                  ', N'Canada    ', N'Montreal  ', N'5740      ', N'Cavendish           ', N'H4W2T8', N'01                  ', N'02                  ')
INSERT [dbo].[Building] ([BuildingID], [Country], [City], [StreetNumber], [Address], [PostalCode], [ManagerID], [OwnerID]) VALUES (N'02                  ', N'Canada    ', N'Montral   ', N'1258      ', N'AtWater             ', N'L3T6cQ', N'21                  ', N'01                  ')
INSERT [dbo].[Building] ([BuildingID], [Country], [City], [StreetNumber], [Address], [PostalCode], [ManagerID], [OwnerID]) VALUES (N'03                  ', N'US        ', N'NewYork   ', N'8954      ', N'Times               ', N'UWST4 ', N'01                  ', N'01                  ')
INSERT [dbo].[Building] ([BuildingID], [Country], [City], [StreetNumber], [Address], [PostalCode], [ManagerID], [OwnerID]) VALUES (N'04                  ', N'Canada    ', N'Montreal  ', N'9612      ', N'WestMount           ', N'Y6C6K2', N'21                  ', N'02                  ')
INSERT [dbo].[Building] ([BuildingID], [Country], [City], [StreetNumber], [Address], [PostalCode], [ManagerID], [OwnerID]) VALUES (N'05                  ', N'US        ', N'California', N'785       ', N'Newland             ', N'Pyw567', N'21                  ', N'01                  ')
INSERT [dbo].[Building] ([BuildingID], [Country], [City], [StreetNumber], [Address], [PostalCode], [ManagerID], [OwnerID]) VALUES (N'06                  ', N'US        ', N'Huston    ', N'7890      ', N'Avangard            ', N'P7T9O6', N'01                  ', N'02                  ')
GO
INSERT [dbo].[Manager] ([ManagerID], [UserID], [FirsName], [LastName], [Email], [PhoneNumber], [UserName], [Password]) VALUES (N'01                  ', N'5                   ', N'mahan               ', N'moulaei             ', N'mahan@gamil.com               ', N'5142354586  ', N'mahan          ', N'kasra          ')
INSERT [dbo].[Manager] ([ManagerID], [UserID], [FirsName], [LastName], [Email], [PhoneNumber], [UserName], [Password]) VALUES (N'21                  ', N'6                   ', N'Mojtaba             ', N'gholami             ', N'moji@gmail.com                ', N'5413568964  ', N'moji           ', N'moji           ')
GO
INSERT [dbo].[Message] ([MessageID], [Details], [Sender], [Recever], [Date]) VALUES (N'01        ', N'Hi there, this is the first message                                                                                                                                                                     ', N'kasragholami        ', N'kimiagholami        ', CAST(N'2121-12-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Message] ([MessageID], [Details], [Sender], [Recever], [Date]) VALUES (N'02        ', N'Now lets go with the second message!                                                                                                                                                                    ', N'kasragholami        ', N'maryam              ', CAST(N'2121-12-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Owner] ([OwnerID], [UserID], [FirstName], [LastName], [Email], [PhoneNumber], [UserName], [Password]) VALUES (N'01                  ', N'3                   ', N'kimia               ', N'gholami             ', N'kimiagholami47@Gmail.com      ', N'5142355458  ', N'kimiagholami   ', N'kasraya1377    ')
INSERT [dbo].[Owner] ([OwnerID], [UserID], [FirstName], [LastName], [Email], [PhoneNumber], [UserName], [Password]) VALUES (N'02                  ', N'8                   ', N'Alireza             ', N'Gholami             ', N'kasragholami92@yahoo.com      ', N'5142355458  ', N'kasi           ', N'kasraya1       ')
GO
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (N'01        ', N'Adminstrator        ')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (N'02        ', N'Manager             ')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (N'03        ', N'Owner               ')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (N'04        ', N'Tenent              ')
GO
INSERT [dbo].[Schedules] ([ScheduleID], [DayOfTheWeek], [StartTime], [EndTime]) VALUES (N'01                  ', N'Monday    ', CAST(N'17:00:00' AS Time), CAST(N'18:30:00' AS Time))
INSERT [dbo].[Schedules] ([ScheduleID], [DayOfTheWeek], [StartTime], [EndTime]) VALUES (N'02                  ', N'Tusday    ', CAST(N'11:15:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[Schedules] ([ScheduleID], [DayOfTheWeek], [StartTime], [EndTime]) VALUES (N'03                  ', N'Tuesday   ', CAST(N'21:30:00' AS Time), CAST(N'22:00:00' AS Time))
INSERT [dbo].[Schedules] ([ScheduleID], [DayOfTheWeek], [StartTime], [EndTime]) VALUES (N'04                  ', N'Wednesday ', CAST(N'19:25:00' AS Time), CAST(N'20:10:00' AS Time))
GO
INSERT [dbo].[Tenent] ([TenentID], [UserID], [FirstName], [LastName], [PhoneNumber], [Messages]) VALUES (N'01                  ', N'4                   ', N'Maryam              ', N'azbahani            ', N'5162146569  ', NULL)
INSERT [dbo].[Tenent] ([TenentID], [UserID], [FirstName], [LastName], [PhoneNumber], [Messages]) VALUES (N'02                  ', N'7                   ', N'Karim               ', N'Karimi              ', N'2653654585  ', NULL)
GO
INSERT [dbo].[Users] ([UseName], [Password], [UserID], [Role]) VALUES (N'kasragholami        ', N'kasraya1377         ', N'1                   ', N'Adminstrator        ')
INSERT [dbo].[Users] ([UseName], [Password], [UserID], [Role]) VALUES (N'mjtaba    ', N'moji      ', N'2                   ', N'Administrator')
INSERT [dbo].[Users] ([UseName], [Password], [UserID], [Role]) VALUES (N'kimiagholami', N'kasraya1377', N'3                   ', N'Owner     ')
INSERT [dbo].[Users] ([UseName], [Password], [UserID], [Role]) VALUES (N'maryam', N'kasra', N'4                   ', N'Tenent')
INSERT [dbo].[Users] ([UseName], [Password], [UserID], [Role]) VALUES (N'mahan     ', N'kasra     ', N'5                   ', N'Manager   ')
INSERT [dbo].[Users] ([UseName], [Password], [UserID], [Role]) VALUES (N'moji      ', N'moji      ', N'6                   ', N'Manager   ')
INSERT [dbo].[Users] ([UseName], [Password], [UserID], [Role]) VALUES (N'karimi', N'karim', N'7                   ', N'Tenent')
INSERT [dbo].[Users] ([UseName], [Password], [UserID], [Role]) VALUES (N'kasi', N'kasraya1', N'8                   ', N'Owner')
GO
ALTER TABLE [dbo].[Adminstrator]  WITH CHECK ADD  CONSTRAINT [FK_Adminstrator_Users1] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Adminstrator] CHECK CONSTRAINT [FK_Adminstrator_Users1]
GO
ALTER TABLE [dbo].[Apartment]  WITH CHECK ADD  CONSTRAINT [FK_Apartment_Building] FOREIGN KEY([BuildingID])
REFERENCES [dbo].[Building] ([BuildingID])
GO
ALTER TABLE [dbo].[Apartment] CHECK CONSTRAINT [FK_Apartment_Building]
GO
ALTER TABLE [dbo].[Apartment]  WITH CHECK ADD  CONSTRAINT [FK_Apartment_Manager] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Manager] ([ManagerID])
GO
ALTER TABLE [dbo].[Apartment] CHECK CONSTRAINT [FK_Apartment_Manager]
GO
ALTER TABLE [dbo].[Apartment]  WITH CHECK ADD  CONSTRAINT [FK_Apartment_Owner] FOREIGN KEY([OwnerID])
REFERENCES [dbo].[Owner] ([OwnerID])
GO
ALTER TABLE [dbo].[Apartment] CHECK CONSTRAINT [FK_Apartment_Owner]
GO
ALTER TABLE [dbo].[Apartment]  WITH CHECK ADD  CONSTRAINT [FK_Apartment_Tenent] FOREIGN KEY([TenentID])
REFERENCES [dbo].[Tenent] ([TenentID])
GO
ALTER TABLE [dbo].[Apartment] CHECK CONSTRAINT [FK_Apartment_Tenent]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Manager] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Manager] ([ManagerID])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Manager]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Schedules] FOREIGN KEY([ScheduleID])
REFERENCES [dbo].[Schedules] ([ScheduleID])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Schedules]
GO
ALTER TABLE [dbo].[Building]  WITH CHECK ADD  CONSTRAINT [FK_Building_Manager] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Manager] ([ManagerID])
GO
ALTER TABLE [dbo].[Building] CHECK CONSTRAINT [FK_Building_Manager]
GO
ALTER TABLE [dbo].[Building]  WITH CHECK ADD  CONSTRAINT [FK_Building_Owner] FOREIGN KEY([OwnerID])
REFERENCES [dbo].[Owner] ([OwnerID])
GO
ALTER TABLE [dbo].[Building] CHECK CONSTRAINT [FK_Building_Owner]
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Manager] CHECK CONSTRAINT [FK_Manager_Users]
GO
ALTER TABLE [dbo].[Owner]  WITH CHECK ADD  CONSTRAINT [FK_Owner_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Owner] CHECK CONSTRAINT [FK_Owner_Users]
GO
ALTER TABLE [dbo].[Tenent]  WITH CHECK ADD  CONSTRAINT [FK_Tenent_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Tenent] CHECK CONSTRAINT [FK_Tenent_Users]
GO
ALTER TABLE [dbo].[UserRoleMappings]  WITH CHECK ADD  CONSTRAINT [FK_UserRoleMappings_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[UserRoleMappings] CHECK CONSTRAINT [FK_UserRoleMappings_Roles]
GO
ALTER TABLE [dbo].[UserRoleMappings]  WITH CHECK ADD  CONSTRAINT [FK_UserRoleMappings_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserRoleMappings] CHECK CONSTRAINT [FK_UserRoleMappings_Users]
GO
USE [master]
GO
ALTER DATABASE [PropertyRentalManagementWebSiteDB] SET  READ_WRITE 
GO
