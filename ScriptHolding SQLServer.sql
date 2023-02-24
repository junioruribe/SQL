create database holding

use holding

--Crear tabla Pais
create table Pais
(
    idPais      int primary key ,
    Nombre      varchar(20) not null,
    Capital     varchar(20) not null,
    Habitantes  int not null
)

--Creacion de la tabla Ciudad
create table Ciudad
( 
    idCiudad    varchar(6) not null,
    Nombre      varchar(20) not null,
    Habitantes  int not null,
    Pais        int not null,
    Estado      char(1) not null,
    primary key (idCiudad),
    foreign key(Pais) references Pais(idPais)
)

--crear tabla asesor
create table asesor
(
    IdAsesor    int primary key,
    Nombres     varchar(30) not null,
    Apellidos   varchar(30) not null,
    Telefono    varchar(12) not null,
    Direccion   varchar(50) not null,
    Titulo      varchar(30) not null,
    Estado  char(1) not null
);

create table Area
(
    IdArea int primary key,
    Nombre varchar(20) not null,
    Descripcion varchar(20) null,
    Estado char(1) not null
);

create table Empresa
(
    IdEmpresa int primary key,
    Nombre  varchar(30) unique not null,
    FechaIngreso date not null,
    ObjVenta int check(ObjVenta>5000000 AND ObjVenta<=100000000) not null,
    Sede     varchar(6) not null,
    Estado char(1) not null,
    foreign key (Sede) references Ciudad(idCiudad)
)

Create table Asesoria
(
    IdAsesoria int identity(1,1) primary key,
    asesor  int not null,
    Empresa int not null,
    Area    int not null,
    FechaInicio date not null,
    foreign key (Asesor) references asesor(IdAsesor),
    foreign key (Empresa) references Empresa(IdEmpresa),
    foreign key  (Area) references Area(IdArea)
);

--Creacion de la tabla vendedor
create table vendedor
(
    idVendedor int not null primary key,
    Nombres    varchar(30) not null,
    Apellidos  varchar(30) not null,
    Telefono    varchar(12) not null,
    Direccion  varchar(50) not null,
    VentaMin    real check(VentaMin>=1000000) not null,
    FechaCaptacion  date not null,
    Captador    int not null,
    Empresa     int not null,
    Estado     char(1) not null,
    foreign key (Captador) references vendedor(idVendedor),
    foreign key (Empresa) references Empresa(IdEmpresa)
)

--Creacion de la tabla operacio
Create table Operacion
(
    idOperacion int identity(1,1) primary key,
    Empresa int not null,
    Pais  int   not null,
    FechaInicio date not null,
    FechaFin    date null,
    foreign key (Empresa) references Empresa(IdEmpresa),
    foreign key (Pais) references Pais(idPais)
)

--******************** REGISTRAR DATOS EN TABLA PAIS *********************
    INSERT INTO PAIS (IDPAIS, NOMBRE, CAPITAL, HABITANTES) VALUES (57, 'Colombia', 'Bogota', 40000);
    INSERT INTO PAIS (IDPAIS, NOMBRE, CAPITAL, HABITANTES) VALUES (55, 'Brasil', 'Saopablo', 90000);
    INSERT INTO PAIS (IDPAIS, NOMBRE, CAPITAL, HABITANTES) VALUES (56, 'Chile', 'Santiago', 50000);
    INSERT INTO PAIS (IDPAIS, NOMBRE, CAPITAL, HABITANTES) VALUES (58, 'Venezuela', 'Caracas', 60000);
    INSERT INTO PAIS (IDPAIS, NOMBRE, CAPITAL, HABITANTES) VALUES (593, 'Ecuador', 'Quito', 35000);
    INSERT INTO PAIS (IDPAIS, NOMBRE, CAPITAL, HABITANTES) VALUES (34, 'España', 'Madrid', 70000);
    INSERT INTO PAIS (IDPAIS, NOMBRE, CAPITAL, HABITANTES) VALUES (54, 'Argentina', 'Buenos Aires', 65000);

INSERT INTO PAIS (IDPAIS, NOMBRE, CAPITAL, HABITANTES) VALUES (86, 'Peru', 'Lima', 35000);
INSERT INTO PAIS (IDPAIS, NOMBRE, CAPITAL, HABITANTES) VALUES (99, 'Uruguay', 'Montevideo', 85000);

