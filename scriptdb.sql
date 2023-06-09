USE [master]
GO
/****** Object:  Database [bd_Notas]    Script Date: 13/04/2023 4:24:32 p. m. ******/
CREATE DATABASE [bd_Notas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bd_Notas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SSQLSERVER\MSSQL\DATA\bd_Notas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bd_Notas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SSQLSERVER\MSSQL\DATA\bd_Notas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [bd_Notas] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bd_Notas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bd_Notas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bd_Notas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bd_Notas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bd_Notas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bd_Notas] SET ARITHABORT OFF 
GO
ALTER DATABASE [bd_Notas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bd_Notas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bd_Notas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bd_Notas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bd_Notas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bd_Notas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bd_Notas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bd_Notas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bd_Notas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bd_Notas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bd_Notas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bd_Notas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bd_Notas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bd_Notas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bd_Notas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bd_Notas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bd_Notas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bd_Notas] SET RECOVERY FULL 
GO
ALTER DATABASE [bd_Notas] SET  MULTI_USER 
GO
ALTER DATABASE [bd_Notas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bd_Notas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bd_Notas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bd_Notas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bd_Notas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [bd_Notas] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'bd_Notas', N'ON'
GO
ALTER DATABASE [bd_Notas] SET QUERY_STORE = OFF
GO
USE [bd_Notas]
GO
/****** Object:  User [user_notas]    Script Date: 13/04/2023 4:24:33 p. m. ******/
CREATE USER [user_notas] FOR LOGIN [user_notas] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [user_notas]
GO
/****** Object:  Table [dbo].[Acudiente]    Script Date: 13/04/2023 4:24:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Acudiente](
	[Id] [int] NOT NULL,
	[id_rol] [varchar](20) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellido] [varchar](100) NOT NULL,
	[Sexo] [varchar](20) NOT NULL,
	[TipoIdentificacion] [varchar](2) NOT NULL,
	[Identificacion] [varchar](30) NOT NULL,
	[Telefono] [varchar](12) NOT NULL,
	[Correo] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Acudiente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Asignatura]    Script Date: 13/04/2023 4:24:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignatura](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[DocenteId] [int] NOT NULL,
	[HoraAsignatura] [varchar](50) NOT NULL,
	[Periodo] [int] NOT NULL,
	[Area] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Asignatura] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Asignatura_Curso]    Script Date: 13/04/2023 4:24:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignatura_Curso](
	[Id] [int] NOT NULL,
	[Id_Asignatura] [int] NOT NULL,
	[Id_Curso] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Asignaturas_estudiantes]    Script Date: 13/04/2023 4:24:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignaturas_estudiantes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Asignaturas] [int] NOT NULL,
	[Id_Estudiantes] [int] NOT NULL,
 CONSTRAINT [PK_Materias_estudiantes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contratacion]    Script Date: 13/04/2023 4:24:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contratacion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DocenteId] [int] NOT NULL,
	[HorasLaborales] [varchar](50) NOT NULL,
	[InstitucionId] [int] NOT NULL,
	[RectorId] [int] NOT NULL,
	[TipodeContrato] [varchar](100) NOT NULL,
	[TipodeCargo] [varchar](100) NOT NULL,
	[FechaContratacion] [datetime] NOT NULL,
 CONSTRAINT [PK_Contratacion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curso]    Script Date: 13/04/2023 4:24:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso](
	[Id] [int] NOT NULL,
	[Grado] [varchar](20) NOT NULL,
	[Fecha_inicio] [datetime] NOT NULL,
	[Fecha_fin] [datetime] NOT NULL,
 CONSTRAINT [PK_Curso] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dias]    Script Date: 13/04/2023 4:24:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dias](
	[Id] [int] NOT NULL,
	[NombreDiasSemana] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Dias] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dias_Asignaturas]    Script Date: 13/04/2023 4:24:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dias_Asignaturas](
	[Id] [int] NOT NULL,
	[IdDias] [int] NOT NULL,
	[IdAsignaturas] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Docente]    Script Date: 13/04/2023 4:24:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Docente](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_usuario] [varchar](20) NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellido] [varchar](100) NOT NULL,
	[TipoIdentificacion] [varchar](2) NOT NULL,
	[Identificacion] [varchar](30) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[Telefono] [varchar](12) NOT NULL,
	[Correo] [varchar](100) NOT NULL,
	[NIT] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Docente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estudiantes]    Script Date: 13/04/2023 4:24:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estudiantes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellido] [varchar](100) NOT NULL,
	[TipoIdentificacion] [varchar](2) NOT NULL,
	[Identificacion] [varchar](30) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[Telefono] [varchar](100) NOT NULL,
	[Correo] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Estudiantes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Institucion]    Script Date: 13/04/2023 4:24:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Institucion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[Nit] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Institucion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notas]    Script Date: 13/04/2023 4:24:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notas](
	[Id] [int] NOT NULL,
	[NotasAsistencia] [float] NOT NULL,
	[NotasParcial] [float] NOT NULL,
	[NotasClases] [float] NOT NULL,
	[NotaDefinitiva] [float] NOT NULL,
	[Id_AsignaturasEstudiantes] [int] NOT NULL,
 CONSTRAINT [PK_Notas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rector]    Script Date: 13/04/2023 4:24:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rector](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_usuario] [varchar](20) NULL,
	[TipoIdentificacion] [varchar](2) NOT NULL,
	[Identificacion] [varchar](30) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellido] [varchar](100) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[Telefono] [varchar](12) NOT NULL,
	[Correo] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Rector] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 13/04/2023 4:24:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[Id_rol] [varchar](20) NOT NULL,
	[Estado] [varchar](20) NOT NULL,
	[Observaciones] [varchar](255) NOT NULL,
	[Descripcion] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[Id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 13/04/2023 4:24:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Usuario] [varchar](20) NOT NULL,
	[Sexo] [varchar](20) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[Clave] [varchar](50) NOT NULL,
	[Fecha_Actualizacion] [datetime] NOT NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[Id_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Asignatura]  WITH CHECK ADD  CONSTRAINT [FK_Asignatura_Docente] FOREIGN KEY([DocenteId])
REFERENCES [dbo].[Docente] ([Id])
GO
ALTER TABLE [dbo].[Asignatura] CHECK CONSTRAINT [FK_Asignatura_Docente]
GO
ALTER TABLE [dbo].[Asignatura_Curso]  WITH CHECK ADD  CONSTRAINT [FK_Asignatura_Curso_Asignatura] FOREIGN KEY([Id_Asignatura])
REFERENCES [dbo].[Asignatura] ([Id])
GO
ALTER TABLE [dbo].[Asignatura_Curso] CHECK CONSTRAINT [FK_Asignatura_Curso_Asignatura]
GO
ALTER TABLE [dbo].[Asignatura_Curso]  WITH CHECK ADD  CONSTRAINT [FK_Asignatura_Curso_Curso] FOREIGN KEY([Id_Curso])
REFERENCES [dbo].[Curso] ([Id])
GO
ALTER TABLE [dbo].[Asignatura_Curso] CHECK CONSTRAINT [FK_Asignatura_Curso_Curso]
GO
ALTER TABLE [dbo].[Asignaturas_estudiantes]  WITH CHECK ADD  CONSTRAINT [FK_Materias_estudiantes_Asignatura] FOREIGN KEY([Id_Asignaturas])
REFERENCES [dbo].[Asignatura] ([Id])
GO
ALTER TABLE [dbo].[Asignaturas_estudiantes] CHECK CONSTRAINT [FK_Materias_estudiantes_Asignatura]
GO
ALTER TABLE [dbo].[Asignaturas_estudiantes]  WITH CHECK ADD  CONSTRAINT [FK_Materias_estudiantes_Estudiantes] FOREIGN KEY([Id_Estudiantes])
REFERENCES [dbo].[Estudiantes] ([Id])
GO
ALTER TABLE [dbo].[Asignaturas_estudiantes] CHECK CONSTRAINT [FK_Materias_estudiantes_Estudiantes]
GO
ALTER TABLE [dbo].[Contratacion]  WITH CHECK ADD  CONSTRAINT [FK_Contratacion_Docente] FOREIGN KEY([DocenteId])
REFERENCES [dbo].[Docente] ([Id])
GO
ALTER TABLE [dbo].[Contratacion] CHECK CONSTRAINT [FK_Contratacion_Docente]
GO
ALTER TABLE [dbo].[Contratacion]  WITH CHECK ADD  CONSTRAINT [FK_Contratacion_Institucion] FOREIGN KEY([InstitucionId])
REFERENCES [dbo].[Institucion] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Contratacion] CHECK CONSTRAINT [FK_Contratacion_Institucion]
GO
ALTER TABLE [dbo].[Contratacion]  WITH CHECK ADD  CONSTRAINT [FK_Contratacion_Rector] FOREIGN KEY([RectorId])
REFERENCES [dbo].[Rector] ([Id])
GO
ALTER TABLE [dbo].[Contratacion] CHECK CONSTRAINT [FK_Contratacion_Rector]
GO
ALTER TABLE [dbo].[Dias_Asignaturas]  WITH CHECK ADD  CONSTRAINT [FK_Dias_Asignaturas_Asignatura] FOREIGN KEY([IdAsignaturas])
REFERENCES [dbo].[Asignatura] ([Id])
GO
ALTER TABLE [dbo].[Dias_Asignaturas] CHECK CONSTRAINT [FK_Dias_Asignaturas_Asignatura]
GO
ALTER TABLE [dbo].[Dias_Asignaturas]  WITH CHECK ADD  CONSTRAINT [FK_Dias_Asignaturas_Dias] FOREIGN KEY([IdDias])
REFERENCES [dbo].[Dias] ([Id])
GO
ALTER TABLE [dbo].[Dias_Asignaturas] CHECK CONSTRAINT [FK_Dias_Asignaturas_Dias]
GO
ALTER TABLE [dbo].[Docente]  WITH CHECK ADD  CONSTRAINT [FK_Docente_Usuarios] FOREIGN KEY([Id_usuario])
REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
ALTER TABLE [dbo].[Docente] CHECK CONSTRAINT [FK_Docente_Usuarios]
GO
ALTER TABLE [dbo].[Notas]  WITH CHECK ADD  CONSTRAINT [FK_Notas_Asignaturas_estudiantes] FOREIGN KEY([Id_AsignaturasEstudiantes])
REFERENCES [dbo].[Asignaturas_estudiantes] ([Id])
GO
ALTER TABLE [dbo].[Notas] CHECK CONSTRAINT [FK_Notas_Asignaturas_estudiantes]
GO
ALTER TABLE [dbo].[Rector]  WITH CHECK ADD  CONSTRAINT [FK_Rector_Usuarios] FOREIGN KEY([Id_usuario])
REFERENCES [dbo].[Usuarios] ([Id_Usuario])
GO
ALTER TABLE [dbo].[Rector] CHECK CONSTRAINT [FK_Rector_Usuarios]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_usuarios_Rol] FOREIGN KEY([Id_Usuario])
REFERENCES [dbo].[Rol] ([Id_rol])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_usuarios_Rol]
GO
USE [master]
GO
ALTER DATABASE [bd_Notas] SET  READ_WRITE 
GO
