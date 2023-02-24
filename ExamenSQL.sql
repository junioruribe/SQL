--1. Realice sentencia SQL que permita/obtener informaci�n de los asesores que realizaron asesor�a a la
--empresa EMP o a Easy en el �rea de Norte o Este.

select * from asesor 
inner join asesoria on idasesor=asesor 
inner join area on idarea=area 
where (empresa=(select idempresa from empresa where nombre='EPM')
or empresa=(select idempresa from empresa where nombre='easy')) and (area=(select idarea from area where area.nombre='norte') 
or area=(select idarea from area where area.nombre='este'))

--2. Realice consulta que muestre informaci�n de los primeros 3 pa�ses que tengan entre 40000 y 65000
--habitantes. Mostrar los resultados ordenados ascendentemente por el n�mero de habitantes

select top 3* from pais where habitantes between 40000 and 65000 order by habitantes asc

--3. Muestre id asesor, id empresa y la cantidad de asesor�as realizadas por los asesores a cada una de las
--empresas. Ordene los resultados por id empresa y cantidad de asesor�as.

select asesor.idasesor, empresa.idempresa, COUNT(*) as 'cantidad de asesorias realizadas'
from Asesor inner join Asesoria on IdAsesor=asesor inner join empresa on idempresa=empresa
group by idasesor,idempresa,Nombres
order by Nombres 


--4. Realice consulta que muestre el c�digo, nombre de cada empresa, las suma y el promedio de las venta
--m�nimas de los vendedores de cada empresa. Ordene las empresas descendentemente por el valor de suma.
 SELECT empresa.idempresa, empresa.nombre, sum(vendedor.ventamin) as "suma", avg (vendedor.ventamin) as "promedio"
 from empresa
 inner join vendedor on empresa.idempresa= vendedor.empresa
 group by empresa.idempresa, empresa.nombre
 order by "suma" desc


--5. Realice sentencia SQL que permita actualizar la fecha de inicio de la asesor�a realizada por el asesor
--1111 a la empresa 5030 en el �rea 40. La nueva fecha a establecer es la fecha actual del sistema.

update asesoria set fechainicio='2022/09/09' where asesor=1111 and empresa=5030 and area=40

--7. Realice sentencia SQL que permita finalizar hoy todas las operaciones que se iniciaron en 1990 y que
--a�n no se han finalizado. Para realizar esta operaci�n, usted debe obtener la fecha del sistema, la cual
--ser� la fecha de Finalizaci�n de operaci�n.

Select * from Operacion where year (FechaInicio)=1990 and FechaFin is null
update Operacion set FechaFin= GETDATE()
where YEAR (FechaInicio)=1990 and FechaFin is null

SELECT * FROM OPERACION

--8. Realice sentencia SQL que permita eliminar los asesores que est�n inactivo y que no han realizado
--asesor�a.
Delete from asesor 
 where IdAsesor not in (select distinct asesor from Asesoria) 

 select * from asesor

--9. Realice sentencia SQL que permita cambiar el c�digo de la empresa 2010 por el c�digo 5060
insert into Empresa(IdEmpresa,Nombre,FechaIngreso,ObjVenta,Sede,Estado)
select 5060,'temporal','1980-02-10',80000000,'C571','A'
from Empresa
where IdEmpresa=2010

update Operacion set Empresa=5060 where empresa=2010
update Asesoria set Empresa=5060 where empresa=2010
update vendedor set Empresa=5060 where empresa=2010
delete from empresa where IdEmpresa=2010
 
 select * from operacion