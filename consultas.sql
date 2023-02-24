--2. Realice consulta que muestre información de todos asesores de la empresa EPM.
	select asesor.*
	from asesor,asesoria,empresa
	where idasesor=asesor and idempresa=empresa and nombre='EPM'

--3. Realice consulta que muestre información de los vendedores de la empresa 2010.
	select vendedor.*
	from empresa,vendedor
	where idempresa=empresa and empresa=2010

--4. Realice consulta que muestre el Nombre, la Venta mínima (VentaMin) y el Id de la empresa (IdEmpresa)
--para la que trabaja cada vendedor.
	select nombres, ventamin,empresa
	from vendedor

--5. Realice consulta que muestre el IdEmpresa, Nombre y el objetivo de venta (ObjVenta).
	select idempresa,nombre,objventa
	from empresa

--6. Realice consulta que muestre de los vendedores que están inactivos (Estado).
	select*
	from vendedor
	where estado='i'

 ----7.	Realice consulta que muestre IdVendedor, nombre, y el Id del vendedor que lo capto.
		select idvendedor,nombres,captador 
		from vendedor
		where idVendedor<>Captador
 
 --8.	Realice consulta que muestre informaci�n de todos asesores que realizaron asesoria a las empresas (Almenos una asesoria).
		select*
		from Asesoria,asesor
		where IdAsesor=asesor
	
--9.	Realice consulta que muestre informaci�n de la empresa que a�n no han terminado operaci�n.
		select*
		from Empresa INNER JOIN  Operacion on IdEmpresa=Empresa
		where FechaFin is null


--10.	Realice consulta que muestre IdVendedor,  nombre del vendendor que no fue captado por otro vendedor
		select idVendedor,Nombres
		from vendedor
		where idvendedor=captador

--11.	Realice consulta que muestre informaci�n de la empresa que est�n inactivas y que est�n realizando operaci�n.
		select empresa.*
		from Empresa inner join operacion on IdEmpresa=empresa
		where estado='i' and fechaFin is null

		-- otra manera 
		select*
		from empresa, operacion
		where idempresa=empresa and estado='a'

		--otra manera 
		select* 
		from empresa inner join operacion on idempresa=empresa and estado='i'

--12.	Realice consulta que muestre informaci�n de la empresa que nunca ha realizado operaci�n.
		SELECT*
		FROM Empresa
		WHERE IdEmpresa NOT IN (
		SELECT DISTINCT Empresa
		FROM Operacion)

--13.	Realice consulta que muestre idAsesor y cantidad de asesor�as realizadas por cada asesor.
		select asesor,count(*)
		from Asesoria
		group by asesor

--14.	Realice consulta que muestre informaci�n del pa�s donde no se est� realizando operaci�n.
 	 	SELECT *
		FROM Pais
		WHERE idPais NOT IN (
		SELECT DISTINCT Pais
		FROM Operacion)  

--15.	Realice consulta que muestre IdVendedor, la cantidad de vendedores que capto.
        select captador as cap,count(captador) as cant
		from vendedor
		where idVendedor <> Captador
		group by captador

--16.	Realice consulta que muestre el m�ximo y el m�nimo objetivo de venta (objVenta) asignado a las empresas.
		SELECT * FROM Empresa WHERE ObjVenta< 30000000 and ObjVenta > 80000000;
		
		--- otra manera
		SELECT * FROM Empresa WHERE ObjVenta IN( 30000000,80000000);
		
		--- otra manera
		select max(objventa)as maximo,min(objventa) as minimo
		from empresa

--17.	Realice consulta que muestre las empresas cuyo objetivo de venta este entre 25000000 y 50000000.
		select * 
		from Empresa
		where ObjVenta >=  25000000  and ObjVenta <=50000000

	--OTRA MANERA 
		SELECT* 
		FROM Empresa
		WHERE ObjVenta BETWEEN  25000000 AND 50000000 
		

--18.	Realice consulta que muestre informaci�n de los primeros 5 empleados de la tabla.
		SELECT  top 5* 
		from vendedor
		ORDER BY ventamin asc

--19.	Realice consulta que muestre informaci�n de la ciudad que no es sede de ninguna empresa.
		select Ciudad.*
		from Ciudad
		where idCiudad not in (select sede from Empresa)

--20.	Realice consulta que muestre las empresas cuyo objetivo de venta sea 80000000, 40000000 � 70000000.
		SELECT * FROM Empresa WHERE ObjVenta IN( 80000000 , 40000000 ,70000000)

--21.	Realice consulta que muestre las empresas que tiene sede en una ciudad de un pa�s en el cual no est�n realizando operaci�n.çç
		select empresa.*
		from Ciudad,empresa
		where idciudad= sede and pais not in(
		select idpais
		from pais
		where idpais not in (select pais from operacion))

	