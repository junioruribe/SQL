create database dbEmpleado

Use dbEmpleado;

create table Empleado
(
Documento int primary key,
Nombre varchar (50) unique,
Genero char (1),
Edad smallint,
ht int,
)
select * from Empleado


INSERT INTO Empleado(Documento, Nombre, Genero, Edad, ht) 
VALUES (11, 'juan', 'h', 25, 81);

INSERT INTO Empleado(Documento, Nombre, Genero, Edad, ht) 
VALUES (22, 'Ana', 'm', 30, 90);

INSERT INTO Empleado(Documento, Nombre, Genero, Edad, ht) 
VALUES (3011, 'Pedro', 'h', 28, 85);

INSERT INTO Empleado(Documento, Nombre, Genero, Edad, ht) 
VALUES (7020, 'Felipe', 'h', 20, 90);
--------------------------------------------------------------------------------------------------

Create procedure spActualizarEmpleado
@doc int,
@ht int
as
begin
	set nocount on;
	declare @msg varchar(50);
	update Empleado set ht=@ht where Documento=@doc;
	if @@ROWCOUNT>0
	Set @msg=CONCAT ('Empleado',@doc,'Actualizado correctamente');
	else
	Set @msg=CONCAT ('Empleado ' ,@doc, ' El Empleado no se actualizo');
	select @msg as Resultado;
end

exec spActualizarEmpleado 7022,90
-------------------------------------------------------------------------------------------------
create procedure spRegistrarEmpleado
@doc int,
@nom varchar (50),
@gen char (1),
@edad smallint,
@ht int
as
begin
	set nocount on;
	declare @msg varchar (50)                        
	if exists (select * from Empleado where documento=@doc)
	begin
		set @msg=concat ('El Empleado ',@doc,'',' ya existe');
	end
	else
	begin
		insert into Empleado(Documento,Nombre,Edad,Genero,ht)
		values (@doc,@nom,@edad,@gen,@ht);
		set @msg=concat('El empleado ',@nom,' Registrado exitosamente');
	end
	select @msg as Resultado;
end
select * from empleado 
exec spRegistrarEmpleado 702,'Felipe1','H',20,81

--------------------------------------------------------------------------------------------------------------------
-- crear un procedimiento para eliminar empleado
create  procedure spEliminarEmpleado
@doc int
as
begin
	set nocount on;
	declare @msg varchar (50);
	delete from empleado where Documento=@doc;
	if @@ROWCOUNT>0
	set @msg=CONCAT('Empleado',@doc,'Eliminado correctamente');
	else
	Set @msg=CONCAT('Empleado',@doc,'No se pudo eliminar');
	select @msg as Resultado;
	end
	exec spEliminarEmpleado 702
--------------------------------------------------------------------------------------------------------------
--funcion para calcular el valor de la hora ordinaria
alter function fCalcularVHO(@edad smallint,@gen char(1))
returns int
as
begin
	declare @vho int;
		if @gen='M' and @edad>=18
		set @vho=10000;
	else if @gen='M' and  @edad>=18
		set @vho=7000;
	else if @gen='H' and @edad>=18
		set @vho=8000;
	else if @gen='H' and @edad>=18
		set @vho=5000;
	else 
		set @vho=4000;

RETURN @vho;
END

select dbo.fCalcularVHO(18,'h')AS Resultado
--------------------------------------------------------------------------------------------------
--dado el documento de indentidad, realizar un procedimiento que devuelva elvalor de la hora ordinario
create procedure spGetVHO
@doc int
AS
Begin
	set nocount on;
	declare @gen char (1),@edad smallint, @vho int; 
	set @gen=(select genero from Empleado where Documento=@doc);
	set @edad=(select Edad from Empleado where Documento=@doc);
	set @vho=(select dbo.fCalcularVHO(@edad,@gen));
	select @vho as 'Valor Hora Ordinaria';
end

exec spGetVHO 7020
---------------------------------------------------------------------------------------------------------------
create  procedure spBuscar
@dato varchar(50)
As
Begin
	if @dato is null
	begin
		select * from empleado;
	end
	else
	begin
		select * 
		from empleado 
		where nombre=@dato or Cast(documento as varchar) =@dato;
	end
end