--******************** REGISTRAR DATOS EN TABLA CIUDAD *********************
INSERT INTO CIUDAD (IDCIUDAD, NOMBRE, HABITANTES, PAIS, ESTADO) VALUES ('C571', 'Medellin', 20000, 57, 'A');
INSERT INTO CIUDAD (IDCIUDAD, NOMBRE, HABITANTES, PAIS, ESTADO) VALUES ('B551', 'RioJaneiro', 45000, 55, 'A');
INSERT INTO CIUDAD (IDCIUDAD, NOMBRE, HABITANTES, PAIS, ESTADO) VALUES ('E5931', 'Quito', 12000, 593, 'A');
INSERT INTO CIUDAD (IDCIUDAD, NOMBRE, HABITANTES, PAIS, ESTADO) VALUES ('C561', 'Santiago', 10000, 56, 'A');
INSERT INTO CIUDAD (IDCIUDAD, NOMBRE, HABITANTES, PAIS, ESTADO) VALUES ('C572', 'Cartagena', 8000, 57, 'A');
INSERT INTO CIUDAD (IDCIUDAD, NOMBRE, HABITANTES, PAIS, ESTADO) VALUES ('E341', 'Madrid', 15000, 34, 'A');
INSERT INTO CIUDAD (IDCIUDAD, NOMBRE, HABITANTES, PAIS, ESTADO) VALUES ('B573', 'Tachira', 20000, 58, 'I');

INSERT INTO CIUDAD (IDCIUDAD, NOMBRE, HABITANTES, PAIS, ESTADO) VALUES ('P861', 'Chimbote', 20000, 86, 'A');
INSERT INTO CIUDAD (IDCIUDAD, NOMBRE, HABITANTES, PAIS, ESTADO) VALUES ('U991', 'Montevideo', 25000, 99, 'A');


--******************** REGISTRAR DATOS EN TABLA EMPRESA *********************
INSERT INTO EMPRESA (IDEMPRESA, NOMBRE, FECHAINGRESO, OBJVENTA, SEDE, ESTADO) 
VALUES (2010, 'EPM', '1980/02/10', 80000000, 'C571', 'A');
INSERT INTO EMPRESA (IDEMPRESA, NOMBRE, FECHAINGRESO, OBJVENTA, SEDE, ESTADO) 
VALUES (3020, 'Une','1965/06/20', 40000000, 'C572', 'I');
INSERT INTO EMPRESA (IDEMPRESA, NOMBRE, FECHAINGRESO, OBJVENTA, SEDE, ESTADO)
VALUES (4030, 'Exito','1970/01/12', 30000000, 'E341', 'A');
INSERT INTO EMPRESA (IDEMPRESA, NOMBRE, FECHAINGRESO, OBJVENTA, SEDE, ESTADO) 
VALUES (5040, 'Metro', '1965/06/20', 40000000, 'E5931', 'A');
INSERT INTO EMPRESA (IDEMPRESA, NOMBRE, FECHAINGRESO, OBJVENTA, SEDE, ESTADO) 
VALUES (6050, 'Jumbo', '1950/06/30', 20000000, 'B551', 'A');
INSERT INTO EMPRESA (IDEMPRESA, NOMBRE, FECHAINGRESO, OBJVENTA, SEDE, ESTADO) 
VALUES (7060, 'Claro', '1975/06/15', 70000000, 'C561', 'A');

INSERT INTO EMPRESA (IDEMPRESA, NOMBRE, FECHAINGRESO, OBJVENTA, SEDE, ESTADO) 
VALUES (5030, 'Easy', '1985/02/10', 65000000, 'P861', 'A');
INSERT INTO EMPRESA (IDEMPRESA, NOMBRE, FECHAINGRESO, OBJVENTA, SEDE, ESTADO) 
VALUES (5050, 'BBVBA', '1995/05/15', 54000000, 'P861', 'I');
INSERT INTO EMPRESA (IDEMPRESA, NOMBRE, FECHAINGRESO, OBJVENTA, SEDE, ESTADO) 
VALUES (6060, 'Movistar', '1995/10/15', 24000000, 'C571', 'I');
INSERT INTO EMPRESA (IDEMPRESA, NOMBRE, FECHAINGRESO, OBJVENTA, SEDE, ESTADO) 
VALUES (7070, 'Colpatria', '1975/06/15', 5100000, 'E341', 'A');


