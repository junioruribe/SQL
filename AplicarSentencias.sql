-- 1)insertar un registro en la tabla pais con el nuevo idpais y el resto de datos de pais a actualizar.
insert into Pais(idPais,Nombre,Capital,Habitantes)
select 100,Nombre,Capital,Habitantes
from Pais
where idPais =99
--consulta de la tabla
select *
from Ciudad

--2. Realice consulta que muestre por cada empresa la cantidad de vendedores. Ordene las empresas ascendentemente por el nombre
SELECT Empresa,Nombre,count(*) AS 'CANTIDAD DE VENDEDORES'
FROM vendedor inner join Empresa on IdEmpresa=Empresa 
GROUP BY Empresa,Nombre
ORDER By Nombre

--3. Realice consulta que muestre el valor de venta m�nima m�s alto que tiene asignado un trabajador
Select *
from vendedor
where VentaMin=(
Select Max(VentaMin)
from vendedor)

update Operacion set Empresa=4010 where Empresa=5030
update Asesoria set Empresa=4010 where Empresa=5030
update vendedor set Empresa=4010 where Empresa=5030

--4. Realice consulta me muestre el nombre y la cantidad de asesor�as realizada por cada asesor.
Select Nombres,count(*) as 'cantidad de asesorias'
from asesor inner join Asesoria  on IdAsesor=asesor
group by Nombres

--5 Realice consulta que muestre informaci�n de los primeros 5 pa�ses con el menor n�mero de habitantes. Mostrar los resultados ordenados ascendentemente por el n�mero de habitantesSelect *
select top 5 *
from Pais 
order by Habitantes asc

--6 Realice consulta que muestre por cada pa�s las suma y el promedio de los habitantes de las ciudades que hacen parte de ese pa�s.
select Pais,Pais.Nombre, SUM(Ciudad.Habitantes)as'SUMA',AVG(Ciudad.Habitantes)as PROMEDIO 
from Pais inner join Ciudad on idPais=Pais
group by Pais, Pais.Nombre

--7 Realice consulta me muestre la cantidad de asesor�as realizada por cada asesor en cada uno de las �reas. Ordene descendentemente los asesores por su nombre
select Area,Nombre,Nombres, COUNT(*) as 'cantidad de asesorias'
from Asesor inner join Asesoria on IdAsesor=asesor inner join Area on IdArea=Area
group by Area,Nombre,Nombres
order by Nombres desc

--8 Realice sentencia SQL que permita habilitar (Estado = A) el asesor identificado con el c�digo 8888
update asesor set Estado='A' where IdAsesor=8888

select *
from asesor

--9 Realice sentencia SQL que permita cambiar la sede de la empresa identificada con c�digo 5050. La nueva sede de la empresa ser� la ciudad identificada con el c�digo C571
update Empresa set Sede='C571' where IdEmpresa=5050
select *
from Empresa

--10 Realice sentencia SQL que permita actualizar el c�digo de la empresa BBVA por el c�digo 6090
update Empresa set IdEmpresa=6090 where Nombre='BBVBA'

--11 Realice sentencia SQL que permita eliminar la empresa BBVA
insert into Empresa(IdEmpresa,Nombre,FechaIngreso,ObjVenta,Sede,Estado)
select 5031,'temporal',fechaIngreso,ObjVenta,Sede,'I'
from Empresa
where IdEmpresa=5030
update Operacion set Empresa=5031 where empresa=5030
update Asesoria set Empresa=5031 where empresa=5030
update vendedor set Empresa=5031 where empresa=5030
delete from empresa where IdEmpresa=5030
select*
from Operacion

--12.Realice sentencia SQL que permita actualizar la fecha de inicio de la asesor�a realizada por el asesor
--1111 a la empresa 5030 en el �rea 40. La nueva fecha a establecer es 20/10/1998
update Asesoria set FechaInicio='20/10/1998'
where asesor=1111 and Empresa= 4010 and area =40
select*
from Asesoria

--13.Realice sentencias que permita cambia la ciudad sede de la empresa Jumbo, la nueva sede ser� la
--ciudad de Madrid
update ciudad set Nombre ='ciudad de madrid'
where Nombre='RioJaneiro'

