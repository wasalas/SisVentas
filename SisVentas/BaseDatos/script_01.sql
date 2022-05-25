-- --------------------------------
-- TABLA CATEGORIAS
-- --------------------------------

------------------------------------------------------------------------------
-- 1) mostrar categoria
------------------------------------------------------------------------------

create or alter proc spMostrar_categoria
as
select top 200 * from Categoria
	order by idcategoria
go

------------------------------------------------------------------------------
-- 2) buscar nombre categoria
------------------------------------------------------------------------------

create or alter proc spBuscar_categoria
@textobuscar	varchar(50)
as
select * from Categoria
where nombre like @textobuscar + '%'	--  Alt + 37
go

------------------------------------------------------------------------------
-- 3) insertar categoria
------------------------------------------------------------------------------

create or alter proc spInsertar_categoria
@idcategoria int output, 
@nombre varchar(50),
@descripcion varchar(256)
as
insert into categoria(nombre, descripcion)
	values (@nombre, @descripcion)
go

------------------------------------------------------------------------------
-- 4) editar categoria
------------------------------------------------------------------------------

create or alter proc spEditar_categoria
@idcategoria int, 
@nombre varchar(50),
@descripcion varchar(256)
as
update categoria
	set nombre = @nombre, 
	descripcion = @descripcion
	where idcategoria = @idcategoria
go

------------------------------------------------------------------------------
-- 5) eliminar categoria
------------------------------------------------------------------------------

create or alter proc spEliminar_categoria
@idcategoria int
as
delete from categoria where idcategoria = @idcategoria
go

-- --------------------------------
-- TABLA PRESENTACIONES
-- --------------------------------

------------------------------------------------------------------------------
-- 1) mostrar presentacion
------------------------------------------------------------------------------

create or alter proc spMostrar_presentacion
as
select top 200 * from presentacion
	order by idpresentacion desc
go

------------------------------------------------------------------------------
-- 2) buscar nombre presentacion
------------------------------------------------------------------------------

create or alter proc spBuscar_presentacion_nombre
@textobuscar	varchar(50)
as
select * from presentacion
where nombre like @textobuscar + '%'	--  Alt + 37
go

------------------------------------------------------------------------------
-- 3) insertar presentacion
------------------------------------------------------------------------------

create or alter proc spInsertar_presentacion
@idpresentacion int output, 
@nombre varchar(50),
@descripcion varchar(256)
as
insert into presentacion(nombre, descripcion)
	values (@nombre, @descripcion)
go

------------------------------------------------------------------------------
-- 4) editar presentacion
------------------------------------------------------------------------------

create or alter proc spEditar_presentacion
@idpresentacion int, 
@nombre varchar(50),
@descripcion varchar(256)
as
update presentacion
	set nombre = @nombre, 
	descripcion = @descripcion
	where idpresentacion = @idpresentacion
go

------------------------------------------------------------------------------
-- 5) eliminar presentacion
------------------------------------------------------------------------------

create or alter proc spEliminar_presentacion
@idpresentacion int
as
delete from presentacion where idpresentacion = @idpresentacion
go

-- --------------------------------
-- TABLA ARTICULOS
-- --------------------------------

------------------------------------------------------------------------------
-- 1) mostrar articulo
------------------------------------------------------------------------------

create or alter proc spMostrar_articulo
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
go

------------------------------------------------------------------------------
-- 2) buscar articulo nombre
------------------------------------------------------------------------------

create or alter proc spBuscar_articulo_nombre
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
go

------------------------------------------------------------------------------
-- 3) insertar articulo
------------------------------------------------------------------------------

create or alter proc spInsertar_articulo
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
go

------------------------------------------------------------------------------
-- 4) editar articulo
------------------------------------------------------------------------------

create or alter proc spEditar_articulo
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
go

------------------------------------------------------------------------------
-- 5) eliminar articulo
------------------------------------------------------------------------------

create or alter proc spEliminar_articulo
@idarticulo int
as
delete from Articulo where idarticulo = @idarticulo
go

-- --------------------------------
-- TABLA PROVEEDOR
-- --------------------------------

------------------------------------------------------------------------------
-- 1) mostrar proveedor
------------------------------------------------------------------------------

create or alter proc spMostrar_proveedor
as
select top 200 * from proveedor
	order by razon_social asc
go

------------------------------------------------------------------------------
-- 2) buscar razon social
------------------------------------------------------------------------------

