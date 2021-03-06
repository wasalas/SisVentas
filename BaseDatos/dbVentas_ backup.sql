USE [dbVentas]
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'View_1', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'View_1', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
/****** Object:  StoredProcedure [dbo].[spMostrar_proveedor]    Script Date: 05/04/2018 17:09:34 ******/
DROP PROCEDURE IF EXISTS [dbo].[spMostrar_proveedor]
GO
/****** Object:  StoredProcedure [dbo].[spMostrar_presentacion]    Script Date: 05/04/2018 17:09:34 ******/
DROP PROCEDURE IF EXISTS [dbo].[spMostrar_presentacion]
GO
/****** Object:  StoredProcedure [dbo].[spMostrar_cliente]    Script Date: 05/04/2018 17:09:34 ******/
DROP PROCEDURE IF EXISTS [dbo].[spMostrar_cliente]
GO
/****** Object:  StoredProcedure [dbo].[spMostrar_categoria]    Script Date: 05/04/2018 17:09:34 ******/
DROP PROCEDURE IF EXISTS [dbo].[spMostrar_categoria]
GO
/****** Object:  StoredProcedure [dbo].[spMostrar_articulo]    Script Date: 05/04/2018 17:09:34 ******/
DROP PROCEDURE IF EXISTS [dbo].[spMostrar_articulo]
GO
/****** Object:  StoredProcedure [dbo].[spInsertar_proveedor]    Script Date: 05/04/2018 17:09:34 ******/
DROP PROCEDURE IF EXISTS [dbo].[spInsertar_proveedor]
GO
/****** Object:  StoredProcedure [dbo].[spInsertar_presentacion]    Script Date: 05/04/2018 17:09:34 ******/
DROP PROCEDURE IF EXISTS [dbo].[spInsertar_presentacion]
GO
/****** Object:  StoredProcedure [dbo].[spInsertar_cliente]    Script Date: 05/04/2018 17:09:34 ******/
DROP PROCEDURE IF EXISTS [dbo].[spInsertar_cliente]
GO
/****** Object:  StoredProcedure [dbo].[spInsertar_categoria]    Script Date: 05/04/2018 17:09:34 ******/
DROP PROCEDURE IF EXISTS [dbo].[spInsertar_categoria]
GO
/****** Object:  StoredProcedure [dbo].[spInsertar_articulo]    Script Date: 05/04/2018 17:09:34 ******/
DROP PROCEDURE IF EXISTS [dbo].[spInsertar_articulo]
GO
/****** Object:  StoredProcedure [dbo].[spEliminar_proveedor]    Script Date: 05/04/2018 17:09:34 ******/
DROP PROCEDURE IF EXISTS [dbo].[spEliminar_proveedor]
GO
/****** Object:  StoredProcedure [dbo].[spEliminar_presentacion]    Script Date: 05/04/2018 17:09:34 ******/
DROP PROCEDURE IF EXISTS [dbo].[spEliminar_presentacion]
GO
/****** Object:  StoredProcedure [dbo].[spEliminar_cliente]    Script Date: 05/04/2018 17:09:34 ******/
DROP PROCEDURE IF EXISTS [dbo].[spEliminar_cliente]
GO
/****** Object:  StoredProcedure [dbo].[spEliminar_categoria]    Script Date: 05/04/2018 17:09:34 ******/
DROP PROCEDURE IF EXISTS [dbo].[spEliminar_categoria]
GO
/****** Object:  StoredProcedure [dbo].[spEliminar_articulo]    Script Date: 05/04/2018 17:09:34 ******/
DROP PROCEDURE IF EXISTS [dbo].[spEliminar_articulo]
GO
/****** Object:  StoredProcedure [dbo].[spEditar_proveedor]    Script Date: 05/04/2018 17:09:34 ******/
DROP PROCEDURE IF EXISTS [dbo].[spEditar_proveedor]
GO
/****** Object:  StoredProcedure [dbo].[spEditar_presentacion]    Script Date: 05/04/2018 17:09:34 ******/
DROP PROCEDURE IF EXISTS [dbo].[spEditar_presentacion]
GO
/****** Object:  StoredProcedure [dbo].[spEditar_cliente]    Script Date: 05/04/2018 17:09:34 ******/
DROP PROCEDURE IF EXISTS [dbo].[spEditar_cliente]
GO
/****** Object:  StoredProcedure [dbo].[spEditar_categoria]    Script Date: 05/04/2018 17:09:34 ******/
DROP PROCEDURE IF EXISTS [dbo].[spEditar_categoria]
GO
/****** Object:  StoredProcedure [dbo].[spEditar_articulo]    Script Date: 05/04/2018 17:09:34 ******/
DROP PROCEDURE IF EXISTS [dbo].[spEditar_articulo]
GO
/****** Object:  StoredProcedure [dbo].[spBuscar_razon_social_proveedor]    Script Date: 05/04/2018 17:09:34 ******/
DROP PROCEDURE IF EXISTS [dbo].[spBuscar_razon_social_proveedor]
GO
/****** Object:  StoredProcedure [dbo].[spBuscar_presentacion_nombre]    Script Date: 05/04/2018 17:09:34 ******/
DROP PROCEDURE IF EXISTS [dbo].[spBuscar_presentacion_nombre]
GO
/****** Object:  StoredProcedure [dbo].[spBuscar_num_documento_proveedor]    Script Date: 05/04/2018 17:09:34 ******/
DROP PROCEDURE IF EXISTS [dbo].[spBuscar_num_documento_proveedor]
GO
/****** Object:  StoredProcedure [dbo].[spBuscar_num_documento_cliente]    Script Date: 05/04/2018 17:09:34 ******/
DROP PROCEDURE IF EXISTS [dbo].[spBuscar_num_documento_cliente]
GO
/****** Object:  StoredProcedure [dbo].[spBuscar_categoria]    Script Date: 05/04/2018 17:09:34 ******/
DROP PROCEDURE IF EXISTS [dbo].[spBuscar_categoria]
GO
/****** Object:  StoredProcedure [dbo].[spBuscar_articulo_nombre]    Script Date: 05/04/2018 17:09:34 ******/
DROP PROCEDURE IF EXISTS [dbo].[spBuscar_articulo_nombre]
GO
/****** Object:  StoredProcedure [dbo].[spBuscar_apellidos_cliente]    Script Date: 05/04/2018 17:09:34 ******/
DROP PROCEDURE IF EXISTS [dbo].[spBuscar_apellidos_cliente]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Venta]') AND type in (N'U'))
ALTER TABLE [dbo].[Venta] DROP CONSTRAINT IF EXISTS [FK_Venta_Trabajador]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Venta]') AND type in (N'U'))
ALTER TABLE [dbo].[Venta] DROP CONSTRAINT IF EXISTS [FK_Venta_Cliente]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ingreso]') AND type in (N'U'))
ALTER TABLE [dbo].[Ingreso] DROP CONSTRAINT IF EXISTS [FK_Ingreso_Trabajador]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ingreso]') AND type in (N'U'))
ALTER TABLE [dbo].[Ingreso] DROP CONSTRAINT IF EXISTS [FK_Ingreso_Proveedor]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Detalle_venta]') AND type in (N'U'))
ALTER TABLE [dbo].[Detalle_venta] DROP CONSTRAINT IF EXISTS [FK_Detalle_venta_Venta]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Detalle_venta]') AND type in (N'U'))
ALTER TABLE [dbo].[Detalle_venta] DROP CONSTRAINT IF EXISTS [FK_Detalle_venta_Detalle_ingreso]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Detalle_ingreso]') AND type in (N'U'))
ALTER TABLE [dbo].[Detalle_ingreso] DROP CONSTRAINT IF EXISTS [FK_Detalle_ingreso_Ingreso]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Detalle_ingreso]') AND type in (N'U'))
ALTER TABLE [dbo].[Detalle_ingreso] DROP CONSTRAINT IF EXISTS [FK_Detalle_ingreso_Articulo]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Articulo]') AND type in (N'U'))
ALTER TABLE [dbo].[Articulo] DROP CONSTRAINT IF EXISTS [FK_Articulo_Presentacion]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Articulo]') AND type in (N'U'))
ALTER TABLE [dbo].[Articulo] DROP CONSTRAINT IF EXISTS [FK_Articulo_Categoria]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 05/04/2018 17:09:34 ******/
DROP TABLE IF EXISTS [dbo].[Venta]
GO
/****** Object:  Table [dbo].[Trabajador]    Script Date: 05/04/2018 17:09:34 ******/
DROP TABLE IF EXISTS [dbo].[Trabajador]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 05/04/2018 17:09:34 ******/
DROP TABLE IF EXISTS [dbo].[Proveedor]
GO
/****** Object:  Table [dbo].[Ingreso]    Script Date: 05/04/2018 17:09:34 ******/
DROP TABLE IF EXISTS [dbo].[Ingreso]
GO
/****** Object:  Table [dbo].[Detalle_venta]    Script Date: 05/04/2018 17:09:34 ******/
DROP TABLE IF EXISTS [dbo].[Detalle_venta]
GO
/****** Object:  Table [dbo].[Detalle_ingreso]    Script Date: 05/04/2018 17:09:34 ******/
DROP TABLE IF EXISTS [dbo].[Detalle_ingreso]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 05/04/2018 17:09:34 ******/
DROP TABLE IF EXISTS [dbo].[Cliente]
GO
/****** Object:  View [dbo].[View_1]    Script Date: 05/04/2018 17:09:34 ******/
DROP VIEW IF EXISTS [dbo].[View_1]
GO
/****** Object:  Table [dbo].[Articulo]    Script Date: 05/04/2018 17:09:34 ******/
DROP TABLE IF EXISTS [dbo].[Articulo]
GO
/****** Object:  Table [dbo].[Presentacion]    Script Date: 05/04/2018 17:09:34 ******/
DROP TABLE IF EXISTS [dbo].[Presentacion]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 05/04/2018 17:09:34 ******/
DROP TABLE IF EXISTS [dbo].[Categoria]
GO
USE [master]
GO
/****** Object:  Database [dbVentas]    Script Date: 05/04/2018 17:09:34 ******/
DROP DATABASE IF EXISTS [dbVentas]
GO
/****** Object:  Database [dbVentas]    Script Date: 05/04/2018 17:09:34 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'dbVentas')
BEGIN
CREATE DATABASE [dbVentas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbVentas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\dbVentas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbVentas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\dbVentas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
END
GO
ALTER DATABASE [dbVentas] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbVentas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbVentas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbVentas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbVentas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbVentas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbVentas] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbVentas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbVentas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbVentas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbVentas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbVentas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbVentas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbVentas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbVentas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbVentas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbVentas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbVentas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbVentas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbVentas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbVentas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbVentas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbVentas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbVentas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbVentas] SET RECOVERY FULL 
GO
ALTER DATABASE [dbVentas] SET  MULTI_USER 
GO
ALTER DATABASE [dbVentas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbVentas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbVentas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbVentas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbVentas] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbVentas', N'ON'
GO
ALTER DATABASE [dbVentas] SET QUERY_STORE = OFF
GO
USE [dbVentas]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [dbVentas]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categoria]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Categoria](
	[idcategoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](256) NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[idcategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Presentacion]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Presentacion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Presentacion](
	[idpresentacion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](256) NULL,
 CONSTRAINT [PK_Presentacion] PRIMARY KEY CLUSTERED 
(
	[idpresentacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Articulo]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Articulo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Articulo](
	[idarticulo] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](1024) NULL,
	[imagen] [image] NULL,
	[idcategoria] [int] NOT NULL,
	[idpresentacion] [int] NOT NULL,
 CONSTRAINT [PK_Articulo] PRIMARY KEY CLUSTERED 
(
	[idarticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[View_1]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[View_1]
AS
SELECT        dbo.Articulo.idarticulo, dbo.Articulo.codigo, dbo.Articulo.nombre, dbo.Articulo.descripcion, dbo.Articulo.imagen, dbo.Articulo.idcategoria, dbo.Categoria.nombre AS Expr1, dbo.Articulo.idpresentacion, 
                         dbo.Presentacion.nombre AS Expr2
FROM            dbo.Articulo INNER JOIN
                         dbo.Categoria ON dbo.Articulo.idcategoria = dbo.Categoria.idcategoria INNER JOIN
                         dbo.Presentacion ON dbo.Articulo.idpresentacion = dbo.Presentacion.idpresentacion
' 
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Cliente](
	[idcliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[apellidos] [varchar](40) NULL,
	[sexo] [varchar](1) NULL,
	[fecha_nacimiento] [date] NULL,
	[tipo_documento] [varchar](20) NOT NULL,
	[num_documento] [varchar](11) NOT NULL,
	[direccion] [varchar](100) NULL,
	[telefono] [varchar](10) NULL,
	[email] [varchar](50) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[idcliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Detalle_ingreso]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Detalle_ingreso]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Detalle_ingreso](
	[iddetalle_ingreso] [int] IDENTITY(1,1) NOT NULL,
	[idingreso] [int] NOT NULL,
	[idarticulo] [int] NOT NULL,
	[precio_compra] [money] NOT NULL,
	[precio_venta] [money] NOT NULL,
	[stock_inicial] [int] NOT NULL,
	[stock_actual] [int] NOT NULL,
	[fecha_produccion] [date] NOT NULL,
	[fecha_vencimiento] [date] NOT NULL,
 CONSTRAINT [PK_Detalle_ingreso] PRIMARY KEY CLUSTERED 
(
	[iddetalle_ingreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Detalle_venta]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Detalle_venta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Detalle_venta](
	[iddetalle_venta] [int] IDENTITY(1,1) NOT NULL,
	[idventa] [int] NOT NULL,
	[iddetalle_ingreso] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio_venta] [money] NOT NULL,
	[descuento] [money] NOT NULL,
 CONSTRAINT [PK_Detalle_venta] PRIMARY KEY CLUSTERED 
(
	[iddetalle_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ingreso]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ingreso]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ingreso](
	[idingreso] [int] IDENTITY(1,1) NOT NULL,
	[idtrabajador] [int] NOT NULL,
	[idproveedor] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[tipo_comprobante] [varchar](20) NOT NULL,
	[serie] [varchar](4) NOT NULL,
	[correlativo] [varchar](7) NOT NULL,
	[igv] [decimal](4, 2) NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[idingreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proveedor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Proveedor](
	[idproveedor] [int] IDENTITY(1,1) NOT NULL,
	[razon_social] [varchar](150) NOT NULL,
	[sector_comercial] [varchar](50) NOT NULL,
	[tipo_documento] [varchar](20) NOT NULL,
	[num_documento] [varchar](11) NOT NULL,
	[direccion] [varchar](100) NULL,
	[telefono] [varchar](10) NULL,
	[email] [varchar](50) NULL,
	[url] [varchar](100) NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[idproveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Trabajador]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Trabajador]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Trabajador](
	[idtrabajador] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[apellidos] [varchar](40) NOT NULL,
	[sexo] [varchar](1) NOT NULL,
	[fecha_nacimiento] [date] NOT NULL,
	[num_documento] [varchar](8) NOT NULL,
	[direccion] [varchar](100) NULL,
	[telefono] [varchar](10) NULL,
	[email] [varchar](50) NULL,
	[acceso] [varchar](20) NOT NULL,
	[usuario] [varchar](20) NOT NULL,
	[password] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Trabajador] PRIMARY KEY CLUSTERED 
(
	[idtrabajador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Venta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Venta](
	[idventa] [int] IDENTITY(1,1) NOT NULL,
	[idcliente] [int] NOT NULL,
	[idtrabajador] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[tipo_comprobante] [varchar](20) NOT NULL,
	[serie] [varchar](4) NOT NULL,
	[correlativo] [varchar](7) NOT NULL,
	[igv] [decimal](4, 2) NOT NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[idventa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Articulo_Categoria]') AND parent_object_id = OBJECT_ID(N'[dbo].[Articulo]'))
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Articulo_Categoria] FOREIGN KEY([idcategoria])
REFERENCES [dbo].[Categoria] ([idcategoria])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Articulo_Categoria]') AND parent_object_id = OBJECT_ID(N'[dbo].[Articulo]'))
ALTER TABLE [dbo].[Articulo] CHECK CONSTRAINT [FK_Articulo_Categoria]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Articulo_Presentacion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Articulo]'))
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Articulo_Presentacion] FOREIGN KEY([idpresentacion])
REFERENCES [dbo].[Presentacion] ([idpresentacion])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Articulo_Presentacion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Articulo]'))
ALTER TABLE [dbo].[Articulo] CHECK CONSTRAINT [FK_Articulo_Presentacion]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Detalle_ingreso_Articulo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Detalle_ingreso]'))
ALTER TABLE [dbo].[Detalle_ingreso]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_ingreso_Articulo] FOREIGN KEY([idarticulo])
REFERENCES [dbo].[Articulo] ([idarticulo])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Detalle_ingreso_Articulo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Detalle_ingreso]'))
ALTER TABLE [dbo].[Detalle_ingreso] CHECK CONSTRAINT [FK_Detalle_ingreso_Articulo]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Detalle_ingreso_Ingreso]') AND parent_object_id = OBJECT_ID(N'[dbo].[Detalle_ingreso]'))
ALTER TABLE [dbo].[Detalle_ingreso]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_ingreso_Ingreso] FOREIGN KEY([idingreso])
REFERENCES [dbo].[Ingreso] ([idingreso])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Detalle_ingreso_Ingreso]') AND parent_object_id = OBJECT_ID(N'[dbo].[Detalle_ingreso]'))
ALTER TABLE [dbo].[Detalle_ingreso] CHECK CONSTRAINT [FK_Detalle_ingreso_Ingreso]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Detalle_venta_Detalle_ingreso]') AND parent_object_id = OBJECT_ID(N'[dbo].[Detalle_venta]'))
ALTER TABLE [dbo].[Detalle_venta]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_venta_Detalle_ingreso] FOREIGN KEY([iddetalle_ingreso])
REFERENCES [dbo].[Detalle_ingreso] ([iddetalle_ingreso])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Detalle_venta_Detalle_ingreso]') AND parent_object_id = OBJECT_ID(N'[dbo].[Detalle_venta]'))
ALTER TABLE [dbo].[Detalle_venta] CHECK CONSTRAINT [FK_Detalle_venta_Detalle_ingreso]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Detalle_venta_Venta]') AND parent_object_id = OBJECT_ID(N'[dbo].[Detalle_venta]'))
ALTER TABLE [dbo].[Detalle_venta]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_venta_Venta] FOREIGN KEY([idventa])
REFERENCES [dbo].[Venta] ([idventa])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Detalle_venta_Venta]') AND parent_object_id = OBJECT_ID(N'[dbo].[Detalle_venta]'))
ALTER TABLE [dbo].[Detalle_venta] CHECK CONSTRAINT [FK_Detalle_venta_Venta]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Ingreso_Proveedor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ingreso]'))
ALTER TABLE [dbo].[Ingreso]  WITH CHECK ADD  CONSTRAINT [FK_Ingreso_Proveedor] FOREIGN KEY([idproveedor])
REFERENCES [dbo].[Proveedor] ([idproveedor])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Ingreso_Proveedor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ingreso]'))
ALTER TABLE [dbo].[Ingreso] CHECK CONSTRAINT [FK_Ingreso_Proveedor]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Ingreso_Trabajador]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ingreso]'))
ALTER TABLE [dbo].[Ingreso]  WITH CHECK ADD  CONSTRAINT [FK_Ingreso_Trabajador] FOREIGN KEY([idtrabajador])
REFERENCES [dbo].[Trabajador] ([idtrabajador])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Ingreso_Trabajador]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ingreso]'))
ALTER TABLE [dbo].[Ingreso] CHECK CONSTRAINT [FK_Ingreso_Trabajador]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Venta_Cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Venta]'))
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Cliente] FOREIGN KEY([idcliente])
REFERENCES [dbo].[Cliente] ([idcliente])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Venta_Cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Venta]'))
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Cliente]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Venta_Trabajador]') AND parent_object_id = OBJECT_ID(N'[dbo].[Venta]'))
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Trabajador] FOREIGN KEY([idtrabajador])
REFERENCES [dbo].[Trabajador] ([idtrabajador])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Venta_Trabajador]') AND parent_object_id = OBJECT_ID(N'[dbo].[Venta]'))
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Trabajador]
GO
/****** Object:  StoredProcedure [dbo].[spBuscar_apellidos_cliente]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spBuscar_apellidos_cliente]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spBuscar_apellidos_cliente] AS' 
END
GO

-- 2) buscar apellidos
ALTER   proc [dbo].[spBuscar_apellidos_cliente]
@textobuscar	varchar(50)
as
select * from cliente
where apellidos like @textobuscar + '%'	--  Alt + 39
GO
/****** Object:  StoredProcedure [dbo].[spBuscar_articulo_nombre]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spBuscar_articulo_nombre]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spBuscar_articulo_nombre] AS' 
END
GO
-- 2) buscar articulo nombre
ALTER procedure [dbo].[spBuscar_articulo_nombre]
@textobuscar varchar(50)
as
SELECT 
	Articulo.idarticulo, Articulo.codigo, 
	Articulo.nombre, Articulo.descripcion, 
	Articulo.imagen, Articulo.idcategoria, 
	Categoria.nombre AS categoria, 
	Articulo.idpresentacion, 
    Presentacion.nombre AS Presentacion
FROM Articulo 
	INNER JOIN Categoria ON dbo.Articulo.idcategoria = dbo.Categoria.idcategoria 
	INNER JOIN Presentacion ON dbo.Articulo.idpresentacion = dbo.Presentacion.idpresentacion
where articulo.nombre like @textobuscar + '%'
order by idarticulo desc
GO
/****** Object:  StoredProcedure [dbo].[spBuscar_categoria]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spBuscar_categoria]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spBuscar_categoria] AS' 
END
GO

-- buscar nombre categoria
ALTER proc [dbo].[spBuscar_categoria]
@textobuscar	varchar(50)
as
select * from Categoria
where nombre like @textobuscar + '%'	--  Alt + 39
GO
/****** Object:  StoredProcedure [dbo].[spBuscar_num_documento_cliente]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spBuscar_num_documento_cliente]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spBuscar_num_documento_cliente] AS' 
END
GO

-- 3) buscar numero de documento
ALTER   proc [dbo].[spBuscar_num_documento_cliente]
@textobuscar	varchar(8)
as
select * from cliente
where num_documento like @textobuscar + '%'	--  Alt + 39
GO
/****** Object:  StoredProcedure [dbo].[spBuscar_num_documento_proveedor]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spBuscar_num_documento_proveedor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spBuscar_num_documento_proveedor] AS' 
END
GO
-- 3) buscar numero de documento
ALTER proc [dbo].[spBuscar_num_documento_proveedor]	
@textobuscar	varchar(11)
as
select * from proveedor
where num_documento like @textobuscar + '%'	--  Alt + 39
GO
/****** Object:  StoredProcedure [dbo].[spBuscar_presentacion_nombre]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spBuscar_presentacion_nombre]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spBuscar_presentacion_nombre] AS' 
END
GO
-- 2) buscar nombre presentacion
ALTER proc [dbo].[spBuscar_presentacion_nombre]
@textobuscar	varchar(50)
as
select * from presentacion
where nombre like @textobuscar + '%'	--  Alt + 39
GO
/****** Object:  StoredProcedure [dbo].[spBuscar_razon_social_proveedor]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spBuscar_razon_social_proveedor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spBuscar_razon_social_proveedor] AS' 
END
GO
ALTER proc [dbo].[spBuscar_razon_social_proveedor]	
@textobuscar	varchar(50)
as
select * from proveedor
where razon_social like @textobuscar + '%'	--  Alt + 39
GO
/****** Object:  StoredProcedure [dbo].[spEditar_articulo]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spEditar_articulo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spEditar_articulo] AS' 
END
GO
-- 4) editar articulo
ALTER proc [dbo].[spEditar_articulo]
@idarticulo int,
@codigo varchar(50),
@nombre varchar(50),
@descripcion varchar(1024),
@imagen image,
@idcategoria int,
@idpresentacion int
as
update articulo
set codigo = @codigo, nombre = @nombre, descripcion = @descripcion, imagen = @imagen, idcategoria = @idcategoria, idpresentacion = @idpresentacion
where idarticulo = @idarticulo
GO
/****** Object:  StoredProcedure [dbo].[spEditar_categoria]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spEditar_categoria]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spEditar_categoria] AS' 
END
GO

-- editar categoria
ALTER proc [dbo].[spEditar_categoria]
@idcategoria int, 
@nombre varchar(50),
@descripcion varchar(256)
as
update categoria
	set nombre = @nombre, 
	descripcion = @descripcion
	where idcategoria = @idcategoria
GO
/****** Object:  StoredProcedure [dbo].[spEditar_cliente]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spEditar_cliente]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spEditar_cliente] AS' 
END
GO
-- 5) editar cliente
ALTER   proc [dbo].[spEditar_cliente]
@idcliente int, 
@nombre varchar(20),
@apellidos varchar(40),
@sexo varchar(1),
@tipo_documento varchar(20),
@num_documento varchar(11),
@direccion varchar(100),
@telefono varchar(10),
@email varchar(50)
as
update Cliente
	set nombre = @nombre,
	apellidos = @apellidos,
	sexo = @sexo,
	tipo_documento = @tipo_documento,
	num_documento = @num_documento,
	direccion = @direccion,
	telefono = @telefono,
	email = @email	
	where @idcliente = @idcliente
GO
/****** Object:  StoredProcedure [dbo].[spEditar_presentacion]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spEditar_presentacion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spEditar_presentacion] AS' 
END
GO
-- 4) editar presentacion
ALTER proc [dbo].[spEditar_presentacion]
@idpresentacion int, 
@nombre varchar(50),
@descripcion varchar(256)
as
update presentacion
	set nombre = @nombre, 
	descripcion = @descripcion
	where idpresentacion = @idpresentacion
GO
/****** Object:  StoredProcedure [dbo].[spEditar_proveedor]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spEditar_proveedor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spEditar_proveedor] AS' 
END
GO
-- 5) editar proveedor
ALTER proc [dbo].[spEditar_proveedor]
@idproveedor int, 
@razon_social varchar(150),
@sector_comercial varchar(50),
@tipo_documento varchar(20),
@num_documento varchar(11),
@direccion varchar(100),
@telefono varchar(10),
@email varchar(50),
@url varchar(100)
as
update proveedor
	set razon_social = @razon_social,
	sector_comercial = @sector_comercial,
	tipo_documento = @tipo_documento,
	num_documento = @num_documento,
	direccion = @direccion,
	telefono = @telefono,
	email = @email,
	url = @url
	where idproveedor = @idproveedor
GO
/****** Object:  StoredProcedure [dbo].[spEliminar_articulo]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spEliminar_articulo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spEliminar_articulo] AS' 
END
GO
-- 5) eliminar articulo
ALTER proc [dbo].[spEliminar_articulo]
@idarticulo int
as
delete from Articulo where idarticulo = @idarticulo
GO
/****** Object:  StoredProcedure [dbo].[spEliminar_categoria]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spEliminar_categoria]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spEliminar_categoria] AS' 
END
GO
-- eliminar categoria
ALTER proc [dbo].[spEliminar_categoria]
@idcategoria int
as
delete from categoria where idcategoria = @idcategoria

GO
/****** Object:  StoredProcedure [dbo].[spEliminar_cliente]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spEliminar_cliente]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spEliminar_cliente] AS' 
END
GO
-- 6) eliminar cliente
ALTER   proc [dbo].[spEliminar_cliente]
@idcliente int
as
delete from cliente where idcliente = @idcliente
GO
/****** Object:  StoredProcedure [dbo].[spEliminar_presentacion]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spEliminar_presentacion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spEliminar_presentacion] AS' 
END
GO
-- 5) eliminar presentacion
ALTER proc [dbo].[spEliminar_presentacion]
@idpresentacion int
as
delete from presentacion where idpresentacion = @idpresentacion
GO
/****** Object:  StoredProcedure [dbo].[spEliminar_proveedor]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spEliminar_proveedor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spEliminar_proveedor] AS' 
END
GO
ALTER   proc [dbo].[spEliminar_proveedor]
@idproveedor int
as
delete from proveedor where idproveedor = @idproveedor
GO
/****** Object:  StoredProcedure [dbo].[spInsertar_articulo]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertar_articulo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spInsertar_articulo] AS' 
END
GO
-- 3) insertar articulo
ALTER proc [dbo].[spInsertar_articulo]
@idarticulo int output,
@codigo varchar(50),
@nombre varchar(50),
@descripcion varchar(1024),
@imagen image,
@idcategoria int,
@idpresentacion int
as
insert into articulo (codigo, nombre, descripcion, imagen, idcategoria, idpresentacion)
values (@codigo, @nombre, @descripcion, @imagen, @idcategoria, @idpresentacion)
GO
/****** Object:  StoredProcedure [dbo].[spInsertar_categoria]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertar_categoria]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spInsertar_categoria] AS' 
END
GO

-- insertar categoria
ALTER proc [dbo].[spInsertar_categoria]
@idcategoria int output, 
@nombre varchar(50),
@descripcion varchar(256)
as
insert into categoria(nombre, descripcion)
	values (@nombre, @descripcion)

GO
/****** Object:  StoredProcedure [dbo].[spInsertar_cliente]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertar_cliente]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spInsertar_cliente] AS' 
END
GO
-- 4) insertar cliente
ALTER   proc [dbo].[spInsertar_cliente]
@idcliente int output, 
@nombre varchar(20),
@apellidos varchar(40),
@sexo varchar(1),
@tipo_documento varchar(20),
@num_documento varchar(11),
@direccion varchar(100),
@telefono varchar(10),
@email varchar(50)
as
insert into cliente(nombre, apellidos, sexo, tipo_documento, num_documento, direccion, telefono, email)
values (@nombre, @apellidos, @sexo, @tipo_documento, @num_documento, @direccion, @telefono, @email)
GO
/****** Object:  StoredProcedure [dbo].[spInsertar_presentacion]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertar_presentacion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spInsertar_presentacion] AS' 
END
GO
-- 3) insertar presentacion
ALTER proc [dbo].[spInsertar_presentacion]
@idpresentacion int output, 
@nombre varchar(50),
@descripcion varchar(256)
as
insert into presentacion(nombre, descripcion)
	values (@nombre, @descripcion)
GO
/****** Object:  StoredProcedure [dbo].[spInsertar_proveedor]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spInsertar_proveedor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spInsertar_proveedor] AS' 
END
GO
-- 4) insertar proveedor
ALTER proc [dbo].[spInsertar_proveedor]
@idproveedor int output, 
@razon_social varchar(150),
@sector_comercial varchar(50),
@tipo_documento varchar(20),
@num_documento varchar(11),
@direccion varchar(100),
@telefono varchar(10),
@email varchar(50),
@url varchar(100)
as
insert into proveedor(razon_social, sector_comercial, tipo_documento, num_documento, direccion, telefono, email, url)
values (@razon_social, @sector_comercial, @tipo_documento, @num_documento, @direccion, @telefono, @email, @url)
GO
/****** Object:  StoredProcedure [dbo].[spMostrar_articulo]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spMostrar_articulo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spMostrar_articulo] AS' 
END
GO
ALTER procedure [dbo].[spMostrar_articulo]
as
SELECT top 100
	Articulo.idarticulo, Articulo.codigo, 
	Articulo.nombre, Articulo.descripcion, 
	Articulo.imagen, Articulo.idcategoria, 
	Categoria.nombre AS categoria, 
	Articulo.idpresentacion, 
    Presentacion.nombre AS Presentacion
FROM Articulo 
	INNER JOIN Categoria ON dbo.Articulo.idcategoria = dbo.Categoria.idcategoria 
	INNER JOIN Presentacion ON dbo.Articulo.idpresentacion = dbo.Presentacion.idpresentacion
order by idarticulo desc
GO
/****** Object:  StoredProcedure [dbo].[spMostrar_categoria]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spMostrar_categoria]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spMostrar_categoria] AS' 
END
GO
-- mostrar categoria
ALTER proc [dbo].[spMostrar_categoria]
as
select top 200 * from Categoria
	order by idcategoria

GO
/****** Object:  StoredProcedure [dbo].[spMostrar_cliente]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spMostrar_cliente]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spMostrar_cliente] AS' 
END
GO
-- 1) mostrar Cliente
ALTER   proc [dbo].[spMostrar_cliente]
as
select top 200 * from cliente
	order by apellidos asc
GO
/****** Object:  StoredProcedure [dbo].[spMostrar_presentacion]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spMostrar_presentacion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spMostrar_presentacion] AS' 
END
GO
ALTER proc [dbo].[spMostrar_presentacion]
as
select top 200 * from presentacion
	order by idpresentacion

GO
/****** Object:  StoredProcedure [dbo].[spMostrar_proveedor]    Script Date: 05/04/2018 17:09:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spMostrar_proveedor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spMostrar_proveedor] AS' 
END
GO
ALTER proc [dbo].[spMostrar_proveedor]
as
select top 200 * from proveedor
	order by razon_social asc
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'View_1', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Articulo"
            Begin Extent = 
               Top = 15
               Left = 142
               Bottom = 216
               Right = 351
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Categoria"
            Begin Extent = 
               Top = 7
               Left = 539
               Bottom = 120
               Right = 748
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Presentacion"
            Begin Extent = 
               Top = 170
               Left = 533
               Bottom = 283
               Right = 742
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'View_1', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
USE [master]
GO
ALTER DATABASE [dbVentas] SET  READ_WRITE 
GO
