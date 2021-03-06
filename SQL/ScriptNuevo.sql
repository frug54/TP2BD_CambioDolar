USE [master]
GO
/****** Object:  Database [CompraVentaDolares]    Script Date: 06/06/2017 12:26:00 ******/
CREATE DATABASE [CompraVentaDolares]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CompraVentaDolares', FILENAME = N'C:\Estudiantes\Data\CompraVentaDolares.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'CompraVentaDolares_log', FILENAME = N'C:\Estudiantes\Log\CompraVentaDolares_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CompraVentaDolares] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CompraVentaDolares].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CompraVentaDolares] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CompraVentaDolares] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CompraVentaDolares] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CompraVentaDolares] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CompraVentaDolares] SET ARITHABORT OFF 
GO
ALTER DATABASE [CompraVentaDolares] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CompraVentaDolares] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CompraVentaDolares] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CompraVentaDolares] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CompraVentaDolares] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CompraVentaDolares] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CompraVentaDolares] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CompraVentaDolares] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CompraVentaDolares] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CompraVentaDolares] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CompraVentaDolares] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CompraVentaDolares] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CompraVentaDolares] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CompraVentaDolares] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CompraVentaDolares] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CompraVentaDolares] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CompraVentaDolares] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CompraVentaDolares] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CompraVentaDolares] SET  MULTI_USER 
GO
ALTER DATABASE [CompraVentaDolares] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CompraVentaDolares] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CompraVentaDolares] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CompraVentaDolares] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CompraVentaDolares] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CompraVentaDolares', N'ON'
GO
USE [CompraVentaDolares]
GO
/****** Object:  Table [dbo].[Comision]    Script Date: 06/06/2017 12:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comision](
	[idComision] [nchar](10) NOT NULL,
	[porcentaje] [float] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[fk_usuario] [int] NOT NULL,
 CONSTRAINT [PK_Comision] PRIMARY KEY CLUSTERED 
(
	[idComision] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cuenta]    Script Date: 06/06/2017 12:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuenta](
	[idCuenta] [int] IDENTITY(1,1) NOT NULL,
	[monto] [int] NOT NULL,
	[tipo_moneda] [varchar](30) NOT NULL,
	[monto_congelado] [int] NOT NULL,
	[fk_participante] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Cuentas] PRIMARY KEY CLUSTERED 
(
	[idCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Oferta]    Script Date: 06/06/2017 12:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oferta](
	[idOferta] [int] IDENTITY(1,1) NOT NULL,
	[tipo_transaccion] [int] NOT NULL,
	[monto] [int] NOT NULL,
	[oferta] [varchar](30) NOT NULL,
	[fk_participante] [varchar](30) NOT NULL,
	[estado] [varchar](30) NULL,
 CONSTRAINT [PK_Ofertas] PRIMARY KEY CLUSTERED 
(
	[idOferta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OfertaAceptada]    Script Date: 06/06/2017 12:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfertaAceptada](
	[fk_comprado] [int] NOT NULL,
	[fk_vendido] [int] NOT NULL,
	[fk_transaccion_compra] [int] NOT NULL,
	[fk_transaccion_venta] [int] NOT NULL,
 CONSTRAINT [PK_OfertaAceptada] PRIMARY KEY CLUSTERED 
(
	[fk_comprado] ASC,
	[fk_vendido] ASC,
	[fk_transaccion_compra] ASC,
	[fk_transaccion_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Participante]    Script Date: 06/06/2017 12:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Participante](
	[cedula] [varchar](30) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[fecha_nacimiento] [date] NOT NULL,
	[email] [varchar](30) NOT NULL,
	[fk_usuario] [int] NOT NULL,
	[direccion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Participante] PRIMARY KEY CLUSTERED 
(
	[cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Telefono]    Script Date: 06/06/2017 12:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Telefono](
	[fk_participante] [varchar](30) NOT NULL,
	[telefono] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Telefono] PRIMARY KEY CLUSTERED 
(
	[fk_participante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TransaccionAgente]    Script Date: 06/06/2017 12:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransaccionAgente](
	[idTransAgente] [int] IDENTITY(1,1) NOT NULL,
	[tipo_transaccion] [varchar](30) NOT NULL,
	[monto] [int] NOT NULL,
	[fk_usuario] [int] NOT NULL,
	[fk_cuenta] [int] NOT NULL,
 CONSTRAINT [PK_TransaccionAgente] PRIMARY KEY CLUSTERED 
(
	[idTransAgente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TransaccionCuenta]    Script Date: 06/06/2017 12:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransaccionCuenta](
	[IdTransCuenta] [int] NOT NULL,
	[estado] [varchar](30) NOT NULL,
	[monto] [int] NOT NULL,
	[comision] [float] NOT NULL,
	[cuenta_dolares] [int] NOT NULL,
	[cuenta_colones] [int] NOT NULL,
	[fk_cuenta] [int] NOT NULL,
 CONSTRAINT [PK_TransaccionesCuentas] PRIMARY KEY CLUSTERED 
(
	[IdTransCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TransaccionXOferta]    Script Date: 06/06/2017 12:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransaccionXOferta](
	[fk_transacciones] [int] NOT NULL,
	[fk_oferta] [int] NOT NULL,
 CONSTRAINT [PK_TransaccionXOferta] PRIMARY KEY CLUSTERED 
(
	[fk_transacciones] ASC,
	[fk_oferta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 06/06/2017 12:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nick] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[tipo_usuario] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Participante] ([cedula], [nombre], [fecha_nacimiento], [email], [fk_usuario], [direccion]) VALUES (N'304220785', N'Julio Gomez', CAST(N'1992-04-15' AS Date), N'Julito@aol.com', 1, N'Cartago Centro')
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([idUsuario], [nick], [password], [tipo_usuario]) VALUES (1, N'adm1', N'psw.adm1', N'Administrador')
INSERT [dbo].[Usuario] ([idUsuario], [nick], [password], [tipo_usuario]) VALUES (2, N'adm2', N'psw.adm2', N'Administrador')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
ALTER TABLE [dbo].[Comision]  WITH CHECK ADD  CONSTRAINT [FK_Comisiones_Usuario] FOREIGN KEY([fk_usuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Comision] CHECK CONSTRAINT [FK_Comisiones_Usuario]
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD  CONSTRAINT [FK_Cuentas_Participante] FOREIGN KEY([fk_participante])
REFERENCES [dbo].[Participante] ([cedula])
GO
ALTER TABLE [dbo].[Cuenta] CHECK CONSTRAINT [FK_Cuentas_Participante]
GO
ALTER TABLE [dbo].[Oferta]  WITH CHECK ADD  CONSTRAINT [FK_Ofertas_Participante] FOREIGN KEY([fk_participante])
REFERENCES [dbo].[Participante] ([cedula])
GO
ALTER TABLE [dbo].[Oferta] CHECK CONSTRAINT [FK_Ofertas_Participante]
GO
ALTER TABLE [dbo].[OfertaAceptada]  WITH CHECK ADD  CONSTRAINT [FK_ofertas_aceptadas_Ofertas] FOREIGN KEY([fk_comprado])
REFERENCES [dbo].[Oferta] ([idOferta])
GO
ALTER TABLE [dbo].[OfertaAceptada] CHECK CONSTRAINT [FK_ofertas_aceptadas_Ofertas]
GO
ALTER TABLE [dbo].[OfertaAceptada]  WITH CHECK ADD  CONSTRAINT [FK_ofertas_aceptadas_Ofertas1] FOREIGN KEY([fk_vendido])
REFERENCES [dbo].[Oferta] ([idOferta])
GO
ALTER TABLE [dbo].[OfertaAceptada] CHECK CONSTRAINT [FK_ofertas_aceptadas_Ofertas1]
GO
ALTER TABLE [dbo].[OfertaAceptada]  WITH CHECK ADD  CONSTRAINT [FK_ofertas_aceptadas_TransaccionesCuentas] FOREIGN KEY([fk_transaccion_compra])
REFERENCES [dbo].[TransaccionCuenta] ([IdTransCuenta])
GO
ALTER TABLE [dbo].[OfertaAceptada] CHECK CONSTRAINT [FK_ofertas_aceptadas_TransaccionesCuentas]
GO
ALTER TABLE [dbo].[OfertaAceptada]  WITH CHECK ADD  CONSTRAINT [FK_ofertas_aceptadas_TransaccionesCuentas1] FOREIGN KEY([fk_transaccion_venta])
REFERENCES [dbo].[TransaccionCuenta] ([IdTransCuenta])
GO
ALTER TABLE [dbo].[OfertaAceptada] CHECK CONSTRAINT [FK_ofertas_aceptadas_TransaccionesCuentas1]
GO
ALTER TABLE [dbo].[Participante]  WITH CHECK ADD  CONSTRAINT [FK_Participante_Usuario] FOREIGN KEY([fk_usuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Participante] CHECK CONSTRAINT [FK_Participante_Usuario]
GO
ALTER TABLE [dbo].[Telefono]  WITH CHECK ADD  CONSTRAINT [FK_Telefono_Participante] FOREIGN KEY([fk_participante])
REFERENCES [dbo].[Participante] ([cedula])
GO
ALTER TABLE [dbo].[Telefono] CHECK CONSTRAINT [FK_Telefono_Participante]
GO
ALTER TABLE [dbo].[TransaccionAgente]  WITH CHECK ADD  CONSTRAINT [FK_TransaccionAgente_Cuentas] FOREIGN KEY([fk_cuenta])
REFERENCES [dbo].[Cuenta] ([idCuenta])
GO
ALTER TABLE [dbo].[TransaccionAgente] CHECK CONSTRAINT [FK_TransaccionAgente_Cuentas]
GO
ALTER TABLE [dbo].[TransaccionAgente]  WITH CHECK ADD  CONSTRAINT [FK_TransaccionAgente_Usuario] FOREIGN KEY([fk_usuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[TransaccionAgente] CHECK CONSTRAINT [FK_TransaccionAgente_Usuario]
GO
ALTER TABLE [dbo].[TransaccionCuenta]  WITH CHECK ADD  CONSTRAINT [FK_TransaccionesCuentas_Cuentas] FOREIGN KEY([fk_cuenta])
REFERENCES [dbo].[Cuenta] ([idCuenta])
GO
ALTER TABLE [dbo].[TransaccionCuenta] CHECK CONSTRAINT [FK_TransaccionesCuentas_Cuentas]
GO
ALTER TABLE [dbo].[TransaccionXOferta]  WITH CHECK ADD  CONSTRAINT [FK_TransaccionXOferta_Ofertas] FOREIGN KEY([fk_oferta])
REFERENCES [dbo].[Oferta] ([idOferta])
GO
ALTER TABLE [dbo].[TransaccionXOferta] CHECK CONSTRAINT [FK_TransaccionXOferta_Ofertas]
GO
ALTER TABLE [dbo].[TransaccionXOferta]  WITH CHECK ADD  CONSTRAINT [FK_TransaccionXOferta_TransaccionesCuentas] FOREIGN KEY([fk_transacciones])
REFERENCES [dbo].[TransaccionCuenta] ([IdTransCuenta])
GO
ALTER TABLE [dbo].[TransaccionXOferta] CHECK CONSTRAINT [FK_TransaccionXOferta_TransaccionesCuentas]
GO
/****** Object:  StoredProcedure [dbo].[CheckLogin]    Script Date: 06/06/2017 12:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckLogin] @NombreUsuario varchar(50), @Password varchar(50)--, @TipoUsuario varchar(50)
AS
BEGIN
	DECLARE @MemberID INT
	IF EXISTS (SELECT nick 
			   FROM Usuario 
			   WHERE nick = @NombreUsuario AND [password] = @Password)-- AND UserType = @TipoUsuario)
	
	BEGIN
		SELECT @MemberID = idUsuario 
		FROM Usuario 
		WHERE nick = @NombreUsuario AND [Password] = @Password-- AND UserType = @TipoUsuario
		
		SELECT * 
		FROM Usuario 
		WHERE  idUsuario = @MemberID
	END

END
GO
USE [master]
GO
ALTER DATABASE [CompraVentaDolares] SET  READ_WRITE 
GO
