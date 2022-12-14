USE [master]
GO
/****** Object:  Database [SheCodeHackathon2022]    Script Date: 11-Sep-22 10:55:20 AM ******/
CREATE DATABASE [SheCodeHackathon2022]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SheCodeHackathon2022', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SheCodeHackathon2022.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SheCodeHackathon2022_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SheCodeHackathon2022_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SheCodeHackathon2022] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SheCodeHackathon2022].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SheCodeHackathon2022] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SheCodeHackathon2022] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SheCodeHackathon2022] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SheCodeHackathon2022] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SheCodeHackathon2022] SET ARITHABORT OFF 
GO
ALTER DATABASE [SheCodeHackathon2022] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SheCodeHackathon2022] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SheCodeHackathon2022] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SheCodeHackathon2022] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SheCodeHackathon2022] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SheCodeHackathon2022] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SheCodeHackathon2022] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SheCodeHackathon2022] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SheCodeHackathon2022] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SheCodeHackathon2022] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SheCodeHackathon2022] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SheCodeHackathon2022] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SheCodeHackathon2022] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SheCodeHackathon2022] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SheCodeHackathon2022] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SheCodeHackathon2022] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SheCodeHackathon2022] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SheCodeHackathon2022] SET RECOVERY FULL 
GO
ALTER DATABASE [SheCodeHackathon2022] SET  MULTI_USER 
GO
ALTER DATABASE [SheCodeHackathon2022] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SheCodeHackathon2022] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SheCodeHackathon2022] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SheCodeHackathon2022] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SheCodeHackathon2022] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SheCodeHackathon2022] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SheCodeHackathon2022', N'ON'
GO
ALTER DATABASE [SheCodeHackathon2022] SET QUERY_STORE = OFF
GO
USE [SheCodeHackathon2022]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 11-Sep-22 10:55:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[name] [nvarchar](50) NULL,
	[ProjectID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectComment]    Script Date: 11-Sep-22 10:55:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectComment](
	[comment] [text] NULL,
	[DateTime] [datetime] NULL,
	[ProjectID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 11-Sep-22 10:55:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[color] [nvarchar](10) NULL,
	[Date] [date] NULL,
	[UserID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SectionComment]    Script Date: 11-Sep-22 10:55:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SectionComment](
	[comment] [text] NULL,
	[DateTime] [datetime] NULL,
	[SectionID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sections]    Script Date: 11-Sep-22 10:55:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sections](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[Date] [date] NULL,
	[ProjectID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 11-Sep-22 10:55:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task2]    Script Date: 11-Sep-22 10:55:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task2](
	[taskid] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[StartDate] [date] NULL,
	[DueDate] [date] NULL,
	[Description] [nvarchar](2000) NULL,
	[priority] [int] NULL,
	[SectionID] [int] NULL,
	[image] [nvarchar](50) NULL,
	[UserID] [int] NULL,
	[ProjectID] [int] NULL,
	[status] [nvarchar](20) NULL,
 CONSTRAINT [PK_Task2] PRIMARY KEY CLUSTERED 
(
	[taskid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskComment]    Script Date: 11-Sep-22 10:55:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskComment](
	[comment] [text] NULL,
	[DateTime] [datetime] NULL,
	[TaskID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 11-Sep-22 10:55:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[StartDate] [date] NULL,
	[DueDate] [date] NULL,
	[Description] [nvarchar](2000) NULL,
	[priority] [int] NULL,
	[status] [nvarchar](20) NULL,
	[SectionID] [int] NULL,
	[ProjectID] [int] NULL,
	[UserID] [int] NULL,
	[image] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskTag]    Script Date: 11-Sep-22 10:55:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskTag](
	[TaskID] [int] NULL,
	[TagName] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11-Sep-22 10:55:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
	[id] [int] NOT NULL,
	[pass] [nvarchar](50) NULL,
	[GMT] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Permission]  WITH CHECK ADD FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([id])
GO
ALTER TABLE [dbo].[ProjectComment]  WITH CHECK ADD FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([id])
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[SectionComment]  WITH CHECK ADD FOREIGN KEY([SectionID])
REFERENCES [dbo].[Sections] ([id])
GO
ALTER TABLE [dbo].[Sections]  WITH CHECK ADD FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([id])
GO
ALTER TABLE [dbo].[TaskComment]  WITH CHECK ADD FOREIGN KEY([TaskID])
REFERENCES [dbo].[Tasks] ([id])
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([id])
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD FOREIGN KEY([SectionID])
REFERENCES [dbo].[Sections] ([id])
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[TaskTag]  WITH CHECK ADD FOREIGN KEY([TagName])
REFERENCES [dbo].[Tags] ([name])
GO
ALTER TABLE [dbo].[TaskTag]  WITH CHECK ADD FOREIGN KEY([TaskID])
REFERENCES [dbo].[Tasks] ([id])
GO
USE [master]
GO
ALTER DATABASE [SheCodeHackathon2022] SET  READ_WRITE 
GO
