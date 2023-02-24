create database dbDeportista;

Use dbDeportista;

create table ClubDeportivo
(
Codigo int primary key,
Nombre varchar (20) unique not null,
Estado bit not null,
)

create table Deportista 
(
Documento int primary key,
Nombre varchar (30) not null,
Estatura float not null,
Peso float not null,
Club int not null,
foreign key (club) references ClubDeportivo(Codigo)
)

select * from ClubDeportivo
select* from Deportista

select Documento,Nombre,Peso,Estatura
from Deportista where Documento=0
