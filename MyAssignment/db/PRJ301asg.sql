USE [master]
GO
/****** Object:  Database [MyAssignmentDB]    Script Date: 10/11/2023 4:28:07 AM ******/
CREATE DATABASE [MyAssignmentDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyAssignmentDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MyAssignmentDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyAssignmentDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MyAssignmentDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MyAssignmentDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyAssignmentDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyAssignmentDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyAssignmentDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyAssignmentDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyAssignmentDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyAssignmentDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyAssignmentDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyAssignmentDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyAssignmentDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyAssignmentDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyAssignmentDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyAssignmentDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyAssignmentDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyAssignmentDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyAssignmentDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyAssignmentDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyAssignmentDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyAssignmentDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyAssignmentDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyAssignmentDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyAssignmentDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyAssignmentDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyAssignmentDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyAssignmentDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MyAssignmentDB] SET  MULTI_USER 
GO
ALTER DATABASE [MyAssignmentDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyAssignmentDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyAssignmentDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyAssignmentDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyAssignmentDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MyAssignmentDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MyAssignmentDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [MyAssignmentDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MyAssignmentDB]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 10/11/2023 4:28:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [nchar](100) NOT NULL,
	[password] [nchar](100) NOT NULL,
	[displayname] [nchar](100) NOT NULL,
	[student_id] [nchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 10/11/2023 4:28:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[course_id] [nchar](10) NOT NULL,
	[course_name] [nchar](100) NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrollment]    Script Date: 10/11/2023 4:28:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollment](
	[enrollment_id] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [nchar](10) NOT NULL,
	[student_id] [nchar](10) NOT NULL,
	[enrollment_semester_name] [nchar](100) NOT NULL,
	[enrollment_semester_id] [int] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[enrollment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 10/11/2023 4:28:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade](
	[grade_id] [int] IDENTITY(1,1) NOT NULL,
	[enrollment_id] [int] NOT NULL,
	[grade_PT1] [float] NOT NULL,
	[grade_PT2] [float] NOT NULL,
	[grade_asignment] [float] NOT NULL,
	[grade_lab1] [float] NOT NULL,
	[grade_lab2] [float] NOT NULL,
	[grade_lab3] [float] NOT NULL,
	[grade_lab4] [float] NOT NULL,
	[grade_lab5] [float] NOT NULL,
	[grade_PE] [float] NOT NULL,
	[grade_FE] [float] NOT NULL,
 CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED 
(
	[grade_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 10/11/2023 4:28:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[student_id] [nchar](10) NOT NULL,
	[student_name] [nchar](100) NOT NULL,
	[student_gender] [nchar](10) NOT NULL,
	[student_dob] [date] NULL,
	[student_email] [nchar](100) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [password], [displayname], [student_id]) VALUES (N'thanbdhe172581                                                                                      ', N'123                                                                                                 ', N'thanbdhe172581                                                                                      ', N'HE172581  ')
GO
INSERT [dbo].[Course] ([course_id], [course_name]) VALUES (N'CSD201    ', N'Data Structures and Algorithms                                                                      ')
INSERT [dbo].[Course] ([course_id], [course_name]) VALUES (N'DBI202    ', N'Introduction to Databases                                                                           ')
INSERT [dbo].[Course] ([course_id], [course_name]) VALUES (N'MAD101    ', N'Discrete mathematics                                                                                ')
INSERT [dbo].[Course] ([course_id], [course_name]) VALUES (N'PRO192    ', N'Object-Oriented Programming                                                                         ')
GO
SET IDENTITY_INSERT [dbo].[Enrollment] ON 

INSERT [dbo].[Enrollment] ([enrollment_id], [course_id], [student_id], [enrollment_semester_name], [enrollment_semester_id]) VALUES (3, N'PRO192    ', N'HE172581  ', N'Spring2023                                                                                          ', 20231)
INSERT [dbo].[Enrollment] ([enrollment_id], [course_id], [student_id], [enrollment_semester_name], [enrollment_semester_id]) VALUES (4, N'CSD201    ', N'HE172581  ', N'Summer2023                                                                                          ', 20232)
INSERT [dbo].[Enrollment] ([enrollment_id], [course_id], [student_id], [enrollment_semester_name], [enrollment_semester_id]) VALUES (5, N'DBI202    ', N'HE172581  ', N'Summer2023                                                                                          ', 20232)
SET IDENTITY_INSERT [dbo].[Enrollment] OFF
GO
SET IDENTITY_INSERT [dbo].[Grade] ON 

INSERT [dbo].[Grade] ([grade_id], [enrollment_id], [grade_PT1], [grade_PT2], [grade_asignment], [grade_lab1], [grade_lab2], [grade_lab3], [grade_lab4], [grade_lab5], [grade_PE], [grade_FE]) VALUES (1, 3, 6, 8, 5, 4, 6, 7, 9, 8, 10, 10)
INSERT [dbo].[Grade] ([grade_id], [enrollment_id], [grade_PT1], [grade_PT2], [grade_asignment], [grade_lab1], [grade_lab2], [grade_lab3], [grade_lab4], [grade_lab5], [grade_PE], [grade_FE]) VALUES (2, 4, 4, 2, 4, 6, 8, 7, 3, 8, 6, 10)
INSERT [dbo].[Grade] ([grade_id], [enrollment_id], [grade_PT1], [grade_PT2], [grade_asignment], [grade_lab1], [grade_lab2], [grade_lab3], [grade_lab4], [grade_lab5], [grade_PE], [grade_FE]) VALUES (3, 5, 10, 9, 7, 8, 2, 4, 6, 5, 10, 8)
SET IDENTITY_INSERT [dbo].[Grade] OFF
GO
INSERT [dbo].[Student] ([student_id], [student_name], [student_gender], [student_dob], [student_email]) VALUES (N'HE172581  ', N'Bach Duc Than                                                                                       ', N'1         ', NULL, NULL)
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Student] FOREIGN KEY([student_id])
REFERENCES [dbo].[Student] ([student_id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Student]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Course] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([course_id])
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Course]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Student] FOREIGN KEY([student_id])
REFERENCES [dbo].[Student] ([student_id])
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Student]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_Enrollment] FOREIGN KEY([enrollment_id])
REFERENCES [dbo].[Enrollment] ([enrollment_id])
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_Enrollment]
GO
USE [master]
GO
ALTER DATABASE [MyAssignmentDB] SET  READ_WRITE 
GO