create or alter proc spBuscar_razon_social_proveedor	
@textobuscar	varchar(50)
as
select * from proveedor
where razon_social like @textobuscar + '%'	--  Alt + 37
go

------------------------------------------------------------------------------
-- 3) buscar numero de documento
------------------------------------------------------------------------------

create or alter proc spBuscar_num_documento_proveedor
@textobuscar	varchar(11)
as
select * from proveedor
where num_documento like @textobuscar + '%'	--  Alt + 37
go

------------------------------------------------------------------------------
-- 4) insertar proveedor
------------------------------------------------------------------------------

create or alter proc spInsertar_proveedor
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
go

------------------------------------------------------------------------------
-- 5) editar proveedor
------------------------------------------------------------------------------

create or alter proc spEditar_proveedor
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
go

------------------------------------------------------------------------------
-- 6) eliminar proveedor
------------------------------------------------------------------------------

create or alter proc spEliminar_proveedor
@idproveedor int
as
delete from proveedor where idproveedor = @idproveedor
go

-- --------------------------------
-- TABLA CLIENTES
-- --------------------------------

------------------------------------------------------------------------------
-- 1) mostrar Cliente
------------------------------------------------------------------------------

create or alter proc spMostrar_cliente
as
select top 200 * from cliente
	order by apellidos asc
go

------------------------------------------------------------------------------
-- 2) buscar apellidos
------------------------------------------------------------------------------

create or alter proc spBuscar_apellidos_cliente
@textobuscar	varchar(50)
as
select * from cliente
where apellidos like @textobuscar + '%'	--  Alt + 37
go

------------------------------------------------------------------------------
-- 3) buscar numero de documento
------------------------------------------------------------------------------

create or alter proc spBuscar_num_documento_cliente
@textobuscar	varchar(8)
as
select * from cliente
where num_documento like @textobuscar + '%'	--  Alt + 37
go

------------------------------------------------------------------------------
-- 4) insertar cliente
------------------------------------------------------------------------------

create or alter proc spInsertar_cliente
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
go

------------------------------------------------------------------------------
-- 5) editar cliente
------------------------------------------------------------------------------

create or alter proc spEditar_cliente
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
go

-- 6) eliminar cliente
create or alter proc spEliminar_cliente
@idcliente int
as
delete from cliente where idcliente = @idcliente
go

-- --------------------------------
-- TABLA TRABAJADOR
-- --------------------------------

------------------------------------------------------------------------------
-- 1) mostrar trabajador
------------------------------------------------------------------------------

create or alter proc spMostrar_trabajador
as
select top 200 * from trabajador
	order by apellidos asc
go

------------------------------------------------------------------------------
-- 2) buscar apellidos
------------------------------------------------------------------------------

create or alter proc spBuscar_apellidos_trabajador
@textobuscar	varchar(50)
as
select * from trabajador
where apellidos like @textobuscar + '%'	--  Alt + 37
go

------------------------------------------------------------------------------
-- 3) buscar numero de documento
------------------------------------------------------------------------------

create or alter proc spBuscar_num_documento_trabajador
@textobuscar	varchar(8)
as
select * from trabajador
where num_documento like @textobuscar + '%'	--  Alt + 37
go

------------------------------------------------------------------------------
-- 4) insertar trabajador
------------------------------------------------------------------------------

create or alter proc spInsertar_trabajador
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
go

------------------------------------------------------------------------------
-- 5) editar trabajador
------------------------------------------------------------------------------

create or alter proc spEditar_trabajador
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
go

-- 6) eliminar trabajador
create or alter proc spEliminar_trabajador
@idtrabajador int
as
delete from trabajador where idtrabajador = @idtrabajador
go

-- --------------------------------
-- LOGIN
-- --------------------------------
create or alter proc spLogin
@usuario varchar(20),
@password varchar(20)
as
select idtrabajador, nombre, apellidos, acceso	from Trabajador
	where usuario = @usuario and password = @password
go

-- --------------------------------
-- INGRESOS
-- --------------------------------

------------------------------------------------------------------------------
-- 1) Agregar columna estado
------------------------------------------------------------------------------

alter table ingreso add estado varchar(7) not null
go

------------------------------------------------------------------------------
-- 2) mostar los ingresos
------------------------------------------------------------------------------

create or alter proc spMostrar_ingreso
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
go

------------------------------------------------------------------------------
-- 3) mostrar ingresos entre fecha
------------------------------------------------------------------------------

create or alter proc spBuscar_ingreso_fecha
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
go

