USE [master]
GO
/****** Object:  Database [Payroll]    Script Date: 11/23/2018 5:22:21 PM ******/
CREATE DATABASE [Payroll]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Payroll', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\Payroll.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Payroll_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\Payroll_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Payroll] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Payroll].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Payroll] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Payroll] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Payroll] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Payroll] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Payroll] SET ARITHABORT OFF 
GO
ALTER DATABASE [Payroll] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Payroll] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Payroll] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Payroll] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Payroll] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Payroll] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Payroll] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Payroll] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Payroll] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Payroll] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Payroll] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Payroll] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Payroll] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Payroll] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Payroll] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Payroll] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Payroll] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Payroll] SET RECOVERY FULL 
GO
ALTER DATABASE [Payroll] SET  MULTI_USER 
GO
ALTER DATABASE [Payroll] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Payroll] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Payroll] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Payroll] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Payroll] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Payroll] SET QUERY_STORE = OFF
GO
USE [Payroll]
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
USE [Payroll]
GO
/****** Object:  Table [dbo].[ListItem]    Script Date: 11/23/2018 5:22:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListItem](
	[ListItemId] [int] IDENTITY(1,1) NOT NULL,
	[ListItemCategoryId] [int] NOT NULL,
	[ListItemName] [varchar](150) NOT NULL,
	[InsertDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_ListItem] PRIMARY KEY CLUSTERED 
(
	[ListItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListItemCategory]    Script Date: 11/23/2018 5:22:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListItemCategory](
	[ListItemCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[ListItemCategoryName] [varchar](150) NOT NULL,
	[InsertDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_ListItemCategory] PRIMARY KEY CLUSTERED 
(
	[ListItemCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VwListItemCategory]    Script Date: 11/23/2018 5:22:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Roshan Shrestha
-- Create date:11-22-2018
-- Description:	return list ListItem Category and List Item table
-- =============================================
CREATE VIEW [dbo].[VwListItemCategory]
AS
SELECT li.ListItemCategoryId,
       li.ListItemId,
       lic.ListItemCategoryName,
       li.ListItemName
FROM dbo.ListItemCategory AS lic
    INNER JOIN dbo.ListItem AS li
        ON li.ListItemCategoryId = lic.ListItemCategoryId;
GO
/****** Object:  Table [dbo].[Client]    Script Date: 11/23/2018 5:22:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ClientId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[InsertDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plan]    Script Date: 11/23/2018 5:22:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plan](
	[PlanId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[PlanDurationListItemId] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[InsertDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Plan] PRIMARY KEY CLUSTERED 
(
	[PlanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanDuration]    Script Date: 11/23/2018 5:22:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanDuration](
	[PlanDurationId] [int] IDENTITY(1,1) NOT NULL,
	[PlanDurationListItemId] [int] NOT NULL,
	[DurationInMonth] [int] NOT NULL,
	[InsertDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_PlanDuration] PRIMARY KEY CLUSTERED 
(
	[PlanDurationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/23/2018 5:22:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
	[RoleDescription] [varchar](300) NOT NULL,
	[InsertDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubDomain]    Script Date: 11/23/2018 5:22:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubDomain](
	[SubDomainId] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[SubDomain] [nvarchar](100) NOT NULL,
	[InsertPersonId] [int] NOT NULL,
	[InsertDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_SubDomain] PRIMARY KEY CLUSTERED 
(
	[SubDomainId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscription]    Script Date: 11/23/2018 5:22:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscription](
	[SubscriptionId] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[PlanId] [int] NOT NULL,
	[SubscriptionStartDate] [smalldatetime] NOT NULL,
	[SubscriptionEndDate] [smalldatetime] NOT NULL,
	[IsActive] [int] NOT NULL,
	[InsertDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Subscription] PRIMARY KEY CLUSTERED 
(
	[SubscriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemUser]    Script Date: 11/23/2018 5:22:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemUser](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[FName] [varchar](50) NOT NULL,
	[MName] [varchar](50) NULL,
	[LName] [varchar](50) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[InsertDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_SystemUser] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemUserInformation]    Script Date: 11/23/2018 5:22:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemUserInformation](
	[SystemUserInformationId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ContactNumber] [int] NOT NULL,
	[MobileNumber] [int] NOT NULL,
	[PersonalEmail] [varchar](150) NOT NULL,
	[GenderListItemId] [int] NOT NULL,
	[Address1] [varchar](50) NULL,
	[Address2] [varchar](50) NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varbinary](50) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[InsertDate] [smalldatetime] NOT NULL,
	[InsertUserId] [int] NOT NULL,
 CONSTRAINT [PK_SystemUserInformation] PRIMARY KEY CLUSTERED 
(
	[SystemUserInformationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/23/2018 5:22:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](150) NOT NULL,
	[FName] [varchar](100) NOT NULL,
	[MName] [varchar](100) NOT NULL,
	[LName] [varchar](100) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[ParentId] [int] NOT NULL,
	[InsertDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInformation]    Script Date: 11/23/2018 5:22:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInformation](
	[UserInformationId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ContactNumber] [int] NOT NULL,
	[MobileNumber] [int] NOT NULL,
	[PersonalEmail] [varchar](150) NOT NULL,
	[GenderListItemId] [int] NOT NULL,
	[Address1] [varchar](50) NULL,
	[Address2] [varchar](50) NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[InsertDate] [smalldatetime] NOT NULL,
	[InsertUserId] [int] NULL,
 CONSTRAINT [PK_UserInformation] PRIMARY KEY CLUSTERED 
(
	[UserInformationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 11/23/2018 5:22:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserRoleId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[UserTypeListItemId] [int] NOT NULL,
	[InsertDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[UserRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ClientId], [UserId], [InsertDate]) VALUES (20, 21, CAST(N'2018-11-22T09:17:00' AS SmallDateTime))
INSERT [dbo].[Client] ([ClientId], [UserId], [InsertDate]) VALUES (1014, 1015, CAST(N'2018-11-22T11:22:00' AS SmallDateTime))
INSERT [dbo].[Client] ([ClientId], [UserId], [InsertDate]) VALUES (1015, 1016, CAST(N'2018-11-23T11:04:00' AS SmallDateTime))
INSERT [dbo].[Client] ([ClientId], [UserId], [InsertDate]) VALUES (1016, 1017, CAST(N'2018-11-23T15:35:00' AS SmallDateTime))
INSERT [dbo].[Client] ([ClientId], [UserId], [InsertDate]) VALUES (1017, 1018, CAST(N'2018-11-23T15:35:00' AS SmallDateTime))
INSERT [dbo].[Client] ([ClientId], [UserId], [InsertDate]) VALUES (1018, 1019, CAST(N'2018-11-23T15:39:00' AS SmallDateTime))
INSERT [dbo].[Client] ([ClientId], [UserId], [InsertDate]) VALUES (1019, 1020, CAST(N'2018-11-23T15:41:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[Client] OFF
SET IDENTITY_INSERT [dbo].[ListItem] ON 

INSERT [dbo].[ListItem] ([ListItemId], [ListItemCategoryId], [ListItemName], [InsertDate]) VALUES (1, 1, N'Male', CAST(N'2018-11-21T13:55:00' AS SmallDateTime))
INSERT [dbo].[ListItem] ([ListItemId], [ListItemCategoryId], [ListItemName], [InsertDate]) VALUES (2, 1, N'Female', CAST(N'2018-11-21T13:55:00' AS SmallDateTime))
INSERT [dbo].[ListItem] ([ListItemId], [ListItemCategoryId], [ListItemName], [InsertDate]) VALUES (3, 1, N'Other', CAST(N'2018-11-21T13:55:00' AS SmallDateTime))
INSERT [dbo].[ListItem] ([ListItemId], [ListItemCategoryId], [ListItemName], [InsertDate]) VALUES (4, 2, N'Client', CAST(N'2018-11-22T09:12:00' AS SmallDateTime))
INSERT [dbo].[ListItem] ([ListItemId], [ListItemCategoryId], [ListItemName], [InsertDate]) VALUES (5, 2, N'System User', CAST(N'2018-11-22T09:12:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[ListItem] OFF
SET IDENTITY_INSERT [dbo].[ListItemCategory] ON 

INSERT [dbo].[ListItemCategory] ([ListItemCategoryId], [ListItemCategoryName], [InsertDate]) VALUES (1, N'Gender', CAST(N'2018-11-21T13:55:00' AS SmallDateTime))
INSERT [dbo].[ListItemCategory] ([ListItemCategoryId], [ListItemCategoryName], [InsertDate]) VALUES (2, N'UserType', CAST(N'2018-11-22T09:11:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[ListItemCategory] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [RoleName], [RoleDescription], [InsertDate]) VALUES (1, N'Client Admin', N'Main Admin of the CLient', CAST(N'2018-11-22T09:07:00' AS SmallDateTime))
INSERT [dbo].[Role] ([RoleId], [RoleName], [RoleDescription], [InsertDate]) VALUES (2, N'Client Manager', N'Main Admin of the CLient', CAST(N'2018-11-22T09:07:00' AS SmallDateTime))
INSERT [dbo].[Role] ([RoleId], [RoleName], [RoleDescription], [InsertDate]) VALUES (3, N'Employee', N'Employees of Client', CAST(N'2018-11-22T09:08:00' AS SmallDateTime))
INSERT [dbo].[Role] ([RoleId], [RoleName], [RoleDescription], [InsertDate]) VALUES (4, N'Admin', N'System Admin', CAST(N'2018-11-22T09:08:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [Email], [FName], [MName], [LName], [Password], [IsActive], [ParentId], [InsertDate]) VALUES (21, N'test@test.com', N'Test', N'', N'User', N'$2a$12$i92QOqTCTcXkLFjkF/CRDe5z/Mf7rsRB7vfm4G8GTiGJhplY4EdKO', 1, 0, CAST(N'2018-11-22T09:17:00' AS SmallDateTime))
INSERT [dbo].[User] ([UserId], [Email], [FName], [MName], [LName], [Password], [IsActive], [ParentId], [InsertDate]) VALUES (1015, N'mah.rosan@gmail.com', N'Rosan', N'Lal', N'Shrestha', N'$2a$12$Ugjzg3QcT0V7YBKyWroiqenVZD4wKk3Nd1P0JVVZtvMcAXKijXydu', 1, 0, CAST(N'2018-11-22T11:22:00' AS SmallDateTime))
INSERT [dbo].[User] ([UserId], [Email], [FName], [MName], [LName], [Password], [IsActive], [ParentId], [InsertDate]) VALUES (1016, N'test1@test.com', N'Test First Name', N'Test', N'Test Last Name', N'$2a$12$ZsHzdi03IIM.4DVFplM7L.ac9DouEWZdW4Ne2zch5.vqHHYewqsJK', 1, 0, CAST(N'2018-11-23T11:04:00' AS SmallDateTime))
INSERT [dbo].[User] ([UserId], [Email], [FName], [MName], [LName], [Password], [IsActive], [ParentId], [InsertDate]) VALUES (1017, N'a@a.com', N'asda', N'sdasd', N'asdas', N'$2a$12$LQOQGQDFuysnEuKZKjWkUerLSsuxFleN5c.RaGSPUMDW2VwoayRB6', 1, 0, CAST(N'2018-11-23T15:35:00' AS SmallDateTime))
INSERT [dbo].[User] ([UserId], [Email], [FName], [MName], [LName], [Password], [IsActive], [ParentId], [InsertDate]) VALUES (1018, N'b@ba.com', N'asd', N'asd', N'asd', N'$2a$12$E5VXuyRA6sKpn2Oz6vHuLeOFwhvFrDafWHK8e/JUSRkyU.OZ788R.', 1, 0, CAST(N'2018-11-23T15:35:00' AS SmallDateTime))
INSERT [dbo].[User] ([UserId], [Email], [FName], [MName], [LName], [Password], [IsActive], [ParentId], [InsertDate]) VALUES (1019, N'c@c.com', N'asd', N'asd', N'asd', N'$2a$12$KXCIZajykhkzaFQ8kCfIKeNY78nhvNxjuQQw2InZQdatqxBnJpUEy', 1, 0, CAST(N'2018-11-23T15:39:00' AS SmallDateTime))
INSERT [dbo].[User] ([UserId], [Email], [FName], [MName], [LName], [Password], [IsActive], [ParentId], [InsertDate]) VALUES (1020, N'', N'', N'', N'', N'$2a$12$ZKazZT1OaAnF.wSl9pzVLeAWt4ndSpnkJD1W/hPek/t6gBu5wDtQe', 1, 0, CAST(N'2018-11-23T15:41:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserInformation] ON 

INSERT [dbo].[UserInformation] ([UserInformationId], [UserId], [ContactNumber], [MobileNumber], [PersonalEmail], [GenderListItemId], [Address1], [Address2], [City], [State], [Country], [InsertDate], [InsertUserId]) VALUES (18, 21, 123123, 31231, N'test@test.com', 2, N'asd 1', N'lksamlak 2 ', N'KTM', N'ST2', N'NEPAL', CAST(N'2018-11-22T09:17:00' AS SmallDateTime), NULL)
INSERT [dbo].[UserInformation] ([UserInformationId], [UserId], [ContactNumber], [MobileNumber], [PersonalEmail], [GenderListItemId], [Address1], [Address2], [City], [State], [Country], [InsertDate], [InsertUserId]) VALUES (1013, 1015, 0, 0, N'mah.rosan@gmail.com', 1, N'Nagaun', N'Kirtipur', N'Ktm', N'State 3', N'Nepal', CAST(N'2018-11-22T11:22:00' AS SmallDateTime), NULL)
INSERT [dbo].[UserInformation] ([UserInformationId], [UserId], [ContactNumber], [MobileNumber], [PersonalEmail], [GenderListItemId], [Address1], [Address2], [City], [State], [Country], [InsertDate], [InsertUserId]) VALUES (1014, 1016, 1231313, 3123, N'test1@test.com', 1, N'asd', N'asdasd', N'Test City', N'asdasd', N'Nepal', CAST(N'2018-11-23T11:04:00' AS SmallDateTime), NULL)
INSERT [dbo].[UserInformation] ([UserInformationId], [UserId], [ContactNumber], [MobileNumber], [PersonalEmail], [GenderListItemId], [Address1], [Address2], [City], [State], [Country], [InsertDate], [InsertUserId]) VALUES (1015, 1017, 123123, 12312, N'a@a.com', 3, N'asd', N'asd', N'asd', N'asd', N'asd', CAST(N'2018-11-23T15:35:00' AS SmallDateTime), NULL)
INSERT [dbo].[UserInformation] ([UserInformationId], [UserId], [ContactNumber], [MobileNumber], [PersonalEmail], [GenderListItemId], [Address1], [Address2], [City], [State], [Country], [InsertDate], [InsertUserId]) VALUES (1016, 1018, 123, 123, N'b@ba.com', 2, N'asd', N'asd', N'sad', N'asd', N'asd', CAST(N'2018-11-23T15:35:00' AS SmallDateTime), NULL)
INSERT [dbo].[UserInformation] ([UserInformationId], [UserId], [ContactNumber], [MobileNumber], [PersonalEmail], [GenderListItemId], [Address1], [Address2], [City], [State], [Country], [InsertDate], [InsertUserId]) VALUES (1017, 1019, 123, 123, N'c@c.com', 3, N'adas', N'das', N'dasd', N'asdas', N'asdasd', CAST(N'2018-11-23T15:39:00' AS SmallDateTime), NULL)
SET IDENTITY_INSERT [dbo].[UserInformation] OFF
SET IDENTITY_INSERT [dbo].[UserRole] ON 

INSERT [dbo].[UserRole] ([UserRoleId], [UserId], [RoleId], [UserTypeListItemId], [InsertDate]) VALUES (3, 21, 1, 4, CAST(N'2018-11-22T09:17:00' AS SmallDateTime))
INSERT [dbo].[UserRole] ([UserRoleId], [UserId], [RoleId], [UserTypeListItemId], [InsertDate]) VALUES (1002, 1015, 1, 4, CAST(N'2018-11-22T11:22:00' AS SmallDateTime))
INSERT [dbo].[UserRole] ([UserRoleId], [UserId], [RoleId], [UserTypeListItemId], [InsertDate]) VALUES (1003, 1016, 1, 4, CAST(N'2018-11-23T11:04:00' AS SmallDateTime))
INSERT [dbo].[UserRole] ([UserRoleId], [UserId], [RoleId], [UserTypeListItemId], [InsertDate]) VALUES (1004, 1017, 1, 4, CAST(N'2018-11-23T15:35:00' AS SmallDateTime))
INSERT [dbo].[UserRole] ([UserRoleId], [UserId], [RoleId], [UserTypeListItemId], [InsertDate]) VALUES (1005, 1018, 1, 4, CAST(N'2018-11-23T15:35:00' AS SmallDateTime))
INSERT [dbo].[UserRole] ([UserRoleId], [UserId], [RoleId], [UserTypeListItemId], [InsertDate]) VALUES (1006, 1019, 1, 4, CAST(N'2018-11-23T15:39:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[UserRole] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Role__8A2B6160518F2A0A]    Script Date: 11/23/2018 5:22:22 PM ******/
ALTER TABLE [dbo].[Role] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__SubDomai__7499EE10E146311A]    Script Date: 11/23/2018 5:22:22 PM ******/
ALTER TABLE [dbo].[SubDomain] ADD UNIQUE NONCLUSTERED 
(
	[SubDomain] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User__A9D10534E48429D8]    Script Date: 11/23/2018 5:22:22 PM ******/
