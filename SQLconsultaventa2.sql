create procedure spMostrarProducto
as 
begin
	select idProducto,Nombre,Valor,Descuento
	from Producto
end

exec spMostrarProducto
---------------------------------------------------------
alter procedure spMostrarVentaymas
@id int
as
begin
	select v.idVenta,Cliente,Fecha,p.Nombre,vrUnitario,d.Cantidad,vrDescuento,vrUnitario*d.Cantidad as SubTotal
	from Producto p inner join DetalleVenta d
		on p.idProducto=d.idProducto  inner join Venta v
		on d.idVenta=v.idVenta 
	where v.idVenta=@id
end


exec spMostrarVentaymas 2


select * from Venta
select * from DetalleVenta

