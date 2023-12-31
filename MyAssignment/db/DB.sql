USE [master]
GO
/****** Object:  Database [MyAssignmentDB1]    Script Date: 11/9/2023 8:56:37 AM ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 11/9/2023 8:56:37 AM ******/
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
/****** Object:  Table [dbo].[Campus]    Script Date: 11/9/2023 8:56:37 AM ******/
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
/****** Object:  Table [dbo].[Course]    Script Date: 11/9/2023 8:56:37 AM ******/
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
/****** Object:  Table [dbo].[Course_Grade]    Script Date: 11/9/2023 8:56:37 AM ******/
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
/****** Object:  Table [dbo].[Enrollment]    Script Date: 11/9/2023 8:56:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollment](
	[enrollment_id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[Grade]    Script Date: 11/9/2023 8:56:37 AM ******/
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
/****** Object:  Table [dbo].[Group]    Script Date: 11/9/2023 8:56:37 AM ******/
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
/****** Object:  Table [dbo].[Major]    Script Date: 11/9/2023 8:56:37 AM ******/
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
/****** Object:  Table [dbo].[Major_Course]    Script Date: 11/9/2023 8:56:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Major_Course](
	[major_course_id] [int] NOT NULL,
	[major_id] [nvarchar](200) NOT NULL,
	[course_id] [nvarchar](200) NOT NULL,
	[semester_number] [int] NOT NULL,
	[credit] [int] NOT NULL,
 CONSTRAINT [PK_Curriculum_Course] PRIMARY KEY CLUSTERED 
(
	[major_course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Score]    Script Date: 11/9/2023 8:56:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Score](
	[score_id] [int] IDENTITY(1,1) NOT NULL,
	[enrollment_id] [int] NOT NULL,
	[course_grade_id] [nvarchar](200) NOT NULL,
	[score] [float] NULL,
 CONSTRAINT [PK_Enrollment_Course_Grade] PRIMARY KEY CLUSTERED 
(
	[score_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Semester]    Script Date: 11/9/2023 8:56:37 AM ******/
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
/****** Object:  Table [dbo].[Student]    Script Date: 11/9/2023 8:56:37 AM ******/
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
INSERT [dbo].[Account] ([username], [password], [displayname], [student_id], [campus_id]) VALUES (N'test', N'123', N'testdisplayname', N'testid', N'CT')
GO
INSERT [dbo].[Campus] ([campus_id], [campus_name]) VALUES (N'CT', N'Cần Thơ')
INSERT [dbo].[Campus] ([campus_id], [campus_name]) VALUES (N'DN', N'Đà Nẵng')
INSERT [dbo].[Campus] ([campus_id], [campus_name]) VALUES (N'HCM', N'Hồ Chí Minh')
INSERT [dbo].[Campus] ([campus_id], [campus_name]) VALUES (N'HL', N'Hòa Lạc')
INSERT [dbo].[Campus] ([campus_id], [campus_name]) VALUES (N'QN', N'Quy Nhơn')
GO
INSERT [dbo].[Course] ([course_id], [course_name]) VALUES (N'CEA201', N'Computer Organization and Architecture')
INSERT [dbo].[Course] ([course_id], [course_name]) VALUES (N'CSD201', N'Data Structures and Algorithms')
INSERT [dbo].[Course] ([course_id], [course_name]) VALUES (N'CSI104', N'Introduction to Computer Science')
INSERT [dbo].[Course] ([course_id], [course_name]) VALUES (N'DBI202', N'Introduction to Databases')
INSERT [dbo].[Course] ([course_id], [course_name]) VALUES (N'IOT102', N'Internet of Things')
INSERT [dbo].[Course] ([course_id], [course_name]) VALUES (N'ITE302c', N'	Ethics in IT')
INSERT [dbo].[Course] ([course_id], [course_name]) VALUES (N'MAD101', N'Discrete mathematics')
INSERT [dbo].[Course] ([course_id], [course_name]) VALUES (N'MAE101', N'Mathematics for Engineering')
INSERT [dbo].[Course] ([course_id], [course_name]) VALUES (N'MAS291', N'Statistics and Probability')
INSERT [dbo].[Course] ([course_id], [course_name]) VALUES (N'OSG202', N'Operating Systems')
INSERT [dbo].[Course] ([course_id], [course_name]) VALUES (N'PRF192', N'Programming Fundamentals')
INSERT [dbo].[Course] ([course_id], [course_name]) VALUES (N'PRJ301', N'Java Web Application Development')
INSERT [dbo].[Course] ([course_id], [course_name]) VALUES (N'PRO192', N'Object-Oriented Programming')
INSERT [dbo].[Course] ([course_id], [course_name]) VALUES (N'SWP391', N'Application development project')
GO
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CEA201_AS1', N'CEA201', N'AS1', 0.15, N'Assignment')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CEA201_AS2', N'CEA201', N'AS2', 0.15, N'Assignment')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CEA201_ASTT', N'CEA201', N'TT', 0.3, N'Assignment')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CEA201_EX1', N'CEA201', N'EX1', 0.075, N'Exercises')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CEA201_EX2', N'CEA201', N'EX2', 0.075, N'Exercises')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CEA201_EX3', N'CEA201', N'EX3', 0.075, N'Exercises')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CEA201_EX4', N'CEA201', N'EX4', 0.075, N'Exercises')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CEA201_EXTT', N'CEA201', N'TT', 0.3, N'Exercises')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CEA201_FE', N'CEA201', N'FE', 0.4, N'Final Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CEA201_FER', N'CEA201', N'FER', 0.4, N'Final Exam Resit')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CEA201_FERTT', N'CEA201', N'TT', 0.4, N'Final Exam Resit')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CEA201_FETT', N'CEA201', N'TT', 0.4, N'Final Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CSD201_AS1', N'CSD201', N'AS1', 0.1, N'Assignment')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CSD201_AS2', N'CSD201', N'AS2', 0.1, N'Assignment')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CSD201_ASTT', N'CSD201', N'TT', 0.2, N'Assignment')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CSD201_FE', N'CSD201', N'FE', 0.3, N'Final Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CSD201_FER', N'CSD201', N'FER', 0.3, N'Final Exam Resit')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CSD201_FERTT', N'CSD201', N'TT', 0.3, N'Final Exam Resit')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CSD201_FETT', N'CSD201', N'TT', 0.3, N'Final Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CSD201_PE', N'CSD201', N'PE', 0.3, N'Practical Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CSD201_PETT', N'CSD201', N'TT', 0.3, N'Practical Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CSD201_PT1', N'CSD201', N'PT1', 0.1, N'Progress test')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CSD201_PT2', N'CSD201', N'PT2', 0.1, N'Progress test')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CSD201_PTTT', N'CSD201', N'TT', 0.2, N'Progress test')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CSI104_FE', N'CSI104', N'FE', 0.4, N'Final Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CSI104_FER', N'CSI104', N'FER', 0.4, N'Final Exam Resit')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CSI104_FERTT', N'CSI104', N'TT', 0.4, N'Final Exam Resit')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CSI104_FETT', N'CSI104', N'TT', 0.4, N'Final Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CSI104_LAB1', N'CSI104', N'LAB1', 0.1, N'Lab')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CSI104_LAB2', N'CSI104', N'LAB2', 0.1, N'Lab')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CSI104_LABTT', N'CSI104', N'TT', 0.2, N'Lab')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CSI104_PRE1', N'CSI104', N'PRE1', 0.05, N'Presentation')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CSI104_PRE2', N'CSI104', N'PRE2', 0.05, N'Presentation')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CSI104_PRETT', N'CSI104', N'TT', 0.1, N'Presentation')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CSI104_PT1', N'CSI104', N'PT1', 0.15, N'Progress test')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CSI104_PT2', N'CSI104', N'PT2', 0.15, N'Progress test')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'CSI104_PTTT', N'CSI104', N'TT', 0.3, N'Progress test')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'DBI202_AS', N'DBI202', N'AS', 0.2, N'Assignment')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'DBI202_ASTT', N'DBI202', N'TT', 0.2, N'Assignment')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'DBI202_FE', N'DBI202', N'FE', 0.3, N'Final Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'DBI202_FER', N'DBI202', N'FER', 0.3, N'Final Exam Resit')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'DBI202_FERTT', N'DBI202', N'TT', 0.3, N'Final Exam Resit')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'DBI202_FETT', N'DBI202', N'TT', 0.3, N'Final Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'DBI202_LAB1', N'DBI202', N'LAB1', 0.02, N'Lab')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'DBI202_LAB2', N'DBI202', N'LAB2', 0.02, N'Lab')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'DBI202_LAB3', N'DBI202', N'LAB3', 0.02, N'Lab')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'DBI202_LAB4', N'DBI202', N'LAB4', 0.02, N'Lab')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'DBI202_LAB5', N'DBI202', N'LAB5', 0.02, N'Lab')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'DBI202_LABTT', N'DBI202', N'TT', 0.1, N'Lab')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'DBI202_PE', N'DBI202', N'PE', 0.3, N'Practical Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'DBI202_PETT', N'DBI202', N'TT', 0.3, N'Practical Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'DBI202_PT1', N'DBI202', N'PT1', 0.05, N'Progress test')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'DBI202_PT2', N'DBI202', N'PT2', 0.05, N'Progress test')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'DBI202_PTTT', N'DBI202', N'TT', 0.1, N'Progress test')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'IOT102_AL', N'IOT102', N'AL', 0.1, N'Active Learning')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'IOT102_ALTT', N'IOT102', N'TT', 0.1, N'Active Learning')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'IOT102_EX1', N'IOT102', N'EX1', 0.05, N'Exercises')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'IOT102_EX2', N'IOT102', N'EX2', 0.05, N'Exercises')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'IOT102_EXTT', N'IOT102', N'TT', 0.1, N'Exercises')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'IOT102_FE', N'IOT102', N'FE', 0.4, N'Final Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'IOT102_FER', N'IOT102', N'FER', 0.4, N'Final Exam Resit')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'IOT102_FERTT', N'IOT102', N'TT', 0.4, N'Final Exam Resit')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'IOT102_FETT', N'IOT102', N'TT', 0.4, N'Final Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'IOT102_PRE', N'IOT102', N'PRE', 0.1, N'Presentation')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'IOT102_PRETT', N'IOT102', N'TT', 0.1, N'Presentation')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'IOT102_PRJ', N'IOT102', N'PRJ', 0.3, N'Project')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'IOT102_PRJTT', N'IOT102', N'TT', 0.3, N'Project')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAD101_AS1', N'MAD101', N'AS1', 0.1, N'Assignment')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAD101_AS2', N'MAD101', N'AS2', 0.1, N'Assignment')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAD101_AS3', N'MAD101', N'AS3', 0.1, N'Assignment')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAD101_ASTT', N'MAD101', N'TT', 0.3, N'Assignment')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAD101_FE', N'MAD101', N'FE', 0.4, N'Final Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAD101_FER', N'MAD101', N'FER', 0.4, N'Final Exam Resit')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAD101_FERTT', N'MAD101', N'TT', 0.4, N'Final Exam Resit')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAD101_FETT', N'MAD101', N'TT', 0.4, N'Final Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAD101_PT1', N'MAD101', N'PT1', 0.1, N'Progress test')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAD101_PT2', N'MAD101', N'PT2', 0.1, N'Progress test')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAD101_PT3', N'MAD101', N'PT3', 0.1, N'Progress test')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAD101_PTTT', N'MAD101', N'TT', 0.3, N'Progress test')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAE101_AS1', N'MAE101', N'AS1', 0.1, N'Assignment')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAE101_AS2', N'MAE101', N'AS2', 0.1, N'Assignment')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAE101_AS3', N'MAE101', N'AS3', 0.1, N'Assignment')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAE101_ASTT', N'MAE101', N'TT', 0.3, N'Assignment')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAE101_FE', N'MAE101', N'FE', 0.4, N'Final Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAE101_FER', N'MAE101', N'FER', 0.4, N'Final Exam Resit')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAE101_FERTT', N'MAE101', N'TT', 0.4, N'Final Exam Resit')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAE101_FETT', N'MAE101', N'TT', 0.4, N'Final Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAE101_PT1', N'MAE101', N'PT1', 0.1, N'Progress test')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAE101_PT2', N'MAE101', N'PT2', 0.1, N'Progress test')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAE101_PT3', N'MAE101', N'PT3', 0.1, N'Progress test')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAE101_PTTT', N'MAE101', N'TT', 0.3, N'Progress test')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAS291_AS1', N'MAS291', N'AS1', 0.1, N'Assignment')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAS291_AS2', N'MAS291', N'AS2', 0.1, N'Assignment')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAS291_ASTT', N'MAS291', N'TT', 0.2, N'Assignment')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAS291_CP', N'MAS291', N'CP', 0.15, N'Computer Project')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAS291_CPTT', N'MAS291', N'TT', 0.15, N'Computer Project')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAS291_FE', N'MAS291', N'FE', 0.35, N'Final Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAS291_FER', N'MAS291', N'FER', 0.35, N'Final Exam Resit')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAS291_FERTT', N'MAS291', N'TT', 0.35, N'Final Exam Resit')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAS291_FETT', N'MAS291', N'TT', 0.35, N'Final Exam')
GO
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAS291_PT1', N'MAS291', N'PT1', 0.1, N'Progress test')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAS291_PT2', N'MAS291', N'PT2', 0.1, N'Progress test')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAS291_PT3', N'MAS291', N'PT3', 0.1, N'Progress test')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'MAS291_PTTT', N'MAS291', N'TT', 0.3, N'Progress test')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'OSG202_FE', N'OSG202', N'FE', 0.4, N'Final Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'OSG202_FER', N'OSG202', N'FER', 0.4, N'Final Exam Resit')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'OSG202_FERTT', N'OSG202', N'TT', 0.4, N'Final Exam Resit')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'OSG202_FETT', N'OSG202', N'TT', 0.4, N'Final Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'OSG202_LAB1', N'OSG202', N'LAB1', 0.05, N'Lab')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'OSG202_LAB2', N'OSG202', N'LAB2', 0.05, N'Lab')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'OSG202_LAB3', N'OSG202', N'LAB3', 0.05, N'Lab')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'OSG202_LAB4', N'OSG202', N'LAB4', 0.05, N'Lab')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'OSG202_LABTT', N'OSG202', N'TT', 0.2, N'Lab')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'OSG202_PRE', N'OSG202', N'PRE', 0.2, N'Presentation')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'OSG202_PRETT', N'OSG202', N'TT', 0.2, N'Presentation')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'OSG202_PT1', N'OSG202', N'PT1', 0.1, N'Progress test')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'OSG202_PT2', N'OSG202', N'PT2', 0.1, N'Progress test')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'OSG202_PTTT', N'OSG202', N'TT', 0.2, N'Progress test')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRF192_AS', N'PRF192', N'AS', 0.1, N'Assignment')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRF192_ASTT', N'PRF192', N'TT', 0.1, N'Assignment')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRF192_FE', N'PRF192', N'FE', 0.3, N'Final Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRF192_FER', N'PRF192', N'FER', 0.3, N'Final Exam Resit')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRF192_FERTT', N'PRF192', N'TT', 0.3, N'Final Exam Resit')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRF192_FETT', N'PRF192', N'TT', 0.3, N'Final Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRF192_PE', N'PRF192', N'PE', 0.4, N'Practical Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRF192_PETT', N'PRF192', N'TT', 0.4, N'Practical Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRF192_PT1', N'PRF192', N'PT1', 0.05, N'Progress test')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRF192_PT2', N'PRF192', N'PT2', 0.05, N'Progress test')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRF192_PTTT', N'PRF192', N'TT', 0.1, N'Progress test')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRF192_WS1', N'PRF192', N'WS1', 0.0125, N'Workshop')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRF192_WS2', N'PRF192', N'WS2', 0.0125, N'Workshop')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRF192_WS3', N'PRF192', N'WS3', 0.0125, N'Workshop')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRF192_WS4', N'PRF192', N'WS4', 0.0125, N'Workshop')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRF192_WS5', N'PRF192', N'WS5', 0.0125, N'Workshop')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRF192_WS6', N'PRF192', N'WS6', 0.0125, N'Workshop')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRF192_WS7', N'PRF192', N'WS7', 0.0125, N'Workshop')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRF192_WS8', N'PRF192', N'WS8', 0.0125, N'Workshop')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRF192_WSTT', N'PRF192', N'TT', 0.1, N'Workshop')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRJ301_AS', N'PRJ301', N'AS', 0.4, N'Assignment')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRJ301_ASTT', N'PRJ301', N'TT', 0.4, N'Assignment')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRJ301_FE', N'PRJ301', N'FE', 0.2, N'Final Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRJ301_FER', N'PRJ301', N'FER', 0.2, N'Final Exam Resit')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRJ301_FERTT', N'PRJ301', N'TT', 0.2, N'Final Exam Resit')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRJ301_FETT', N'PRJ301', N'TT', 0.2, N'Final Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRJ301_PE', N'PRJ301', N'PE', 0.2, N'Practical Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRJ301_PETT', N'PRJ301', N'TT', 0.2, N'Practical Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRJ301_PT1', N'PRJ301', N'PT1', 0.05, N'Progress test 1')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRJ301_PT1TT', N'PRJ301', N'TT', 0.05, N'Progress test 1')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRJ301_PT2', N'PRJ301', N'PT2', 0.05, N'Progress test 2')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRJ301_PT2TT', N'PRJ301', N'TT', 0.05, N'Progress test 2')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRJ301_WS1', N'PRJ301', N'WS1', 0.05, N'Workshop 1')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRJ301_WS1TT', N'PRJ301', N'TT', 0.05, N'Workshop 1')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRJ301_WS2', N'PRJ301', N'WS2', 0.05, N'Workshop 2')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRJ301_WS2TT', N'PRJ301', N'TT', 0.05, N'Workshop 2')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRO192_AS', N'PRO192', N'AS', 0.2, N'Assignment')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRO192_ASTT', N'PRO192', N'TT', 0.2, N'Assignment')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRO192_FE', N'PRO192', N'FE', 0.3, N'Final Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRO192_FER', N'PRO192', N'FER', 0.3, N'Final Exam Resit')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRO192_FERTT', N'PRO192', N'TT', 0.3, N'Final Exam Resit')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRO192_FETT', N'PRO192', N'TT', 0.3, N'Final Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRO192_LAB1', N'PRO192', N'LAB1', 0.016666666666666666, N'Lab')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRO192_LAB2', N'PRO192', N'LAB2', 0.016666666666666666, N'Lab')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRO192_LAB3', N'PRO192', N'LAB3', 0.016666666666666666, N'Lab')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRO192_LAB4', N'PRO192', N'LAB4', 0.016666666666666666, N'Lab')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRO192_LAB5', N'PRO192', N'LAB5', 0.016666666666666666, N'Lab')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRO192_LAB6', N'PRO192', N'LAB6', 0.016666666666666666, N'Lab')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRO192_LABTT', N'PRO192', N'TT', 0.1, N'Lab')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRO192_PE', N'PRO192', N'PE', 0.3, N'Practical Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRO192_PETT', N'PRO192', N'TT', 0.3, N'Practical Exam')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRO192_PT1', N'PRO192', N'PT1', 0.05, N'Progress test')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRO192_PT2', N'PRO192', N'PT2', 0.05, N'Progress test')
INSERT [dbo].[Course_Grade] ([course_grade_id], [course_id], [grade_id], [course_grade_weight], [course_grade_group]) VALUES (N'PRO192_PTTT', N'PRO192', N'TT', 0.1, N'Progress test')
GO
SET IDENTITY_INSERT [dbo].[Enrollment] ON 

