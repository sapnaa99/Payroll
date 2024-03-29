USE [Payroll]
GO
/****** Object:  Table [dbo].[ListItem]    Script Date: 2/18/2019 2:06:18 PM ******/
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
/****** Object:  Table [dbo].[ListItemCategory]    Script Date: 2/18/2019 2:06:18 PM ******/
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
/****** Object:  View [dbo].[VwListItemCategory]    Script Date: 2/18/2019 2:06:18 PM ******/
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
/****** Object:  Table [dbo].[Attendance]    Script Date: 2/18/2019 2:06:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[AttendanceId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[InTime] [time](7) NULL,
	[OutTime] [time](7) NULL,
	[IsPresent] [bit] NOT NULL,
	[InsertUserId] [int] NOT NULL,
	[InsertDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED 
(
	[AttendanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 2/18/2019 2:06:19 PM ******/
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
/****** Object:  Table [dbo].[Company]    Script Date: 2/18/2019 2:06:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](150) NOT NULL,
	[ClientId] [int] NOT NULL,
	[InsertUserID] [int] NOT NULL,
	[InsertDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Complain]    Script Date: 2/18/2019 2:06:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Complain](
	[ComplainId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[ComplainSeverityListItemId] [int] NOT NULL,
	[ConsultManagement] [bit] NOT NULL,
	[ComplainStatusListItemId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[InsertDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK__Complain__88D549118A86E9E9] PRIMARY KEY CLUSTERED 
(
	[ComplainId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 2/18/2019 2:06:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](150) NOT NULL,
	[FName] [nvarchar](100) NOT NULL,
	[MName] [nvarchar](100) NULL,
	[LName] [nvarchar](100) NOT NULL,
	[Passsword] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[InsertUserId] [int] NOT NULL,
	[InsertDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeInformation]    Script Date: 2/18/2019 2:06:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeInformation](
	[EmployeeInformationId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
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
	[InsertUserId] [int] NOT NULL,
 CONSTRAINT [PK_EmployeeInformation] PRIMARY KEY CLUSTERED 
(
	[EmployeeInformationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeLeave]    Script Date: 2/18/2019 2:06:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeLeave](
	[EmployeeLeaveId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[LeaveId] [int] NULL,
	[AppliedDate] [smalldatetime] NOT NULL,
	[StartDate] [smalldatetime] NOT NULL,
	[EndDate] [smalldatetime] NOT NULL,
	[LeaveStatusListItemId] [int] NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[Remarks] [nvarchar](250) NULL,
	[ApprovedUserId] [int] NULL,
	[InsertDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_EmployeeLeave] PRIMARY KEY CLUSTERED 
(
	[EmployeeLeaveId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeLeaveDetail]    Script Date: 2/18/2019 2:06:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeLeaveDetail](
	[EmployeeLeaveDetailId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[LeaveId] [int] NOT NULL,
	[Days] [int] NOT NULL,
	[InsertDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_EmployeeLeaveDetail] PRIMARY KEY CLUSTERED 
(
	[EmployeeLeaveDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeSalary]    Script Date: 2/18/2019 2:06:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeSalary](
	[EmployeeSalaryId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[BasicSalary] [money] NOT NULL,
	[Allowance] [money] NOT NULL,
	[InserUserId] [int] NOT NULL,
	[InsertDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_EmployeeSalary] PRIMARY KEY CLUSTERED 
(
	[EmployeeSalaryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leave]    Script Date: 2/18/2019 2:06:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leave](
	[LeaveId] [int] IDENTITY(1,1) NOT NULL,
	[LeaveName] [nvarchar](150) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Days] [int] NOT NULL,
	[InsertDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Leave] PRIMARY KEY CLUSTERED 
(
	[LeaveId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plan]    Script Date: 2/18/2019 2:06:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plan](
	[PlanId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[PlanDurationListItemId] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[CompanyLimit] [int] NOT NULL,
	[IsActive] [int] NOT NULL,
	[InsertDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Plan] PRIMARY KEY CLUSTERED 
(
	[PlanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanDuration]    Script Date: 2/18/2019 2:06:19 PM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 2/18/2019 2:06:19 PM ******/
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
/****** Object:  Table [dbo].[SalaryRateSetup]    Script Date: 2/18/2019 2:06:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalaryRateSetup](
	[SalaryRateSetupId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[RateName] [nvarchar](150) NOT NULL,
	[From] [money] NOT NULL,
	[Upto] [money] NOT NULL,
	[Rate] [float] NOT NULL,
	[InsertUserId] [int] NOT NULL,
	[InsertDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_SalaryRateSetup] PRIMARY KEY CLUSTERED 
(
	[SalaryRateSetupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalaryTransaction]    Script Date: 2/18/2019 2:06:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalaryTransaction](
	[SalaryTransactionId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[SalaryPaymentTypeListItemId] [int] NOT NULL,
	[PaidFromDate] [smalldatetime] NOT NULL,
	[PaidUptoDate] [smalldatetime] NOT NULL,
	[PaymentMethodListItemId] [int] NOT NULL,
	[SalaryAmount] [money] NOT NULL,
	[EmployeeProvidentFundRate] [float] NULL,
	[EmployeeProvidentFundAmount] [money] NULL,
	[CompanyProvidentFundRate] [float] NULL,
	[CompanyProvidentFundAmount] [money] NULL,
	[TaxAmount] [money] NOT NULL,
	[MiscellenousAmount] [money] NOT NULL,
	[SalaryStatusListItemId] [int] NOT NULL,
	[InsertUserId] [int] NOT NULL,
	[InsertDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK__SalaryTr__2973CC57EABB3C52] PRIMARY KEY CLUSTERED 
(
	[SalaryTransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubDomain]    Script Date: 2/18/2019 2:06:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubDomain](
	[SubDomainId] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[SubDomain] [nvarchar](100) NOT NULL,
	[InsertUserId] [int] NOT NULL,
	[InsertDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_SubDomain] PRIMARY KEY CLUSTERED 
(
	[SubDomainId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscription]    Script Date: 2/18/2019 2:06:20 PM ******/
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
/****** Object:  Table [dbo].[SystemUser]    Script Date: 2/18/2019 2:06:20 PM ******/
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
/****** Object:  Table [dbo].[SystemUserInformation]    Script Date: 2/18/2019 2:06:20 PM ******/
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
/****** Object:  Table [dbo].[Ticket]    Script Date: 2/18/2019 2:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[TicketId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[PriorityListItemId] [int] NOT NULL,
	[TicketStatusListItemId] [int] NOT NULL,
	[InsertDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK__Ticket__712CC6077AC1BA54] PRIMARY KEY CLUSTERED 
(
	[TicketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2/18/2019 2:06:20 PM ******/
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
/****** Object:  Table [dbo].[UserInformation]    Script Date: 2/18/2019 2:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInformation](
	[UserInformationId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ContactNumber] [int] NULL,
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
/****** Object:  Table [dbo].[UserRole]    Script Date: 2/18/2019 2:06:20 PM ******/
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
SET IDENTITY_INSERT [dbo].[Attendance] ON 