--******************** REGISTRAR DATOS EN TABLA VENDEDOR *********************
INSERT INTO VENDEDOR (IDVENDEDOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, VENTAMIN, FECHACAPTACION, CAPTADOR, EMPRESA, ESTADO) 
VALUES (2222, 'Victor', 'Mora Paez', '3448906', 'C43A#10', 5200000, '1985/12/10', 2222, 4030, 'A');
INSERT INTO VENDEDOR(IDVENDEDOR,NOMBRES,APELLIDOS,TELEFONO,DIRECCION,VENTAMIN,FECHACAPTACION,CAPTADOR,EMPRESA,ESTADO) 
VALUES (4444, 'Mery', 'Brand Per', '2345789', 'C34A#14', 7655000,'1990/01/01', 4444, 2010, 'A');
INSERT INTO VENDEDOR (IDVENDEDOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, VENTAMIN, FECHACAPTACION, CAPTADOR, EMPRESA, ESTADO) 
VALUES (1111, 'Edinson', 'Martinez ', '3412058', 'C82A#10', 9500000, '1980/07/15', 4444, 2010, 'A');
INSERT INTO VENDEDOR (IDVENDEDOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, VENTAMIN, FECHACAPTACION, CAPTADOR, EMPRESA, ESTADO) 
VALUES (3333, 'Lucia', 'Dia Dasa', '5678943', 'C67A#13', 5450000, '1995/12/10', 4444, 2010, 'A');
INSERT INTO VENDEDOR (IDVENDEDOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, VENTAMIN, FECHACAPTACION, CAPTADOR, EMPRESA, ESTADO) 
VALUES (5555, 'Ana', 'Andrades', '234567', 'C52A#14', 3500000, '1995/12/10', 2222, 4030, 'A');
INSERT INTO VENDEDOR (IDVENDEDOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, VENTAMIN, FECHACAPTACION, CAPTADOR, EMPRESA, ESTADO) 
VALUES (6666, 'Mateo', 'Vera Vega', '3457689', 'C52A#14', 5200000, '2010/12/31', 6666, 3020, 'I');

INSERT INTO VENDEDOR (IDVENDEDOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, VENTAMIN, FECHACAPTACION, CAPTADOR, EMPRESA, ESTADO) 
VALUES (7777, 'Manuel', 'Perea', '6677898', 'C34A#10', 1650000, '1990/12/10', 7777, 5030, 'A');
INSERT INTO VENDEDOR (IDVENDEDOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, VENTAMIN, FECHACAPTACION, CAPTADOR, EMPRESA, ESTADO) 
VALUES (9999, 'Maria', 'Dia', '4545789', 'C54A#14', 2655000, '1990/01/19', 9999, 5030, 'A');
INSERT INTO VENDEDOR (IDVENDEDOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, VENTAMIN, FECHACAPTACION, CAPTADOR, EMPRESA, ESTADO) 
VALUES (2908, 'Rubiela', 'Paternina', '9875780', 'C75B#74', 9655000, '1980/06/16', 2908, 6060, 'A');


--******************** REGISTRAR DATOS EN TABLA OPERACION *********************
INSERT INTO OPERACION (EMPRESA, PAIS, FECHAINICIO, FECHAFIN) 
VALUES (2010, 57, '1990/07/15', NULL);
INSERT INTO OPERACION (EMPRESA, PAIS, FECHAINICIO, FECHAFIN) 
VALUES (3020, 54, '1970/06/20', NULL);
INSERT INTO OPERACION (EMPRESA, PAIS, FECHAINICIO, FECHAFIN) 
VALUES (7060, 593,'1975/10/15', '2012/10/15');
INSERT INTO OPERACION (EMPRESA, PAIS, FECHAINICIO, FECHAFIN) 
VALUES (4030, 57, '1980/01/12', NULL);
INSERT INTO OPERACION (EMPRESA, PAIS, FECHAINICIO, FECHAFIN) 
VALUES (5040, 55, '1970/06/20', NULL);
INSERT INTO OPERACION (EMPRESA, PAIS, FECHAINICIO, FECHAFIN) 
VALUES (6050, 57, '1965/06/30', '2010/06/30');
INSERT INTO OPERACION (EMPRESA, PAIS, FECHAINICIO, FECHAFIN) 
VALUES (2010, 593, '1995/07/15', NULL);

