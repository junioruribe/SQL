
create database dbActividad2
use dbActividad2

create table Productos
(
CodProducto int not null,
Nombre varchar (50) not null,
Descripcion varchar (200)not null,
Precio float not null,
)

INSERT INTO Productos (CodProducto,Nombre,Descripcion,Precio)
VALUES (1,'Atun enlatado','lata de atun 140 gramos',0.72)
insert into Productos  (CodProducto,Nombre,Descripcion,Precio) values (2,'Sardina en lata','Lata de 170 gramos',0.98)
insert into Productos  (CodProducto,Nombre,Descripcion,Precio) values (3,'Lentejas','Paquete 1kilo',1.12)
insert into Productos  (CodProducto,Nombre,Descripcion,Precio) values (4,'Mayonesa','Paquete 1Kilo',1.34)
insert into Productos  (CodProducto,Nombre,Descripcion,Precio) values (5,'Mortadela','Envase 150 gramos',1.45)

select*
from Productos
 
 DROP TABLE Productos
 DELETE FROM Productos

 -- Muestra algunos campos de la tabla
1. SELECT nombre, precio FROM productos;

--Poner un alias (Nombre Temporal)
2. SELECT CodProducto AS “Codigo del producto”, Nombre, precio AS
Valor FROM productos;

-- Muestra la tabla referenciada
3. SELECT * FROM productos;

--Ordena por campo seleccionado en orden de precio
4. SELECT nombre, precio FROM productos ORDER BY precio;

--ordena por campo seleccionado por precio y nombre
5. SELECT nombre, precio FROM productos ORDER BY precio, nombre;

--Selecciona todala imformacion por campo seleccion
6. SELECT nombre, precio FROM productos ORDER BY precio DESC;

--Seleciona la imformacion por campo seleccionado (where forma como se filtran los registros en la tabla)
7. SELECT * FROM productos WHERE nombre = “Lentejas”;

--Define un rango dado en decimales, muestra todo lo que cumpla la condicion (dos rangos)
8. SELECT * FROM productos WHERE precio > 0.90 AND precio < 1.30;

--Define un rango dado en decimales muestra lo que cumpla la condicion 
9. SELECT * FROM productos WHERE precio < 0.90 OR precio > 1.30;

--muestra todos los productos que esten entre y sus atributos
10. SELECT * FROM productos WHERE precio < 0.90 OR precio > 1.30;

--muestra todos los productos y sus atributos 
11.SELECT * FROM productos WHERE nombre = “Mayonesa” OR nombre
= “Lentejas”;

--muestra todos los atributos ordenados por precio
12.SELECT * FROM productos WHERE nombre = “Mayonesa” OR nombre
= “Lentejas” ORDER BY precio DESC;

--muestra los 5 primeros ordenados por nombre
13.SELECT TOP 5 * FROM productos ORDER BY Nombre DESC;

--muestra los registros ordenado en columna 2 y 4
14.SELECT * FROM productos ORDER BY 2, 4 DESC;

--muestra los registros hasta un limite 5
	SELECT  top 5* from vendedor

--muestra el registro en orden de precio con un limite
16.SELECT * FROM productos ORDER BY precio DESC LIMIT 3;

--muestra el registro en orden de precio con un limite
17.SELECT * FROM productos ORDER BY precio DESC LIMIT 4, 3;

--Agrupa
18.SELECT COUNT(*) FROM productos group by;

--cuenta
19.SELECT COUNT(*) FROM productos WHERE precio > 1;

--compara los campos de los productos referenciados en un cojunto (in significa or)
20.SELECT nombre,
precio FROM productos WHERE nombre IN(“Lentejas”, “Azucar
blanco”, “Mortadela”);

--compara los nombres que no sean (ni...ni..ni)
21.SELECT nombre,precio FROM productos WHERE nombre NOT
IN(“Lentejas”, “Azucar blanco”, “Mortadela”);

--comnpara las referencias que cumplan con los criterios.
22.SELECT * FROM productos WHERE precio IN( 0.90 , 0.98 1.34, 1.2);







