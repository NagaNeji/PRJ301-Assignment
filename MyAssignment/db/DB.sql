USE [master]
GO
/****** Object:  Database [MyAssignmentDB1]    Script Date: 10/22/2023 6:21:13 PM ******/
CREATE DATABASE [MyAssignmentDB1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyAssignmentDB1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MyAssignmentDB1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyAssignmentDB1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MyAssignmentDB1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MyAssignmentDB1] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyAssignmentDB1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyAssignmentDB1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyAssignmentDB1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyAssignmentDB1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyAssignmentDB1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyAssignmentDB1] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyAssignmentDB1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyAssignmentDB1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyAssignmentDB1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyAssignmentDB1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyAssignmentDB1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyAssignmentDB1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyAssignmentDB1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyAssignmentDB1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyAssignmentDB1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyAssignmentDB1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyAssignmentDB1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyAssignmentDB1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyAssignmentDB1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyAssignmentDB1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyAssignmentDB1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyAssignmentDB1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyAssignmentDB1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyAssignmentDB1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MyAssignmentDB1] SET  MULTI_USER 
GO
ALTER DATABASE [MyAssignmentDB1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyAssignmentDB1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyAssignmentDB1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyAssignmentDB1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyAssignmentDB1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MyAssignmentDB1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MyAssignmentDB1] SET QUERY_STORE = ON
GO
ALTER DATABASE [MyAssignmentDB1] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MyAssignmentDB1]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 10/22/2023 6:21:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [nvarchar](200) NOT NULL,
	[password] [nvarchar](200) NOT NULL,
	[displayname] [nvarchar](200) NOT NULL,
	[student_id] [nvarchar](200) NOT NULL,
	[campus_id] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campus]    Script Date: 10/22/2023 6:21:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campus](
	[campus_id] [nvarchar](50) NOT NULL,
	[campus_name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Campus] PRIMARY KEY CLUSTERED 
(
	[campus_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 10/22/2023 6:21:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[course_id] [nvarchar](200) NOT NULL,
	[course_name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course_Grade]    Script Date: 10/22/2023 6:21:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course_Grade](
	[course_grade_id] [nvarchar](200) NOT NULL,
	[course_id] [nvarchar](200) NOT NULL,
	[grade_id] [nvarchar](50) NOT NULL,
	[course_grade_weight] [float] NOT NULL,
	[course_grade_group] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Course_Grade] PRIMARY KEY CLUSTERED 
(
	[course_grade_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrollment]    Script Date: 10/22/2023 6:21:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollment](
	[enrollment_id] [nvarchar](200) NOT NULL,
	[student_id] [nvarchar](200) NOT NULL,
	[semester_id] [int] NOT NULL,
	[course_id] [nvarchar](200) NOT NULL,
	[enrollment_start_date] [date] NOT NULL,
	[enrollment_end_date] [date] NOT NULL,
	[group_id] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[enrollment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 10/22/2023 6:21:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade](
	[grade_id] [nvarchar](50) NOT NULL,
	[grade_name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED 
(
	[grade_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 10/22/2023 6:21:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[group_id] [nvarchar](50) NOT NULL,
	[group_name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Major]    Script Date: 10/22/2023 6:21:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Major](
	[major_id] [nvarchar](200) NOT NULL,
	[major_name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Curriculum] PRIMARY KEY CLUSTERED 
(
	[major_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Major_Course]    Script Date: 10/22/2023 6:21:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Major_Course](
	[major_course_id] [int] NOT NULL,
	[major_id] [nvarchar](200) NOT NULL,
	[course_id] [nvarchar](200) NOT NULL,
	[semester_number] [int] NOT NULL,
 CONSTRAINT [PK_Curriculum_Course] PRIMARY KEY CLUSTERED 
(
	[major_course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Score]    Script Date: 10/22/2023 6:21:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Score](
	[score_id] [int] IDENTITY(1,1) NOT NULL,
	[enrollment_id] [nvarchar](200) NOT NULL,
	[course_grade_id] [nvarchar](200) NOT NULL,
	[score] [float] NULL,
 CONSTRAINT [PK_Enrollment_Course_Grade] PRIMARY KEY CLUSTERED 
(
	[score_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Semester]    Script Date: 10/22/2023 6:21:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semester](
	[semester_id] [int] NOT NULL,
	[semester_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Semester] PRIMARY KEY CLUSTERED 
(
	[semester_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 10/22/2023 6:21:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[student_id] [nvarchar](200) NOT NULL,
	[student_name] [nvarchar](200) NOT NULL,
	[student_gender] [bit] NOT NULL,
	[student_dob] [date] NULL,
	[student_email] [nvarchar](200) NULL,
	[major_id] [nvarchar](200) NOT NULL,
	[campus_id] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [password], [displayname], [student_id], [campus_id]) VALUES (N'thanbdhe172581', N'123', N'thanbdhe172581', N'HE172581', N'HL')
GO
INSERT [dbo].[Campus] ([campus_id], [campus_name]) VALUES (N'CT', N'Cần Thơ')
INSERT [dbo].[Campus] ([campus_id], [campus_name]) VALUES (N'DN', N'Đà Nẵng')
INSERT [dbo].[Campus] ([campus_id], [campus_name]) VALUES (N'HCM', N'Hồ Chí Minh')
INSERT [dbo].[Campus] ([campus_id], [campus_name]) VALUES (N'HL', N'Hòa Lạc')
INSERT [dbo].[Campus] ([campus_id], [campus_name]) VALUES (N'HN', N'Hà Nội')
INSERT [dbo].[Campus] ([campus_id], [campus_name]) VALUES (N'QN', N'Quy Nhơn')
GO
INSERT [dbo].[Course] ([course_id], [course_name]) VALUES (N'CEA201', N'Computer Organization and Architecture')
INSERT [dbo].[Course] ([course_id], [course_name]) VALUES (N'CSD201', N'Data Structures and Algorithms')
INSERT [dbo].[Course] ([course_id], [course_name]) VALUES (N'CSI104', N'Introduction to Computer Science')
INSERT [dbo].[Course] ([course_id], [course_name]) VALUES (N'DBI202', N'Introduction to Databases')
INSERT [dbo].[Course] ([course_id], [course_name]) VALUES (N'IOT102', N'Internet of Things')
INSERT [dbo].[Course] ([course_id], [course_name]) VALUES (N'MAD101', N'Discrete mathematics')
INSERT [dbo].[Course] ([course_id], [course_name]) VALUES (N'MAE101', N'Mathematics for Engineering')
INSERT [dbo].[Course] ([course_id], [course_name]) VALUES (N'MAS291', N'Statistics and Probability')
INSERT [dbo].[Course] ([course_id], [course_name]) VALUES (N'OSG202', N'Operating Systems')
INSERT [dbo].[Course] ([course_id], [course_name]) VALUES (N'PRF192', N'Programming Fundamentals')
INSERT [dbo].[Course] ([course_id], [course_name]) VALUES (N'PRJ301', N'Java Web Application Development')
INSERT [dbo].[Course] ([course_id], [course_name]) VALUES (N'PRO192', N'Object-Oriented Programming')
GO
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CEA201_AS1', N'CEA201', N'AS1', 0.15, N'Assignment')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CEA201_AS2', N'CEA201', N'AS2', 0.15, N'Assignment')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CEA201_EX1', N'CEA201', N'EX1', 0.075, N'Exercises')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CEA201_EX2', N'CEA201', N'EX2', 0.075, N'Exercises')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CEA201_EX3', N'CEA201', N'EX3', 0.075, N'Exercises')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CEA201_EX4', N'CEA201', N'EX4', 0.075, N'Exercises')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CEA201_FE', N'CEA201', N'FE', 0.4, N'Final Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CEA201_FER', N'CEA201', N'FER', 0.4, N'Final Exam Resit')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CSI104_FE', N'CSI104', N'FE', 0.4, N'Final Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CSI104_FER', N'CSI104', N'FER', 0.4, N'Final Exam Resit')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CSI104_LAB1', N'CSI104', N'LAB1', 0.1, N'Lab')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CSI104_LAB2', N'CSI104', N'LAB2', 0.1, N'Lab')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CSI104_PRE1', N'CSI104', N'PRE1', 0.05, N'Presentation')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CSI104_PRE2', N'CSI104', N'PRE2', 0.05, N'Presentation')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CSI104_PT1', N'CSI104', N'PT1', 0.15, N'Progress test')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CSI104_PT2', N'CSI104', N'PT2', 0.15, N'Progress test')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAE101_AS1', N'MAE101', N'AS1', 0.1, N'Assignment')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAE101_AS2', N'MAE101', N'AS2', 0.1, N'Assignment')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAE101_AS3', N'MAE101', N'AS3', 0.1, N'Assignment')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAE101_FE', N'MAE101', N'FE', 0.4, N'Final Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAE101_FER', N'MAE101', N'FER', 0.4, N'Final Exam Resit')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAE101_PT1', N'MAE101', N'PT1', 0.1, N'Progress test')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAE101_PT2', N'MAE101', N'PT2', 0.1, N'Progress test')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAE101_PT3', N'MAE101', N'PT3', 0.1, N'Progress test')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRF192_AS', N'PRF192', N'AS', 0.1, N'Assignment')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRF192_FE', N'PRF192', N'FE', 0.3, N'Final Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRF192_FER', N'PRF192', N'FER', 0.3, N'Final Exam Resit')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRF192_PE', N'PRF192', N'PE', 0.4, N'Practical Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRF192_PT1', N'PRF192', N'PT1', 0.05, N'Progress test')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRF192_PT2', N'PRF192', N'PT2', 0.05, N'Progress test')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRF192_WS1', N'PRF192', N'WS1', 0.0125, N'Workshop')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRF192_WS2', N'PRF192', N'WS2', 0.0125, N'Workshop')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRF192_WS3', N'PRF192', N'WS3', 0.0125, N'Workshop')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRF192_WS4', N'PRF192', N'WS4', 0.0125, N'Workshop')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRF192_WS5', N'PRF192', N'WS5', 0.0125, N'Workshop')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRF192_WS6', N'PRF192', N'WS6', 0.0125, N'Workshop')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRF192_WS7', N'PRF192', N'WS7', 0.0125, N'Workshop')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRF192_WS8', N'PRF192', N'WS8', 0.0125, N'Workshop')
GO
INSERT [dbo].[Enrollment] ([enrollment_id], [student_id], [semester_id], [course_id], [enrollment_start_date], [enrollment_end_date], [group_id]) VALUES (N'HE172581_20223_CEA201', N'HE172581', 20223, N'CEA201', CAST(N'2022-09-05' AS Date), CAST(N'2022-11-11' AS Date), N'SE1753')
INSERT [dbo].[Enrollment] ([enrollment_id], [student_id], [semester_id], [course_id], [enrollment_start_date], [enrollment_end_date], [group_id]) VALUES (N'HE172581_20223_CSI104', N'HE172581', 20223, N'CSI104', CAST(N'2022-09-05' AS Date), CAST(N'2022-11-11' AS Date), N'SE1753')
INSERT [dbo].[Enrollment] ([enrollment_id], [student_id], [semester_id], [course_id], [enrollment_start_date], [enrollment_end_date], [group_id]) VALUES (N'HE172581_20223_MAE101', N'HE172581', 20223, N'MAE101', CAST(N'2022-09-06' AS Date), CAST(N'2022-11-10' AS Date), N'SE1753')
INSERT [dbo].[Enrollment] ([enrollment_id], [student_id], [semester_id], [course_id], [enrollment_start_date], [enrollment_end_date], [group_id]) VALUES (N'HE172581_20223_PRF192', N'HE172581', 20223, N'PRF192', CAST(N'2022-09-06' AS Date), CAST(N'2022-11-08' AS Date), N'SE1753')
GO
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'AS', N'Assignment')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'AS1', N'Assignment 1')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'AS2', N'Assignment 2')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'AS3', N'Assignment 3')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'EX1', N'Exercises 1')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'EX2', N'Exercises 2')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'EX3', N'Exercises 3')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'EX4', N'Exercises 4')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'EX5', N'Exercises 5')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'FE', N'Final Exam')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'FER', N'Final Exam Resit')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'LAB1', N'Lab 1')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'LAB10', N'Lab 10')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'LAB2', N'Lab 2')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'LAB3', N'Lab 3')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'LAB4', N'Lab 4')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'LAB5', N'Lab 5')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'LAB6', N'Lab 6')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'LAB7', N'Lab 7')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'LAB8', N'Lab 8')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'LAB9', N'Lab 9')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'PA', N'Participation')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'PE', N'Practical Exam')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'PRE', N'Presentation')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'PRE1', N'Presentation 1')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'PRE2', N'Presentation 2')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'PT1', N'Progress test 1')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'PT2', N'Progress test 2')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'PT3', N'Progress test 3')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'WS1', N'Workshop 1')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'WS10', N'Workshop 10')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'WS2', N'Workshop 2')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'WS3', N'Workshop 3')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'WS4', N'Workshop 4')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'WS5', N'Workshop 5')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'WS6', N'Workshop 6')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'WS7', N'Workshop 7')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'WS8', N'Workshop 8')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'WS9', N'Workshop 9')
GO
INSERT [dbo].[Group] ([group_id], [group_name]) VALUES (N'SE1753', N'SE1753')
GO
INSERT [dbo].[Major] ([major_id], [major_name]) VALUES (N'SE', N'Software Engineering')
GO
INSERT [dbo].[Major_Course] ([major_course_id], [major_id], [course_id], [semester_number]) VALUES (11, N'SE', N'CSI104', 1)
INSERT [dbo].[Major_Course] ([major_course_id], [major_id], [course_id], [semester_number]) VALUES (12, N'SE', N'PRF192', 1)
INSERT [dbo].[Major_Course] ([major_course_id], [major_id], [course_id], [semester_number]) VALUES (13, N'SE', N'MAE101', 1)
INSERT [dbo].[Major_Course] ([major_course_id], [major_id], [course_id], [semester_number]) VALUES (14, N'SE', N'CEA201', 1)
INSERT [dbo].[Major_Course] ([major_course_id], [major_id], [course_id], [semester_number]) VALUES (21, N'SE', N'PRO192', 2)
INSERT [dbo].[Major_Course] ([major_course_id], [major_id], [course_id], [semester_number]) VALUES (22, N'SE', N'MAD101', 2)
INSERT [dbo].[Major_Course] ([major_course_id], [major_id], [course_id], [semester_number]) VALUES (23, N'SE', N'OSG202', 2)
INSERT [dbo].[Major_Course] ([major_course_id], [major_id], [course_id], [semester_number]) VALUES (31, N'SE', N'CSD201', 3)
INSERT [dbo].[Major_Course] ([major_course_id], [major_id], [course_id], [semester_number]) VALUES (32, N'SE', N'DBI202', 3)
INSERT [dbo].[Major_Course] ([major_course_id], [major_id], [course_id], [semester_number]) VALUES (41, N'SE', N'MAS291', 4)
INSERT [dbo].[Major_Course] ([major_course_id], [major_id], [course_id], [semester_number]) VALUES (42, N'SE', N'IOT102', 4)
INSERT [dbo].[Major_Course] ([major_course_id], [major_id], [course_id], [semester_number]) VALUES (43, N'SE', N'PRJ301', 4)
GO
INSERT [dbo].[Semester] ([semester_id], [semester_name]) VALUES (20223, N'Fall2022')
INSERT [dbo].[Semester] ([semester_id], [semester_name]) VALUES (20231, N'Spring2023')
INSERT [dbo].[Semester] ([semester_id], [semester_name]) VALUES (20232, N'Summer2023')
INSERT [dbo].[Semester] ([semester_id], [semester_name]) VALUES (20233, N'Fall2023')
GO
INSERT [dbo].[Student] ([student_id], [student_name], [student_gender], [student_dob], [student_email], [major_id], [campus_id]) VALUES (N'HE172581', N'Bạch Đức Thản', 1, CAST(N'2003-09-03' AS Date), N'thanbdhe172581@fpt.edu.vn', N'SE', N'HL')
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Campus] FOREIGN KEY([campus_id])
REFERENCES [dbo].[Campus] ([campus_id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Campus]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Student] FOREIGN KEY([student_id])
REFERENCES [dbo].[Student] ([student_id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Student]
GO
ALTER TABLE [dbo].[Course_Grade]  WITH CHECK ADD  CONSTRAINT [FK_Course_Grade_Course] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([course_id])
GO
ALTER TABLE [dbo].[Course_Grade] CHECK CONSTRAINT [FK_Course_Grade_Course]
GO
ALTER TABLE [dbo].[Course_Grade]  WITH CHECK ADD  CONSTRAINT [FK_Course_Grade_Grade] FOREIGN KEY([grade_id])
REFERENCES [dbo].[Grade] ([grade_id])
GO
ALTER TABLE [dbo].[Course_Grade] CHECK CONSTRAINT [FK_Course_Grade_Grade]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Course] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([course_id])
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Course]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Group] FOREIGN KEY([group_id])
REFERENCES [dbo].[Group] ([group_id])
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Group]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Semester] FOREIGN KEY([semester_id])
REFERENCES [dbo].[Semester] ([semester_id])
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Semester]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Student] FOREIGN KEY([student_id])
REFERENCES [dbo].[Student] ([student_id])
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Student]
GO
ALTER TABLE [dbo].[Major_Course]  WITH CHECK ADD  CONSTRAINT [FK_Major_Course_Course] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([course_id])
GO
ALTER TABLE [dbo].[Major_Course] CHECK CONSTRAINT [FK_Major_Course_Course]
GO
ALTER TABLE [dbo].[Major_Course]  WITH CHECK ADD  CONSTRAINT [FK_Major_Course_Major] FOREIGN KEY([major_id])
REFERENCES [dbo].[Major] ([major_id])
GO
ALTER TABLE [dbo].[Major_Course] CHECK CONSTRAINT [FK_Major_Course_Major]
GO
ALTER TABLE [dbo].[Score]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Course_Grade_Course_Grade] FOREIGN KEY([course_grade_id])
REFERENCES [dbo].[Course_Grade] ([course_grade_id])
GO
ALTER TABLE [dbo].[Score] CHECK CONSTRAINT [FK_Enrollment_Course_Grade_Course_Grade]
GO
ALTER TABLE [dbo].[Score]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Course_Grade_Enrollment] FOREIGN KEY([enrollment_id])
REFERENCES [dbo].[Enrollment] ([enrollment_id])
GO
ALTER TABLE [dbo].[Score] CHECK CONSTRAINT [FK_Enrollment_Course_Grade_Enrollment]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Campus1] FOREIGN KEY([campus_id])
REFERENCES [dbo].[Campus] ([campus_id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Campus1]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Major] FOREIGN KEY([major_id])
REFERENCES [dbo].[Major] ([major_id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Major]
GO
USE [master]
GO
ALTER DATABASE [MyAssignmentDB1] SET  READ_WRITE 
GO
