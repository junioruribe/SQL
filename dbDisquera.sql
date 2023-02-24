create database dbDisquera
use dbDisquera

create table Cancion
(
IdCancion int primary key,
Nombre varchar (20)unique not null,
Duracion int not null,
Genero varchar (20) not null,
Estado bit not null,
)

ALTER TABLE Cancion
ADD Descripcion varchar (30) not null

CREATE TABLE Compositor
(
IdCompositor int primary key,
Nombres varchar (30) not null,
Apellidos varchar(30) not null,
Telefono int not null,
Nacimiento date not null,
Estado varchar(15) not null,
)

ALTER TABLE Cancion
DROP COLUMN Estado

EXEC sp_rename'Compositor.Telefono','Celular','COLUMN'

ALTER TABLE dbo.Compositor
ADD Email varchar(50) not null

ALTER TABLE Compositor
ALTER COLUMN Estado varchar(15) NOT NULL

EXEC sp_rename'Compositor.Nacimiento','FechaNacimiento','COLUMN'

CREATE TABLE Composicion
(
IdPreparacion int primary key,
IdCompositor int not null,
IdCancion int not null,
Fecha date not null,
)
ALTER TABLE  Composicion
DROP CONSTRAINT PK__IdPreparacion

ALTER TABLE Composicion
DROP COLUMN IdPreparacion

ALTER TABLE Composicion
ADD PRIMARY KEY(IdCancion)

ALTER TABLE Composicion
ADD FOREIGN KEY (IdCompositor) references Cancion(IdCancion)

ALTER TABLE Composicion
ADD FOREIGN KEY (IdCompositor) references Compositor(IdCompositor)

select*
from INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE
where TABLE_NAME='Composicion'

select*
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME = 'Composicion'

select*
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME = 'Compositor'

CREATE TABLE Genero
(
IdNombre varchar(20) primary key,
PaisOrigen varchar (30) not null,
Descripcion varchar (50) not null
)
ALTER TABLE Genero
ADD FOREIGN KEY (IdNombre) references Cancion(IdCancion)

select*
from INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE
where TABLE_NAME='Genero'

BACKUP DATABASE dbDisquera
TO DISK='D:\carpeta\bkDB.bak'

ALTER TABLE Cancion
DROP CONSTRAINT FK_Articulo_IdCate_15502E78