ALTER TABLE [dbo].[User] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__UserInfo__7B5B59A53DF3D839]    Script Date: 11/23/2018 5:22:22 PM ******/
ALTER TABLE [dbo].[UserInformation] ADD UNIQUE NONCLUSTERED 
(
	[PersonalEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client.UserId_User.UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client.UserId_User.UserId]
GO
ALTER TABLE [dbo].[ListItem]  WITH CHECK ADD  CONSTRAINT [FK_ListItem_ListItemCategory] FOREIGN KEY([ListItemCategoryId])
REFERENCES [dbo].[ListItemCategory] ([ListItemCategoryId])
GO
ALTER TABLE [dbo].[ListItem] CHECK CONSTRAINT [FK_ListItem_ListItemCategory]
GO
ALTER TABLE [dbo].[Plan]  WITH CHECK ADD  CONSTRAINT [FK_Plan_Plan] FOREIGN KEY([PlanDurationListItemId])
REFERENCES [dbo].[ListItem] ([ListItemId])
GO
ALTER TABLE [dbo].[Plan] CHECK CONSTRAINT [FK_Plan_Plan]
GO
ALTER TABLE [dbo].[PlanDuration]  WITH CHECK ADD  CONSTRAINT [FK_PlanDuration_ListItem] FOREIGN KEY([PlanDurationListItemId])
REFERENCES [dbo].[ListItem] ([ListItemId])
GO
ALTER TABLE [dbo].[PlanDuration] CHECK CONSTRAINT [FK_PlanDuration_ListItem]
GO
ALTER TABLE [dbo].[SubDomain]  WITH CHECK ADD  CONSTRAINT [FK_SubDomain_Client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([ClientId])
GO
ALTER TABLE [dbo].[SubDomain] CHECK CONSTRAINT [FK_SubDomain_Client]
GO
ALTER TABLE [dbo].[Subscription]  WITH CHECK ADD  CONSTRAINT [FK_Subscription.ClientId_Client.ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([ClientId])
GO
ALTER TABLE [dbo].[Subscription] CHECK CONSTRAINT [FK_Subscription.ClientId_Client.ClientId]
GO
ALTER TABLE [dbo].[Subscription]  WITH CHECK ADD  CONSTRAINT [FK_Subscription_Plan] FOREIGN KEY([PlanId])
REFERENCES [dbo].[Plan] ([PlanId])
GO
ALTER TABLE [dbo].[Subscription] CHECK CONSTRAINT [FK_Subscription_Plan]
GO
ALTER TABLE [dbo].[SystemUserInformation]  WITH CHECK ADD  CONSTRAINT [FK_SystemUserInformation_ListItem] FOREIGN KEY([GenderListItemId])
REFERENCES [dbo].[ListItem] ([ListItemId])
GO
ALTER TABLE [dbo].[SystemUserInformation] CHECK CONSTRAINT [FK_SystemUserInformation_ListItem]
GO
ALTER TABLE [dbo].[SystemUserInformation]  WITH CHECK ADD  CONSTRAINT [FK_SystemUserInformation_SystemUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[SystemUser] ([UserId])
GO
ALTER TABLE [dbo].[SystemUserInformation] CHECK CONSTRAINT [FK_SystemUserInformation_SystemUser]
GO
ALTER TABLE [dbo].[SystemUserInformation]  WITH CHECK ADD  CONSTRAINT [FK_SystemUserInformation_SystemUser1] FOREIGN KEY([InsertUserId])
REFERENCES [dbo].[SystemUser] ([UserId])
GO
ALTER TABLE [dbo].[SystemUserInformation] CHECK CONSTRAINT [FK_SystemUserInformation_SystemUser1]
GO
ALTER TABLE [dbo].[UserInformation]  WITH CHECK ADD  CONSTRAINT [FK_UserInformation_ListItem] FOREIGN KEY([GenderListItemId])
REFERENCES [dbo].[ListItem] ([ListItemId])
GO
ALTER TABLE [dbo].[UserInformation] CHECK CONSTRAINT [FK_UserInformation_ListItem]
GO
ALTER TABLE [dbo].[UserInformation]  WITH CHECK ADD  CONSTRAINT [FK_UserInformation_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserInformation] CHECK CONSTRAINT [FK_UserInformation_User]
GO
ALTER TABLE [dbo].[UserInformation]  WITH CHECK ADD  CONSTRAINT [FK_UserInformation_User1] FOREIGN KEY([InsertUserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserInformation] CHECK CONSTRAINT [FK_UserInformation_User1]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole.RoleId_Role.RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole.RoleId_Role.RoleId]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole.UserID_User.UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole.UserID_User.UserId]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_ListItem] FOREIGN KEY([UserTypeListItemId])
REFERENCES [dbo].[ListItem] ([ListItemId])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_ListItem]
GO
/****** Object:  StoredProcedure [dbo].[SpListItemCategoryDetailSel]    Script Date: 11/23/2018 5:22:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Roshan Shrestha
-- Create date: 11-23-2018
-- Description:	return the List item value with id according to the passed List item catergory name
-- =============================================
CREATE PROCEDURE [dbo].[SpListItemCategoryDetailSel]
(@ListItemCategoryName VARCHAR(150))
AS
BEGIN
    SET NOCOUNT ON;

    IF 1 = 2
    BEGIN
        SELECT CAST(NULL AS INT) AS Id
        WHERE 1 = 2
        FOR JSON PATH, INCLUDE_NULL_VALUES;
    END;

    SELECT vlic.ListItemId,
           vlic.ListItemName
    INTO #tmp
    FROM dbo.VwListItemCategory AS vlic
    WHERE vlic.ListItemCategoryName = @ListItemCategoryName;


    SELECT *
    FROM #tmp AS t
    FOR JSON PATH, INCLUDE_NULL_VALUES;
    DROP TABLE #tmp;
END;



GO
/****** Object:  StoredProcedure [dbo].[SpUserIns]    Script Date: 11/23/2018 5:22:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Roshan Shrestha
-- Create date: 11-21-2018
-- Description:	Inserts Users and Client
-- =============================================

CREATE PROCEDURE [dbo].[SpUserIns]
(
    @UserModel NVARCHAR(MAX),
    @UserInformationModel NVARCHAR(MAX),
    @ReturnMessage VARCHAR(100) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        CREATE TABLE #UserModel
        (
            FName VARCHAR(100),
            MName VARCHAR(100),
            LName VARCHAR(100),
            Email VARCHAR(150),
            Password NVARCHAR(MAX)
        );
        INSERT INTO #UserModel
        (
            FName,
            MName,
            LName,
            Email,
            Password
        )
        SELECT FName,
               MName,
               LName,
               Email,
               Password
        FROM
            OPENJSON(@UserModel)
            WITH
            (
                FName VARCHAR(100) '$.FName',
                MName VARCHAR(100) '$.MName',
                LName VARCHAR(100) '$.LName',
                Email VARCHAR(150) '$.Email',
                Password NVARCHAR(MAX) '$.Password'
            );

        CREATE TABLE #UserInformationModel
        (
            ContactNumber INT,
            MobileNumber INT,
            PersonalEmail VARCHAR(150),
            GenderListItemId INT,
            Address1 VARCHAR(50),
            Address2 VARCHAR(50),
            City VARCHAR(50),
            State VARCHAR(50),
            Country VARCHAR(50),
        );
        INSERT INTO #UserInformationModel
        (
            ContactNumber,
            MobileNumber,
            PersonalEmail,
            GenderListItemId,
            Address1,
            Address2,
            City,
            State,
            Country
        )
        SELECT ContactNumber,
               MobileNumber,
               PersonalEmail,
               GenderListItemId,
               Address1,
               Address2,
               City,
               State,
               Country
        FROM
            OPENJSON(@UserInformationModel)
            WITH
            (
                ContactNumber INT '$.ContactNumber',
                MobileNumber INT '$.MobileNumber',
                PersonalEmail VARCHAR(150) '$.PersonalEmail',
                GenderListItemId INT '$.GenderListItemId',
                Address1 VARCHAR(50) '$.Address1',
                Address2 VARCHAR(50) '$.Address2',
                City VARCHAR(50) '$.City',
                State VARCHAR(50) '$.State',
                Country VARCHAR(50) '$.Country'
            );

        IF EXISTS
        (
            SELECT *
            FROM dbo.[User] AS u
            WHERE u.Email =
            (
                SELECT um.Email FROM #UserModel AS um
            )
        )
        BEGIN
            SET @ReturnMessage = 'User with same email already exists';
            RETURN;
        END;

        IF EXISTS
        (
            SELECT *
            FROM dbo.UserInformation AS ui
            WHERE ui.PersonalEmail =
            (
                SELECT uim.PersonalEmail FROM #UserInformationModel AS uim
            )
        )
        BEGIN
            SET @ReturnMessage = 'User with same email already exists';
            RETURN;
        END;
        INSERT INTO dbo.[User]
        (
            Email,
            FName,
            MName,
            LName,
            Password,
            IsActive,
            ParentId,
            InsertDate
        )
        SELECT um.Email,
               um.FName,
               um.MName,
               um.LName,
               um.Password,
               1,
               0,
               GETDATE()
        FROM #UserModel AS um;
        DECLARE @UserId INT = SCOPE_IDENTITY();

        INSERT INTO dbo.Client
        (
            UserId,
            InsertDate
        )
        VALUES
        (   @UserId,  -- UserId - int
            GETDATE() -- InsertDate - smalldatetime
            );


        INSERT INTO dbo.UserInformation
        (
            UserId,
            ContactNumber,
            MobileNumber,
            PersonalEmail,
            GenderListItemId,
            Address1,
            Address2,
            City,
            State,
            Country,
            InsertDate,
            InsertUserId
        )
        SELECT @UserId,
               ContactNumber,
               uim.MobileNumber,
               uim.PersonalEmail,
               uim.GenderListItemId,
               uim.Address1,
               uim.Address2,
               uim.City,
               uim.State,
               uim.Country,
               GETDATE(),
               NULL
        FROM #UserInformationModel AS uim;

        DECLARE @ClientAdminRoleId INT =
                (
                    SELECT r.RoleId FROM dbo.Role AS r WHERE r.RoleName = 'Client Admin'
                );

        DECLARE @UserTypeListItemId INT =
                (
                    SELECT li.ListItemId
                    FROM dbo.ListItemCategory AS lic
                        INNER JOIN dbo.ListItem AS li
                            ON li.ListItemCategoryId = lic.ListItemCategoryId
                    WHERE lic.ListItemCategoryName = 'UserType'
                          AND li.ListItemName = 'Client'
                );
        INSERT INTO dbo.UserRole
        (
            UserId,
            RoleId,
            UserTypeListItemId,
            InsertDate
        )
        VALUES
        (   @UserId,             -- UserId - int
            @ClientAdminRoleId,  -- RoleId - int
            @UserTypeListItemId, -- UserTypeListItemId - int
            GETDATE()            -- InsertDate - smalldatetime
            );
        --UPDATE rt
        --SET rt.ReportType = rtm.ReportType
        --FROM dbo.ReportType AS rt
        --    INNER JOIN #ReportTypeModel AS rtm
        --        ON rtm.ReportTypeId = rt.ReportTypeId
        --WHERE rtm.ReportTypeId != 0;

        SET @ReturnMessage = 'Saved Sucessfully';
        DROP TABLE #UserInformationModel;
        DROP TABLE #UserModel;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH;
END;



GO
/****** Object:  StoredProcedure [dbo].[SpUserRoleSel]    Script Date: 11/23/2018 5:22:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Roshan Shrestha
-- Create date: 11-22-2018
-- Description:	return list of User Role
-- =============================================
CREATE PROCEDURE [dbo].[SpUserRoleSel]
(@UserId INT)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT r.RoleName,
           r.RoleDescription
    FROM dbo.UserRole AS ur
        INNER JOIN dbo.Role AS r
            ON r.RoleId = ur.RoleId
    WHERE ur.UserId = @UserId;
END;


GO
/****** Object:  StoredProcedure [dbo].[SpUserSel]    Script Date: 11/23/2018 5:22:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Roshan Shrestha
-- Create date: 11-22-2018
-- Description:	return list of User
-- =============================================
CREATE PROCEDURE [dbo].[SpUserSel]
(@UserId INT)
AS
BEGIN
    SET NOCOUNT ON;

    IF 1 = 2
    BEGIN
        SELECT CAST(NULL AS INT) AS Id
        WHERE 1 = 2
        FOR JSON PATH, INCLUDE_NULL_VALUES;
    END;

    DECLARE @ParentUserId INT;
    IF ((SELECT u.ParentId FROM dbo.[User] AS u WHERE u.UserId = @UserId) = 0)
    BEGIN
        SET @ParentUserId =
        (
            SELECT u.UserId FROM dbo.[User] AS u WHERE u.UserId = @UserId
        );

    END;
    ELSE
    BEGIN
        SET @ParentUserId =
        (
            SELECT u.UserId
            FROM dbo.[User] AS u
            WHERE u.UserId =
            (
                SELECT u2.ParentId FROM dbo.[User] AS u2 WHERE u2.UserId = @UserId
            )
        );
    END;
    SELECT u.Email,
           u.FName + ' ' + u.LName AS FullName,
           ui.ContactNumber,
           ui.MobileNumber,
           ui.PersonalEmail,
           vlic.ListItemName AS Gender,
           ui.Address1,
           ui.Address2,
           ui.City,
           ui.State,
           ui.Country,
           vlic2.ListItemName AS UserType,
           r.RoleName
    INTO #tmp
    FROM dbo.[User] AS u
        INNER JOIN dbo.Client AS c
            ON c.UserId = u.UserId
        INNER JOIN dbo.UserInformation AS ui
            ON ui.UserId = u.UserId
        INNER JOIN dbo.UserRole AS ur
            ON ur.UserId = u.UserId
        INNER JOIN dbo.VwListItemCategory AS vlic
            ON ui.GenderListItemId = vlic.ListItemId
        INNER JOIN dbo.VwListItemCategory AS vlic2
            ON ur.UserTypeListItemId = vlic2.ListItemId
        INNER JOIN dbo.Role AS r
            ON r.RoleId = ur.RoleId
    WHERE u.ParentId = @ParentUserId
          OR c.UserId = @ParentUserId;


    SELECT *
    FROM #tmp AS t
    FOR JSON PATH, INCLUDE_NULL_VALUES;
    DROP TABLE #tmp;
END;

GO
/****** Object:  StoredProcedure [dbo].[SpVerifyUserSel]    Script Date: 11/23/2018 5:22:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Roshan Shrestha
-- Create date: 11-22-2018
-- Description:	return list of User
-- =============================================
CREATE PROCEDURE [dbo].[SpVerifyUserSel]
(@Email VARCHAR(150))
AS
BEGIN
    SET NOCOUNT ON;

    SELECT u.UserId,
           u.Email,
           u.FName + ' ' + u.LName AS FullName,
           u.Password,
           u.ParentId
    FROM dbo.[User] AS u
    WHERE u.Email = @Email
          AND u.IsActive = 1;

END;


GO
USE [master]
GO
ALTER DATABASE [Payroll] SET  READ_WRITE 
GO
