USE [master]
GO
/****** Object:  Database [MyAssignmentDB1]    Script Date: 10/22/2023 6:09:35 PM ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 10/22/2023 6:09:35 PM ******/
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
/****** Object:  Table [dbo].[Campus]    Script Date: 10/22/2023 6:09:35 PM ******/
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
/****** Object:  Table [dbo].[Course]    Script Date: 10/22/2023 6:09:35 PM ******/
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
/****** Object:  Table [dbo].[Course_Grade]    Script Date: 10/22/2023 6:09:35 PM ******/
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
/****** Object:  Table [dbo].[Enrollment]    Script Date: 10/22/2023 6:09:35 PM ******/
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
/****** Object:  Table [dbo].[Grade]    Script Date: 10/22/2023 6:09:35 PM ******/
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
/****** Object:  Table [dbo].[Group]    Script Date: 10/22/2023 6:09:35 PM ******/
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
/****** Object:  Table [dbo].[Major]    Script Date: 10/22/2023 6:09:35 PM ******/
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
/****** Object:  Table [dbo].[Major_Course]    Script Date: 10/22/2023 6:09:35 PM ******/
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
/****** Object:  Table [dbo].[Score]    Script Date: 10/22/2023 6:09:35 PM ******/
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
/****** Object:  Table [dbo].[Semester]    Script Date: 10/22/2023 6:09:35 PM ******/
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
/****** Object:  Table [dbo].[Student]    Script Date: 10/22/2023 6:09:35 PM ******/
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
