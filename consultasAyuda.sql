// CREAR BASE DE DATOS \\
CREATE DATABASE DBPrueba

// CREAR TABLA DE DATOS \\
create table Producto
(
IdProducto int primary key,
Nombre varchar (20) not null,
Categoria varchar (20) not null,
Valor int check (valor>=100),
Descripcion varchar (30) null
)

CREATE TABLE Categoria
(
IdCategoria int not null,
Nombre varchar(20) unique not null
)

-- REFERENCIA TABLA \\
select*
FROM DBPrueba.dbo.Producto

-- MOSTRAR TABLA DE BASE DE DATOS \\ 
select*
from INFORMATION_SCHEMA.TABLES

-- MOSTRAR ESTRUCTURA DE UNA TABLA \\
select*
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME = 'Producto'

-- MOSTRAR RESTRICCIONES DE UNA TABLA \\
select*
from INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE
where TABLE_NAME='Producto'

-- MOSTRAR LAS RESTRICCIONES DEFINIDAS EN UNA TABLA \\
select CONSTRAINT_NAME,TABLE_SCHEMA,
TABLE_NAME,CONSTRAINT_TYPE
from INFORMATION_SCHEMA,TABLE_CONSTRAINTS
WHERE TABLE_NAME='producto'


-- CAMBIAR EL NOMBRE DE UN CAMPO DE LA TABLA \\
EXEC sp_rename'Producto.Descripcion','Detalle','COLUMN'
// cambiar el nombre de una tabla \\
EXEC sp_rename'Producto','Articulo'

-- CAMBIAR EL NOMBRE DE UNA BASE DE DATOS \\
ALTER DATABASE DBPrueba MODIFY NAME=DBProducto

-- AGREGAR COLUMNA A UNA TABLA \\
// FORMA 1 \\
ALTER TABLE dbo.Producto
ADD IdCategoria INT not null
// FORMA 2 \\
ALTER TABLE Categoria
ADD IdCategoria INT Not null,
Estado BIT not null

-- ELIMINAR COLUMNA DE UNA TABLA\\
ALTER TABLE Producto 
DROP COLUMN Categoria

-- MODIFICAR COLUMNA EN LA TABLA \\
ALTER TABLE Producto
ALTER COLUMN Valor INT NOT NULL

-- AGREGAR COLUMNA A UNA TABLA CON RESTRICCION CHEK \\
ALTER TABLE Producto
ADD Cantidad INT not null
CONSTRAINT ck_Cant CHECK(Cantidad >=1)

-- AGREGAR COLUMNA EN UNA TABLA CON VALOR POR DEFECTO \\
ALTER TABLE Categoria
ADD FechaRegistro date not null DEFAULT GETDATE()

-- REGISTRAR IMFORMACION EN UNA TABLA CON CAMPO POR DEFECTO \\
INSERT INTO Categoria(IdCategoria,Nombre,Descripcion,Estado)
Values(10,'Verduras','Nutritivas',1)

ALTER TABLE dbo.Categoria
ADD Descripcion varchar(20) not null

ALTER TABLE dbo.Categoria
ADD estado BIT not null

select*
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME = 'Articulo'

SELECT *
FROM Categoria

-- AGREGAR CLAVE PRIMARIA A UNA TABLA \\
-- FORMA 1 \\
ALTER TABLE Categoria
ADD PRIMARY KEY (IdCategoria)
-- FORMA 2 \\ 
ALTER TABLE categoria
ADD CONSTRAINT pk_IdCat PRIMARY KEY (IdCategoria)

-- RELACIONAR DOS TABLAS  DE DATOS \\
ALTER TABLE Producto
ADD FOREIGN KEY (Categoria) references Categoria(IdCategoria)

-- Eliminar relacion entre dos tablas \\
ALTER TABLE Articulo
DROP CONSTRAINT FK_Articulo_IdCate_15502E78

SELECT COLUMN_NAME,CONSTRAINT_NAME
from INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE
where TABLE_NAME='Categoria'
-- ELIMINAR RESTRICCION DE CLAVE PRIMARIA EN UNA TABLA \\
ALTER TABLE  Categoria
DROP CONSTRAINT PK_IdCat

-- REALIZAR BACKUP A UNA BASE DE DATOS guardar carpeta\\
BACKUP DATABASE DBProducto
TO DISK='C:\SQL PRUEBA\bkDB.bak'

-- REINICIAR UN CAMPO AUTO AUNMENTABLE \\
DBCC CHECKINDENT (CATEGORIA,RESSED,0)

-- AGREGAR RESTRICCION CHECK A UN CAMPO DE LA TABLA \\
ALTER TABLE Producto
ADD CONSTRAINT CK_Valor(Valor>=100)

-- BORRAR EL CONTENIDO DE UNA TABLA \\
DELETE FROM Categoria

--ELIMINAR UNA TABLA DE DATOS DE LA BASE DE DATOS \\
DROP TABLE Categoria