INSERT INTO OPERACION (EMPRESA, PAIS, FECHAINICIO, FECHAFIN) 
VALUES (5030, 86, '1986/05/20', '1989/02/15');
INSERT INTO OPERACION (EMPRESA, PAIS, FECHAINICIO, FECHAFIN) 
VALUES (5030, 86,'1990/08/15', NULL);
INSERT INTO OPERACION (EMPRESA, PAIS, FECHAINICIO, FECHAFIN) 
VALUES (5030, 57, '1990/07/10','1998/07/17');
INSERT INTO OPERACION (EMPRESA, PAIS, FECHAINICIO, FECHAFIN) 
VALUES (5030, 57, '2002/07/10', NULL);
INSERT INTO OPERACION (EMPRESA, PAIS, FECHAINICIO, FECHAFIN) 
VALUES (6060, 99,'1996/10/15', NULL);

--******************** REGISTRAR DATOS EN TABLA ASESOR *********************
INSERT INTO ASESOR (IDASESOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, TITULO, ESTADO) 
VALUES (1111, 'Edinson', 'Martinez', '3412058', 'C82A#10', 'Ingeniero', 'A');
INSERT INTO ASESOR (IDASESOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, TITULO, ESTADO) 
VALUES (7030, 'Juan', 'Mu�oz Dia', '4546567', 'C32A#15', 'Contador', 'A');
INSERT INTO ASESOR (IDASESOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, TITULO, ESTADO) 
VALUES (7040, 'Elvis', 'Flores Dia', '1703572', 'C82A#10', 'Abogado', 'A');
INSERT INTO ASESOR (IDASESOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, TITULO, ESTADO) 
VALUES (7050, 'Claudia', 'Vera Mora', '3526981', 'C52A#13', 'Ingeniero', 'A');
INSERT INTO ASESOR (IDASESOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, TITULO, ESTADO) 
VALUES (7060, 'Ana Luz', 'Rios Paez', '3257902', 'C82A#14', 'Publicista', 'I');
INSERT INTO ASESOR (IDASESOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, TITULO, ESTADO) 
VALUES (7070, 'Luisa', 'Martinez', '5678931', 'C72A#15', 'Arquitecto', 'A');
INSERT INTO ASESOR (IDASESOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, TITULO, ESTADO) 
VALUES (7080, 'Carlos', 'Ruiz Solis', '5422572', 'C92A#16', 'Admin', 'A');

INSERT INTO ASESOR (IDASESOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, TITULO, ESTADO) 
VALUES (8888, 'Andrea', 'Lopez', '3452058', 'C85A#34', 'Ingeniera', 'I');
INSERT INTO ASESOR (IDASESOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, TITULO, ESTADO) 
VALUES (1027, 'Andres', 'Martinez', '5765606', 'C71#70', 'Ingeniero', 'A');



--******************** REGISTRAR DATOS EN TABLA AREA *********************
INSERT INTO AREA (IDAREA, NOMBRE, DESCRIPCION, ESTADO) 
VALUES (10, 'Norte', 'Fria', 'A');
INSERT INTO AREA (IDAREA, NOMBRE, DESCRIPCION, ESTADO) 
VALUES (20, 'Sur', 'Caliente', 'A');
INSERT INTO AREA (IDAREA, NOMBRE, DESCRIPCION, ESTADO) 
VALUES (30, 'Oriente', null, 'A');
INSERT INTO AREA (IDAREA, NOMBRE, DESCRIPCION, ESTADO) 
VALUES (40, 'Este', 'Fria', 'A');
INSERT INTO AREA (IDAREA, NOMBRE, DESCRIPCION, ESTADO) 
VALUES (50, 'Central', null, 'A');
INSERT INTO AREA (IDAREA, NOMBRE, DESCRIPCION, ESTADO) 
VALUES (60, 'Oeste', 'Tropical', 'I');
INSERT INTO AREA (IDAREA, NOMBRE, DESCRIPCION, ESTADO) 
VALUES (70, 'Occidente', null, 'A');