------------------------------------------------------------------------------
-- 4) insertar ingreso
------------------------------------------------------------------------------

create or alter proc spInsertar_ingreso
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
go

------------------------------------------------------------------------------
-- 5) anular ingreso
------------------------------------------------------------------------------

create or alter proc spAnular_ingreso
@idingreso int
as
update Ingreso set estado = 'ANULADO' where idingreso = @idingreso
go

------------------------------------------------------------------------------
-- 6) insertar detalles de ingreso
------------------------------------------------------------------------------

create or alter proc spInsertar_detalle_ingreso
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
go

------------------------------------------------------------------------------
-- 7) mostrar detalle de ingreso
------------------------------------------------------------------------------

create or alter proc spMostrar_detalle_ingreso
@textobuscar int
as
select d.idarticulo, a.nombre as articulo, d.precio_compra, d.precio_venta, d.stock_inicial, d.fecha_produccion, d.fecha_vencimiento,
	(d.stock_inicial * d.precio_compra) as subtotal
from Detalle_ingreso d inner join articulo a on d.idarticulo = a.idarticulo
where d.idingreso = @textobuscar

go

-- --------------------------------
-- VENTAS
-- --------------------------------

------------------------------------------------------------------------------
-- 1) Mostrar Venta
------------------------------------------------------------------------------

create or alter proc spMostrar_venta
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
go

------------------------------------------------------------------------------
-- 2) Buscar ventas por fecha
------------------------------------------------------------------------------

create or alter proc spBuscar_ventas_fecha
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
go

------------------------------------------------------------------------------
-- 3) insertar venta
------------------------------------------------------------------------------

create or alter proc spInsertar_venta
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
go

------------------------------------------------------------------------------
-- 4) insertar detalle de venta
------------------------------------------------------------------------------

create or alter proc spInsertar_detalle_venta
@iddetalle_venta int output,
@idventa int,
@iddetalle_ingreso int,
@cantidad int,
@precio_venta money,
@descuento money
as
insert into Detalle_Venta (idventa, iddetalle_ingreso, cantidad, precio_venta, descuento)
	values (@idventa, @iddetalle_ingreso, @cantidad, @precio_venta, @descuento)
go

------------------------------------------------------------------------------
-- 5) eliminar venta
------------------------------------------------------------------------------

create or alter proc spEliminar_venta
@idventa int
as
delete from Venta where idventa = @idventa
go

------------------------------------------------------------------------------
-- 6) Restablecer el stock despues de eliminar la venta y su detalle
------------------------------------------------------------------------------

create or alter trigger trRestablecer_stock
on [detalle_venta]
for delete
as
update di set di.stock_actual = di.stock_actual + dv.cantidad
from detalle_ingreso as di inner join
deleted as dv on di.iddetalle_ingreso = dv.iddetalle_ingreso
go

------------------------------------------------------------------------------
-- 7) disminuir el stock despues de la venta
------------------------------------------------------------------------------

create or alter proc spDisminuir_stock
@iddetalle_ingreso int,
@cantidad int
as
update Detalle_ingreso set stock_actual = stock_actual - @cantidad
where iddetalle_ingreso = @iddetalle_ingreso
go

------------------------------------------------------------------------------
-- 8) mostrar los detalles de una venta
------------------------------------------------------------------------------

create or alter proc spMostrar_detalle_venta
@textobuscar int
as
select d.iddetalle_ingreso, a.nombre as articulo, 
	d.cantidad, d.precio_venta, d.descuento,
	((d.precio_venta * d.cantidad) - d.descuento ) as subtotal
from detalle_venta d
	inner join Detalle_ingreso di on di.iddetalle_ingreso = d.iddetalle_ingreso
	inner join Articulo a on a.idarticulo = a.idarticulo
where d.idventa = @textobuscar
go

------------------------------------------------------------------------------
-- 9) mostrar articulos para la venta x nombre
------------------------------------------------------------------------------
create or alter proc spBuscarArticulo_venta_nombre
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

------------------------------------------------------------------------------
-- 10) mostrar articulos para la venta x codigo
------------------------------------------------------------------------------
create or alter proc spBuscarArticulo_venta_codigo
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

------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------
exec spMostrar_categoria
exec spMostrar_presentacion
exec spMostrar_articulo
exec spMostrar_trabajador

update Trabajador set acceso = 'Administrador' where idtrabajador = 1;

select * from detalle_ingreso
------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------