INSERT [dbo].[Attendance] ([AttendanceId], [CompanyId], [EmployeeId], [InTime], [OutTime], [IsPresent], [InsertUserId], [InsertDate]) VALUES (1, 2, 11, CAST(N'10:23:39.9933333' AS Time), NULL, 1, 2024, CAST(N'2018-12-04T10:23:00' AS SmallDateTime))
INSERT [dbo].[Attendance] ([AttendanceId], [CompanyId], [EmployeeId], [InTime], [OutTime], [IsPresent], [InsertUserId], [InsertDate]) VALUES (2, 2, 18, CAST(N'10:23:41.1633333' AS Time), NULL, 1, 2024, CAST(N'2018-12-04T10:23:00' AS SmallDateTime))
INSERT [dbo].[Attendance] ([AttendanceId], [CompanyId], [EmployeeId], [InTime], [OutTime], [IsPresent], [InsertUserId], [InsertDate]) VALUES (3, 2, 11, CAST(N'10:24:29.3000000' AS Time), CAST(N'11:23:21.1000000' AS Time), 1, 2024, CAST(N'2018-12-05T10:24:00' AS SmallDateTime))
INSERT [dbo].[Attendance] ([AttendanceId], [CompanyId], [EmployeeId], [InTime], [OutTime], [IsPresent], [InsertUserId], [InsertDate]) VALUES (4, 2, 18, CAST(N'10:24:30.2433333' AS Time), CAST(N'11:23:19.9000000' AS Time), 1, 2024, CAST(N'2018-12-05T10:25:00' AS SmallDateTime))
INSERT [dbo].[Attendance] ([AttendanceId], [CompanyId], [EmployeeId], [InTime], [OutTime], [IsPresent], [InsertUserId], [InsertDate]) VALUES (5, 2, 11, CAST(N'15:51:07.3933333' AS Time), CAST(N'16:37:32.8300000' AS Time), 1, 2024, CAST(N'2018-12-18T15:51:00' AS SmallDateTime))
INSERT [dbo].[Attendance] ([AttendanceId], [CompanyId], [EmployeeId], [InTime], [OutTime], [IsPresent], [InsertUserId], [InsertDate]) VALUES (6, 2, 18, CAST(N'15:51:09.2700000' AS Time), CAST(N'16:37:34.3733333' AS Time), 1, 2024, CAST(N'2018-12-18T15:51:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[Attendance] OFF
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ClientId], [UserId], [InsertDate]) VALUES (2023, 2024, CAST(N'2018-11-30T11:47:00' AS SmallDateTime))
INSERT [dbo].[Client] ([ClientId], [UserId], [InsertDate]) VALUES (2024, 2025, CAST(N'2018-11-30T11:49:00' AS SmallDateTime))
INSERT [dbo].[Client] ([ClientId], [UserId], [InsertDate]) VALUES (2025, 2026, CAST(N'2018-11-30T13:48:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[Client] OFF
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([CompanyId], [CompanyName], [ClientId], [InsertUserID], [InsertDate]) VALUES (2, N'Rosan Corporation....', 2023, 2024, CAST(N'2018-11-30T14:02:00' AS SmallDateTime))
INSERT [dbo].[Company] ([CompanyId], [CompanyName], [ClientId], [InsertUserID], [InsertDate]) VALUES (8, N'Test Company', 2023, 2024, CAST(N'2018-11-30T16:54:00' AS SmallDateTime))
INSERT [dbo].[Company] ([CompanyId], [CompanyName], [ClientId], [InsertUserID], [InsertDate]) VALUES (1020, N'Client User Companyy', 2023, 2024, CAST(N'2018-12-03T11:46:00' AS SmallDateTime))
INSERT [dbo].[Company] ([CompanyId], [CompanyName], [ClientId], [InsertUserID], [InsertDate]) VALUES (1022, N'ry', 2023, 2024, CAST(N'2018-12-04T10:59:00' AS SmallDateTime))
INSERT [dbo].[Company] ([CompanyId], [CompanyName], [ClientId], [InsertUserID], [InsertDate]) VALUES (1023, N'uuu', 2023, 2024, CAST(N'2018-12-04T10:59:00' AS SmallDateTime))
INSERT [dbo].[Company] ([CompanyId], [CompanyName], [ClientId], [InsertUserID], [InsertDate]) VALUES (1024, N'Test Sapanaa', 2023, 2024, CAST(N'2018-12-06T17:23:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmployeeId], [Email], [FName], [MName], [LName], [Passsword], [IsActive], [CompanyId], [InsertUserId], [InsertDate]) VALUES (11, N'sapnaa.chaudhary@gmail.com', N'Sapana ', NULL, N'Chaudhary', N'123123', 1, 2, 2024, CAST(N'2018-12-03T00:00:00' AS SmallDateTime))
INSERT [dbo].[Employee] ([EmployeeId], [Email], [FName], [MName], [LName], [Passsword], [IsActive], [CompanyId], [InsertUserId], [InsertDate]) VALUES (18, N'mah.rosan@gmail.com', N'Roshan', N'Lal', N'Shrestha', N'$2a$12$GZt.dScDn8t.1atf6v5toueGnvWL4OjmWqn5Ia6mdaDTOwUWddkoq', 1, 2, 2024, CAST(N'2018-12-04T14:40:00' AS SmallDateTime))
INSERT [dbo].[Employee] ([EmployeeId], [Email], [FName], [MName], [LName], [Passsword], [IsActive], [CompanyId], [InsertUserId], [InsertDate]) VALUES (19, N'a@a.com', N'fsd', N'fsdf', N'sdfsf', N'$2a$12$ykLAqcnKvn/KkYMgS2Phk.ov6R5ZTesXwqTpMbYUFwUhUicvMOUxS', 1, 1020, 2024, CAST(N'2018-12-06T15:13:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[EmployeeInformation] ON 

INSERT [dbo].[EmployeeInformation] ([EmployeeInformationId], [EmployeeId], [ContactNumber], [MobileNumber], [PersonalEmail], [GenderListItemId], [Address1], [Address2], [City], [State], [Country], [InsertDate], [InsertUserId]) VALUES (1, 18, 986000581, 986000581, N'rosan@s.com', 1, N'nagaun', N'kirtipur', N'kathmandu', N'state33', N'nepal', CAST(N'2018-12-04T14:40:00' AS SmallDateTime), 2024)
INSERT [dbo].[EmployeeInformation] ([EmployeeInformationId], [EmployeeId], [ContactNumber], [MobileNumber], [PersonalEmail], [GenderListItemId], [Address1], [Address2], [City], [State], [Country], [InsertDate], [InsertUserId]) VALUES (3, 11, 986000581, 986000581, N'rosan@s.com', 2, N'nagaun', N'kirtipur', N'kathmandu', N'state33', N'nepal', CAST(N'2018-12-06T15:01:00' AS SmallDateTime), 2024)
INSERT [dbo].[EmployeeInformation] ([EmployeeInformationId], [EmployeeId], [ContactNumber], [MobileNumber], [PersonalEmail], [GenderListItemId], [Address1], [Address2], [City], [State], [Country], [InsertDate], [InsertUserId]) VALUES (4, 19, 986000581, 986000581, N'rosan@s.com', 1, N'nagaun', N'qwe', N'', N'', N'nepal', CAST(N'2018-12-06T15:13:00' AS SmallDateTime), 2024)
SET IDENTITY_INSERT [dbo].[EmployeeInformation] OFF
SET IDENTITY_INSERT [dbo].[EmployeeLeave] ON 

INSERT [dbo].[EmployeeLeave] ([EmployeeLeaveId], [EmployeeId], [LeaveId], [AppliedDate], [StartDate], [EndDate], [LeaveStatusListItemId], [Description], [Remarks], [ApprovedUserId], [InsertDate]) VALUES (1006, 18, 4005, CAST(N'2019-01-06T22:43:00' AS SmallDateTime), CAST(N'2019-01-06T12:30:00' AS SmallDateTime), CAST(N'2019-01-08T12:30:00' AS SmallDateTime), 1008, N'Hello', N'Hello', NULL, CAST(N'2019-01-07T10:13:00' AS SmallDateTime))
INSERT [dbo].[EmployeeLeave] ([EmployeeLeaveId], [EmployeeId], [LeaveId], [AppliedDate], [StartDate], [EndDate], [LeaveStatusListItemId], [Description], [Remarks], [ApprovedUserId], [InsertDate]) VALUES (1007, 18, 4005, CAST(N'2019-01-07T04:35:00' AS SmallDateTime), CAST(N'2019-01-06T18:15:00' AS SmallDateTime), CAST(N'2019-02-17T18:15:00' AS SmallDateTime), 1008, N'Check', NULL, NULL, CAST(N'2019-01-07T10:20:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[EmployeeLeave] OFF
SET IDENTITY_INSERT [dbo].[EmployeeSalary] ON 

INSERT [dbo].[EmployeeSalary] ([EmployeeSalaryId], [EmployeeId], [BasicSalary], [Allowance], [InserUserId], [InsertDate]) VALUES (1, 18, 1000.0000, 1500.0000, 2024, CAST(N'2018-12-04T14:40:00' AS SmallDateTime))
INSERT [dbo].[EmployeeSalary] ([EmployeeSalaryId], [EmployeeId], [BasicSalary], [Allowance], [InserUserId], [InsertDate]) VALUES (2, 19, 1000.0000, 1500.0000, 2024, CAST(N'2018-12-06T15:13:00' AS SmallDateTime))
INSERT [dbo].[EmployeeSalary] ([EmployeeSalaryId], [EmployeeId], [BasicSalary], [Allowance], [InserUserId], [InsertDate]) VALUES (1002, 11, 6000.0000, 2000.0000, 2024, CAST(N'2018-12-28T11:50:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[EmployeeSalary] OFF
SET IDENTITY_INSERT [dbo].[Leave] ON 

INSERT [dbo].[Leave] ([LeaveId], [LeaveName], [CompanyId], [Days], [InsertDate]) VALUES (4005, N'Test leave', 2, 2, CAST(N'2018-12-18T15:49:00' AS SmallDateTime))
INSERT [dbo].[Leave] ([LeaveId], [LeaveName], [CompanyId], [Days], [InsertDate]) VALUES (4007, N'Test Leave 2', 1024, 6, CAST(N'2018-12-19T10:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[Leave] OFF
SET IDENTITY_INSERT [dbo].[ListItem] ON 

INSERT [dbo].[ListItem] ([ListItemId], [ListItemCategoryId], [ListItemName], [InsertDate]) VALUES (1, 1, N'Male', CAST(N'2018-11-21T13:55:00' AS SmallDateTime))
INSERT [dbo].[ListItem] ([ListItemId], [ListItemCategoryId], [ListItemName], [InsertDate]) VALUES (2, 1, N'Female', CAST(N'2018-11-21T13:55:00' AS SmallDateTime))
INSERT [dbo].[ListItem] ([ListItemId], [ListItemCategoryId], [ListItemName], [InsertDate]) VALUES (3, 1, N'Other', CAST(N'2018-11-21T13:55:00' AS SmallDateTime))
INSERT [dbo].[ListItem] ([ListItemId], [ListItemCategoryId], [ListItemName], [InsertDate]) VALUES (4, 2, N'Client', CAST(N'2018-11-22T09:12:00' AS SmallDateTime))
INSERT [dbo].[ListItem] ([ListItemId], [ListItemCategoryId], [ListItemName], [InsertDate]) VALUES (5, 2, N'System User', CAST(N'2018-11-22T09:12:00' AS SmallDateTime))
INSERT [dbo].[ListItem] ([ListItemId], [ListItemCategoryId], [ListItemName], [InsertDate]) VALUES (1004, 1002, N'One mounth', CAST(N'2018-11-26T13:20:00' AS SmallDateTime))
INSERT [dbo].[ListItem] ([ListItemId], [ListItemCategoryId], [ListItemName], [InsertDate]) VALUES (1005, 1002, N'Three month', CAST(N'2018-11-26T13:21:00' AS SmallDateTime))
INSERT [dbo].[ListItem] ([ListItemId], [ListItemCategoryId], [ListItemName], [InsertDate]) VALUES (1006, 1002, N'Six month', CAST(N'2018-11-26T13:21:00' AS SmallDateTime))
INSERT [dbo].[ListItem] ([ListItemId], [ListItemCategoryId], [ListItemName], [InsertDate]) VALUES (1007, 1002, N'One Year', CAST(N'2018-11-26T13:21:00' AS SmallDateTime))
INSERT [dbo].[ListItem] ([ListItemId], [ListItemCategoryId], [ListItemName], [InsertDate]) VALUES (1008, 1003, N'Pending', CAST(N'2018-12-07T10:24:00' AS SmallDateTime))
INSERT [dbo].[ListItem] ([ListItemId], [ListItemCategoryId], [ListItemName], [InsertDate]) VALUES (1009, 1003, N'Approved', CAST(N'2018-12-07T10:24:00' AS SmallDateTime))
INSERT [dbo].[ListItem] ([ListItemId], [ListItemCategoryId], [ListItemName], [InsertDate]) VALUES (1010, 1003, N'Unapproved', CAST(N'2018-12-07T10:25:00' AS SmallDateTime))
INSERT [dbo].[ListItem] ([ListItemId], [ListItemCategoryId], [ListItemName], [InsertDate]) VALUES (1011, 2003, N'Daily Salary', CAST(N'2018-12-28T04:43:00' AS SmallDateTime))
INSERT [dbo].[ListItem] ([ListItemId], [ListItemCategoryId], [ListItemName], [InsertDate]) VALUES (1012, 2003, N'Weekly Salary', CAST(N'2018-12-28T10:30:00' AS SmallDateTime))
INSERT [dbo].[ListItem] ([ListItemId], [ListItemCategoryId], [ListItemName], [InsertDate]) VALUES (1013, 2003, N'Monthly Salary', CAST(N'2018-12-28T10:30:00' AS SmallDateTime))
INSERT [dbo].[ListItem] ([ListItemId], [ListItemCategoryId], [ListItemName], [InsertDate]) VALUES (1014, 2003, N'Bonus', CAST(N'2018-12-28T10:30:00' AS SmallDateTime))
INSERT [dbo].[ListItem] ([ListItemId], [ListItemCategoryId], [ListItemName], [InsertDate]) VALUES (1015, 2004, N'Cheque', CAST(N'2018-12-28T10:31:00' AS SmallDateTime))
INSERT [dbo].[ListItem] ([ListItemId], [ListItemCategoryId], [ListItemName], [InsertDate]) VALUES (1016, 2004, N'Cash', CAST(N'2018-12-28T10:31:00' AS SmallDateTime))
INSERT [dbo].[ListItem] ([ListItemId], [ListItemCategoryId], [ListItemName], [InsertDate]) VALUES (1017, 2005, N'Deployed', CAST(N'2018-12-28T10:32:00' AS SmallDateTime))
INSERT [dbo].[ListItem] ([ListItemId], [ListItemCategoryId], [ListItemName], [InsertDate]) VALUES (1018, 2005, N'Withold', CAST(N'2018-12-28T10:32:00' AS SmallDateTime))
INSERT [dbo].[ListItem] ([ListItemId], [ListItemCategoryId], [ListItemName], [InsertDate]) VALUES (1019, 2003, N'Advance', CAST(N'2018-12-28T14:37:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[ListItem] OFF
SET IDENTITY_INSERT [dbo].[ListItemCategory] ON 

INSERT [dbo].[ListItemCategory] ([ListItemCategoryId], [ListItemCategoryName], [InsertDate]) VALUES (1, N'Gender', CAST(N'2018-11-21T13:55:00' AS SmallDateTime))
INSERT [dbo].[ListItemCategory] ([ListItemCategoryId], [ListItemCategoryName], [InsertDate]) VALUES (2, N'UserType', CAST(N'2018-11-22T09:11:00' AS SmallDateTime))
INSERT [dbo].[ListItemCategory] ([ListItemCategoryId], [ListItemCategoryName], [InsertDate]) VALUES (1002, N'PlanDuration', CAST(N'2018-11-26T13:19:00' AS SmallDateTime))
INSERT [dbo].[ListItemCategory] ([ListItemCategoryId], [ListItemCategoryName], [InsertDate]) VALUES (1003, N'LeaveStatus', CAST(N'2018-12-07T10:23:00' AS SmallDateTime))
INSERT [dbo].[ListItemCategory] ([ListItemCategoryId], [ListItemCategoryName], [InsertDate]) VALUES (2003, N'SalaryPaymentType', CAST(N'2018-12-28T10:27:00' AS SmallDateTime))
INSERT [dbo].[ListItemCategory] ([ListItemCategoryId], [ListItemCategoryName], [InsertDate]) VALUES (2004, N'PaymentMethod', CAST(N'2018-12-28T10:28:00' AS SmallDateTime))
INSERT [dbo].[ListItemCategory] ([ListItemCategoryId], [ListItemCategoryName], [InsertDate]) VALUES (2005, N'SalaryStatus', CAST(N'2018-12-28T10:28:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[ListItemCategory] OFF
SET IDENTITY_INSERT [dbo].[Plan] ON 

INSERT [dbo].[Plan] ([PlanId], [Name], [PlanDurationListItemId], [Price], [CompanyLimit], [IsActive], [InsertDate]) VALUES (1, N'One Month Plan', 1004, 150.0000, 2, 1, CAST(N'2018-11-26T13:24:00' AS SmallDateTime))
INSERT [dbo].[Plan] ([PlanId], [Name], [PlanDurationListItemId], [Price], [CompanyLimit], [IsActive], [InsertDate]) VALUES (2, N'Dashain Offer', 1004, 145.0000, 2, 1, CAST(N'2018-11-26T13:24:00' AS SmallDateTime))
INSERT [dbo].[Plan] ([PlanId], [Name], [PlanDurationListItemId], [Price], [CompanyLimit], [IsActive], [InsertDate]) VALUES (4, N'Six Month Offer', 1006, 250.0000, 2, 1, CAST(N'2018-11-26T13:29:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[Plan] OFF
SET IDENTITY_INSERT [dbo].[PlanDuration] ON 

INSERT [dbo].[PlanDuration] ([PlanDurationId], [PlanDurationListItemId], [DurationInMonth], [InsertDate]) VALUES (1, 1004, 1, CAST(N'2018-11-26T13:22:00' AS SmallDateTime))
INSERT [dbo].[PlanDuration] ([PlanDurationId], [PlanDurationListItemId], [DurationInMonth], [InsertDate]) VALUES (2, 1005, 3, CAST(N'2018-11-26T13:22:00' AS SmallDateTime))
INSERT [dbo].[PlanDuration] ([PlanDurationId], [PlanDurationListItemId], [DurationInMonth], [InsertDate]) VALUES (3, 1006, 6, CAST(N'2018-11-26T13:22:00' AS SmallDateTime))
INSERT [dbo].[PlanDuration] ([PlanDurationId], [PlanDurationListItemId], [DurationInMonth], [InsertDate]) VALUES (4, 1007, 12, CAST(N'2018-11-26T13:22:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[PlanDuration] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [RoleName], [RoleDescription], [InsertDate]) VALUES (1, N'Client Admin', N'Main Admin of the CLient', CAST(N'2018-11-22T09:07:00' AS SmallDateTime))
INSERT [dbo].[Role] ([RoleId], [RoleName], [RoleDescription], [InsertDate]) VALUES (2, N'Client Manager', N'Main Admin of the CLient', CAST(N'2018-11-22T09:07:00' AS SmallDateTime))
INSERT [dbo].[Role] ([RoleId], [RoleName], [RoleDescription], [InsertDate]) VALUES (3, N'Employee', N'Employees of Client', CAST(N'2018-11-22T09:08:00' AS SmallDateTime))
INSERT [dbo].[Role] ([RoleId], [RoleName], [RoleDescription], [InsertDate]) VALUES (4, N'Admin', N'System Admin', CAST(N'2018-11-22T09:08:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[SalaryRateSetup] ON 

INSERT [dbo].[SalaryRateSetup] ([SalaryRateSetupId], [CompanyId], [RateName], [From], [Upto], [Rate], [InsertUserId], [InsertDate]) VALUES (1, 2, N'Test Rate', 0.0000, 350000.0000, 1, 2024, CAST(N'2018-12-05T10:31:00' AS SmallDateTime))
INSERT [dbo].[SalaryRateSetup] ([SalaryRateSetupId], [CompanyId], [RateName], [From], [Upto], [Rate], [InsertUserId], [InsertDate]) VALUES (5, 2, N'Test Rate 2', 351000.0000, 450000.0000, 10, 2024, CAST(N'2018-12-04T11:09:00' AS SmallDateTime))
INSERT [dbo].[SalaryRateSetup] ([SalaryRateSetupId], [CompanyId], [RateName], [From], [Upto], [Rate], [InsertUserId], [InsertDate]) VALUES (6, 1020, N'Client Test', 1.0000, 250000.0000, 1, 2024, CAST(N'2018-12-03T17:31:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[SalaryRateSetup] OFF
SET IDENTITY_INSERT [dbo].[SalaryTransaction] ON 

INSERT [dbo].[SalaryTransaction] ([SalaryTransactionId], [EmployeeId], [SalaryPaymentTypeListItemId], [PaidFromDate], [PaidUptoDate], [PaymentMethodListItemId], [SalaryAmount], [EmployeeProvidentFundRate], [EmployeeProvidentFundAmount], [CompanyProvidentFundRate], [CompanyProvidentFundAmount], [TaxAmount], [MiscellenousAmount], [SalaryStatusListItemId], [InsertUserId], [InsertDate]) VALUES (2, 18, 1013, CAST(N'2018-12-28T04:41:00' AS SmallDateTime), CAST(N'2018-12-28T04:41:00' AS SmallDateTime), 1015, 5000.0000, NULL, NULL, NULL, NULL, 500.0000, 500.0000, 1017, 2024, CAST(N'2018-12-28T04:41:00' AS SmallDateTime))
INSERT [dbo].[SalaryTransaction] ([SalaryTransactionId], [EmployeeId], [SalaryPaymentTypeListItemId], [PaidFromDate], [PaidUptoDate], [PaymentMethodListItemId], [SalaryAmount], [EmployeeProvidentFundRate], [EmployeeProvidentFundAmount], [CompanyProvidentFundRate], [CompanyProvidentFundAmount], [TaxAmount], [MiscellenousAmount], [SalaryStatusListItemId], [InsertUserId], [InsertDate]) VALUES (3, 18, 1013, CAST(N'2018-12-28T04:41:00' AS SmallDateTime), CAST(N'2018-12-30T04:41:00' AS SmallDateTime), 1015, 5000.0000, NULL, NULL, NULL, NULL, 500.0000, 500.0000, 1017, 2024, CAST(N'2018-12-28T10:47:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[SalaryTransaction] OFF
SET IDENTITY_INSERT [dbo].[SubDomain] ON 

INSERT [dbo].[SubDomain] ([SubDomainId], [ClientId], [SubDomain], [InsertUserId], [InsertDate]) VALUES (1, 2023, N'Rosan', 2024, CAST(N'2018-11-30T11:47:00' AS SmallDateTime))
INSERT [dbo].[SubDomain] ([SubDomainId], [ClientId], [SubDomain], [InsertUserId], [InsertDate]) VALUES (2, 2024, N'Test', 2025, CAST(N'2018-11-30T11:49:00' AS SmallDateTime))
INSERT [dbo].[SubDomain] ([SubDomainId], [ClientId], [SubDomain], [InsertUserId], [InsertDate]) VALUES (3, 2025, N'abc', 2026, CAST(N'2018-11-30T13:48:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[SubDomain] OFF
SET IDENTITY_INSERT [dbo].[Subscription] ON 

INSERT [dbo].[Subscription] ([SubscriptionId], [ClientId], [PlanId], [SubscriptionStartDate], [SubscriptionEndDate], [IsActive], [InsertDate]) VALUES (2, 2023, 1, CAST(N'2018-11-30T11:47:00' AS SmallDateTime), CAST(N'2019-12-30T11:47:00' AS SmallDateTime), 1, CAST(N'2018-11-30T11:47:00' AS SmallDateTime))
INSERT [dbo].[Subscription] ([SubscriptionId], [ClientId], [PlanId], [SubscriptionStartDate], [SubscriptionEndDate], [IsActive], [InsertDate]) VALUES (3, 2024, 4, CAST(N'2018-11-30T11:49:00' AS SmallDateTime), CAST(N'2019-12-30T11:47:00' AS SmallDateTime), 1, CAST(N'2018-11-30T11:49:00' AS SmallDateTime))
INSERT [dbo].[Subscription] ([SubscriptionId], [ClientId], [PlanId], [SubscriptionStartDate], [SubscriptionEndDate], [IsActive], [InsertDate]) VALUES (4, 2025, 2, CAST(N'2018-11-30T13:48:00' AS SmallDateTime), CAST(N'2019-12-30T11:47:00' AS SmallDateTime), 1, CAST(N'2018-11-30T13:48:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[Subscription] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [Email], [FName], [MName], [LName], [Password], [IsActive], [ParentId], [InsertDate]) VALUES (2024, N'mah.rosan@gmail.com', N'Rosan', N'', N'Shrestha', N'$2a$12$TUuhBmP0eTHNNE.xo4zfAOnG8tdKNHPCGiOtvtuuAGrAs3X5IZJ2S', 1, 0, CAST(N'2018-11-30T11:47:00' AS SmallDateTime))
INSERT [dbo].[User] ([UserId], [Email], [FName], [MName], [LName], [Password], [IsActive], [ParentId], [InsertDate]) VALUES (2025, N'a@a.com', N'Test', N'', N'Test', N'$2a$12$aBL5FwlZ4gKh1GnNvrDTS.gz6PWHh.AZacMcymDDe4kWSojveolO2', 1, 0, CAST(N'2018-11-30T11:49:00' AS SmallDateTime))
INSERT [dbo].[User] ([UserId], [Email], [FName], [MName], [LName], [Password], [IsActive], [ParentId], [InsertDate]) VALUES (2026, N'abc@a.com', N'abc', N'', N'def', N'$2a$12$zhnxT7ZNVoBw0LEiXqBR0upx7ia9xcoXY4UHF8xCwF22Xa/US41MW', 1, 0, CAST(N'2018-11-30T13:48:00' AS SmallDateTime))
INSERT [dbo].[User] ([UserId], [Email], [FName], [MName], [LName], [Password], [IsActive], [ParentId], [InsertDate]) VALUES (2028, N'c1@c.com', N'Client', N'', N'User', N'$2a$12$015.icw72CzJOIYu6I5unueY8UVQFUxMeAdFV7IhTx3AbOFe2yUA.', 1, 2024, CAST(N'2018-12-03T11:21:00' AS SmallDateTime))
INSERT [dbo].[User] ([UserId], [Email], [FName], [MName], [LName], [Password], [IsActive], [ParentId], [InsertDate]) VALUES (2029, N'abc1@a.com', N'AbcManager', N'', N' xyzManager', N'$2a$12$CnkxYE4ZaDRqlUOhIN5HvuziZEzBrxREJ9iT7qON2a5OkZgdIQNBC', 1, 2026, CAST(N'2018-12-03T11:53:00' AS SmallDateTime))
INSERT [dbo].[User] ([UserId], [Email], [FName], [MName], [LName], [Password], [IsActive], [ParentId], [InsertDate]) VALUES (2030, N'sapana@gmail.com', N'Sapana', N'', N'Chau', N'$2a$12$IibcM1Inu4N71CXen842Z.H1bwedDxPNOFDUedUu2fDar3/xJzIpi', 1, 2024, CAST(N'2018-12-03T11:56:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserInformation] ON 

INSERT [dbo].[UserInformation] ([UserInformationId], [UserId], [ContactNumber], [MobileNumber], [PersonalEmail], [GenderListItemId], [Address1], [Address2], [City], [State], [Country], [InsertDate], [InsertUserId]) VALUES (2022, 2024, 1270071224, 1233739313, N'mah.rosan@gmail.com', 1, N'Nagaun', N'Kirtipur', N'Kathmandu', N'State 3', N'Nepal', CAST(N'2018-11-30T11:47:00' AS SmallDateTime), NULL)
INSERT [dbo].[UserInformation] ([UserInformationId], [UserId], [ContactNumber], [MobileNumber], [PersonalEmail], [GenderListItemId], [Address1], [Address2], [City], [State], [Country], [InsertDate], [InsertUserId]) VALUES (2023, 2025, 123, 123, N'a@a.com', 1, N'Nagaun', N'Kirtipur', N'Kathmandu', N'State 3', N'Nepal', CAST(N'2018-11-30T11:49:00' AS SmallDateTime), NULL)
INSERT [dbo].[UserInformation] ([UserInformationId], [UserId], [ContactNumber], [MobileNumber], [PersonalEmail], [GenderListItemId], [Address1], [Address2], [City], [State], [Country], [InsertDate], [InsertUserId]) VALUES (2024, 2026, 1270071224, 1233739313, N'abc@a.com', 2, N'asd', N'asdasd', N'Test City', N'State 3', N'Nepal', CAST(N'2018-11-30T13:48:00' AS SmallDateTime), NULL)
INSERT [dbo].[UserInformation] ([UserInformationId], [UserId], [ContactNumber], [MobileNumber], [PersonalEmail], [GenderListItemId], [Address1], [Address2], [City], [State], [Country], [InsertDate], [InsertUserId]) VALUES (2025, 2028, NULL, 1233739313, N'c1@c.com', 1, N'', N'', N'', N'State 3', N'Nepal', CAST(N'2018-12-03T11:21:00' AS SmallDateTime), 2024)
INSERT [dbo].[UserInformation] ([UserInformationId], [UserId], [ContactNumber], [MobileNumber], [PersonalEmail], [GenderListItemId], [Address1], [Address2], [City], [State], [Country], [InsertDate], [InsertUserId]) VALUES (2026, 2029, 1270071224, 1233739313, N'abc1@a.com', 2, N'Nagaun', N'Kirtipur', N'Kathmandu', N'State 3', N'Nepal', CAST(N'2018-12-03T11:53:00' AS SmallDateTime), 2026)
INSERT [dbo].[UserInformation] ([UserInformationId], [UserId], [ContactNumber], [MobileNumber], [PersonalEmail], [GenderListItemId], [Address1], [Address2], [City], [State], [Country], [InsertDate], [InsertUserId]) VALUES (2027, 2030, 1270071224, 1233739313, N'sapana@gmail.com', 2, N'', N'', N'', N'State 3', N'Nepal', CAST(N'2018-12-03T11:56:00' AS SmallDateTime), 2024)
SET IDENTITY_INSERT [dbo].[UserInformation] OFF
SET IDENTITY_INSERT [dbo].[UserRole] ON 

INSERT [dbo].[UserRole] ([UserRoleId], [UserId], [RoleId], [UserTypeListItemId], [InsertDate]) VALUES (2003, 2024, 1, 4, CAST(N'2018-11-30T11:47:00' AS SmallDateTime))
INSERT [dbo].[UserRole] ([UserRoleId], [UserId], [RoleId], [UserTypeListItemId], [InsertDate]) VALUES (2004, 2025, 1, 4, CAST(N'2018-11-30T11:49:00' AS SmallDateTime))
INSERT [dbo].[UserRole] ([UserRoleId], [UserId], [RoleId], [UserTypeListItemId], [InsertDate]) VALUES (2005, 2026, 1, 4, CAST(N'2018-11-30T13:48:00' AS SmallDateTime))
INSERT [dbo].[UserRole] ([UserRoleId], [UserId], [RoleId], [UserTypeListItemId], [InsertDate]) VALUES (3004, 2028, 2, 4, CAST(N'2018-12-03T11:21:00' AS SmallDateTime))
INSERT [dbo].[UserRole] ([UserRoleId], [UserId], [RoleId], [UserTypeListItemId], [InsertDate]) VALUES (3005, 2029, 2, 4, CAST(N'2018-12-03T11:53:00' AS SmallDateTime))
INSERT [dbo].[UserRole] ([UserRoleId], [UserId], [RoleId], [UserTypeListItemId], [InsertDate]) VALUES (3006, 2030, 2, 4, CAST(N'2018-12-03T11:56:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[UserRole] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Company]    Script Date: 2/18/2019 2:06:20 PM ******/
ALTER TABLE [dbo].[Company] ADD  CONSTRAINT [IX_Company] UNIQUE NONCLUSTERED 
(
	[CompanyName] ASC,
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Role__8A2B6160518F2A0A]    Script Date: 2/18/2019 2:06:20 PM ******/
ALTER TABLE [dbo].[Role] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_CompanyId_RateName]    Script Date: 2/18/2019 2:06:20 PM ******/
ALTER TABLE [dbo].[SalaryRateSetup] ADD  CONSTRAINT [UC_CompanyId_RateName] UNIQUE NONCLUSTERED 
(
	[CompanyId] ASC,
	[RateName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__SubDomai__7499EE10E146311A]    Script Date: 2/18/2019 2:06:20 PM ******/
ALTER TABLE [dbo].[SubDomain] ADD UNIQUE NONCLUSTERED 
(
	[SubDomain] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User__A9D10534E48429D8]    Script Date: 2/18/2019 2:06:20 PM ******/
ALTER TABLE [dbo].[User] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__UserInfo__7B5B59A53DF3D839]    Script Date: 2/18/2019 2:06:20 PM ******/
ALTER TABLE [dbo].[UserInformation] ADD  CONSTRAINT [UQ__UserInfo__7B5B59A53DF3D839] UNIQUE NONCLUSTERED 
(
	[PersonalEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Company] FOREIGN KEY([InsertUserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Company]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Employee]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_User] FOREIGN KEY([InsertUserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_User]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client.UserId_User.UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client.UserId_User.UserId]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_Client_ClientId_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([ClientId])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_Client_ClientId_ClientId]
GO
ALTER TABLE [dbo].[Complain]  WITH CHECK ADD  CONSTRAINT [FK_Complain_Employee(EmployeeId)] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[Complain] CHECK CONSTRAINT [FK_Complain_Employee(EmployeeId)]
GO
ALTER TABLE [dbo].[Complain]  WITH CHECK ADD  CONSTRAINT [FK_Complain_ListItem(ComplainSeverity)] FOREIGN KEY([ComplainSeverityListItemId])
REFERENCES [dbo].[ListItem] ([ListItemId])
GO
ALTER TABLE [dbo].[Complain] CHECK CONSTRAINT [FK_Complain_ListItem(ComplainSeverity)]
GO
ALTER TABLE [dbo].[Complain]  WITH CHECK ADD  CONSTRAINT [FK_Complain_ListItem(ComplainStatus)] FOREIGN KEY([ComplainStatusListItemId])
REFERENCES [dbo].[ListItem] ([ListItemId])
GO
ALTER TABLE [dbo].[Complain] CHECK CONSTRAINT [FK_Complain_ListItem(ComplainStatus)]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([CompanyId])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Company]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_User] FOREIGN KEY([InsertUserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_User]
GO
ALTER TABLE [dbo].[EmployeeInformation]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeInformation_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[EmployeeInformation] CHECK CONSTRAINT [FK_EmployeeInformation_Employee]
GO
ALTER TABLE [dbo].[EmployeeInformation]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeInformation_ListItem] FOREIGN KEY([GenderListItemId])
REFERENCES [dbo].[ListItem] ([ListItemId])
GO
ALTER TABLE [dbo].[EmployeeInformation] CHECK CONSTRAINT [FK_EmployeeInformation_ListItem]
GO
ALTER TABLE [dbo].[EmployeeLeave]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeLeave(EmployeeId)_Employee(EmployeeId)] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[EmployeeLeave] CHECK CONSTRAINT [FK_EmployeeLeave(EmployeeId)_Employee(EmployeeId)]
GO
ALTER TABLE [dbo].[EmployeeLeave]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeLeave(LeaveId)_Leave(LeaveId)] FOREIGN KEY([LeaveId])
REFERENCES [dbo].[Leave] ([LeaveId])
GO
ALTER TABLE [dbo].[EmployeeLeave] CHECK CONSTRAINT [FK_EmployeeLeave(LeaveId)_Leave(LeaveId)]
GO
ALTER TABLE [dbo].[EmployeeLeave]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeLeave(UserId)_User(ApprovedUserId)] FOREIGN KEY([ApprovedUserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[EmployeeLeave] CHECK CONSTRAINT [FK_EmployeeLeave(UserId)_User(ApprovedUserId)]
GO
ALTER TABLE [dbo].[EmployeeLeave]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeLeave_ListItem] FOREIGN KEY([LeaveStatusListItemId])
REFERENCES [dbo].[ListItem] ([ListItemId])
GO
ALTER TABLE [dbo].[EmployeeLeave] CHECK CONSTRAINT [FK_EmployeeLeave_ListItem]
GO
ALTER TABLE [dbo].[EmployeeLeaveDetail]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeLeaveDetail(EmployeeId)_Employee(EmployeeId)] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[EmployeeLeaveDetail] CHECK CONSTRAINT [FK_EmployeeLeaveDetail(EmployeeId)_Employee(EmployeeId)]
GO
ALTER TABLE [dbo].[EmployeeLeaveDetail]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeLeaveDetail(LeaveId)_Leave(LeaveId)] FOREIGN KEY([LeaveId])
REFERENCES [dbo].[Leave] ([LeaveId])
GO
ALTER TABLE [dbo].[EmployeeLeaveDetail] CHECK CONSTRAINT [FK_EmployeeLeaveDetail(LeaveId)_Leave(LeaveId)]
GO
ALTER TABLE [dbo].[EmployeeSalary]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeSalary_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[EmployeeSalary] CHECK CONSTRAINT [FK_EmployeeSalary_Employee]
GO
ALTER TABLE [dbo].[EmployeeSalary]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeSalary_User] FOREIGN KEY([InserUserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[EmployeeSalary] CHECK CONSTRAINT [FK_EmployeeSalary_User]
GO
ALTER TABLE [dbo].[Leave]  WITH CHECK ADD  CONSTRAINT [FK_Leave_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([CompanyId])
GO
ALTER TABLE [dbo].[Leave] CHECK CONSTRAINT [FK_Leave_Company]
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
ALTER TABLE [dbo].[SalaryRateSetup]  WITH CHECK ADD  CONSTRAINT [FK_SalaryRateSetup_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([CompanyId])
GO
ALTER TABLE [dbo].[SalaryRateSetup] CHECK CONSTRAINT [FK_SalaryRateSetup_Company]
GO
ALTER TABLE [dbo].[SalaryRateSetup]  WITH CHECK ADD  CONSTRAINT [FK_SalaryRateSetup_User] FOREIGN KEY([InsertUserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[SalaryRateSetup] CHECK CONSTRAINT [FK_SalaryRateSetup_User]
GO
ALTER TABLE [dbo].[SalaryTransaction]  WITH CHECK ADD  CONSTRAINT [FK_SalaryTransaction_Employee(EmployeeId)] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[SalaryTransaction] CHECK CONSTRAINT [FK_SalaryTransaction_Employee(EmployeeId)]
GO
ALTER TABLE [dbo].[SalaryTransaction]  WITH CHECK ADD  CONSTRAINT [FK_SalaryTransaction_ListItem(PaymentMethod)] FOREIGN KEY([PaymentMethodListItemId])
REFERENCES [dbo].[ListItem] ([ListItemId])
GO
ALTER TABLE [dbo].[SalaryTransaction] CHECK CONSTRAINT [FK_SalaryTransaction_ListItem(PaymentMethod)]
GO
ALTER TABLE [dbo].[SalaryTransaction]  WITH CHECK ADD  CONSTRAINT [FK_SalaryTransaction_ListItem(SalaryPaymentType)] FOREIGN KEY([SalaryPaymentTypeListItemId])
REFERENCES [dbo].[ListItem] ([ListItemId])
GO
ALTER TABLE [dbo].[SalaryTransaction] CHECK CONSTRAINT [FK_SalaryTransaction_ListItem(SalaryPaymentType)]
GO
ALTER TABLE [dbo].[SalaryTransaction]  WITH CHECK ADD  CONSTRAINT [FK_SalaryTransaction_ListItem(SalaryStatus)] FOREIGN KEY([SalaryStatusListItemId])
REFERENCES [dbo].[ListItem] ([ListItemId])
GO
ALTER TABLE [dbo].[SalaryTransaction] CHECK CONSTRAINT [FK_SalaryTransaction_ListItem(SalaryStatus)]
GO
ALTER TABLE [dbo].[SalaryTransaction]  WITH CHECK ADD  CONSTRAINT [FK_SalaryTransaction_User(InsertUserId-UserId)] FOREIGN KEY([InsertUserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[SalaryTransaction] CHECK CONSTRAINT [FK_SalaryTransaction_User(InsertUserId-UserId)]
GO
ALTER TABLE [dbo].[SubDomain]  WITH CHECK ADD  CONSTRAINT [FK_SubDomain_Client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([ClientId])
GO
ALTER TABLE [dbo].[SubDomain] CHECK CONSTRAINT [FK_SubDomain_Client]
GO
ALTER TABLE [dbo].[SubDomain]  WITH CHECK ADD  CONSTRAINT [FK_SubDomain_User] FOREIGN KEY([InsertUserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[SubDomain] CHECK CONSTRAINT [FK_SubDomain_User]
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
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Employee(EmployeeId)] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Employee(EmployeeId)]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_ListItem(Priority)] FOREIGN KEY([PriorityListItemId])
REFERENCES [dbo].[ListItem] ([ListItemId])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_ListItem(Priority)]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_ListItem(TicketStatus)] FOREIGN KEY([TicketStatusListItemId])
REFERENCES [dbo].[ListItem] ([ListItemId])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_ListItem(TicketStatus)]
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
/****** Object:  StoredProcedure [dbo].[SpClientUserIns]    Script Date: 2/18/2019 2:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Roshan Shrestha
-- Create date: 12-3-2018
-- Description:	Inserts Users of the client
-- =============================================

CREATE PROCEDURE [dbo].[SpClientUserIns]
(
    @UserId INT,
    @UserModel NVARCHAR(MAX),
    @UserInformationModel NVARCHAR(MAX),
    @InsertUserId INT,
    @ReturnMessage VARCHAR(100) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;
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


        --DECLARE @ClientId INT
        --    = (CASE
        --           WHEN (
        --                (
        --                    SELECT u.ParentId FROM dbo.[User] AS u WHERE u.UserId = @UserId
        --                ) = 0
        --                ) THEN
        --           (
        --               SELECT c.ClientId FROM dbo.Client AS c WHERE c.UserId = @UserId
        --           )
        --           ELSE
        --       (
        --           SELECT c.ClientId
        --           FROM dbo.Client AS c
        --           WHERE c.UserId =
        --           (
        --               SELECT u.ParentId FROM dbo.[User] AS u WHERE u.UserId = @UserId
        --           )
        --       )
        --       END
        --      );

        DECLARE @ParentUserId INT = dbo.FnGetParentUserId(@UserId);

        IF @ParentUserId = 0
        BEGIN
            SET @ParentUserId = @UserId;
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
               @ParentUserId,
               GETDATE()
        FROM #UserModel AS um;
        SET @UserId = SCOPE_IDENTITY();



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
               @InsertUserId
        FROM #UserInformationModel AS uim;






        DECLARE @ClientManagerRoleId INT =
                (
                    SELECT r.RoleId FROM dbo.Role AS r WHERE r.RoleName = 'Client Manager'
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

        --adds userrole
        INSERT INTO dbo.UserRole
        (
            UserId,
            RoleId,
            UserTypeListItemId,
            InsertDate
        )
        VALUES
        (   @UserId,              -- UserId - int
            @ClientManagerRoleId, -- RoleId - int
            @UserTypeListItemId,  -- UserTypeListItemId - int
            GETDATE()             -- InsertDate - smalldatetime
            );



        SET @ReturnMessage = 'Saved Sucessfully';
        DROP TABLE #UserInformationModel;
        DROP TABLE #UserModel;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION THROW;
    END CATCH;
END;

GO
/****** Object:  StoredProcedure [dbo].[SpCompanyIns]    Script Date: 2/18/2019 2:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Roshan Shrestha
-- Create date: 11-21-2018
-- Description:	Inserts Users and Client
-- =============================================

CREATE PROCEDURE [dbo].[SpCompanyIns]
(
    @CompanyId INT,
    @CompanyName NVARCHAR(150),
    @UserId INT,
    @ReturnMessage VARCHAR(100) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        DECLARE @ClientId INT;
        IF (
           (
               SELECT u.ParentId FROM dbo.[User] AS u WHERE u.UserId = @UserId
           ) != 0
           )
        BEGIN
            SET @ClientId =
            (
                SELECT c.ClientId
                FROM dbo.Client AS c
                WHERE c.UserId =
                (
                    SELECT u.ParentId FROM dbo.[User] AS u WHERE u.UserId = @UserId
                )
            );
        END;
        ELSE
        BEGIN
            SET @ClientId =
            (
                SELECT c.ClientId FROM dbo.Client AS c WHERE c.UserId = @UserId
            );
        END;


        IF EXISTS
        (
            SELECT *
            FROM dbo.Company AS c
            WHERE c.ClientId = @ClientId
                  AND c.CompanyName = @CompanyName
        )
        BEGIN
            SET @ReturnMessage = 'You have already created Company with same name';
            RETURN;
        END;


		
        IF 
        (
           @CompanyName = ''
        )
        BEGIN
            SET @ReturnMessage = 'Name cannot be empty';
            RETURN;
        END;

        IF (@CompanyId = 0)
        BEGIN
          

            INSERT INTO dbo.Company
            (
                CompanyName,
                ClientId,
                InsertUserID,
                InsertDate
            )
            VALUES
            (   @CompanyName, -- CompanyName - nvarchar(150)
                @ClientId,    -- ClientId - int
                @UserId,      -- InsertUserID - int
                GETDATE()     -- InsertDate - smalldatetime
                );

            SET @ReturnMessage = 'Saved Succesfully';
        END;
        ELSE
        BEGIN
            UPDATE c
            SET c.CompanyName = @CompanyName,
                c.InsertUserID = @UserId
            FROM dbo.Company AS c
            WHERE c.ClientId = @ClientId
                  AND c.CompanyId = @CompanyId;

            SET @ReturnMessage = 'Updated Succesfully';
        END;

    END TRY
    BEGIN CATCH

    END CATCH;
END;



GO
/****** Object:  StoredProcedure [dbo].[SpCompanySel]    Script Date: 2/18/2019 2:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Roshan Shrestha
-- Create date: 11-22-2018
-- Description:	return list of Company
-- =============================================
CREATE PROCEDURE [dbo].[SpCompanySel]
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
    SELECT c.CompanyId,
           c.CompanyName,
           c.InsertDate AS CreatedDate,
           u2.FName + ' ' + u2.LName AS CreatedBy
    INTO #tmp
    FROM dbo.Company AS c
        INNER JOIN dbo.Client AS c2
            ON c2.ClientId = c.ClientId
        INNER JOIN dbo.[User] AS u
            ON u.UserId = c2.UserId
        INNER JOIN dbo.[User] AS u2
            ON c.InsertUserID = u2.UserId
    WHERE c2.UserId = @ParentUserId;


    SELECT *
    FROM #tmp AS t
    FOR JSON PATH, INCLUDE_NULL_VALUES;
    DROP TABLE #tmp;
END;



GO
/****** Object:  StoredProcedure [dbo].[SpEmployeeAttendenceIns]    Script Date: 2/18/2019 2:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Sapana Chaudhary
-- Create date: 12-04-2018
-- Description:	present and absent status of Employee
-- =============================================

CREATE PROCEDURE [dbo].[SpEmployeeAttendenceIns]
(
    @CompanyId INT,
    @EmployeeId INT,
    @IsPresent BIT,
    @UserId INT,
	@ReturnMessage NVARCHAR(100) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
	 IF EXISTS
        (
            SELECT *
            FROM dbo.Company AS c
            WHERE c.CompanyId = @CompanyId              
        )
        BEGIN
		IF EXISTS
		(
			SELECT *
			FROM dbo.Attendance AS a
			WHERE a.CompanyId = @CompanyId 
			AND   a.EmployeeId=@EmployeeId
			AND	 CAST(a.InsertDate AS DATE) = CAST(GETDATE() AS DATE)
		 )
	    BEGIN
			IF EXISTS
			(
				SELECT * 
				FROM dbo.Attendance AS aA
				WHERE aA.CompanyId = @CompanyId 
				AND   aA.EmployeeId=@EmployeeId
				AND	 CAST(aA.InsertDate AS DATE) = CAST(GETDATE() AS DATE)
				AND aA.IsPresent = 1
			)
			BEGIN
				UPDATE dbo.Attendance
				SET IsPresent = @IsPresent,InTime=NULL
				WHERE CompanyId = @CompanyId 
				AND   EmployeeId=@EmployeeId
				AND	 CAST(InsertDate AS DATE) = CAST(GETDATE() AS DATE)
			END
			ELSE
			BEGIN
				UPDATE dbo.Attendance
				SET IsPresent = @IsPresent,InTime=CURRENT_TIMESTAMP
				WHERE CompanyId = @CompanyId 
				AND   EmployeeId=@EmployeeId
				AND	 CAST(InsertDate AS DATE) = CAST(GETDATE() AS DATE)
			END

	    END
        ELSE
		BEGIN
			 INSERT INTO dbo.Attendance
            (
                CompanyId,
                EmployeeId,
                IsPresent,
                InsertDate,
				InsertUserId,
				InTime,
				OutTime
            )
            VALUES
            (   @CompanyId, 
                @EmployeeId,   
                'true',      
                GETDATE(),
				@UserId,
				CURRENT_TIMESTAMP,
				null    
             );
			 SET @ReturnMessage = 'Attendence Checked-In';
            RETURN;
	     END
            SET @ReturnMessage = 'Sorry Company name dosenot exist!';
            RETURN;
        END;
    END TRY
    BEGIN CATCH
    END CATCH;
END;

GO
/****** Object:  StoredProcedure [dbo].[SpEmployeeAttendenceLogoutIns]    Script Date: 2/18/2019 2:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Sapana Chaudhary
-- Create date: 12-05-2018
-- Description:	present and absent status of Employee
-- =============================================

CREATE PROCEDURE [dbo].[SpEmployeeAttendenceLogoutIns]
(
    @CompanyId INT,
    @AttendanceId INT,
	@ReturnMessage NVARCHAR(100) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
	 IF EXISTS
        (
            SELECT *
            FROM dbo.Company AS c
            WHERE c.CompanyId = @CompanyId              
        )
        BEGIN
			IF EXISTS
			(
				SELECT *
				FROM dbo.Attendance AS a
				WHERE a.AttendanceId = @AttendanceId AND IsPresent=1
			)
			BEGIN		
				UPDATE dbo.Attendance
				SET OutTime = CURRENT_TIMESTAMP
				WHERE AttendanceId = @AttendanceId 	
			END
			ELSE
			  SET @ReturnMessage = 'Sorry Employee has not Checked-In';
		      RETURN;
		END 
	ELSE			  
        SET @ReturnMessage = 'Sorry Company name dosenot exist!';
        RETURN;        
    END TRY
    BEGIN CATCH
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[SpEmployeeAttendenceSel]    Script Date: 2/18/2019 2:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Sapana Chaudhary
-- Create date: 11-28-2018
-- Description:	List of employees for attendence process
-- =============================================
CREATE PROCEDURE [dbo].[SpEmployeeAttendenceSel]
(@CompanyId INT)
AS
BEGIN
    SET NOCOUNT ON;

    IF 1 = 2
    BEGIN
        SELECT CAST(NULL AS INT) AS Id
        WHERE 1 = 2
        FOR JSON PATH, INCLUDE_NULL_VALUES;
    END;

    SELECT (eA.FName + ' ' +eA.LName) as EmployeeName, eA.EmployeeId, 
			eA.CompanyId ,A.InTime ,A.OutTime,A.InsertDate ,A.IsPresent,A.AttendanceId
    INTO #tmp
    FROM dbo.Employee AS eA
	LEFT JOIN Attendance AS A 
	on eA.EmployeeId = A.EmployeeId AND 
	CAST(A.InsertDate AS DATE) = CAST(GETDATE() AS DATE)
    WHERE eA.CompanyId = @CompanyId
	
	SELECT *
    FROM #tmp AS t
    FOR JSON PATH, INCLUDE_NULL_VALUES;
    DROP TABLE #tmp;
END;

GO
/****** Object:  StoredProcedure [dbo].[SpEmployeeIns]    Script Date: 2/18/2019 2:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Roshan Shrestha
-- Create date: 12-4-2018
-- Description:	Inserts Employee, its information and its salary detail
-- =============================================

CREATE PROCEDURE [dbo].[SpEmployeeIns]
(
    @EmployeeModel NVARCHAR(MAX),
    @EmployeeInformation NVARCHAR(MAX),
    @EmployeeSalary NVARCHAR(MAX),
    @ReturnMessage VARCHAR(100) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;
        CREATE TABLE #EmployeeModel
        (
            FName VARCHAR(100),
            MName VARCHAR(100),
            LName VARCHAR(100),
            Email VARCHAR(150),
            Password NVARCHAR(MAX),
            CompanyId INT
        );
        INSERT INTO #EmployeeModel
        (
            FName,
            MName,
            LName,
            Email,
            Password,
            CompanyId
        )
        SELECT FName,
               MName,
               LName,
               Email,
               Password,
               CompanyId
        FROM
            OPENJSON(@EmployeeModel)
            WITH
            (
                FName VARCHAR(100) '$.FName',
                MName VARCHAR(100) '$.MName',
                LName VARCHAR(100) '$.LName',
                Email VARCHAR(150) '$.Email',
                Password NVARCHAR(MAX) '$.Password',
                CompanyId INT '$.CompanyId'
            );


        CREATE TABLE #EmployeeInformation
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
            InsertUserId INT
        );
        INSERT INTO #EmployeeInformation
        (
            ContactNumber,
            MobileNumber,
            PersonalEmail,
            GenderListItemId,
            Address1,
            Address2,
            City,
            State,
            Country,
            InsertUserId
        )
        SELECT ContactNumber,
               MobileNumber,
               PersonalEmail,
               GenderListItemId,
               Address1,
               Address2,
               City,
               State,
               Country,
               InsertUserId
        FROM
            OPENJSON(@EmployeeInformation)
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
                Country VARCHAR(50) '$.Country',
                InsertUserId INT '$.InsertUserId'
            );


        CREATE TABLE #EmployeeSalary
        (
            BasicSalary MONEY,
            Allowance MONEY
        );
        INSERT INTO #EmployeeSalary
        (
            BasicSalary,
            Allowance
        )
        SELECT BasicSalary,
               Allowance
        FROM
            OPENJSON(@EmployeeSalary)
            WITH
            (
                BasicSalary MONEY '$.BasicSalary',
                Allowance MONEY '$.Allowance'
            );


        DECLARE @InsertUserId INT =
                (
                    SELECT ei.InsertUserId FROM #EmployeeInformation AS ei
                );
        INSERT INTO dbo.Employee
        (
            Email,
            FName,
            MName,
            LName,
            Passsword,
            IsActive,
            CompanyId,
            InsertUserId,
            InsertDate
        )
        SELECT em.Email,
               em.FName,
               em.MName,
               em.LName,
               em.Password,
               1,
               em.CompanyId,
               @InsertUserId,
               GETDATE()
        FROM #EmployeeModel AS em;

        DECLARE @EmployeeId INT = SCOPE_IDENTITY();

        INSERT INTO dbo.EmployeeInformation
        (
            EmployeeId,
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
        SELECT @EmployeeId,
               ei.ContactNumber,
               ei.MobileNumber,
               ei.PersonalEmail,
               ei.GenderListItemId,
               ei.Address1,
               ei.Address2,
               ei.City,
               ei.State,
               ei.Country,
               GETDATE(),
               @InsertUserId
        FROM #EmployeeInformation AS ei;


        INSERT INTO dbo.EmployeeSalary
        (
            EmployeeId,
            BasicSalary,
            Allowance,
            InserUserId,
            InsertDate
        )
        SELECT @EmployeeId,
               es.BasicSalary,
               es.Allowance,
               @InsertUserId,
               GETDATE()
        FROM #EmployeeSalary AS es;

        SET @ReturnMessage = 'Saved Sucessfully';
        DROP TABLE #EmployeeSalary;
        DROP TABLE #EmployeeInformation;
        DROP TABLE #EmployeeModel;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
    END CATCH;
END;



GO
/****** Object:  StoredProcedure [dbo].[SpEmployeeLeaveAppliedIns]    Script Date: 2/18/2019 2:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Sapana Chaudhary
-- Create date: 01-04-2019
-- Description:	return list of Leaves of that particular Employee
-- =============================================
CREATE PROCEDURE [dbo].[SpEmployeeLeaveAppliedIns]
(
	@EmployeeLeaveModel NVARCHAR(MAX),
    @ReturnMessage VARCHAR(100) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;
     BEGIN TRY
        CREATE TABLE #EmployeeLeaveModel
        (          
			EmployeeLeaveId	int,
			EmployeeId	int,
			LeaveId	int,
			AppliedDate	smalldatetime,
			StartDate	smalldatetime,
			EndDate	smalldatetime,
			LeaveStatusListItemId	int,
			Description	nvarchar(MAX),
			Remarks	nvarchar(256),
			ApprovedUserId	int,
			InsertDate	smalldatetime,
        );
		INSERT INTO #EmployeeLeaveModel
        (
			EmployeeLeaveId,
			EmployeeId,
			LeaveId,
			AppliedDate,
			StartDate,
			EndDate,
			LeaveStatusListItemId,
			Description,
			Remarks,
			ApprovedUserId,
			InsertDate
        )
        SELECT 
			EmployeeLeaveId,
			EmployeeId,
			LeaveId,
			AppliedDate,
			StartDate,	
			EndDate,
			LeaveStatusListItemId,
			Description,
			Remarks,
			ApprovedUserId,
			InsertDate
        FROM
            OPENJSON(@EmployeeLeaveModel)
            WITH
            (
				EmployeeLeaveId INT '$.EmployeeLeaveId',
				EmployeeId INT '$.EmployeeId',
				LeaveId INT '$.LeaveId',
				AppliedDate SMALLDATETIME '$.AppliedDate',
				StartDate SMALLDATETIME '$.StartDate',
				EndDate SMALLDATETIME '$.EndDate',
				LeaveStatusListItemId INT '$.LeaveStatusListItemId',
				Description NVARCHAR(MAX) '$.Description',
				Remarks NVARCHAR(256) '$.Remarks',
				ApprovedUserId INT '$.ApprovedUserId',
				InsertDate SMALLDATETIME '$.InsertDate'				
            );
		declare @PendingListStatusListItemId int = (select ListItemId from VwListItemCategory where ListItemCategoryName='LeaveStatus' and ListItemName='Pending')
		INSERT INTO dbo.EmployeeLeave
        (	
			EmployeeId,
			LeaveId,
			AppliedDate,
			StartDate,
			EndDate,
			LeaveStatusListItemId,
			Description,
			Remarks,
			ApprovedUserId,
			InsertDate
        )
        SELECT 	
			EmployeeId,
			LeaveId,
			GETDATE(),
			StartDate,
			EndDate,
			@PendingListStatusListItemId,
			Description,
			Remarks,
			ApprovedUserId,
			GETDATE()
        FROM #EmployeeLeaveModel AS eA
        WHERE eA.EmployeeLeaveId = 0;
		SET @ReturnMessage = 'Added Sucessfully';

		UPDATE s
        SET s.EmployeeId = eA.EmployeeId,           
			LeaveId = eA.LeaveId,
			AppliedDate = eA.AppliedDate,
			StartDate = eA.StartDate,
			EndDate = eA.EndDate,
			LeaveStatusListItemId = eA.LeaveStatusListItemId,
			Description = eA.Description,		
			Remarks = eA.Remarks,
			ApprovedUserId = eA.ApprovedUserId,
			InsertDate = eA.InsertDate
		FROM dbo.EmployeeLeave AS s
        INNER JOIN #EmployeeLeaveModel AS eA
        ON eA.EmployeeLeaveId = s.EmployeeLeaveId
        WHERE eA.EmployeeLeaveId != 0;

		SET @ReturnMessage = 'Updated Sucessfully';

	DROP TABLE #EmployeeLeaveModel;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH;
END;

GO
/****** Object:  StoredProcedure [dbo].[SpEmployeeLeaveAppliedSel]    Script Date: 2/18/2019 2:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Sapana Chaudhary
-- Create date: 01-03-2019
-- Description:	return list of Leaves of that particular Employee
-- =============================================
CREATE PROCEDURE [dbo].[SpEmployeeLeaveAppliedSel]
(@EmployeeId INT)
AS
BEGIN
    SET NOCOUNT ON;
	
    IF 1 = 2
    BEGIN
        SELECT CAST(NULL AS INT) AS EmployeeId
        WHERE 1 = 2
        FOR JSON PATH, INCLUDE_NULL_VALUES;
    END;

    SELECT el.EmployeeLeaveId,
           el.EmployeeId,
		   e.FName+e.LName as EmployeeName,
           l.LeaveName,
		   el.LeaveId,
		   v.ListItemName,
           el.AppliedDate,
		   el.ApprovedUserId,
		   el.InsertDate,
           el.StartDate,
           el.EndDate,
           el.Description,
           el.Remarks,          
           el.LeaveStatusListItemId
    INTO #tmp
    FROM dbo.EmployeeLeave AS el        
        INNER JOIN dbo.Leave AS l
        ON l.LeaveId = el.LeaveId 
		INNER JOIN dbo.VwListItemCategory as v
		ON el.LeaveStatusListItemId = v.ListItemId
		INNER JOIN dbo.Employee as e
		ON el.EmployeeId = e.EmployeeId 
		where el.EmployeeId =@EmployeeId and v.ListItemCategoryName='LeaveStatus'

    SELECT *
    FROM #tmp AS t
    FOR JSON PATH, INCLUDE_NULL_VALUES;
    DROP TABLE #tmp;
END;
GO
/****** Object:  StoredProcedure [dbo].[SpEmployeeLeaveSel]    Script Date: 2/18/2019 2:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Roshan Shrestha
-- Create date: 12-7-2018
-- Description:	return list of Employee Leave
-- =============================================
CREATE PROCEDURE [dbo].[SpEmployeeLeaveSel]
(@CompanyId INT)
AS
BEGIN
    SET NOCOUNT ON;

    IF 1 = 2
    BEGIN
        SELECT CAST(NULL AS INT) AS Id
        WHERE 1 = 2
        FOR JSON PATH, INCLUDE_NULL_VALUES;
    END;

    SELECT el.EmployeeLeaveId,
           e.EmployeeId,
           l.LeaveName,
           el.AppliedDate,
           el.StartDate,
           el.EndDate,
           el.Description,
           el.Remarks,
           e.Email,
           e.FName + ' ' + e.LName AS EmployeeFullName,
           u.FName + ' ' + u.LName AS ApprovedUser,
           vlic.ListItemName AS LeaveStatus,
           el.LeaveStatusListItemId
    INTO #tmp
    FROM dbo.EmployeeLeave AS el
        INNER JOIN dbo.Employee AS e
            ON e.EmployeeId = el.EmployeeId
               AND e.CompanyId = @CompanyId
        INNER JOIN dbo.Leave AS l
            ON l.LeaveId = el.LeaveId
        --INNER JOIN dbo.Company AS c
        --    ON c.CompanyId = e.CompanyId
        LEFT JOIN dbo.[User] AS u
            ON u.UserId = el.ApprovedUserId
        INNER JOIN dbo.VwListItemCategory AS vlic
            ON vlic.ListItemId = el.LeaveStatusListItemId
               AND vlic.ListItemCategoryName = 'LeaveStatus';

    SELECT *
    FROM #tmp AS t
    FOR JSON PATH, INCLUDE_NULL_VALUES;
    DROP TABLE #tmp;
END;






GO
/****** Object:  StoredProcedure [dbo].[SpEmployeeleaveStatusTsk]    Script Date: 2/18/2019 2:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Roshan Shrestha
-- Create date: 12-10-2018
-- Description:	changes the status of employee Leave
-- =============================================

CREATE PROCEDURE [dbo].[SpEmployeeleaveStatusTsk]
(
    @Status NVARCHAR(50),
    @EmployeeLeaveId INT,
    @InsertUserId INT,
    @ReturnMessage VARCHAR(100) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;
        DECLARE @EmployeeId INT,
                @LeaveId INT;

        SELECT @EmployeeId = el.EmployeeId,
               @LeaveId = el.LeaveId
        FROM dbo.EmployeeLeave AS el
        WHERE el.EmployeeLeaveId = @EmployeeLeaveId;

        IF (
           (
               SELECT eld.Days
               FROM dbo.EmployeeLeaveDetail AS eld
               WHERE eld.LeaveId = @LeaveId
                     AND eld.EmployeeId = @EmployeeId
           ) >
           (
               SELECT l.Days
               FROM dbo.Leave AS l
               WHERE l.LeaveId = @LeaveId
                     AND l.CompanyId =
                     (
                         SELECT e.CompanyId FROM dbo.Employee AS e WHERE e.EmployeeId = @EmployeeId
                     )
           )
           )
        BEGIN
            SET @ReturnMessage = 'Following leave of the employee has already been used up';
            RETURN;
        END;


        DECLARE @previousLeaveStatusId INT =
                (
                    SELECT el.LeaveStatusListItemId
                    FROM dbo.EmployeeLeave AS el
                    WHERE el.EmployeeLeaveId = @EmployeeLeaveId
                );

        IF (@Status = 'Approved' OR @Status = 'Unapproved')
        BEGIN


            UPDATE el
            SET el.LeaveStatusListItemId =
                (
                    SELECT vlic.ListItemId
                    FROM dbo.VwListItemCategory AS vlic
                    WHERE vlic.ListItemName = @Status
                          AND vlic.ListItemCategoryName = 'LeaveStatus'
                ),
                el.ApprovedUserId = @InsertUserId,
                el.InsertDate = GETDATE()
            FROM dbo.EmployeeLeave AS el
            WHERE el.EmployeeLeaveId = @EmployeeLeaveId
                  AND el.LeaveId = @LeaveId;
        END;

        IF (@Status = 'Approved')
        BEGIN


            IF EXISTS
            (
                SELECT *
                FROM dbo.EmployeeLeaveDetail AS eld
                WHERE eld.EmployeeId = @EmployeeId
                      AND eld.LeaveId = @LeaveId
            )
            BEGIN
                UPDATE eld
                SET eld.Days = (eld.Days + 1),
                    eld.InsertDate = GETDATE()
                FROM dbo.EmployeeLeaveDetail AS eld
                WHERE eld.EmployeeId = @EmployeeId
                      AND eld.LeaveId = @LeaveId;
            END;
            ELSE
            BEGIN
                INSERT INTO dbo.EmployeeLeaveDetail
                (
                    EmployeeId,
                    LeaveId,
                    Days,
                    InsertDate
                )
                VALUES
                (   @EmployeeId, -- EmployeeId - int
                    @LeaveId,    -- LeaveId - int
                    1,           -- Days - int
                    GETDATE()    -- InsertDate - smalldatetime
                    );
            END;
        END;


        IF (@Status = 'Unapproved')
        BEGIN

            IF (
               (
                   SELECT vlic.ListItemName
                   FROM dbo.VwListItemCategory AS vlic
                   WHERE vlic.ListItemId = @previousLeaveStatusId
               ) = 'Approved'
               )
            BEGIN
                UPDATE eld
                SET eld.Days = (eld.Days - 1),
                    eld.InsertDate = GETDATE()
                FROM dbo.EmployeeLeaveDetail AS eld
                WHERE eld.EmployeeId = @EmployeeId
                      AND eld.LeaveId = @LeaveId;


            END;
        END;
        COMMIT TRANSACTION;

    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
    END CATCH;
END;





GO
/****** Object:  StoredProcedure [dbo].[SpEmployeeSalartTransactionSel]    Script Date: 2/18/2019 2:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Roshan Shrestha
-- Create date: 12-28-2018
-- Description:	return list of Employee with their last salary transaction
-- =============================================
CREATE PROCEDURE [dbo].[SpEmployeeSalartTransactionSel]
(@CompanyId INT)
AS
BEGIN
    SET NOCOUNT ON;

    IF 1 = 2
    BEGIN
        SELECT CAST(NULL AS INT) AS Id
        WHERE 1 = 2
        FOR JSON PATH, INCLUDE_NULL_VALUES;
    END;

    SELECT e.EmployeeId,
           (e.FName + ' ' + e.LName) AS Name,
           es.BasicSalary,
           es.Allowance,
           st1.LastPaidDate,
           DATEDIFF(DAY, st1.LastPaidDate, GETDATE()) AS DayDiff
    INTO #tmp
    FROM dbo.Employee AS e
        INNER JOIN dbo.Company AS c
            ON c.CompanyId = e.CompanyId
               AND c.CompanyId = @CompanyId
        INNER JOIN dbo.EmployeeSalary AS es
            ON es.EmployeeId = e.EmployeeId
        LEFT JOIN
        (
            SELECT st.EmployeeId,
                   MAX(st.InsertDate) AS LastPaidDate
            FROM dbo.SalaryTransaction AS st
            GROUP BY st.EmployeeId
        ) AS st1
            ON st1.EmployeeId = e.EmployeeId;


    SELECT *
    FROM #tmp AS t
    FOR JSON PATH, INCLUDE_NULL_VALUES;
    DROP TABLE #tmp;
END;







GO
/****** Object:  StoredProcedure [dbo].[SpEmployeeSel]    Script Date: 2/18/2019 2:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Roshan Shrestha
-- Create date:12-6-2018
-- Description:	return list of Employee
-- =============================================
CREATE PROCEDURE [dbo].[SpEmployeeSel]
(@ClientId INT)
AS
BEGIN
    SET NOCOUNT ON;

    IF 1 = 2
    BEGIN
        SELECT CAST(NULL AS INT) AS Id
        WHERE 1 = 2
        FOR JSON PATH, INCLUDE_NULL_VALUES;
    END;


    SELECT e.EmployeeId,
           e.Email,
           e.FName + ' ' + e.LName AS FullName,
           e.IsActive,
           c.CompanyName,
           ei.ContactNumber,
           ei.MobileNumber,
           ei.PersonalEmail,
           vlic.ListItemName AS Gender,
           ei.Address1,
           ei.Address2,
           ei.City,
           ei.State,
           ei.Country
    INTO #tmp
    FROM dbo.Employee AS e
        INNER JOIN dbo.EmployeeInformation AS ei
            ON ei.EmployeeId = e.EmployeeId
        INNER JOIN dbo.Company AS c
            ON c.CompanyId = e.CompanyId
        INNER JOIN dbo.Client AS c2
            ON c2.ClientId = c.ClientId
        INNER JOIN dbo.VwListItemCategory AS vlic
            ON ei.GenderListItemId = vlic.ListItemId
    WHERE c.ClientId = @ClientId;

    SELECT *
    FROM #tmp AS t
    FOR JSON PATH, INCLUDE_NULL_VALUES;
    DROP TABLE #tmp;
END;




GO
/****** Object:  StoredProcedure [dbo].[SpLeaveDel]    Script Date: 2/18/2019 2:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		Sapana Chaudhary
-- Create date: 12-11-2018
-- Description:	delete the respective leave if needed
-- =============================================

CREATE PROCEDURE [dbo].[SpLeaveDel]
(  
    @LeaveId INT,
	@ReturnMessage NVARCHAR(100) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;	
    BEGIN TRY	
			BEGIN		
				DELETE dbo.EmployeeLeave
				WHERE LeaveId =@LeaveId
				
				DELETE dbo.EmployeeLeaveDetail
				WHERE LeaveId =@LeaveId
			
				DELETE dbo.Leave				
				WHERE LeaveId =@LeaveId				
			END			
			  SET @ReturnMessage = 'Leave Successfully Deleted';
		      RETURN;	     	     
    END TRY
    BEGIN CATCH
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[SpLeaveIns]    Script Date: 2/18/2019 2:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Sapana Chaudhary
-- Create date: 12-06-2018
-- Description:	present and absent status of Employee
-- =============================================

CREATE PROCEDURE [dbo].[SpLeaveIns]
(	
    @CompanyId INT,  
	@LeaveName NVARCHAR(100),
	@Days INT,
	@ReturnMessage NVARCHAR(100) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
	 IF EXISTS
        (
            SELECT *
            FROM dbo.Company AS c
            WHERE c.CompanyId = @CompanyId              
        )
        BEGIN
			IF EXISTS
			(
				SELECT *
				FROM DBO.Leave AS l
				Where l.LeaveName = @LeaveName
			)
			BEGIN
				SET @ReturnMessage = 'Sorry Leave name already exist!';
				RETURN;
			END

			ELSE

			BEGIN
				IF 
				(
				   @LeaveName = ''
				)
				BEGIN
					SET @ReturnMessage = 'Leave name cannot be empty';
					RETURN;
				END;
				ELSE
				BEGIN
					INSERT INTO dbo.Leave
					(
						CompanyId,
						LeaveName,
						DAYS,
						InsertDate
					)
					VALUES
					(
						@CompanyId,
						@LeaveName,
						@Days,
						GETDATE()
					)
					 SET @ReturnMessage = 'Leave added successfully!';
					 RETURN;
				END
			END
		
	    END;
		ELSE
		BEGIN	    
            SET @ReturnMessage = 'Sorry Company name dosenot exist!';
            RETURN;
        END;		
    END TRY
    BEGIN CATCH
    END CATCH;
END;

GO
/****** Object:  StoredProcedure [dbo].[SpLeaveSel]    Script Date: 2/18/2019 2:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Sapana Chaudhary
-- Create date: 12-06-2018
-- Description:	return list of Leave of particular company
-- =============================================
CREATE PROCEDURE [dbo].[SpLeaveSel]
(
	@CompanyId INT
)
AS
BEGIN
    SET NOCOUNT ON;

    IF 1 = 2
    BEGIN
        SELECT CAST(NULL AS INT) AS CompanyId
        WHERE 1 = 2
        FOR JSON PATH, INCLUDE_NULL_VALUES;
    END;

		SELECT *
		INTO #tmp
		FROM dbo.Leave as l
		WHERE l.CompanyId = 
		(
			 SELECT co.CompanyId FROM dbo.Company AS co WHERE co.CompanyId = @CompanyId
		);
    SELECT *
    FROM #tmp AS t
    FOR JSON PATH, INCLUDE_NULL_VALUES;
    DROP TABLE #tmp;
END;
GO
/****** Object:  StoredProcedure [dbo].[SpLeaveUpdate]    Script Date: 2/18/2019 2:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		Sapana Chaudhary
-- Create date: 12-06-2018
-- Description:	present and absent status of Employee
-- =============================================

CREATE PROCEDURE [dbo].[SpLeaveUpdate]
(
	@LeaveId INT,
    @CompanyId INT,  
	@LeaveName NVARCHAR(100),
	@Days INT,
	@ReturnMessage NVARCHAR(100) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
	 IF EXISTS
        (
            SELECT *
            FROM dbo.Company AS c
            WHERE c.CompanyId = @CompanyId              
        )
        BEGIN		
			IF(@LeaveId=0)		
				BEGIN
					INSERT INTO dbo.Leave
						(
							CompanyId,
							LeaveName,
							DAYS,
							InsertDate
						)
						VALUES
						(
							@CompanyId,
							@LeaveName,
							@Days,
							GETDATE()
						)
						 SET @ReturnMessage = 'Leave added successfully!';
						 RETURN;		
				END
			 ELSE
				BEGIN
					UPDATE l
					SET l.LeaveName = @LeaveName,
						l.Days = @Days
					FROM dbo.Leave AS l
					WHERE l.LeaveId=@LeaveId

					SET @ReturnMessage = 'Updated Succesfully';
				END;  
	    END;
		ELSE
		BEGIN	    
            SET @ReturnMessage = 'Sorry Company name dosenot exist!';
            RETURN;
        END;		
    END TRY
    BEGIN CATCH
    END CATCH;
END;

GO
/****** Object:  StoredProcedure [dbo].[SpListItemCategoryDetailSel]    Script Date: 2/18/2019 2:06:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SpPlanSel]    Script Date: 2/18/2019 2:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Roshan Shrestha
-- Create date: 11-26-2018
-- Description:	return list of Plans
-- =============================================
CREATE PROCEDURE [dbo].[SpPlanSel]
AS
BEGIN
    SET NOCOUNT ON;

    IF 1 = 2
    BEGIN
        SELECT CAST(NULL AS INT) AS Id
        WHERE 1 = 2
        FOR JSON PATH, INCLUDE_NULL_VALUES;
    END;

    SELECT p.PlanId,
           p.Name,
           p.Price,
           p.CompanyLimit,
           pd.DurationInMonth
    INTO #tmp
    FROM dbo.[Plan] AS p
        INNER JOIN dbo.PlanDuration AS pd
            ON pd.PlanDurationListItemId = p.PlanDurationListItemId;

    SELECT *
    FROM #tmp AS t
    FOR JSON PATH, INCLUDE_NULL_VALUES;
    DROP TABLE #tmp;
END;


GO
/****** Object:  StoredProcedure [dbo].[SpSalaryRateSel]    Script Date: 2/18/2019 2:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Roshan Shrestha
-- Create date: 11-22-2018
-- Description:	return list of salary rate setup
-- =============================================
CREATE PROCEDURE [dbo].[SpSalaryRateSel]
(@ClientId INT)
AS
BEGIN
    SET NOCOUNT ON;

    IF 1 = 2
    BEGIN
        SELECT CAST(NULL AS INT) AS SalaryRateSetupId
        WHERE 1 = 2
        FOR JSON PATH, INCLUDE_NULL_VALUES;
    END;

    SELECT srs.SalaryRateSetupId,
           c.CompanyId,
           srs.RateName,
           srs.[From],
           srs.Upto,
           srs.Rate,
           c.CompanyName
    INTO #tmp
    FROM dbo.SalaryRateSetup AS srs
        INNER JOIN dbo.Company AS c
            ON c.CompanyId = srs.CompanyId
    WHERE c.ClientId = @ClientId;

    SELECT *
    FROM #tmp AS t
    FOR JSON PATH, INCLUDE_NULL_VALUES;
    DROP TABLE #tmp;
END;




GO
/****** Object:  StoredProcedure [dbo].[SpSalaryRateSetupIns]    Script Date: 2/18/2019 2:06:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Roshan Shrestha
-- Create date: 11-21-2018
-- Description:	Inserts Salary Rate
-- =============================================

CREATE PROCEDURE [dbo].[SpSalaryRateSetupIns]
(
    @SalaryRateSetupId INT,
    @CompanyId INT,
    @RateName NVARCHAR(150),
    @From INT,
    @Upto INT,
    @Rate FLOAT,
    @InsertUserId INT,
    @ReturnMessage VARCHAR(100) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        IF @From > @Upto
        BEGIN
            SET @ReturnMessage = 'Start Salary is more than End Salary';
            RETURN;
        END;



        IF (@SalaryRateSetupId = 0)
        BEGIN

            INSERT INTO dbo.SalaryRateSetup
            (
                CompanyId,
                RateName,
                [From],
                Upto,
                Rate,
                InsertUserId,
                InsertDate
            )
            VALUES
            (   @CompanyId,              -- CompanyId - int
                @RateName,               -- RateName - nvarchar(150)
                @From,                   -- From - money
                @Upto,                   -- Upto - money
                @Rate,                   -- Rate - float
                @InsertUserId, GETDATE() -- InsertDate - smalldatetime
                );

            SET @ReturnMessage = 'Inserted Succesfully';
        END;
        ELSE IF (@CompanyId > 0)
        BEGIN
            IF EXISTS
            (
                SELECT *
                FROM dbo.SalaryRateSetup AS srs
                WHERE @Upto
                      BETWEEN srs.[From] AND srs.Upto
                      AND srs.SalaryRateSetupId != @SalaryRateSetupId AND srs.CompanyId = @CompanyId
            )
               OR EXISTS
            (
                SELECT *
                FROM dbo.SalaryRateSetup AS srs
                WHERE @From
                      BETWEEN srs.[From] AND srs.Upto
                      AND srs.SalaryRateSetupId != @SalaryRateSetupId AND srs.CompanyId = @CompanyId
            )
            BEGIN
                SET @ReturnMessage = 'Salary range already exist';
                RETURN;
            END;


            UPDATE srs
            SET RateName = @RateName,
                [From] = @From,
                Upto = @Upto,
                Rate = @Rate,
                srs.InsertUserId = @InsertUserId,
                InsertDate = GETDATE()
            FROM dbo.SalaryRateSetup AS srs
            WHERE srs.CompanyId = @CompanyId
                  AND srs.SalaryRateSetupId = @SalaryRateSetupId;
        END;
        SET @ReturnMessage = 'Updated Succesfully';


    END TRY
    BEGIN CATCH

    END CATCH;
END;



GO
/****** Object:  StoredProcedure [dbo].[SpUserIns]    Script Date: 2/18/2019 2:06:20 PM ******/
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
        BEGIN TRANSACTION;
        CREATE TABLE #UserModel
        (
            FName VARCHAR(100),
            MName VARCHAR(100),
            LName VARCHAR(100),
            Email VARCHAR(150),
            Password NVARCHAR(MAX),
            PlanId INT,
            SubDomain VARCHAR(100)
        );
        INSERT INTO #UserModel
        (
            FName,
            MName,
            LName,
            Email,
            Password,
            PlanId,
            SubDomain
        )
        SELECT FName,
               MName,
               LName,
               Email,
               Password,
               PlanId,
               SubDomain
        FROM
            OPENJSON(@UserModel)
            WITH
            (
                FName VARCHAR(100) '$.FName',
                MName VARCHAR(100) '$.MName',
                LName VARCHAR(100) '$.LName',
                Email VARCHAR(150) '$.Email',
                Password NVARCHAR(MAX) '$.Password',
                PlanId INT '$.PlanId',
                SubDomain VARCHAR(100) '$.SubDomain'
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
        DECLARE @PlanId INT =
                (
                    SELECT um.PlanId FROM #UserModel AS um
                );

        --SELECT * FROM #UserModel AS um
        --SELECT * FROM #UserInformationModel AS uim
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
        DECLARE @ClientId INT = SCOPE_IDENTITY();

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



        INSERT INTO dbo.SubDomain
        (
            ClientId,
            SubDomain,
            InsertUserId,
            InsertDate
        )
        SELECT @ClientId,
               um.SubDomain,
               @UserId,
               GETDATE()
        FROM #UserModel AS um;



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

        --adds userrole
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


        --Duration IN MONTH FROM PLAN TO ADD TO the expiry date 
        DECLARE @DurationInMonth INT =
                (
                    SELECT pd.DurationInMonth
                    FROM dbo.[Plan] AS p
                        INNER JOIN dbo.PlanDuration AS pd
                            ON pd.PlanDurationListItemId = p.PlanDurationListItemId
                    WHERE p.PlanId = @PlanId
                );
        --SUBSCRIPTION ADD Part
        INSERT INTO dbo.Subscription
        (
            ClientId,
            PlanId,
            SubscriptionStartDate,
            SubscriptionEndDate,
            IsActive,
            InsertDate
        )
        VALUES
        (   @ClientId,                                   -- ClientId - int
            @PlanId,                                     -- PlanId - int
            GETDATE(),                                   -- SubscriptionStartDate - smalldatetime
            DATEADD(MONTH, @DurationInMonth, GETDATE()), -- SubscriptionEndDate - smalldatetime
            1,                                           -- IsActive - int
            GETDATE()                                    -- InsertDate - smalldatetime
            );

        SET @ReturnMessage = 'Saved Sucessfully';
        DROP TABLE #UserInformationModel;
        DROP TABLE #UserModel;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION THROW;
    END CATCH;
END;


GO
/****** Object:  StoredProcedure [dbo].[SpUserRoleSel]    Script Date: 2/18/2019 2:06:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SpUserSel]    Script Date: 2/18/2019 2:06:20 PM ******/
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
        --INNER JOIN dbo.Client AS c
        --    ON c.UserId = u.UserId
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
          OR u.UserId = @ParentUserId;


    SELECT *
    FROM #tmp AS t
    FOR JSON PATH, INCLUDE_NULL_VALUES;
    DROP TABLE #tmp;
END;


GO
/****** Object:  StoredProcedure [dbo].[SpVerifyUserSel]    Script Date: 2/18/2019 2:06:20 PM ******/
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

    DECLARE @ClientUserId INT =
            (
                SELECT u.ParentId FROM dbo.[User] AS u WHERE u.Email = @Email
            );
    IF @ClientUserId = 0
    BEGIN
        SET @ClientUserId =
        (
            SELECT u.UserId FROM dbo.[User] AS u WHERE u.Email = @Email
        );


    END;
    DECLARE @ClientId INT =
            (
                SELECT c.ClientId FROM dbo.Client AS c WHERE c.UserId = @ClientUserId
            );
    SELECT u.UserId,
           u.Email,
           u.FName + ' ' + u.LName AS FullName,
           u.Password,
           u.ParentId,
           @ClientId AS ClientId
    FROM dbo.[User] AS u
        INNER JOIN dbo.Client AS c
            ON c.UserId = @ClientUserId
        INNER JOIN dbo.Subscription AS s
            ON s.ClientId = @ClientId
    WHERE u.Email = @Email
          AND u.IsActive = 1
          AND s.SubscriptionEndDate >= GETDATE();
END;


GO
