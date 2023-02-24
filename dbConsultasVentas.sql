--Realizar un sp que permita dado el nombre o el id muestre la imformacion del rpoducto (id,nombre,categoria,cantidad,valor y descuento)
--si no existe el producto que muestre un msg

alter procedure spListarInformacion
@dato varchar (50)
as
begin
	set nocount on;
	if exists (select * from Producto where Nombre=@dato or CONVERT(varchar(50),idProducto)=@dato)
	select idProducto,Producto.Nombre,Categoria.Nombre,Cantidad,Valor,Descuento
	from Producto inner join Categoria on idCategoria=Categoria
	 Where Producto.Nombre=@dato or CONVERT(varchar (50),idProducto)=@dato;
	else
	select CONCAT('el Producto',@dato,'no se encuentra registrado')
end

exec  spListarInformacion 444
-------------------------------------------------------------------------------------------------------------------------
---Registrar producto

alter procedure [dbo].[spRegistrarProducto]
@id int,
@nom varchar(30),
@cat varchar(30),
@vencimiento date,
@cant int,
@vr	int,
@desc float,
@img varchar(50),
@esta bit
AS
Begin
	set nocount on;
	declare @msg varchar(50);
	if exists (select * from Producto where Nombre=@nom)
	begin
		set @msg=concat ('El Producto ',@nom,'',' ya existe');
	end
	else
	begin
	if exists (select * from Producto where idProducto=@id)
		begin
		set @msg=concat ('El Producto ',@id,'',' ya existe');
	end
	else
	begin
		insert into producto values (@id,@nom,dbo.fnBuscarIdCategoria(@cat),@vencimiento,@cant,@vr,@desc,@img,@esta);
		set @msg='Producto registro exitosamente';
	
	End
end
select @msg as Resultado;
end

exec spRegistrarProducto 1111,'lentejas','granos','2022/05/20',2,500,4.5,null,1
-------------------------------------------------------------------------------------------------------------------------------
-- registrar venta 
ALTER procedure [dbo].[spRegistrarVenta]
@fecha  date,
@cliente   varchar(30),
@emple		varchar(30)
AS
Begin
	declare @mensaje varchar(50);
	insert into Venta(fecha,cliente,empleado)
	values(@fecha,@cliente,@emple);
	set @mensaje = 'Venta registrada exitosamente';
	Select @mensaje AS Respuesta;
End

exec spRegistrarVenta '07/09/2022','junior','alberto'

-------------------------------------------------------------------------------------------------------------------
alter procedure spRegistrarDetalle
@idvent int,
@idprod  int,
@cant   int,
@vrUni	int,
@vrdesc	float
AS
Begin
	insert into DetalleVenta(idVenta,idProducto,Cantidad,vrUnitario,vrDescuento)
	values(@idvent,@idprod,@cant,@vrUni,@vrdesc);
End

exec spRegistrarDetalle 3,1020,5,1000,50

select* from Producto
select* from DetalleVenta