INSERT INTO AREA (IDAREA, NOMBRE, DESCRIPCION, ESTADO) 
VALUES (90, 'Noroeste', 'Caliente', 'A');

--******************** REGISTRAR DATOS EN TABLA ASESORIA *********************
INSERT INTO ASESORIA (ASESOR, EMPRESA, AREA, FECHAINICIO) 
VALUES (1111, 2010, 40, '1992/07/15');
INSERT INTO ASESORIA (ASESOR, EMPRESA, AREA, FECHAINICIO) 
VALUES (7030, 3020, 20, '1975/06/20');
INSERT INTO ASESORIA (ASESOR, EMPRESA, AREA, FECHAINICIO) 
VALUES (7040, 4030, 60,'1985/01/12');
INSERT INTO ASESORIA (ASESOR, EMPRESA, AREA, FECHAINICIO) 
VALUES (7070, 2010, 30, '1995/07/15');
INSERT INTO ASESORIA (ASESOR, EMPRESA, AREA, FECHAINICIO) 
VALUES (7080, 5040, 50, '1975/07/20');
INSERT INTO ASESORIA (ASESOR, EMPRESA, AREA, FECHAINICIO) 
VALUES (7050, 6050, 40, '1967/08/30');
INSERT INTO ASESORIA (ASESOR, EMPRESA, AREA, FECHAINICIO) 
VALUES (1111, 4030, 10, '1995/07/15');

INSERT INTO ASESORIA (ASESOR, EMPRESA, AREA, FECHAINICIO) 
VALUES (8888, 5030, 90, '1995/07/15');
INSERT INTO ASESORIA (ASESOR, EMPRESA, AREA, FECHAINICIO) 
VALUES (1111, 5030, 40, '1996/07/10');
INSERT INTO ASESORIA (ASESOR, EMPRESA, AREA, FECHAINICIO) 
VALUES (1111, 7070, 40, '1995/07/15');

--2.	Realice consulta que muestre informaci�n de todos asesores de la empresa EPM3.	Realice consulta que muestre informaci�n de los vendedores de la empresa 2010.
		SELECT Asesor.*
		FROM asesor INNER JOIN Asesoria ON IdAsesor=asesor
		INNER JOIN Empresa ON IdEmpresa=Empresa
		WHERE Empresa.Nombre='EPM'

--4.	Realice consulta que muestre el  Nombre, la Venta m�nima (VentaMin) y el Id de la empresa (IdEmpresa) para la que trabaja cada vendedor.

--5.	Realice consulta que muestre el IdEmpresa, Nombre y el objetivo de venta (ObjVenta).

--6.	Realice consulta que muestre de los vendedores que est�n inactivos (Estado).

--7.	Realice consulta que muestre IdVendedor, nombre, y el Id del vendedor que lo capto.

--8.	Realice consulta que muestre informaci�n de todos asesores que realizaron asertoria a las empresas (Almenos una asesoria).

--9.	Realice consulta que muestre informaci�n de la empresa que a�n no han terminado operaci�n.

--10.	Realice consulta que muestre IdVendedor,  nombre del vendenor que no fue captado por otro vendedor

--11.	Realice consulta que muestre informaci�n de la empresa que est�n inactivas y que est�n realizando operaci�n.

--12.	Realice consulta que muestre informaci�n de la empresa que nunca ha realizado operaci�n.
		SELECT Empresa.*
		FROM Empresa
		WHERE IdEmpresa NOT IN (
		SELECT DISTINCT Empresa
		FROM Operacion)
--13.	Realice consulta que muestre idAsesor y cantidad de asesor�as realizadas por cada asesor.

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

--17.	Realice consulta que muestre las empresas cuyo objetivo de venta este entre 25000000 y 50000000.

--18.	Realice consulta que muestre informaci�n de los primeros 5 empleados de la tabla.

--19.	Realice consulta que muestre informaci�n de la ciudad que no es sede de ninguna empresa.

--20.	Realice consulta que muestre las empresas cuyo objetivo de venta sea 80000000, 40000000 � 70000000.

--21.	Realice consulta que muestre las empresas que tiene sede en una ciudad de un pa�s en el cual no est�n realizando operaci�n.


