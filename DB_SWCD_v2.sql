USE [master]
GO
/****** Object:  Database [DB_SWCD]    Script Date: 15/12/2021 00:41:45 ******/
CREATE DATABASE [DB_SWCD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_SWCD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB_SWCD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_SWCD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB_SWCD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DB_SWCD] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_SWCD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_SWCD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_SWCD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_SWCD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_SWCD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_SWCD] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_SWCD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_SWCD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_SWCD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_SWCD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_SWCD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_SWCD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_SWCD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_SWCD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_SWCD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_SWCD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_SWCD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_SWCD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_SWCD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_SWCD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_SWCD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_SWCD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_SWCD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_SWCD] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_SWCD] SET  MULTI_USER 
GO
ALTER DATABASE [DB_SWCD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_SWCD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_SWCD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_SWCD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_SWCD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_SWCD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_SWCD', N'ON'
GO
ALTER DATABASE [DB_SWCD] SET QUERY_STORE = OFF
GO
USE [DB_SWCD]
GO
/****** Object:  Table [dbo].[Cita]    Script Date: 15/12/2021 00:41:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cita](
	[CitaID] [int] IDENTITY(1,1) NOT NULL,
	[FechaAtencion] [date] NULL,
	[InicioAtencion] [time](7) NULL,
	[FinAtencion] [time](7) NULL,
	[Obervacion] [nchar](1000) NULL,
	[MedicoID] [int] NOT NULL,
	[PacienteID] [int] NOT NULL,
	[UsusarioID] [int] NOT NULL,
	[EstadoCitaID] [int] NOT NULL,
 CONSTRAINT [PK_Cita] PRIMARY KEY CLUSTERED 
(
	[CitaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 15/12/2021 00:41:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[EmpleadoID] [int] NOT NULL,
	[Dni] [nchar](8) NULL,
	[Nombre] [nchar](300) NULL,
	[Telefono] [nchar](9) NULL,
	[Email] [nchar](200) NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[EmpleadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado_Cita]    Script Date: 15/12/2021 00:41:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado_Cita](
	[EstadoCitaID] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Estado_Cita] PRIMARY KEY CLUSTERED 
(
	[EstadoCitaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medico]    Script Date: 15/12/2021 00:41:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medico](
	[MedicoID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](30) NOT NULL,
	[Apellido] [nchar](30) NOT NULL,
	[Telefono] [nchar](9) NULL,
	[Email] [nchar](50) NOT NULL,
	[Dni] [nchar](10) NOT NULL,
	[UsuarioID] [int] NOT NULL,
 CONSTRAINT [PK_Medico] PRIMARY KEY CLUSTERED 
(
	[MedicoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 15/12/2021 00:41:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[PacienteID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](50) NOT NULL,
	[Apellido] [nchar](200) NOT NULL,
	[Direccion] [nchar](200) NULL,
	[Telefono] [nchar](9) NULL,
	[Email] [nchar](200) NULL,
	[Dni] [nchar](8) NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[PacienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfil]    Script Date: 15/12/2021 00:41:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfil](
	[PerfilID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](30) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Perfil] PRIMARY KEY CLUSTERED 
(
	[PerfilID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receta]    Script Date: 15/12/2021 00:41:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receta](
	[RecetaID] [int] IDENTITY(1,1) NOT NULL,
	[Medicamento] [nchar](200) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Dosis] [nchar](100) NOT NULL,
	[CitaID] [int] NOT NULL,
	[Frecuencia] [nchar](100) NOT NULL,
	[Duracion] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Receta] PRIMARY KEY CLUSTERED 
(
	[RecetaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 15/12/2021 00:41:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[UsarioID] [int] IDENTITY(1,1) NOT NULL,
	[PerfilID] [int] NOT NULL,
	[Usuario] [nchar](30) NULL,
	[Clave] [nchar](10) NULL,
	[Estado] [bit] NULL,
	[Nombre] [nchar](80) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[UsarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cita] ON 

INSERT [dbo].[Cita] ([CitaID], [FechaAtencion], [InicioAtencion], [FinAtencion], [Obervacion], [MedicoID], [PacienteID], [UsusarioID], [EstadoCitaID]) VALUES (4, CAST(N'2021-11-08' AS Date), CAST(N'22:30:00' AS Time), CAST(N'23:30:00' AS Time), N'limpieza bucal                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ', 2, 1, 2, 1)
INSERT [dbo].[Cita] ([CitaID], [FechaAtencion], [InicioAtencion], [FinAtencion], [Obervacion], [MedicoID], [PacienteID], [UsusarioID], [EstadoCitaID]) VALUES (5, CAST(N'2021-11-08' AS Date), CAST(N'21:30:00' AS Time), CAST(N'22:30:00' AS Time), N'curaciones                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ', 2, 1, 2, 1)
INSERT [dbo].[Cita] ([CitaID], [FechaAtencion], [InicioAtencion], [FinAtencion], [Obervacion], [MedicoID], [PacienteID], [UsusarioID], [EstadoCitaID]) VALUES (13, CAST(N'2021-11-27' AS Date), CAST(N'20:00:00' AS Time), CAST(N'20:30:00' AS Time), NULL, 1, 1, 1, 2)
INSERT [dbo].[Cita] ([CitaID], [FechaAtencion], [InicioAtencion], [FinAtencion], [Obervacion], [MedicoID], [PacienteID], [UsusarioID], [EstadoCitaID]) VALUES (14, CAST(N'2021-11-27' AS Date), CAST(N'17:00:00' AS Time), CAST(N'17:30:00' AS Time), NULL, 1, 1, 1, 3)
INSERT [dbo].[Cita] ([CitaID], [FechaAtencion], [InicioAtencion], [FinAtencion], [Obervacion], [MedicoID], [PacienteID], [UsusarioID], [EstadoCitaID]) VALUES (15, CAST(N'2021-11-27' AS Date), CAST(N'16:00:00' AS Time), CAST(N'16:30:00' AS Time), N'Dolor de muela                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ', 1, 1, 1, 2)
INSERT [dbo].[Cita] ([CitaID], [FechaAtencion], [InicioAtencion], [FinAtencion], [Obervacion], [MedicoID], [PacienteID], [UsusarioID], [EstadoCitaID]) VALUES (16, CAST(N'2021-11-27' AS Date), CAST(N'19:00:00' AS Time), CAST(N'19:30:00' AS Time), N'Extraccion                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ', 2, 2, 1, 2)
INSERT [dbo].[Cita] ([CitaID], [FechaAtencion], [InicioAtencion], [FinAtencion], [Obervacion], [MedicoID], [PacienteID], [UsusarioID], [EstadoCitaID]) VALUES (17, CAST(N'2021-11-27' AS Date), CAST(N'12:00:00' AS Time), CAST(N'12:30:00' AS Time), N'Enjuague                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', 2, 3, 1, 2)
INSERT [dbo].[Cita] ([CitaID], [FechaAtencion], [InicioAtencion], [FinAtencion], [Obervacion], [MedicoID], [PacienteID], [UsusarioID], [EstadoCitaID]) VALUES (18, CAST(N'2021-11-27' AS Date), CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 2, 5, 1, 2)
INSERT [dbo].[Cita] ([CitaID], [FechaAtencion], [InicioAtencion], [FinAtencion], [Obervacion], [MedicoID], [PacienteID], [UsusarioID], [EstadoCitaID]) VALUES (19, CAST(N'2021-11-27' AS Date), CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 2, 5, 1, 1)
INSERT [dbo].[Cita] ([CitaID], [FechaAtencion], [InicioAtencion], [FinAtencion], [Obervacion], [MedicoID], [PacienteID], [UsusarioID], [EstadoCitaID]) VALUES (20, CAST(N'2021-11-27' AS Date), CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), N'Curacion                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', 2, 4, 2, 1)
INSERT [dbo].[Cita] ([CitaID], [FechaAtencion], [InicioAtencion], [FinAtencion], [Obervacion], [MedicoID], [PacienteID], [UsusarioID], [EstadoCitaID]) VALUES (21, CAST(N'2021-11-27' AS Date), CAST(N'10:00:00' AS Time), CAST(N'10:30:00' AS Time), NULL, 1, 3, 2, 1)
INSERT [dbo].[Cita] ([CitaID], [FechaAtencion], [InicioAtencion], [FinAtencion], [Obervacion], [MedicoID], [PacienteID], [UsusarioID], [EstadoCitaID]) VALUES (22, CAST(N'2021-11-27' AS Date), CAST(N'08:00:00' AS Time), CAST(N'08:30:00' AS Time), N'Lavado                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', 2, 5, 1, 1)
INSERT [dbo].[Cita] ([CitaID], [FechaAtencion], [InicioAtencion], [FinAtencion], [Obervacion], [MedicoID], [PacienteID], [UsusarioID], [EstadoCitaID]) VALUES (23, CAST(N'2021-11-27' AS Date), CAST(N'09:00:00' AS Time), CAST(N'09:30:00' AS Time), N'Limpieza                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', 2, 4, 1, 1)
INSERT [dbo].[Cita] ([CitaID], [FechaAtencion], [InicioAtencion], [FinAtencion], [Obervacion], [MedicoID], [PacienteID], [UsusarioID], [EstadoCitaID]) VALUES (24, CAST(N'2021-11-27' AS Date), CAST(N'11:00:00' AS Time), CAST(N'11:30:00' AS Time), N'Extraccion                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ', 2, 1, 2, 1)
INSERT [dbo].[Cita] ([CitaID], [FechaAtencion], [InicioAtencion], [FinAtencion], [Obervacion], [MedicoID], [PacienteID], [UsusarioID], [EstadoCitaID]) VALUES (25, CAST(N'2021-11-29' AS Date), CAST(N'08:00:00' AS Time), CAST(N'08:30:00' AS Time), N'Reevalucación                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ', 2, 5, 1, 2)
INSERT [dbo].[Cita] ([CitaID], [FechaAtencion], [InicioAtencion], [FinAtencion], [Obervacion], [MedicoID], [PacienteID], [UsusarioID], [EstadoCitaID]) VALUES (26, CAST(N'2021-11-29' AS Date), CAST(N'09:00:00' AS Time), CAST(N'09:30:00' AS Time), N'Diagnostico                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', 2, 4, 1, 2)
INSERT [dbo].[Cita] ([CitaID], [FechaAtencion], [InicioAtencion], [FinAtencion], [Obervacion], [MedicoID], [PacienteID], [UsusarioID], [EstadoCitaID]) VALUES (27, CAST(N'2021-11-29' AS Date), CAST(N'10:00:00' AS Time), CAST(N'10:30:00' AS Time), N'Curaciones                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ', 1, 2, 1, 2)
INSERT [dbo].[Cita] ([CitaID], [FechaAtencion], [InicioAtencion], [FinAtencion], [Obervacion], [MedicoID], [PacienteID], [UsusarioID], [EstadoCitaID]) VALUES (28, CAST(N'2021-11-29' AS Date), CAST(N'11:00:00' AS Time), CAST(N'11:30:00' AS Time), N'Limpieza                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', 2, 1, 1, 2)
INSERT [dbo].[Cita] ([CitaID], [FechaAtencion], [InicioAtencion], [FinAtencion], [Obervacion], [MedicoID], [PacienteID], [UsusarioID], [EstadoCitaID]) VALUES (29, CAST(N'2021-11-12' AS Date), CAST(N'12:00:00' AS Time), CAST(N'12:30:00' AS Time), N'jajaja                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', 2, 3, 2, 1)
INSERT [dbo].[Cita] ([CitaID], [FechaAtencion], [InicioAtencion], [FinAtencion], [Obervacion], [MedicoID], [PacienteID], [UsusarioID], [EstadoCitaID]) VALUES (30, CAST(N'2021-11-30' AS Date), CAST(N'12:00:00' AS Time), CAST(N'12:30:00' AS Time), N'Enjuague                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', 2, 2, 1, 2)
INSERT [dbo].[Cita] ([CitaID], [FechaAtencion], [InicioAtencion], [FinAtencion], [Obervacion], [MedicoID], [PacienteID], [UsusarioID], [EstadoCitaID]) VALUES (31, CAST(N'2021-11-30' AS Date), CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), N'Reevaluar                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ', 1, 5, 2, 2)
INSERT [dbo].[Cita] ([CitaID], [FechaAtencion], [InicioAtencion], [FinAtencion], [Obervacion], [MedicoID], [PacienteID], [UsusarioID], [EstadoCitaID]) VALUES (32, CAST(N'2021-12-30' AS Date), CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), N'Placa                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ', 2, 1, 2, 2)
INSERT [dbo].[Cita] ([CitaID], [FechaAtencion], [InicioAtencion], [FinAtencion], [Obervacion], [MedicoID], [PacienteID], [UsusarioID], [EstadoCitaID]) VALUES (33, CAST(N'2021-12-30' AS Date), CAST(N'21:00:00' AS Time), CAST(N'21:30:00' AS Time), N'Placa                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ', 2, 3, 2, 2)
INSERT [dbo].[Cita] ([CitaID], [FechaAtencion], [InicioAtencion], [FinAtencion], [Obervacion], [MedicoID], [PacienteID], [UsusarioID], [EstadoCitaID]) VALUES (34, CAST(N'2021-11-30' AS Date), CAST(N'15:30:00' AS Time), CAST(N'16:00:00' AS Time), N'Lavado                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', 1, 1, 2, 3)
INSERT [dbo].[Cita] ([CitaID], [FechaAtencion], [InicioAtencion], [FinAtencion], [Obervacion], [MedicoID], [PacienteID], [UsusarioID], [EstadoCitaID]) VALUES (35, CAST(N'2021-11-30' AS Date), CAST(N'17:00:00' AS Time), CAST(N'17:30:00' AS Time), N'Hola                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 1, 1, 2, 2)
INSERT [dbo].[Cita] ([CitaID], [FechaAtencion], [InicioAtencion], [FinAtencion], [Obervacion], [MedicoID], [PacienteID], [UsusarioID], [EstadoCitaID]) VALUES (41, CAST(N'2021-10-12' AS Date), CAST(N'12:00:00' AS Time), CAST(N'12:30:00' AS Time), N'jajaja                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', 1, 2, 1, 1)
SET IDENTITY_INSERT [dbo].[Cita] OFF
GO
SET IDENTITY_INSERT [dbo].[Estado_Cita] ON 

INSERT [dbo].[Estado_Cita] ([EstadoCitaID], [Descripcion]) VALUES (1, N'Citado                                            ')
INSERT [dbo].[Estado_Cita] ([EstadoCitaID], [Descripcion]) VALUES (2, N'Admision                                          ')
INSERT [dbo].[Estado_Cita] ([EstadoCitaID], [Descripcion]) VALUES (3, N'En Atencion                                       ')
SET IDENTITY_INSERT [dbo].[Estado_Cita] OFF
GO
SET IDENTITY_INSERT [dbo].[Medico] ON 

INSERT [dbo].[Medico] ([MedicoID], [Nombre], [Apellido], [Telefono], [Email], [Dni], [UsuarioID]) VALUES (1, N'Sandra                        ', N'Arroyo Bedoya                 ', N'999888777', N'sandra12@gmail.com                                ', N'22584769  ', 2)
INSERT [dbo].[Medico] ([MedicoID], [Nombre], [Apellido], [Telefono], [Email], [Dni], [UsuarioID]) VALUES (2, N'Almendra                      ', N'Chang                         ', N'995848777', N'almech@gmail.com                                  ', N'72843086  ', 1)
SET IDENTITY_INSERT [dbo].[Medico] OFF
GO
SET IDENTITY_INSERT [dbo].[Paciente] ON 

INSERT [dbo].[Paciente] ([PacienteID], [Nombre], [Apellido], [Direccion], [Telefono], [Email], [Dni]) VALUES (1, N'Daniela                                           ', N'Arroyo Chang                                                                                                                                                                                            ', N'Sergio Bernales 513 dpto 202                                                                                                                                                                            ', N'992568451', N'dani-ar@gmail.com                                                                                                                                                                                       ', N'72513712')
INSERT [dbo].[Paciente] ([PacienteID], [Nombre], [Apellido], [Direccion], [Telefono], [Email], [Dni]) VALUES (2, N'Luis  s                                           ', N'Delgado de Alcantara                                                                                                                                                                                    ', N'Av sucre 415                                                                                                                                                                                            ', N'996245785', N'Luisd@hotmail.com                                                                                                                                                                                       ', N'70461258')
INSERT [dbo].[Paciente] ([PacienteID], [Nombre], [Apellido], [Direccion], [Telefono], [Email], [Dni]) VALUES (3, N'Vanessa                                           ', N'Alcantara de Delgado                                                                                                                                                                                    ', N'Av sucre 1054                                                                                                                                                                                           ', N'998745522', N'vane@gmail.com                                                                                                                                                                                          ', N'77889944')
INSERT [dbo].[Paciente] ([PacienteID], [Nombre], [Apellido], [Direccion], [Telefono], [Email], [Dni]) VALUES (4, N'Rosaura                                           ', N'Aguirre                                                                                                                                                                                                 ', N'las lomas 234                                                                                                                                                                                           ', N'987458758', N'dan@gmail.com                                                                                                                                                                                           ', N'89745874')
INSERT [dbo].[Paciente] ([PacienteID], [Nombre], [Apellido], [Direccion], [Telefono], [Email], [Dni]) VALUES (5, N'Shantall                                          ', N'Arroyo perez                                                                                                                                                                                            ', N'jr Barrio Medico 234                                                                                                                                                                                    ', N'996587459', N'shanti@gmail.com                                                                                                                                                                                        ', N'78542568')
SET IDENTITY_INSERT [dbo].[Paciente] OFF
GO
SET IDENTITY_INSERT [dbo].[Perfil] ON 

INSERT [dbo].[Perfil] ([PerfilID], [Nombre], [Estado]) VALUES (1, N'Administrador                 ', 1)
INSERT [dbo].[Perfil] ([PerfilID], [Nombre], [Estado]) VALUES (2, N'Medico                        ', 1)
INSERT [dbo].[Perfil] ([PerfilID], [Nombre], [Estado]) VALUES (3, N'Asistente                     ', 1)
SET IDENTITY_INSERT [dbo].[Perfil] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([UsarioID], [PerfilID], [Usuario], [Clave], [Estado], [Nombre]) VALUES (1, 1, N'DARROYO                       ', N'1122      ', 1, N'Daniel Arroyo                                                                   ')
INSERT [dbo].[Usuario] ([UsarioID], [PerfilID], [Usuario], [Clave], [Estado], [Nombre]) VALUES (2, 2, N'SARROYO                       ', N'1234      ', 1, N'Sandra Arroyo                                                                   ')
INSERT [dbo].[Usuario] ([UsarioID], [PerfilID], [Usuario], [Clave], [Estado], [Nombre]) VALUES (3, 3, N'MAGUIRRE                      ', N'4567      ', 1, N'Mijael Aguirre                                                                  ')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[Cita]  WITH CHECK ADD  CONSTRAINT [FK_Cita_Estado_Cita] FOREIGN KEY([EstadoCitaID])
REFERENCES [dbo].[Estado_Cita] ([EstadoCitaID])
GO
ALTER TABLE [dbo].[Cita] CHECK CONSTRAINT [FK_Cita_Estado_Cita]
GO
ALTER TABLE [dbo].[Cita]  WITH CHECK ADD  CONSTRAINT [FK_Cita_Medico] FOREIGN KEY([MedicoID])
REFERENCES [dbo].[Medico] ([MedicoID])
GO
ALTER TABLE [dbo].[Cita] CHECK CONSTRAINT [FK_Cita_Medico]
GO
ALTER TABLE [dbo].[Cita]  WITH CHECK ADD  CONSTRAINT [FK_Cita_Paciente] FOREIGN KEY([PacienteID])
REFERENCES [dbo].[Paciente] ([PacienteID])
GO
ALTER TABLE [dbo].[Cita] CHECK CONSTRAINT [FK_Cita_Paciente]
GO
ALTER TABLE [dbo].[Cita]  WITH CHECK ADD  CONSTRAINT [FK_Cita_Usuario] FOREIGN KEY([UsusarioID])
REFERENCES [dbo].[Usuario] ([UsarioID])
GO
ALTER TABLE [dbo].[Cita] CHECK CONSTRAINT [FK_Cita_Usuario]
GO
ALTER TABLE [dbo].[Medico]  WITH CHECK ADD  CONSTRAINT [FK_Medico_Usuario] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuario] ([UsarioID])
GO
ALTER TABLE [dbo].[Medico] CHECK CONSTRAINT [FK_Medico_Usuario]
GO
ALTER TABLE [dbo].[Receta]  WITH CHECK ADD  CONSTRAINT [FK_Receta_Cita] FOREIGN KEY([CitaID])
REFERENCES [dbo].[Cita] ([CitaID])
GO
ALTER TABLE [dbo].[Receta] CHECK CONSTRAINT [FK_Receta_Cita]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Perfil] FOREIGN KEY([PerfilID])
REFERENCES [dbo].[Perfil] ([PerfilID])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Perfil]
GO
/****** Object:  StoredProcedure [dbo].[SP_CitaAdmision]    Script Date: 15/12/2021 00:41:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Modificar cita Admision
create procedure [dbo].[SP_CitaAdmision]
@id int
as
set nocount on
update Cita set EstadoCitaID=2
where CitaID = @id
GO
/****** Object:  StoredProcedure [dbo].[SP_CitaAtencion]    Script Date: 15/12/2021 00:41:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Modificar Cita en Atencion
create procedure [dbo].[SP_CitaAtencion]
@id int
as
set nocount on
update Cita set EstadoCitaID=4
where CitaID = @id
GO
/****** Object:  StoredProcedure [dbo].[SP_CitaAtendido]    Script Date: 15/12/2021 00:41:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Modificar Cita Atendido
create procedure [dbo].[SP_CitaAtendido]
@id int
as
set nocount on
update Cita set EstadoCitaID=5
where CitaID = @id
GO
/****** Object:  StoredProcedure [dbo].[SP_CitaLlamado]    Script Date: 15/12/2021 00:41:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Modificar Cita Llamado
create procedure [dbo].[SP_CitaLlamado]
@id int
as
set nocount on
update Cita set EstadoCitaID=3
where CitaID = @id
GO
/****** Object:  StoredProcedure [dbo].[SP_CitaMedicos]    Script Date: 15/12/2021 00:41:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_CitaMedicos]
@id int
as
select c.CitaID, c.FechaAtencion, c.InicioAtencion, c.Obervacion, p.Dni,p.Nombre,p.Apellido,m.MedicoID,p.PacienteID
from Cita as c inner join Paciente as p on c.PacienteID=p.PacienteID
inner join Medico as m on m.MedicoID=c.MedicoID 
inner join Usuario as u on u.UsarioID = m.UsuarioID
where EstadoCitaID = 2 and u.UsarioID = @id order by FechaAtencion desc
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerCitados]    Script Date: 15/12/2021 00:41:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Devuelve citas con estado de cita Citados
create procedure [dbo].[SP_ObtenerCitados]
as
select CitaID, EstadoCitaID, FechaAtencion, InicioAtencion, Obervacion, p.Dni,p.Nombre,p.Apellido 
from Cita as c inner join Paciente as p on c.PacienteID=p.PacienteID
where EstadoCitaID = 1 order by FechaAtencion desc
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerHistoria]    Script Date: 15/12/2021 00:41:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Obtener historia Clinica
create procedure [dbo].[SP_ObtenerHistoria]
as
select CitaID, EstadoCitaID, FechaAtencion, InicioAtencion, Obervacion, p.Dni,p.Nombre,p.Apellido 
from Cita as c inner join Paciente as p on c.PacienteID=p.PacienteID
where EstadoCitaID = 5 order by FechaAtencion desc



GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerLlamados]    Script Date: 15/12/2021 00:41:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Devuelve citas con estado de cita Llamados
CREATE procedure [dbo].[SP_ObtenerLlamados]
as
select CitaID, EstadoCitaID, FechaAtencion, InicioAtencion, Obervacion, p.Dni,p.Nombre,p.Apellido 
from Cita as c inner join Paciente as p on c.PacienteID=p.PacienteID
where EstadoCitaID = 3 order by FechaAtencion desc
GO
USE [master]
GO
ALTER DATABASE [DB_SWCD] SET  READ_WRITE 
GO