update Empresa set Sede=(select idCiudad from Ciudad 
						where Nombre='madrid')
where Nombre='Jumbo'
					
select*
from Ciudad

--14).Realice sentencia SQL que permita obtener la cantidad de operaciones que ha realizado la empresa
--Easy en Colombia.
select Empresa,Empresa.Nombre, Pais.Nombre, count(*) as Cantidad
from Operacion inner join Empresa on IdEmpresa=Empresa
inner join Pais on Idpais=Pais
where Empresa.Nombre='easy' and pais.Nombre='Colombia'
group by Empresa, Empresa.Nombre, pais.Nombre


--15)Realice sentencia SQL que permita cambiar el c�digo del asesor identificado con c�digo 8888 por el
--c�digo 9999
update asesor set IdAsesor=9999 where Nombres='Andrea'

--16)Realice sentencia SQL que permita eliminar las asesor�as realizadas por el asesor 1111 a la empresa
--5030
update vendedor set Captador=2222 where asesor=9999

--18)Que soluci�n ofrecer�a usted, si por alguna raz�n hubiera la necesidad de reducir en 10000 el n�mero
--de habitante de la ciudad de Medell�n, lo cual tambi�n implicar�a reducir en 10000 el n�mero de
--habitantes del pa�s a la cual pertenece la ciudad.
update Ciudad set Habitantes=Habitantes-10000
where Nombre='Medellin'
update Pais set Habitantes=Habitantes-10000
where idPais=(select Ciudad.Pais
from Ciudad where Nombre='Medellin')

select*
from Ciudad

--19. Realice sentencia SQL que permita obtener la sumatoria de las venta m�nima (VentaMin) de los
--empleados de EPM.
select vendedor sum(VentaMin)
from empresa

--24. Realice sentencia SQL que permita eliminar las operaciones realizadas (finalizadas) por la empresa
--5030 en Colombia. Para realizar esta operaci�n, usted debe crear sentencia que consulte si la
--empresa 5030 realizo operaci�n en Colombia y devolver el c�digo de Colombia.

DELETE FROM Operacion WHERE Empresa=5030 and Pais = (select Idpais from Pais where Nombre='Colombia')

--25. Realice sentencia SQL que permita finalizar hoy todas las operaciones que se iniciaron en 1990 y que
--a�n no se han finalizado. Para realizar esta operaci�n, usted debe obtener la fecha del sistema, la cual
--ser� la fecha de Finalizaci�n de operaci�n.

Select * from Operacion where year (FechaInicio)=1990 and FechaFin is null

update Operacion set FechaFin= GETDATE()
where YEAR (FechaInicio)=1990 and FechaFin is null

--26.Realice sentencia SQL que permita activar (Estado = A) todas las empresas que est�n inactivas y que
--aun est�n realizando operaci�n en alg�n pa�s.

update Empresa set Estado='A'
from Empresa inner join Operacion on IdEmpresa= Empresa
where Estado ='I' and FechaFin is null

--27. Realice sentencia SQL que permita desactivar (Estado = I) todas las ciudades que no sean sede de
--alguna empresa.

update Ciudad set Estado='I' where IdCiudad not in (select distinct sede from Empresa)

--28. Realice sentencia SQL que permita eliminar los asesores que no han realizado asesor�a.

Delete from asesor where IdAsesor not in (select distinct asesor from Asesoria)

--29. Realice sentencia SQL que permita cambiar el c�digo de la empresa 5030 por el c�digo 4070 

update Empresa set IdEmpresa=4070 where IdEmpresa=5030

--30. Que soluci�n ofrecer�a usted si por alguna orden de judicial hubiera la necesidad de eliminar el �rea
--identificada con el c�digo 90. Tenga presente que la informaci�n de las asesor�as realizadas por el
--asesor es de suma importancia para el holding.

insert into Area (IdArea,Nombre,Descripcion,Estado)
select 91,Nombre,Descripcion,Estado
from Area
where IdArea=90

delete from Area where IdArea=90

update Asesoria set Area=91 where Area=90

select * from Area
Select * from Asesoria