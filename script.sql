USE [master]
GO
/****** Object:  Database [pruebaTak]    Script Date: 20/08/2021 11:48:18 ******/
CREATE DATABASE [pruebaTak]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pruebaTak', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\pruebaTak.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'pruebaTak_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\pruebaTak_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [pruebaTak] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pruebaTak].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pruebaTak] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pruebaTak] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pruebaTak] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pruebaTak] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pruebaTak] SET ARITHABORT OFF 
GO
ALTER DATABASE [pruebaTak] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [pruebaTak] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pruebaTak] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pruebaTak] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pruebaTak] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pruebaTak] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pruebaTak] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pruebaTak] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pruebaTak] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pruebaTak] SET  DISABLE_BROKER 
GO
ALTER DATABASE [pruebaTak] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pruebaTak] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pruebaTak] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [pruebaTak] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [pruebaTak] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pruebaTak] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pruebaTak] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [pruebaTak] SET RECOVERY FULL 
GO
ALTER DATABASE [pruebaTak] SET  MULTI_USER 
GO
ALTER DATABASE [pruebaTak] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pruebaTak] SET DB_CHAINING OFF 
GO
ALTER DATABASE [pruebaTak] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [pruebaTak] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [pruebaTak] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [pruebaTak] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'pruebaTak', N'ON'
GO
ALTER DATABASE [pruebaTak] SET QUERY_STORE = OFF
GO
USE [pruebaTak]
GO
/****** Object:  Table [dbo].[tb_colaboradores]    Script Date: 20/08/2021 11:48:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_colaboradores](
	[id] [int] NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[apellido] [nvarchar](50) NULL,
	[fecha_nacimiento] [date] NULL,
	[estado_civil] [nchar](10) NULL,
	[grado_academico] [nvarchar](50) NULL,
 CONSTRAINT [PK_tb_colaboradores] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_colaboradores_direccion]    Script Date: 20/08/2021 11:48:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_colaboradores_direccion](
	[id] [int] NOT NULL,
	[id_colaborador] [int] NULL,
	[id_direccion] [int] NULL,
 CONSTRAINT [PK_tb_colaboradores_direccion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_departamentos]    Script Date: 20/08/2021 11:48:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_departamentos](
	[id] [int] NOT NULL,
	[descrip_departamento] [nvarchar](50) NULL,
	[id_pais] [int] NULL,
 CONSTRAINT [PK_tb_departamentos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_direcciones]    Script Date: 20/08/2021 11:48:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_direcciones](
	[id] [int] NOT NULL,
	[id_pais] [int] NULL,
	[id_departamento] [int] NULL,
	[id_municipio] [int] NULL,
	[direccion] [nvarchar](50) NULL,
 CONSTRAINT [PK_tb_direcciones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_municipios]    Script Date: 20/08/2021 11:48:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_municipios](
	[id] [int] NOT NULL,
	[descrip_municipios] [nvarchar](50) NULL,
	[id_departamento] [int] NULL,
 CONSTRAINT [PK_tb_municipios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_pais]    Script Date: 20/08/2021 11:48:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_pais](
	[id] [int] NOT NULL,
	[descrip_pais] [nvarchar](50) NULL,
 CONSTRAINT [PK_tb_pais] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tb_colaboradores_direccion]  WITH CHECK ADD  CONSTRAINT [FK_tb_colaboradores_direccion_tb_colaboradores] FOREIGN KEY([id_colaborador])
REFERENCES [dbo].[tb_colaboradores] ([id])
GO
ALTER TABLE [dbo].[tb_colaboradores_direccion] CHECK CONSTRAINT [FK_tb_colaboradores_direccion_tb_colaboradores]
GO
ALTER TABLE [dbo].[tb_colaboradores_direccion]  WITH CHECK ADD  CONSTRAINT [FK_tb_colaboradores_direccion_tb_direcciones] FOREIGN KEY([id_direccion])
REFERENCES [dbo].[tb_direcciones] ([id])
GO
ALTER TABLE [dbo].[tb_colaboradores_direccion] CHECK CONSTRAINT [FK_tb_colaboradores_direccion_tb_direcciones]
GO
ALTER TABLE [dbo].[tb_departamentos]  WITH CHECK ADD  CONSTRAINT [FK_tb_departamentos_tb_pais] FOREIGN KEY([id_pais])
REFERENCES [dbo].[tb_pais] ([id])
GO
ALTER TABLE [dbo].[tb_departamentos] CHECK CONSTRAINT [FK_tb_departamentos_tb_pais]
GO
ALTER TABLE [dbo].[tb_direcciones]  WITH CHECK ADD  CONSTRAINT [FK_tb_direcciones_tb_departamentos] FOREIGN KEY([id_departamento])
REFERENCES [dbo].[tb_departamentos] ([id])
GO
ALTER TABLE [dbo].[tb_direcciones] CHECK CONSTRAINT [FK_tb_direcciones_tb_departamentos]
GO
ALTER TABLE [dbo].[tb_direcciones]  WITH CHECK ADD  CONSTRAINT [FK_tb_direcciones_tb_municipios] FOREIGN KEY([id_municipio])
REFERENCES [dbo].[tb_municipios] ([id])
GO
ALTER TABLE [dbo].[tb_direcciones] CHECK CONSTRAINT [FK_tb_direcciones_tb_municipios]
GO
ALTER TABLE [dbo].[tb_direcciones]  WITH CHECK ADD  CONSTRAINT [FK_tb_direcciones_tb_pais] FOREIGN KEY([id_pais])
REFERENCES [dbo].[tb_pais] ([id])
GO
ALTER TABLE [dbo].[tb_direcciones] CHECK CONSTRAINT [FK_tb_direcciones_tb_pais]
GO
ALTER TABLE [dbo].[tb_municipios]  WITH CHECK ADD  CONSTRAINT [FK_tb_municipios_tb_departamentos] FOREIGN KEY([id_departamento])
REFERENCES [dbo].[tb_departamentos] ([id])
GO
ALTER TABLE [dbo].[tb_municipios] CHECK CONSTRAINT [FK_tb_municipios_tb_departamentos]
GO
USE [master]
GO
ALTER DATABASE [pruebaTak] SET  READ_WRITE 
GO
