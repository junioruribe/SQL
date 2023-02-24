alter PROCEDURE spRegistrarDeportista
@nom varchar(30),
@doc int,
@esta float,
@peso float,
@club int

AS
BEGIN 
	set nocount on;
	DECLARE @msg varchar(40)
	INSERT INTO  Deportista (Documento,Nombre,Estatura,Peso,Club)
	VALUES (@doc,@nom,@esta,@peso,@club);
	set @msg='Deportista registrado exitosamente';
	SELECT @msg AS Resultado;
END


exec spRegistrarDeportista 'juan',88,1.78,80,77

CREATE PROCEDURE spRegistrarClub
@cod int,
@nom varchar(20),
@esta bit

AS
BEGIN
	set nocount on;
	DECLARE @msg varchar(40)
	INSERT INTO ClubDeportivo(Codigo,Nombre,Estado)
	VALUES (@cod,@nom,@esta);
	set @msg='Club registrado Exitosamente';
	SELECT @msg AS Resultado;
END

exec spRegistrarClub 44,'Cali',0

select * from ClubDeportivo