USE [master]
GO
/****** Object:  Database [TestNexosDB]    Script Date: 2/09/2021 12:09:48 a. m. ******/
CREATE DATABASE [TestNexosDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestNexosDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TestNexosDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestNexosDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TestNexosDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TestNexosDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestNexosDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestNexosDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestNexosDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestNexosDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestNexosDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestNexosDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestNexosDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestNexosDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestNexosDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestNexosDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestNexosDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestNexosDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestNexosDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestNexosDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestNexosDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestNexosDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestNexosDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestNexosDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestNexosDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestNexosDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestNexosDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestNexosDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestNexosDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestNexosDB] SET RECOVERY FULL 
GO
ALTER DATABASE [TestNexosDB] SET  MULTI_USER 
GO
ALTER DATABASE [TestNexosDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestNexosDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestNexosDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestNexosDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TestNexosDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TestNexosDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TestNexosDB', N'ON'
GO
ALTER DATABASE [TestNexosDB] SET QUERY_STORE = OFF
GO
USE [TestNexosDB]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 2/09/2021 12:09:48 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[DateOfBirth] [nvarchar](max) NULL,
	[CityOfOrigin] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 2/09/2021 12:09:48 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ano] [nvarchar](max) NULL,
	[titulo] [nvarchar](max) NULL,
	[genero] [nvarchar](max) NULL,
	[NumPaginas] [int] NOT NULL,
	[PublisherId] [int] NOT NULL,
	[AuthorId] [int] NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 2/09/2021 12:09:48 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publisher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CorrespondenceAddress] [nvarchar](max) NULL,
	[Telephone] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[MaximumBooksRegistered] [int] NOT NULL,
 CONSTRAINT [PK_Publisher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_Books_AuthorId]    Script Date: 2/09/2021 12:09:48 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_Books_AuthorId] ON [dbo].[Books]
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Books_PublisherId]    Script Date: 2/09/2021 12:09:48 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_Books_PublisherId] ON [dbo].[Books]
(
	[PublisherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Authors_AuthorId] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Authors] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Authors_AuthorId]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Publisher_PublisherId] FOREIGN KEY([PublisherId])
REFERENCES [dbo].[Publisher] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Publisher_PublisherId]
GO
USE [master]
GO
ALTER DATABASE [TestNexosDB] SET  READ_WRITE 
GO
