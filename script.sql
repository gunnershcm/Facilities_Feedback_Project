USE [master]
GO
/****** Object:  Database [FacilitiesFeedback]    Script Date: 6/29/2022 2:53:52 PM ******/
CREATE DATABASE [FacilitiesFeedback]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FacilitiesFeedback', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.FISHBONE\MSSQL\DATA\FacilitiesFeedback.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FacilitiesFeedback_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.FISHBONE\MSSQL\DATA\FacilitiesFeedback_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FacilitiesFeedback] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FacilitiesFeedback].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FacilitiesFeedback] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FacilitiesFeedback] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FacilitiesFeedback] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FacilitiesFeedback] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FacilitiesFeedback] SET ARITHABORT OFF 
GO
ALTER DATABASE [FacilitiesFeedback] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FacilitiesFeedback] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FacilitiesFeedback] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FacilitiesFeedback] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FacilitiesFeedback] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FacilitiesFeedback] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FacilitiesFeedback] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FacilitiesFeedback] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FacilitiesFeedback] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FacilitiesFeedback] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FacilitiesFeedback] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FacilitiesFeedback] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FacilitiesFeedback] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FacilitiesFeedback] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FacilitiesFeedback] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FacilitiesFeedback] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FacilitiesFeedback] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FacilitiesFeedback] SET RECOVERY FULL 
GO
ALTER DATABASE [FacilitiesFeedback] SET  MULTI_USER 
GO
ALTER DATABASE [FacilitiesFeedback] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FacilitiesFeedback] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FacilitiesFeedback] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FacilitiesFeedback] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FacilitiesFeedback] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FacilitiesFeedback] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FacilitiesFeedback', N'ON'
GO
ALTER DATABASE [FacilitiesFeedback] SET QUERY_STORE = OFF
GO
USE [FacilitiesFeedback]
GO
/****** Object:  Schema [duyndse150396_SQLLogin_1]    Script Date: 6/29/2022 2:53:53 PM ******/
CREATE SCHEMA [duyndse150396_SQLLogin_1]
GO
/****** Object:  Table [dbo].[tblDepartments]    Script Date: 6/29/2022 2:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDepartments](
	[depID] [int] NOT NULL,
	[depName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[depID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFacilities]    Script Date: 6/29/2022 2:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFacilities](
	[facilityID] [nvarchar](10) NOT NULL,
	[facilityName] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[facilityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFeedbackImages]    Script Date: 6/29/2022 2:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFeedbackImages](
	[imageID] [int] IDENTITY(1,1) NOT NULL,
	[imageURL] [nvarchar](200) NOT NULL,
	[feedbackID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__tblFeedb__336E9B7540B2A864] PRIMARY KEY CLUSTERED 
(
	[imageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFeedbacks]    Script Date: 6/29/2022 2:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFeedbacks](
	[feedbackID] [nvarchar](50) NOT NULL,
	[senderEmail] [nvarchar](100) NOT NULL,
	[title] [nvarchar](150) NOT NULL,
	[description] [nvarchar](4000) NOT NULL,
	[sentTime] [datetime] NOT NULL,
	[handlerEmail] [nvarchar](100) NULL,
	[roomNumber] [int] NOT NULL,
	[facilityID] [nvarchar](10) NOT NULL,
	[statusID] [int] NOT NULL,
	[deleteReason] [nvarchar](100) NULL,
	[assignTime] [datetime] NULL,
	[completeTime] [datetime] NULL,
 CONSTRAINT [PK__tblFeedb__2613FDC45EE824CC] PRIMARY KEY CLUSTERED 
(
	[feedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFeedbackStatus]    Script Date: 6/29/2022 2:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFeedbackStatus](
	[statusID] [int] IDENTITY(1,1) NOT NULL,
	[statusName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRates]    Script Date: 6/29/2022 2:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRates](
	[email] [nvarchar](100) NOT NULL,
	[handledFeedbacks] [int] NOT NULL,
	[rate] [float] NOT NULL,
 CONSTRAINT [PK_tblRates] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblReportImages]    Script Date: 6/29/2022 2:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReportImages](
	[imageID] [int] IDENTITY(1,1) NOT NULL,
	[imageURL] [nvarchar](200) NOT NULL,
	[reportID] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_tblReportImages] PRIMARY KEY CLUSTERED 
(
	[imageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblReports]    Script Date: 6/29/2022 2:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReports](
	[reportID] [nvarchar](100) NOT NULL,
	[statusID] [int] NOT NULL,
	[feedbackID] [nvarchar](50) NOT NULL,
	[description] [nvarchar](2000) NULL,
	[spentMoney] [int] NOT NULL,
	[time] [datetime] NOT NULL,
	[rated] [int] NULL,
 CONSTRAINT [PK__tblRepor__1C9B4ECD9340F115] PRIMARY KEY CLUSTERED 
(
	[reportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblReportStatus]    Script Date: 6/29/2022 2:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReportStatus](
	[statusID] [int] NOT NULL,
	[statusName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 6/29/2022 2:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [nvarchar](10) NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 6/29/2022 2:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[email] [nvarchar](100) NOT NULL,
	[fullName] [nvarchar](100) NOT NULL,
	[picture] [nvarchar](200) NOT NULL,
	[roleID] [nvarchar](10) NOT NULL,
	[depID] [int] NULL,
	[statusID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserStatus]    Script Date: 6/29/2022 2:53:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserStatus](
	[statusID] [int] NOT NULL,
	[statusName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblDepartments] ([depID], [depName]) VALUES (1, N'Electrical equipment')
INSERT [dbo].[tblDepartments] ([depID], [depName]) VALUES (2, N'Internet')
INSERT [dbo].[tblDepartments] ([depID], [depName]) VALUES (3, N'Tables / Chairs')
INSERT [dbo].[tblDepartments] ([depID], [depName]) VALUES (4, N'Teaching aids')
GO
INSERT [dbo].[tblFacilities] ([facilityID], [facilityName]) VALUES (N'1', N'Electrical equipment')
INSERT [dbo].[tblFacilities] ([facilityID], [facilityName]) VALUES (N'2', N'Internet')
INSERT [dbo].[tblFacilities] ([facilityID], [facilityName]) VALUES (N'3', N'Tables / Chairs')
INSERT [dbo].[tblFacilities] ([facilityID], [facilityName]) VALUES (N'4', N'Teaching aids')
INSERT [dbo].[tblFacilities] ([facilityID], [facilityName]) VALUES (N'5', N'Others')
GO
SET IDENTITY_INSERT [dbo].[tblFeedbackImages] ON 

INSERT [dbo].[tblFeedbackImages] ([imageID], [imageURL], [feedbackID]) VALUES (163, N'http://res.cloudinary.com/fishbone-2710/image/upload/v1654500983/ufi375b4jxhqm610jt0n.png', N'0cc1ef79-f454-4be8-9cb1-9e45b4fd58f0')
INSERT [dbo].[tblFeedbackImages] ([imageID], [imageURL], [feedbackID]) VALUES (164, N'http://res.cloudinary.com/fishbone-2710/image/upload/v1654503320/em05koooarg8arwhv95h.png', N'22caa0b4-9d18-428e-bacf-226cdc230098')
INSERT [dbo].[tblFeedbackImages] ([imageID], [imageURL], [feedbackID]) VALUES (165, N'http://res.cloudinary.com/fishbone-2710/image/upload/v1654503326/ovi9mzw4mlv3r1f9hzfb.png', N'22caa0b4-9d18-428e-bacf-226cdc230098')
INSERT [dbo].[tblFeedbackImages] ([imageID], [imageURL], [feedbackID]) VALUES (166, N'http://res.cloudinary.com/fishbone-2710/image/upload/v1654835149/yasjuxevrignzaqtgwc7.jpg', N'50214ddc-ab86-44b2-b667-eed821de1846')
INSERT [dbo].[tblFeedbackImages] ([imageID], [imageURL], [feedbackID]) VALUES (167, N'http://res.cloudinary.com/fishbone-2710/image/upload/v1655453596/v5qbsqlkjqk6233etd4f.png', N'45404197-f226-440a-a1fa-780fee971b3a')
INSERT [dbo].[tblFeedbackImages] ([imageID], [imageURL], [feedbackID]) VALUES (168, N'http://res.cloudinary.com/fishbone-2710/image/upload/v1655453632/wlpzxms664eliovvdzd2.png', N'14085dd3-7e0f-42b4-bb69-d3e34b0c51ae')
INSERT [dbo].[tblFeedbackImages] ([imageID], [imageURL], [feedbackID]) VALUES (169, N'http://res.cloudinary.com/fishbone-2710/image/upload/v1655454426/osbq3pkkg0pmcf5dr6js.png', N'cd917a87-5af0-49ee-8766-b92afe9ceff6')
INSERT [dbo].[tblFeedbackImages] ([imageID], [imageURL], [feedbackID]) VALUES (170, N'http://res.cloudinary.com/fishbone-2710/image/upload/v1655454804/cu75wkdfnl8ts0e8u6yb.png', N'cfad56ee-52b0-4aa8-9b2f-0f895c9a49d0')
INSERT [dbo].[tblFeedbackImages] ([imageID], [imageURL], [feedbackID]) VALUES (171, N'http://res.cloudinary.com/fishbone-2710/image/upload/v1655884169/rfxzyf10r42ticis5nka.png', N'e5f7115d-5701-472f-8680-6f4f55b6419a')
INSERT [dbo].[tblFeedbackImages] ([imageID], [imageURL], [feedbackID]) VALUES (172, N'http://res.cloudinary.com/fishbone-2710/image/upload/v1655884172/gwq3yrztbo4aa9s6dqvl.png', N'e687f999-5d3d-4d8f-873c-57cbdb2173c3')
SET IDENTITY_INSERT [dbo].[tblFeedbackImages] OFF
GO
INSERT [dbo].[tblFeedbacks] ([feedbackID], [senderEmail], [title], [description], [sentTime], [handlerEmail], [roomNumber], [facilityID], [statusID], [deleteReason], [assignTime], [completeTime]) VALUES (N'0cc1ef79-f454-4be8-9cb1-9e45b4fd58f0', N'cuonghcse151442@fpt.edu.vn', N'test2', N'test2', CAST(N'2022-06-06T14:36:21.000' AS DateTime), N'danhltse161278@fpt.edu.vn', 3, N'1', 2, NULL, CAST(N'2022-06-20T15:20:28.000' AS DateTime), NULL)
INSERT [dbo].[tblFeedbacks] ([feedbackID], [senderEmail], [title], [description], [sentTime], [handlerEmail], [roomNumber], [facilityID], [statusID], [deleteReason], [assignTime], [completeTime]) VALUES (N'14085dd3-7e0f-42b4-bb69-d3e34b0c51ae', N'cuonghcse151442@fpt.edu.vn', N'fwdegfhgjhkj.l;k''l;', N'xzsdafgdhfygiuo', CAST(N'2022-06-17T15:13:50.000' AS DateTime), NULL, 1, N'1', 0, N'Wrong feedback information', NULL, NULL)
INSERT [dbo].[tblFeedbacks] ([feedbackID], [senderEmail], [title], [description], [sentTime], [handlerEmail], [roomNumber], [facilityID], [statusID], [deleteReason], [assignTime], [completeTime]) VALUES (N'22caa0b4-9d18-428e-bacf-226cdc230098', N'cuonghcse151442@fpt.edu.vn', N' cb', N' zx', CAST(N'2022-06-06T15:14:47.000' AS DateTime), NULL, 32, N'1', 0, N'Wrong feedback information', NULL, NULL)
INSERT [dbo].[tblFeedbacks] ([feedbackID], [senderEmail], [title], [description], [sentTime], [handlerEmail], [roomNumber], [facilityID], [statusID], [deleteReason], [assignTime], [completeTime]) VALUES (N'45404197-f226-440a-a1fa-780fee971b3a', N'cuonghcse151442@fpt.edu.vn', N'fwdegfhgjhkj.l;k''l;', N'xzsdafgdhfygiuo', CAST(N'2022-06-17T15:13:13.000' AS DateTime), NULL, 1, N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[tblFeedbacks] ([feedbackID], [senderEmail], [title], [description], [sentTime], [handlerEmail], [roomNumber], [facilityID], [statusID], [deleteReason], [assignTime], [completeTime]) VALUES (N'50214ddc-ab86-44b2-b667-eed821de1846', N'cuonghcse151442@fpt.edu.vn', N'adasd', N'fawgewg', CAST(N'2022-06-10T11:25:47.000' AS DateTime), N'danhltse161278@fpt.edu.vn', 3, N'1', 4, NULL, CAST(N'2022-06-17T13:49:29.000' AS DateTime), CAST(N'2022-06-17T13:51:08.000' AS DateTime))
INSERT [dbo].[tblFeedbacks] ([feedbackID], [senderEmail], [title], [description], [sentTime], [handlerEmail], [roomNumber], [facilityID], [statusID], [deleteReason], [assignTime], [completeTime]) VALUES (N'cd917a87-5af0-49ee-8766-b92afe9ceff6', N'cuonghcse151442@fpt.edu.vn', N' zx', N' zx', CAST(N'2022-06-17T15:27:04.000' AS DateTime), N'danhltse161278@fpt.edu.vn', 1, N'1', 3, NULL, CAST(N'2022-06-17T15:28:23.000' AS DateTime), NULL)
INSERT [dbo].[tblFeedbacks] ([feedbackID], [senderEmail], [title], [description], [sentTime], [handlerEmail], [roomNumber], [facilityID], [statusID], [deleteReason], [assignTime], [completeTime]) VALUES (N'cfad56ee-52b0-4aa8-9b2f-0f895c9a49d0', N'phucnhse151432@fpt.edu.vn', N'ersgty', N'sdjf', CAST(N'2022-06-17T15:33:17.000' AS DateTime), N'danhltse161278@fpt.edu.vn', 2, N'1', 4, NULL, CAST(N'2022-06-17T15:33:50.000' AS DateTime), CAST(N'2022-06-20T15:13:45.000' AS DateTime))
INSERT [dbo].[tblFeedbacks] ([feedbackID], [senderEmail], [title], [description], [sentTime], [handlerEmail], [roomNumber], [facilityID], [statusID], [deleteReason], [assignTime], [completeTime]) VALUES (N'e5f7115d-5701-472f-8680-6f4f55b6419a', N'phucnhse151432@fpt.edu.vn', N'as', N'as', CAST(N'2022-06-22T14:49:26.000' AS DateTime), NULL, 50, N'1', 1, NULL, NULL, NULL)
INSERT [dbo].[tblFeedbacks] ([feedbackID], [senderEmail], [title], [description], [sentTime], [handlerEmail], [roomNumber], [facilityID], [statusID], [deleteReason], [assignTime], [completeTime]) VALUES (N'e687f999-5d3d-4d8f-873c-57cbdb2173c3', N'phucnhse151432@fpt.edu.vn', N'as', N'as', CAST(N'2022-06-22T14:49:29.000' AS DateTime), NULL, 50, N'1', 1, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[tblFeedbackStatus] ON 

INSERT [dbo].[tblFeedbackStatus] ([statusID], [statusName]) VALUES (0, N'Deleted')
INSERT [dbo].[tblFeedbackStatus] ([statusID], [statusName]) VALUES (1, N'Pending')
INSERT [dbo].[tblFeedbackStatus] ([statusID], [statusName]) VALUES (2, N'Processing')
INSERT [dbo].[tblFeedbackStatus] ([statusID], [statusName]) VALUES (3, N'Waiting for approval')
INSERT [dbo].[tblFeedbackStatus] ([statusID], [statusName]) VALUES (4, N'Completed')
INSERT [dbo].[tblFeedbackStatus] ([statusID], [statusName]) VALUES (5, N'2')
INSERT [dbo].[tblFeedbackStatus] ([statusID], [statusName]) VALUES (6, N'3')
SET IDENTITY_INSERT [dbo].[tblFeedbackStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[tblReportImages] ON 

INSERT [dbo].[tblReportImages] ([imageID], [imageURL], [reportID]) VALUES (17, N'http://res.cloudinary.com/fishbone-2710/image/upload/v1655448615/eevscj5yhifa0fbgvl8w.png', N'7edab934-e266-4006-b33c-d656e3d5b274')
INSERT [dbo].[tblReportImages] ([imageID], [imageURL], [reportID]) VALUES (18, N'http://res.cloudinary.com/fishbone-2710/image/upload/v1655454732/t4vpy6ufgmr6aafnicrr.png', N'2cb609e9-accd-4eaa-a33e-fb98bc49bb83')
INSERT [dbo].[tblReportImages] ([imageID], [imageURL], [reportID]) VALUES (19, N'http://res.cloudinary.com/fishbone-2710/image/upload/v1655454913/b8fvb19ciji5dvrqbwcc.png', N'942910a2-aa4c-46a3-803c-0bff21814958')
SET IDENTITY_INSERT [dbo].[tblReportImages] OFF
GO
INSERT [dbo].[tblReports] ([reportID], [statusID], [feedbackID], [description], [spentMoney], [time], [rated]) VALUES (N'2cb609e9-accd-4eaa-a33e-fb98bc49bb83', 1, N'cd917a87-5af0-49ee-8766-b92afe9ceff6', N'z', 0, CAST(N'2022-06-17T15:32:09.000' AS DateTime), NULL)
INSERT [dbo].[tblReports] ([reportID], [statusID], [feedbackID], [description], [spentMoney], [time], [rated]) VALUES (N'7edab934-e266-4006-b33c-d656e3d5b274', 1, N'50214ddc-ab86-44b2-b667-eed821de1846', N'asghaagsg', 13123, CAST(N'2022-06-17T13:50:05.000' AS DateTime), 4)
INSERT [dbo].[tblReports] ([reportID], [statusID], [feedbackID], [description], [spentMoney], [time], [rated]) VALUES (N'942910a2-aa4c-46a3-803c-0bff21814958', 1, N'cfad56ee-52b0-4aa8-9b2f-0f895c9a49d0', N'dsARstyduio', 3234, CAST(N'2022-06-17T15:35:09.000' AS DateTime), 4)
GO
INSERT [dbo].[tblReportStatus] ([statusID], [statusName]) VALUES (1, N'Active')
INSERT [dbo].[tblReportStatus] ([statusID], [statusName]) VALUES (2, N'Deleted')
GO
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'EP', N'Employee')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'MG', N'Manager')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'US', N'User')
GO
INSERT [dbo].[tblUsers] ([email], [fullName], [picture], [roleID], [depID], [statusID]) VALUES (N'cuonghcse151442@fpt.edu.vn', N'Hoang Chi Cuong (K15 HCM)', N'https://lh3.googleusercontent.com/a-/AOh14GgP6Bm3lxhxUjK0nxfDPIZbF8HhHWHhRJxgo5M1=s96-c', N'US', NULL, 1)
INSERT [dbo].[tblUsers] ([email], [fullName], [picture], [roleID], [depID], [statusID]) VALUES (N'danhltse161278@fpt.edu.vn', N'Le Thanh Danh (K16_HCM)', N'https://lh3.googleusercontent.com/a-/AOh14Gi4F2lXLlX3RTFKvZANXFbxBrwmQeIpAlkOu9X7GA=s96-c', N'EP', 1, 1)
INSERT [dbo].[tblUsers] ([email], [fullName], [picture], [roleID], [depID], [statusID]) VALUES (N'khanhvtse150420@fpt.edu.vn', N'Vo Tuan Khanh (K15 HCM)', N'https://lh3.googleusercontent.com/a/AATXAJwN5aJYORHv2_1e1XlY8kd0Y7XI3YLPlEor1eIf=s96-c', N'MG', NULL, 1)
INSERT [dbo].[tblUsers] ([email], [fullName], [picture], [roleID], [depID], [statusID]) VALUES (N'phucnhse151432@fpt.edu.vn', N'Nguyen Huu Phuc (K15 HCM)', N'https://lh3.googleusercontent.com/a-/AOh14Gh0icfTUkzV6bq_FXSR9M0We5_YgkRjaq0eHJm2=s96-c', N'US', NULL, 1)
GO
INSERT [dbo].[tblUserStatus] ([statusID], [statusName]) VALUES (0, N'inactive')
INSERT [dbo].[tblUserStatus] ([statusID], [statusName]) VALUES (1, N'active')
GO
ALTER TABLE [dbo].[tblFeedbackImages]  WITH CHECK ADD  CONSTRAINT [FK_tblFeedbackImages_tblFeedbacks] FOREIGN KEY([feedbackID])
REFERENCES [dbo].[tblFeedbacks] ([feedbackID])
GO
ALTER TABLE [dbo].[tblFeedbackImages] CHECK CONSTRAINT [FK_tblFeedbackImages_tblFeedbacks]
GO
ALTER TABLE [dbo].[tblFeedbacks]  WITH CHECK ADD  CONSTRAINT [FK_tblFeedbacks_tblFacilities] FOREIGN KEY([facilityID])
REFERENCES [dbo].[tblFacilities] ([facilityID])
GO
ALTER TABLE [dbo].[tblFeedbacks] CHECK CONSTRAINT [FK_tblFeedbacks_tblFacilities]
GO
ALTER TABLE [dbo].[tblFeedbacks]  WITH CHECK ADD  CONSTRAINT [FK_tblFeedbacks_tblFeedbackStatus] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblFeedbackStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblFeedbacks] CHECK CONSTRAINT [FK_tblFeedbacks_tblFeedbackStatus]
GO
ALTER TABLE [dbo].[tblFeedbacks]  WITH CHECK ADD  CONSTRAINT [FK_tblFeedbacks_tblUsers] FOREIGN KEY([senderEmail])
REFERENCES [dbo].[tblUsers] ([email])
GO
ALTER TABLE [dbo].[tblFeedbacks] CHECK CONSTRAINT [FK_tblFeedbacks_tblUsers]
GO
ALTER TABLE [dbo].[tblFeedbacks]  WITH CHECK ADD  CONSTRAINT [FK_tblFeedbacks_tblUsers1] FOREIGN KEY([handlerEmail])
REFERENCES [dbo].[tblUsers] ([email])
GO
ALTER TABLE [dbo].[tblFeedbacks] CHECK CONSTRAINT [FK_tblFeedbacks_tblUsers1]
GO
ALTER TABLE [dbo].[tblRates]  WITH CHECK ADD  CONSTRAINT [FK_tblRates_tblUsers] FOREIGN KEY([email])
REFERENCES [dbo].[tblUsers] ([email])
GO
ALTER TABLE [dbo].[tblRates] CHECK CONSTRAINT [FK_tblRates_tblUsers]
GO
ALTER TABLE [dbo].[tblReportImages]  WITH CHECK ADD  CONSTRAINT [FK_tblReportImages_tblReport] FOREIGN KEY([reportID])
REFERENCES [dbo].[tblReports] ([reportID])
GO
ALTER TABLE [dbo].[tblReportImages] CHECK CONSTRAINT [FK_tblReportImages_tblReport]
GO
ALTER TABLE [dbo].[tblReports]  WITH CHECK ADD  CONSTRAINT [FK_tblReport_tblFeedbacks] FOREIGN KEY([feedbackID])
REFERENCES [dbo].[tblFeedbacks] ([feedbackID])
GO
ALTER TABLE [dbo].[tblReports] CHECK CONSTRAINT [FK_tblReport_tblFeedbacks]
GO
ALTER TABLE [dbo].[tblReports]  WITH CHECK ADD  CONSTRAINT [FK_tblReport_tblReportStatus] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblReportStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblReports] CHECK CONSTRAINT [FK_tblReport_tblReportStatus]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblDepartments] FOREIGN KEY([depID])
REFERENCES [dbo].[tblDepartments] ([depID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblDepartments]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoles]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblUserStatus] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblUserStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblUserStatus]
GO
USE [master]
GO
ALTER DATABASE [FacilitiesFeedback] SET  READ_WRITE 
GO