INSERT [dbo].[Enrollment] ([enrollment_id], [student_id], [semester_id], [course_id], [enrollment_start_date], [enrollment_end_date], [group_id]) VALUES (1, N'HE172581', 20223, N'CEA201', CAST(N'2022-09-05' AS Date), CAST(N'2022-11-11' AS Date), N'SE1753')
INSERT [dbo].[Enrollment] ([enrollment_id], [student_id], [semester_id], [course_id], [enrollment_start_date], [enrollment_end_date], [group_id]) VALUES (2, N'HE172581', 20223, N'CSI104', CAST(N'2022-09-05' AS Date), CAST(N'2022-11-11' AS Date), N'SE1753')
INSERT [dbo].[Enrollment] ([enrollment_id], [student_id], [semester_id], [course_id], [enrollment_start_date], [enrollment_end_date], [group_id]) VALUES (3, N'HE172581', 20223, N'MAE101', CAST(N'2022-09-06' AS Date), CAST(N'2022-11-10' AS Date), N'SE1753')
INSERT [dbo].[Enrollment] ([enrollment_id], [student_id], [semester_id], [course_id], [enrollment_start_date], [enrollment_end_date], [group_id]) VALUES (4, N'HE172581', 20223, N'PRF192', CAST(N'2022-09-06' AS Date), CAST(N'2022-11-08' AS Date), N'SE1753')
INSERT [dbo].[Enrollment] ([enrollment_id], [student_id], [semester_id], [course_id], [enrollment_start_date], [enrollment_end_date], [group_id]) VALUES (5, N'HE172581', 20231, N'MAD101', CAST(N'2023-01-03' AS Date), CAST(N'2023-03-24' AS Date), N'SE1749')
INSERT [dbo].[Enrollment] ([enrollment_id], [student_id], [semester_id], [course_id], [enrollment_start_date], [enrollment_end_date], [group_id]) VALUES (6, N'HE172581', 20231, N'OSG202', CAST(N'2023-01-05' AS Date), CAST(N'2023-03-23' AS Date), N'SE1754')
INSERT [dbo].[Enrollment] ([enrollment_id], [student_id], [semester_id], [course_id], [enrollment_start_date], [enrollment_end_date], [group_id]) VALUES (7, N'HE172581', 20231, N'PRO192', CAST(N'2023-01-05' AS Date), CAST(N'2023-03-23' AS Date), N'SE1754')
INSERT [dbo].[Enrollment] ([enrollment_id], [student_id], [semester_id], [course_id], [enrollment_start_date], [enrollment_end_date], [group_id]) VALUES (8, N'HE172581', 20232, N'CSD201', CAST(N'2023-05-08' AS Date), CAST(N'2023-07-20' AS Date), N'SE1753')
INSERT [dbo].[Enrollment] ([enrollment_id], [student_id], [semester_id], [course_id], [enrollment_start_date], [enrollment_end_date], [group_id]) VALUES (9, N'HE172581', 20232, N'DBI202', CAST(N'2023-05-08' AS Date), CAST(N'2023-07-20' AS Date), N'SE1753')
INSERT [dbo].[Enrollment] ([enrollment_id], [student_id], [semester_id], [course_id], [enrollment_start_date], [enrollment_end_date], [group_id]) VALUES (10, N'HE172581', 20233, N'IOT102', CAST(N'2023-09-06' AS Date), CAST(N'2023-10-04' AS Date), N'SE1753')
INSERT [dbo].[Enrollment] ([enrollment_id], [student_id], [semester_id], [course_id], [enrollment_start_date], [enrollment_end_date], [group_id]) VALUES (11, N'HE172581', 20233, N'MAS291', CAST(N'2023-09-05' AS Date), CAST(N'2023-11-10' AS Date), N'SE1753')
INSERT [dbo].[Enrollment] ([enrollment_id], [student_id], [semester_id], [course_id], [enrollment_start_date], [enrollment_end_date], [group_id]) VALUES (12, N'HE172581', 20233, N'PRJ301', CAST(N'2023-09-06' AS Date), CAST(N'2023-11-08' AS Date), N'SE1753')
INSERT [dbo].[Enrollment] ([enrollment_id], [student_id], [semester_id], [course_id], [enrollment_start_date], [enrollment_end_date], [group_id]) VALUES (13, N'HE172581', 20232, N'PRO192', CAST(N'2023-09-06' AS Date), CAST(N'2023-11-08' AS Date), N'SE1754')
SET IDENTITY_INSERT [dbo].[Enrollment] OFF
GO
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'AL', N'Active Learning')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'AS', N'Assignment')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'AS1', N'Assignment 1')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'AS2', N'Assignment 2')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'AS3', N'Assignment 3')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'CP', N'Computer Project')
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
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'PRJ', N'Project')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'PT1', N'Progress test 1')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'PT2', N'Progress test 2')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'PT3', N'Progress test 3')
INSERT [dbo].[Grade] ([grade_id], [grade_name]) VALUES (N'TT', N'Total')
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
INSERT [dbo].[Group] ([group_id], [group_name]) VALUES (N'SE1749', N'SE1749')
INSERT [dbo].[Group] ([group_id], [group_name]) VALUES (N'SE1750', N'SE1750')
INSERT [dbo].[Group] ([group_id], [group_name]) VALUES (N'SE1753', N'SE1753')
INSERT [dbo].[Group] ([group_id], [group_name]) VALUES (N'SE1754', N'SE1754')
GO
INSERT [dbo].[Major] ([major_id], [major_name]) VALUES (N'SE', N'Software Engineering')
GO
INSERT [dbo].[Major_Course] ([major_course_id], [major_id], [course_id], [semester_number], [credit]) VALUES (11, N'SE', N'CSI104', 1, 3)
INSERT [dbo].[Major_Course] ([major_course_id], [major_id], [course_id], [semester_number], [credit]) VALUES (12, N'SE', N'PRF192', 1, 3)
INSERT [dbo].[Major_Course] ([major_course_id], [major_id], [course_id], [semester_number], [credit]) VALUES (13, N'SE', N'MAE101', 1, 3)
INSERT [dbo].[Major_Course] ([major_course_id], [major_id], [course_id], [semester_number], [credit]) VALUES (14, N'SE', N'CEA201', 1, 3)
INSERT [dbo].[Major_Course] ([major_course_id], [major_id], [course_id], [semester_number], [credit]) VALUES (21, N'SE', N'PRO192', 2, 3)
INSERT [dbo].[Major_Course] ([major_course_id], [major_id], [course_id], [semester_number], [credit]) VALUES (22, N'SE', N'MAD101', 2, 3)
INSERT [dbo].[Major_Course] ([major_course_id], [major_id], [course_id], [semester_number], [credit]) VALUES (23, N'SE', N'OSG202', 2, 3)
INSERT [dbo].[Major_Course] ([major_course_id], [major_id], [course_id], [semester_number], [credit]) VALUES (31, N'SE', N'CSD201', 3, 3)
INSERT [dbo].[Major_Course] ([major_course_id], [major_id], [course_id], [semester_number], [credit]) VALUES (32, N'SE', N'DBI202', 3, 3)
INSERT [dbo].[Major_Course] ([major_course_id], [major_id], [course_id], [semester_number], [credit]) VALUES (41, N'SE', N'MAS291', 4, 3)
INSERT [dbo].[Major_Course] ([major_course_id], [major_id], [course_id], [semester_number], [credit]) VALUES (42, N'SE', N'IOT102', 4, 3)
INSERT [dbo].[Major_Course] ([major_course_id], [major_id], [course_id], [semester_number], [credit]) VALUES (43, N'SE', N'PRJ301', 4, 3)
INSERT [dbo].[Major_Course] ([major_course_id], [major_id], [course_id], [semester_number], [credit]) VALUES (51, N'SE', N'SWP391', 5, 3)
INSERT [dbo].[Major_Course] ([major_course_id], [major_id], [course_id], [semester_number], [credit]) VALUES (52, N'SE', N'ITE302c', 5, 3)
GO
SET IDENTITY_INSERT [dbo].[Score] ON 

INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (1, 1, N'CEA201_AS1', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (2, 1, N'CEA201_AS2', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (3, 1, N'CEA201_ASTT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (4, 1, N'CEA201_EX1', 0)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (6, 1, N'CEA201_EX2', 0)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (7, 1, N'CEA201_EX3', 0)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (8, 1, N'CEA201_EX4', 0)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (9, 1, N'CEA201_EXTT', 0)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (10, 1, N'CEA201_FE', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (11, 1, N'CEA201_FETT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (12, 1, N'CEA201_FER', NULL)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (13, 1, N'CEA201_FERTT', NULL)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (14, 2, N'CSI104_PRE1', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (15, 2, N'CSI104_PRE2', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (27, 2, N'CSI104_PRETT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (28, 2, N'CSI104_LAB1', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (29, 2, N'CSI104_LAB2', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (30, 2, N'CSI104_LABTT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (31, 2, N'CSI104_PT1', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (32, 2, N'CSI104_PT2', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (33, 2, N'CSI104_PTTT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (34, 2, N'CSI104_FE', 3)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (35, 2, N'CSI104_FETT', 3)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (36, 2, N'CSI104_FER', NULL)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (37, 2, N'CSI104_FERTT', NULL)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (38, 3, N'MAE101_AS1', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (39, 3, N'MAE101_AS2', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (40, 3, N'MAE101_AS3', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (41, 3, N'MAE101_ASTT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (42, 3, N'MAE101_PT1', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (43, 3, N'MAE101_PT2', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (44, 3, N'MAE101_PT3', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (45, 3, N'MAE101_PTTT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (46, 3, N'MAE101_FE', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (47, 3, N'MAE101_FETT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (48, 3, N'MAE101_FER', 3)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (49, 3, N'MAE101_FERTT', 3)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (50, 4, N'PRF192_AS', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (51, 4, N'PRF192_ASTT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (52, 4, N'PRF192_PT1', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (53, 4, N'PRF192_PT2', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (54, 4, N'PRF192_PTTT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (55, 4, N'PRF192_WS1', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (56, 4, N'PRF192_WS2', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (57, 4, N'PRF192_WS3', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (58, 4, N'PRF192_WS4', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (59, 4, N'PRF192_WS5', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (60, 4, N'PRF192_WS6', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (61, 4, N'PRF192_WS7', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (62, 4, N'PRF192_WS8', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (63, 4, N'PRF192_WSTT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (64, 4, N'PRF192_PE', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (65, 4, N'PRF192_PETT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (66, 4, N'PRF192_FE', 3)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (67, 4, N'PRF192_FETT', 3)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (68, 4, N'PRF192_FER', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (69, 4, N'PRF192_FERTT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (70, 5, N'MAD101_AS1', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (71, 5, N'MAD101_AS2', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (72, 5, N'MAD101_AS3', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (73, 5, N'MAD101_ASTT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (74, 5, N'MAD101_PT1', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (75, 5, N'MAD101_PT2', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (76, 5, N'MAD101_PT3', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (77, 5, N'MAD101_PTTT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (78, 5, N'MAD101_FE', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (79, 5, N'MAD101_FETT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (80, 5, N'MAD101_FER', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (81, 5, N'MAD101_FERTT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (82, 6, N'OSG202_LAB1', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (83, 6, N'OSG202_LAB2', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (84, 6, N'OSG202_LAB3', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (85, 6, N'OSG202_LAB4', 99)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (86, 6, N'OSG202_LABTT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (87, 6, N'OSG202_PRE', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (88, 6, N'OSG202_PRETT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (89, 6, N'OSG202_PT1', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (90, 6, N'OSG202_PT2', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (91, 6, N'OSG202_PTTT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (92, 6, N'OSG202_FE', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (93, 6, N'OSG202_FETT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (94, 6, N'OSG202_FER', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (95, 6, N'OSG202_FERTT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (96, 7, N'PRO192_LAB1', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (97, 7, N'PRO192_LAB2', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (98, 7, N'PRO192_LAB3', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (99, 7, N'PRO192_LAB4', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (100, 7, N'PRO192_LAB5', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (101, 7, N'PRO192_LAB6', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (102, 7, N'PRO192_LABTT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (103, 7, N'PRO192_PT1', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (104, 7, N'PRO192_PT2', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (105, 7, N'PRO192_PTTT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (106, 7, N'PRO192_AS', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (107, 7, N'PRO192_ASTT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (108, 7, N'PRO192_PE', 0)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (109, 7, N'PRO192_PETT', 0)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (110, 7, N'PRO192_FE', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (111, 7, N'PRO192_FETT', 9)
GO
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (112, 7, N'PRO192_FER', NULL)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (113, 7, N'PRO192_FERTT', NULL)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (114, 8, N'CSD201_AS1', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (115, 8, N'CSD201_AS2', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (116, 8, N'CSD201_ASTT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (117, 8, N'CSD201_PT1', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (118, 8, N'CSD201_PT2', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (119, 8, N'CSD201_PTTT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (120, 8, N'CSD201_PE', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (121, 8, N'CSD201_PETT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (122, 8, N'CSD201_FE', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (123, 8, N'CSD201_FETT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (124, 8, N'CSD201_FER', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (125, 8, N'CSD201_FERTT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (126, 9, N'DBI202_LAB1', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (127, 9, N'DBI202_LAB2', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (128, 9, N'DBI202_LAB3', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (129, 9, N'DBI202_LAB4', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (130, 9, N'DBI202_LAB5', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (131, 9, N'DBI202_LABTT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (132, 9, N'DBI202_PT1', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (133, 9, N'DBI202_PT2', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (134, 9, N'DBI202_PTTT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (135, 9, N'DBI202_AS', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (136, 9, N'DBI202_ASTT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (137, 9, N'DBI202_PE', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (138, 9, N'DBI202_PETT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (139, 9, N'DBI202_FE', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (140, 9, N'DBI202_FETT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (141, 9, N'DBI202_FER', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (142, 9, N'DBI202_FERTT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (143, 10, N'IOT102_AL', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (144, 10, N'IOT102_ALTT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (145, 10, N'IOT102_EX1', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (146, 10, N'IOT102_EX2', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (147, 10, N'IOT102_EXTT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (148, 10, N'IOT102_PRE', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (149, 10, N'IOT102_PRETT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (150, 10, N'IOT102_PRJ', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (151, 10, N'IOT102_PRJTT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (152, 10, N'IOT102_FE', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (153, 10, N'IOT102_FETT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (154, 10, N'IOT102_FER', NULL)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (155, 10, N'IOT102_FERTT', NULL)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (156, 11, N'MAS291_CP', NULL)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (157, 11, N'MAS291_CPTT', NULL)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (158, 11, N'MAS291_AS1', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (159, 11, N'MAS291_AS2', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (160, 11, N'MAS291_ASTT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (161, 11, N'MAS291_PT1', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (162, 11, N'MAS291_PT2', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (163, 11, N'MAS291_PT3', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (164, 11, N'MAS291_PTTT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (165, 11, N'MAS291_FE', NULL)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (166, 11, N'MAS291_FETT', NULL)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (167, 11, N'MAS291_FER', NULL)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (168, 11, N'MAS291_FERTT', NULL)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (169, 12, N'PRJ301_PT1', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (170, 12, N'PRJ301_PT1TT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (171, 12, N'PRJ301_PT2', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (172, 12, N'PRJ301_PT2TT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (173, 12, N'PRJ301_WS1', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (174, 12, N'PRJ301_WS1TT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (175, 12, N'PRJ301_WS2', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (176, 12, N'PRJ301_WS2TT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (177, 12, N'PRJ301_PE', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (178, 12, N'PRJ301_PETT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (179, 12, N'PRJ301_AS', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (180, 12, N'PRJ301_ASTT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (181, 12, N'PRJ301_FE', NULL)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (182, 12, N'PRJ301_FETT', NULL)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (183, 12, N'PRJ301_FER', NULL)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (184, 12, N'PRJ301_FERTT', NULL)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (185, 13, N'PRO192_LAB1', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (186, 13, N'PRO192_LAB2', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (187, 13, N'PRO192_LAB3', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (188, 13, N'PRO192_LAB4', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (189, 13, N'PRO192_LAB5', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (190, 13, N'PRO192_LAB6', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (191, 13, N'PRO192_LABTT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (192, 13, N'PRO192_PT1', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (193, 13, N'PRO192_PT2', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (194, 13, N'PRO192_PTTT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (195, 13, N'PRO192_AS', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (196, 13, N'PRO192_ASTT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (197, 13, N'PRO192_PE', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (198, 13, N'PRO192_PETT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (199, 13, N'PRO192_FE', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (200, 13, N'PRO192_FETT', 9)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (201, 13, N'PRO192_FER', NULL)
INSERT [dbo].[Score] ([score_id], [enrollment_id], [course_grade_id], [score]) VALUES (202, 13, N'PRO192_FERTT', NULL)
SET IDENTITY_INSERT [dbo].[Score] OFF
GO
INSERT [dbo].[Semester] ([semester_id], [semester_name]) VALUES (20223, N'Fall2022')
INSERT [dbo].[Semester] ([semester_id], [semester_name]) VALUES (20231, N'Spring2023')
INSERT [dbo].[Semester] ([semester_id], [semester_name]) VALUES (20232, N'Summer2023')
INSERT [dbo].[Semester] ([semester_id], [semester_name]) VALUES (20233, N'Fall2023')
GO
INSERT [dbo].[Student] ([student_id], [student_name], [student_gender], [student_dob], [student_email], [major_id], [campus_id]) VALUES (N'HE172581', N'Bạch Đức Thản', 1, CAST(N'2003-09-03' AS Date), N'thanbdhe172581@fpt.edu.vn', N'SE', N'HL')
INSERT [dbo].[Student] ([student_id], [student_name], [student_gender], [student_dob], [student_email], [major_id], [campus_id]) VALUES (N'testid', N'testname', 1, CAST(N'2003-09-03' AS Date), N'', N'SE', N'CT')
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
