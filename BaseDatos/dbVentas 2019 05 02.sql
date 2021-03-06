USE [master]
GO
/****** Object:  Database [dbVentas]    Script Date: 2/05/2019 12:59:00 ******/
CREATE DATABASE [dbVentas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbVentas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\dbVentas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbVentas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\dbVentas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[Categoria]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[idcategoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](256) NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[idcategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Presentacion]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Presentacion](
	[idpresentacion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](256) NULL,
 CONSTRAINT [PK_Presentacion] PRIMARY KEY CLUSTERED 
(
	[idpresentacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Articulo]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  View [dbo].[View_1]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT        dbo.Articulo.idarticulo, dbo.Articulo.codigo, dbo.Articulo.nombre, dbo.Articulo.descripcion, dbo.Articulo.imagen, dbo.Articulo.idcategoria, dbo.Categoria.nombre AS Expr1, dbo.Articulo.idpresentacion, 
                         dbo.Presentacion.nombre AS Expr2
FROM            dbo.Articulo INNER JOIN
                         dbo.Categoria ON dbo.Articulo.idcategoria = dbo.Categoria.idcategoria INNER JOIN
                         dbo.Presentacion ON dbo.Articulo.idpresentacion = dbo.Presentacion.idpresentacion
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Table [dbo].[Detalle_ingreso]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Table [dbo].[Detalle_venta]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Table [dbo].[Ingreso]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingreso](
	[idingreso] [int] IDENTITY(1,1) NOT NULL,
	[idtrabajador] [int] NOT NULL,
	[idproveedor] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[tipo_comprobante] [varchar](20) NOT NULL,
	[serie] [varchar](4) NOT NULL,
	[correlativo] [varchar](7) NOT NULL,
	[igv] [decimal](4, 2) NOT NULL,
	[estado] [varchar](7) NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[idingreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Table [dbo].[Trabajador]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Articulo_Categoria] FOREIGN KEY([idcategoria])
REFERENCES [dbo].[Categoria] ([idcategoria])
GO
ALTER TABLE [dbo].[Articulo] CHECK CONSTRAINT [FK_Articulo_Categoria]
GO
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Articulo_Presentacion] FOREIGN KEY([idpresentacion])
REFERENCES [dbo].[Presentacion] ([idpresentacion])
GO
ALTER TABLE [dbo].[Articulo] CHECK CONSTRAINT [FK_Articulo_Presentacion]
GO
ALTER TABLE [dbo].[Detalle_ingreso]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_ingreso_Articulo] FOREIGN KEY([idarticulo])
REFERENCES [dbo].[Articulo] ([idarticulo])
GO
ALTER TABLE [dbo].[Detalle_ingreso] CHECK CONSTRAINT [FK_Detalle_ingreso_Articulo]
GO
ALTER TABLE [dbo].[Detalle_ingreso]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_ingreso_Ingreso] FOREIGN KEY([idingreso])
REFERENCES [dbo].[Ingreso] ([idingreso])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Detalle_ingreso] CHECK CONSTRAINT [FK_Detalle_ingreso_Ingreso]
GO
ALTER TABLE [dbo].[Detalle_venta]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_venta_Detalle_ingreso] FOREIGN KEY([iddetalle_ingreso])
REFERENCES [dbo].[Detalle_ingreso] ([iddetalle_ingreso])
GO
ALTER TABLE [dbo].[Detalle_venta] CHECK CONSTRAINT [FK_Detalle_venta_Detalle_ingreso]
GO
ALTER TABLE [dbo].[Detalle_venta]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_venta_Venta] FOREIGN KEY([idventa])
REFERENCES [dbo].[Venta] ([idventa])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Detalle_venta] CHECK CONSTRAINT [FK_Detalle_venta_Venta]
GO
ALTER TABLE [dbo].[Ingreso]  WITH CHECK ADD  CONSTRAINT [FK_Ingreso_Proveedor] FOREIGN KEY([idproveedor])
REFERENCES [dbo].[Proveedor] ([idproveedor])
GO
ALTER TABLE [dbo].[Ingreso] CHECK CONSTRAINT [FK_Ingreso_Proveedor]
GO
ALTER TABLE [dbo].[Ingreso]  WITH CHECK ADD  CONSTRAINT [FK_Ingreso_Trabajador] FOREIGN KEY([idtrabajador])
REFERENCES [dbo].[Trabajador] ([idtrabajador])
GO
ALTER TABLE [dbo].[Ingreso] CHECK CONSTRAINT [FK_Ingreso_Trabajador]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Cliente] FOREIGN KEY([idcliente])
REFERENCES [dbo].[Cliente] ([idcliente])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Cliente]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Trabajador] FOREIGN KEY([idtrabajador])
REFERENCES [dbo].[Trabajador] ([idtrabajador])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Trabajador]
GO
/****** Object:  StoredProcedure [dbo].[spAnular_ingreso]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------------------------------------------------
-- 5) anular ingreso
------------------------------------------------------------------------------

create   proc [dbo].[spAnular_ingreso]
@idingreso int
as
update Ingreso set estado = 'ANULADO' where idingreso = @idingreso
GO
/****** Object:  StoredProcedure [dbo].[spBuscar_apellidos_cliente]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------------------------------------------------
-- 2) buscar apellidos
------------------------------------------------------------------------------

create   proc [dbo].[spBuscar_apellidos_cliente]
@textobuscar	varchar(50)
as
select * from cliente
where apellidos like @textobuscar + '%'	--  Alt + 37
GO
/****** Object:  StoredProcedure [dbo].[spBuscar_apellidos_trabajador]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[spBuscar_apellidos_trabajador]
@textobuscar	varchar(50)
as
select * from trabajador
where apellidos like @textobuscar + '%'	--  Alt + 37
GO
/****** Object:  StoredProcedure [dbo].[spBuscar_articulo_nombre]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[spBuscar_articulo_nombre]
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
/****** Object:  StoredProcedure [dbo].[spBuscar_categoria]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[spBuscar_categoria]
@textobuscar	varchar(50)
as
select * from Categoria
where nombre like @textobuscar + '%'	--  Alt + 37
GO
/****** Object:  StoredProcedure [dbo].[spBuscar_ingreso_fecha]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[spBuscar_ingreso_fecha]
@textobuscarini varchar(20),
@textobuscarfin varchar(20)
as
select i.idingreso, (t.apellidos + ' ' + t.nombre) as trabajador,
	p.razon_social as proveedor,
	i.fecha, i.tipo_comprobante, i.serie, i.correlativo, i.estado,
	sum(d.precio_compra * d.stock_inicial) as total
from Detalle_ingreso d	inner join ingreso i on d.idingreso = i.idingreso
						inner join Proveedor p on i.idproveedor = p.idproveedor
						inner join Trabajador t on i.idtrabajador = t.idtrabajador
group by i.idingreso, t.apellidos + ' ' + t.nombre,	p.razon_social,
	i.fecha, i.tipo_comprobante, i.serie, i.correlativo, i.estado
having i.fecha >= @textobuscarini and i.fecha <= @textobuscarfin
GO
/****** Object:  StoredProcedure [dbo].[spBuscar_num_documento_cliente]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------------------------------------------------
-- 3) buscar numero de documento
------------------------------------------------------------------------------

create   proc [dbo].[spBuscar_num_documento_cliente]
@textobuscar	varchar(8)
as
select * from cliente
where num_documento like @textobuscar + '%'	--  Alt + 37
GO
/****** Object:  StoredProcedure [dbo].[spBuscar_num_documento_proveedor]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[spBuscar_num_documento_proveedor]
@textobuscar	varchar(11)
as
select * from proveedor
where num_documento like @textobuscar + '%'	--  Alt + 37
GO
/****** Object:  StoredProcedure [dbo].[spBuscar_num_documento_trabajador]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------------------------------------------------
-- 3) buscar numero de documento
------------------------------------------------------------------------------

create   proc [dbo].[spBuscar_num_documento_trabajador]
@textobuscar	varchar(8)
as
select * from trabajador
where num_documento like @textobuscar + '%'	--  Alt + 37
GO
/****** Object:  StoredProcedure [dbo].[spBuscar_presentacion_nombre]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[spBuscar_presentacion_nombre]
@textobuscar	varchar(50)
as
select * from presentacion
where nombre like @textobuscar + '%'	--  Alt + 37
GO
/****** Object:  StoredProcedure [dbo].[spBuscar_razon_social_proveedor]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[spBuscar_razon_social_proveedor]	
@textobuscar	varchar(50)
as
select * from proveedor
where razon_social like @textobuscar + '%'	--  Alt + 37
GO
/****** Object:  StoredProcedure [dbo].[spBuscar_ventas_fecha]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------------------------------------------------
-- 2) Buscar ventas por fecha
------------------------------------------------------------------------------

create   proc [dbo].[spBuscar_ventas_fecha]
@textobuscar varchar(50),
@textobuscar2 varchar(50)
as
select v.idventa, 
	(t.nombre + ' ' + t.apellidos) as trabajador,
	(c.nombre + ' ' + c.apellidos) as cliente,
	v.fecha, v.tipo_comprobante, v.serie, v.correlativo,
	sum ((d.cantidad * d.precio_venta) - d.descuento) as total
	from venta v inner join Detalle_Venta d on v.idventa = d.idventa 
	inner join Cliente c on v.idcliente = c.idcliente 
	inner join Trabajador t on v.idtrabajador = t.idtrabajador
	group by v.idventa, 
	(t.nombre + ' ' + t.apellidos),
	(c.nombre + ' ' + c.apellidos),
	v.fecha, v.tipo_comprobante, v.serie, v.correlativo
	having v.fecha >= @textobuscar and v.fecha <= @textobuscar2
GO
/****** Object:  StoredProcedure [dbo].[spBuscarArticulo_venta_codigo]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[spBuscarArticulo_venta_codigo]
@textobuscar as varchar(50)
as
select d.iddetalle_ingreso, a.codigo, a.nombre, 
	c.nombre as categoria, 
	p.nombre as presentacion,
	d.stock_actual, d.precio_compra, d.precio_venta, d.fecha_vencimiento
from articulo a
	inner join categoria c on a.idcategoria = c.idcategoria
	inner join presentacion p on a.idpresentacion = p.idpresentacion
	inner join detalle_ingreso d on a.idarticulo = d.idarticulo
	inner join ingreso i on d.idingreso = i.idingreso
where a.codigo = @textobuscar and d.stock_actual > 0 and i.estado <> 'ANULADO'
GO
/****** Object:  StoredProcedure [dbo].[spBuscarArticulo_venta_nombre]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------------------------------------------------
-- 9) mostrar articulos para la venta x nombre
------------------------------------------------------------------------------
create   proc [dbo].[spBuscarArticulo_venta_nombre]
@textobuscar as varchar(50)
as
select d.iddetalle_ingreso, a.codigo, a.nombre, 
	c.nombre as categoria, 
	p.nombre as presentacion,
	d.stock_actual, d.precio_compra, d.precio_venta, d.fecha_vencimiento
from articulo a
	inner join categoria c on a.idcategoria = c.idcategoria
	inner join presentacion p on a.idpresentacion = p.idpresentacion
	inner join detalle_ingreso d on a.idarticulo = d.idarticulo
	inner join ingreso i on d.idingreso = i.idingreso
where a.nombre like @textobuscar + '%' and d.stock_actual > 0 and i.estado <> 'ANULADO'
GO
/****** Object:  StoredProcedure [dbo].[spDisminuir_stock]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------------------------------------------------
-- 7) disminuir el stock despues de la venta
------------------------------------------------------------------------------

create   proc [dbo].[spDisminuir_stock]
@iddetalle_ingreso int,
@cantidad int
as
update Detalle_ingreso set stock_actual = stock_actual - @cantidad
where iddetalle_ingreso = @iddetalle_ingreso
GO
/****** Object:  StoredProcedure [dbo].[spEditar_articulo]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[spEditar_articulo]
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
/****** Object:  StoredProcedure [dbo].[spEditar_categoria]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[spEditar_categoria]
@idcategoria int, 
@nombre varchar(50),
@descripcion varchar(256)
as
update categoria
	set nombre = @nombre, 
	descripcion = @descripcion
	where idcategoria = @idcategoria
GO
/****** Object:  StoredProcedure [dbo].[spEditar_cliente]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------------------------------------------------
-- 5) editar cliente
------------------------------------------------------------------------------

create   proc [dbo].[spEditar_cliente]
@idcliente int, 
@nombre varchar(20),
@apellidos varchar(40),
@sexo varchar(1),
@fecha_nacimiento date,
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
	fecha_nacimiento = fecha_nacimiento,
	tipo_documento = @tipo_documento,
	num_documento = @num_documento,
	direccion = @direccion,
	telefono = @telefono,
	email = @email	
	where @idcliente = @idcliente
GO
/****** Object:  StoredProcedure [dbo].[spEditar_presentacion]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[spEditar_presentacion]
@idpresentacion int, 
@nombre varchar(50),
@descripcion varchar(256)
as
update presentacion
	set nombre = @nombre, 
	descripcion = @descripcion
	where idpresentacion = @idpresentacion
GO
/****** Object:  StoredProcedure [dbo].[spEditar_proveedor]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[spEditar_proveedor]
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
/****** Object:  StoredProcedure [dbo].[spEditar_trabajador]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------------------------------------------------
-- 5) editar trabajador
------------------------------------------------------------------------------

create   proc [dbo].[spEditar_trabajador]
@idtrabajador int, 
@nombre varchar(20),
@apellidos varchar(40),
@sexo varchar(1),
@fecha_nacimiento date,
@num_documento varchar(11),
@direccion varchar(100),
@telefono varchar(10),
@email varchar(50),
@acceso varchar(20),
@usuario varchar(20),
@password varchar(20)
as
update trabajador
	set nombre = @nombre,
	apellidos = @apellidos,
	sexo = @sexo,
	fecha_nacimiento = fecha_nacimiento,
	num_documento = @num_documento,
	direccion = @direccion,
	telefono = @telefono,
	email = @email,
	acceso = @acceso,
	usuario = @usuario,
	password = @password
	where idtrabajador = @idtrabajador
GO
/****** Object:  StoredProcedure [dbo].[spEliminar_articulo]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[spEliminar_articulo]
@idarticulo int
as
delete from Articulo where idarticulo = @idarticulo
GO
/****** Object:  StoredProcedure [dbo].[spEliminar_categoria]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[spEliminar_categoria]
@idcategoria int
as
delete from categoria where idcategoria = @idcategoria
GO
/****** Object:  StoredProcedure [dbo].[spEliminar_cliente]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 6) eliminar cliente
create   proc [dbo].[spEliminar_cliente]
@idcliente int
as
delete from cliente where idcliente = @idcliente
GO
/****** Object:  StoredProcedure [dbo].[spEliminar_presentacion]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[spEliminar_presentacion]
@idpresentacion int
as
delete from presentacion where idpresentacion = @idpresentacion
GO
/****** Object:  StoredProcedure [dbo].[spEliminar_proveedor]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[spEliminar_proveedor]
@idproveedor int
as
delete from proveedor where idproveedor = @idproveedor
GO
/****** Object:  StoredProcedure [dbo].[spEliminar_trabajador]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 6) eliminar trabajador
create   proc [dbo].[spEliminar_trabajador]
@idtrabajador int
as
delete from trabajador where idtrabajador = @idtrabajador
GO
/****** Object:  StoredProcedure [dbo].[spEliminar_venta]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------------------------------------------------
-- 5) eliminar venta
------------------------------------------------------------------------------

create   proc [dbo].[spEliminar_venta]
@idventa int
as
delete from Venta where idventa = @idventa
GO
/****** Object:  StoredProcedure [dbo].[spInsertar_articulo]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[spInsertar_articulo]
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
/****** Object:  StoredProcedure [dbo].[spInsertar_categoria]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[spInsertar_categoria]
@idcategoria int output, 
@nombre varchar(50),
@descripcion varchar(256)
as
insert into categoria(nombre, descripcion)
	values (@nombre, @descripcion)
GO
/****** Object:  StoredProcedure [dbo].[spInsertar_cliente]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------------------------------------------------
-- 4) insertar cliente
------------------------------------------------------------------------------

create   proc [dbo].[spInsertar_cliente]
@idcliente int output, 
@nombre varchar(20),
@apellidos varchar(40),
@sexo varchar(1),
@fecha_nacimiento date,
@tipo_documento varchar(20),
@num_documento varchar(11),
@direccion varchar(100),
@telefono varchar(10),
@email varchar(50)
as
insert into cliente(nombre, apellidos, sexo, fecha_nacimiento, tipo_documento, num_documento, direccion, telefono, email)
values (@nombre, @apellidos, @sexo, @fecha_nacimiento, @tipo_documento, @num_documento, @direccion, @telefono, @email)
GO
/****** Object:  StoredProcedure [dbo].[spInsertar_detalle_ingreso]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------------------------------------------------
-- 6) insertar detalles de ingreso
------------------------------------------------------------------------------

create   proc [dbo].[spInsertar_detalle_ingreso]
@iddetalle_ingreso int output,
@idingreso int,
@idarticulo int,
@precio_compra money, 
@precio_venta money,
@stock_inicial int,
@stock_actual int,
@fecha_produccion date,
@fecha_vencimiento date
as
insert into Detalle_ingreso(idingreso, idarticulo, precio_compra, precio_venta, stock_inicial, stock_actual, fecha_produccion, fecha_vencimiento)
	values(@idingreso, @idarticulo, @precio_compra, @precio_venta, @stock_inicial, @stock_actual, @fecha_produccion, @fecha_vencimiento)
GO
/****** Object:  StoredProcedure [dbo].[spInsertar_detalle_venta]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------------------------------------------------
-- 4) insertar detalle de venta
------------------------------------------------------------------------------

create   proc [dbo].[spInsertar_detalle_venta]
@iddetalle_venta int output,
@idventa int,
@iddetalle_ingreso int,
@cantidad int,
@precio_venta money,
@descuento money
as
insert into Detalle_Venta (idventa, iddetalle_ingreso, cantidad, precio_venta, descuento)
	values (@idventa, @iddetalle_ingreso, @cantidad, @precio_venta, @descuento)
GO
/****** Object:  StoredProcedure [dbo].[spInsertar_ingreso]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------------------------------------------------
-- 4) insertar ingreso
------------------------------------------------------------------------------

create   proc [dbo].[spInsertar_ingreso]
@idingreso int = null output,
@idtrabajador int,
@idproveedor int,
@fecha date,
@tipo_comprobante varchar(20),
@serie varchar(4),
@correlativo varchar(7),
@igv decimal(7,2),
@estado varchar(7)
as
insert into ingreso (idtrabajador, idproveedor, fecha, tipo_comprobante, serie, correlativo, igv, estado)
values(@idtrabajador, @idproveedor, @fecha, @tipo_comprobante, @serie, @correlativo, @igv, @estado)

-- obtener el codigo autogenerado
set @idingreso = @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[spInsertar_presentacion]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[spInsertar_presentacion]
@idpresentacion int output, 
@nombre varchar(50),
@descripcion varchar(256)
as
insert into presentacion(nombre, descripcion)
	values (@nombre, @descripcion)
GO
/****** Object:  StoredProcedure [dbo].[spInsertar_proveedor]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[spInsertar_proveedor]
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
/****** Object:  StoredProcedure [dbo].[spInsertar_trabajador]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------------------------------------------------
-- 4) insertar trabajador
------------------------------------------------------------------------------

create   proc [dbo].[spInsertar_trabajador]
@idtrabajador int output, 
@nombre varchar(20),
@apellidos varchar(40),
@sexo varchar(1),
@fecha_nacimiento date,
@num_documento varchar(11),
@direccion varchar(100),
@telefono varchar(10),
@email varchar(50),
@acceso varchar(20),
@usuario varchar(20),
@password varchar(20)
as
insert into trabajador(nombre, apellidos, sexo, fecha_nacimiento, num_documento, direccion, telefono, email, acceso, usuario, password)
values (@nombre, @apellidos, @sexo, @fecha_nacimiento, @num_documento, @direccion, @telefono, @email, @acceso, @usuario, @password)
GO
/****** Object:  StoredProcedure [dbo].[spInsertar_venta]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------------------------------------------------
-- 3) insertar venta
------------------------------------------------------------------------------

create   proc [dbo].[spInsertar_venta]
@idventa int = null output,
@idcliente int,
@idtrabajador int,
@fecha date,
@tipo_comprobante varchar(20),
@serie varchar(4),
@correlativo varchar(7),
@igv decimal(4,2)
as
insert into Venta (idcliente, idtrabajador, fecha, tipo_comprobante, serie, correlativo, igv)
	values (@idcliente, @idtrabajador, @fecha, @tipo_comprobante, @serie, @correlativo, @igv)
set @idventa = @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[spLogin]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- --------------------------------
create   proc [dbo].[spLogin]
@usuario varchar(20),
@password varchar(20)
as
select idtrabajador, nombre, apellidos, acceso	from Trabajador
	where usuario = @usuario and password = @password
GO
/****** Object:  StoredProcedure [dbo].[spMostrar_articulo]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[spMostrar_articulo]
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
/****** Object:  StoredProcedure [dbo].[spMostrar_categoria]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[spMostrar_categoria]
as
select top 200 * from Categoria
	order by idcategoria
GO
/****** Object:  StoredProcedure [dbo].[spMostrar_cliente]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- --------------------------------
-- TABLA CLIENTES
-- --------------------------------

------------------------------------------------------------------------------
-- 1) mostrar Cliente
------------------------------------------------------------------------------

create   proc [dbo].[spMostrar_cliente]
as
select top 200 * from cliente
	order by apellidos asc
GO
/****** Object:  StoredProcedure [dbo].[spMostrar_detalle_ingreso]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------------------------------------------------
-- 7) mostrar detalle de ingreso
------------------------------------------------------------------------------

create   proc [dbo].[spMostrar_detalle_ingreso]
@textobuscar int
as
select d.idarticulo, a.nombre as articulo, d.precio_compra, d.precio_venta, d.stock_inicial, d.fecha_produccion, d.fecha_vencimiento,
	(d.stock_inicial * d.precio_compra) as subtotal
from Detalle_ingreso d inner join articulo a on d.idarticulo = a.idarticulo
where d.idingreso = @textobuscar

GO
/****** Object:  StoredProcedure [dbo].[spMostrar_detalle_venta]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------------------------------------------------
-- 8) mostrar los detalles de una venta
------------------------------------------------------------------------------

create   proc [dbo].[spMostrar_detalle_venta]
@textobuscar int
as
select d.iddetalle_ingreso, a.nombre as articulo, 
	d.cantidad, d.precio_venta, d.descuento,
	((d.precio_venta * d.cantidad) - d.descuento ) as subtotal
from detalle_venta d
	inner join Detalle_ingreso di on di.iddetalle_ingreso = d.iddetalle_ingreso
	inner join Articulo a on a.idarticulo = a.idarticulo
where d.idventa = @textobuscar
GO
/****** Object:  StoredProcedure [dbo].[spMostrar_ingreso]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[spMostrar_ingreso]
as
select top 200 i.idingreso, (t.apellidos + ' ' + t.nombre) as trabajador,
	p.razon_social as proveedor,
	i.fecha, i.tipo_comprobante, i.serie, i.correlativo, i.estado,
	sum(d.precio_compra * d.stock_inicial) as total
from Detalle_ingreso d	inner join ingreso i on d.idingreso = i.idingreso
						inner join Proveedor p on i.idproveedor = p.idproveedor
						inner join Trabajador t on i.idtrabajador = t.idtrabajador
group by i.idingreso, t.apellidos + ' ' + t.nombre,	p.razon_social,
	i.fecha, i.tipo_comprobante, i.serie, i.correlativo, i.estado
order by i.idingreso desc
GO
/****** Object:  StoredProcedure [dbo].[spMostrar_presentacion]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[spMostrar_presentacion]
as
select top 200 * from presentacion
	order by idpresentacion desc
GO
/****** Object:  StoredProcedure [dbo].[spMostrar_proveedor]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[spMostrar_proveedor]
as
select top 200 * from proveedor
	order by razon_social asc
GO
/****** Object:  StoredProcedure [dbo].[spMostrar_trabajador]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[spMostrar_trabajador]
as
select top 200 * from trabajador
	order by apellidos asc
GO
/****** Object:  StoredProcedure [dbo].[spMostrar_venta]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   proc [dbo].[spMostrar_venta]
as
select top 100 v.idventa, 
	(t.nombre + ' ' + t.apellidos) as trabajador,
	(c.nombre + ' ' + c.apellidos) as cliente,
	v.fecha, v.tipo_comprobante, v.serie, v.correlativo,
	sum ((d.cantidad * d.precio_venta) - d.descuento) as total
	from venta v inner join Detalle_Venta d on v.idventa = d.idventa 
	inner join Cliente c on v.idcliente = c.idcliente 
	inner join Trabajador t on v.idtrabajador = t.idtrabajador
	group by v.idventa, 
	(t.nombre + ' ' + t.apellidos),
	(c.nombre + ' ' + c.apellidos),
	v.fecha, v.tipo_comprobante, v.serie, v.correlativo
	order by v.idventa desc
GO
/****** Object:  StoredProcedure [dbo].[spReporte_factura]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[spReporte_factura]
@idventa int
as
select v.idventa, 
	(t.nombre + ' ' + t.apellidos) as trabajador,
	(c.nombre + ' ' + c.apellidos) as cliente,
	c.direccion, c.telefono, c.num_documento,
	v.fecha, v.tipo_comprobante, v.serie, v.correlativo, v.igv,
	a.nombre,
	dv.precio_venta, dv.cantidad, dv.descuento,
	((dv.precio_venta * dv.cantidad) - dv.descuento) as totalParcial	
	from Detalle_Venta dv	inner join detalle_ingreso di on dv.iddetalle_ingreso = di.iddetalle_ingreso
							inner join articulo a		  on di.idarticulo        = a.idarticulo
							inner join venta    v         on dv.idventa           = v.idventa
							inner join cliente c          on v.idcliente          = c.idcliente
							inner join Trabajador t       on v.idtrabajador       = t.idtrabajador	
	where v.idventa = @idventa	
GO
/****** Object:  StoredProcedure [dbo].[spStock_articulos]    Script Date: 2/05/2019 12:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 2) Consulta de Stock de Articulos
create   proc [dbo].[spStock_articulos]
AS
SELECT dbo.Articulo.codigo, dbo.Articulo.nombre, 
	dbo.Categoria.nombre AS Categoria, 
	sum(dbo.Detalle_ingreso.stock_inicial) as Cantidad_ingreso, 
	sum(dbo.Detalle_ingreso.stock_actual)  as Cantidad_stock,
	sum(dbo.Detalle_ingreso.stock_inicial) - sum(dbo.Detalle_ingreso.stock_actual)  as Cantidad_ventas
FROM dbo.Articulo INNER JOIN dbo.Categoria ON dbo.Articulo.idcategoria = dbo.Categoria.idcategoria 
				  INNER JOIN dbo.Detalle_ingreso ON dbo.Articulo.idarticulo = dbo.Detalle_ingreso.idarticulo 
				  INNER JOIN dbo.Ingreso ON dbo.Detalle_ingreso.idingreso = dbo.Ingreso.idingreso
WHERE estado <> 'ANULADO'
GROUP BY dbo.Articulo.codigo, dbo.Articulo.nombre, 
	dbo.Categoria.nombre
GO
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
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
USE [master]
GO
ALTER DATABASE [dbVentas] SET  READ_WRITE 
GO
