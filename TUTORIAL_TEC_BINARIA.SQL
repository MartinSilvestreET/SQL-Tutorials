-- ************ Querys examples in PostgreSQL 14 / pgAdmin 4.*************

-- Create database.
Create database mytest

-- Delete database.
Drop database if exists "mytest"

-- Create a table.
create table persona(
    idpersona int not null,
    nombre varchar(20),
    Cedula varchar (10)
)

-- Insert data in a table.
insert into persona values('3','Maria',"6468646")
insert into persona (idpersona,nombre) values ('3','Maria')


-- Update a register.

select * from persona 
--update persona set cedula = '14641', nombre = 'Maria', idpersona = '1'
--where cedula is null 
--where nombre = 'Maria'



-- Consultas - Select 

select * from persona
--select (nombre, cedula)as datos from persona
select (nombre) as Nombre, (cedula) as Cedula from persona
--select nombre from persona
--where idpersona = '2'



-- Where y Condicionales =, !=, >, <, <=, >=,

-- Operadores logicos AND OR.
select * from persona
--Where nombre != 'Maria'
--Where idpersona >= 0
Where idpersona = 2 and nombre = 'Daniel' 


-- Borrar registros

select * from persona
delete from persona 
where nombre = 'Daniel'

 -- Comentar una o más líneas.
 /*
select * persona

creat table test(

	idtest int not null,
	nombre varchar(20),
	telefono varchar(10)
)
*/

-- Modificar una tabla

ALTER TABLE persona
ADD COLUMN test varchar(20) 

ALTER TABLE persona
RENAME COLUMN test to test2

ALTER TABLE persona
DROP COLUMN test2



-- Modificar una columna

ALTER TABLE persona
ADD COLUMN test VARCHAR(20)


SELECT * FROM persona
UPDATE persona SET  test ='TYM' -- Para poder añadir caracteres nulos

alter table persona
alter column test set not null

-- Eliminar la operacion anterior
alter table persona
alter column test drop not null

-- 
alter table persona
alter column test type varchar(50)


-- Clave primaria
Select * from persona

create table persona (
    idpersona int not null,
    nombre varcgar (20),
    cedula varchar (10),
    primary key (idpersona)
)

alter table persona
add primary key (idpersona)

-- marcara error al estar repetido
insert into persona values ('2','Jorge','14643','TYM')



-- Autoincrementar

create table Test(
idtest serial primary key not null,
	nombre varchar(20),  
    telefono varchar(10)
)

select * from test


insert into test (nombre,telefono) values('Eduardo','81')
insert into test (nombre,telefono) values('Jose','82')
insert into test (nombre,telefono) values('Maria','83')


-- Autoincrementar

create table Test(
idtest serial primary key not null,
	nombre varchar(20),  
    telefono varchar(10)
)

select * from persona
select * from test


insert into test (nombre,telefono) values ('Eduardo','81')
insert into test (nombre,telefono) values ('Jose','82')
insert into test (nombre,telefono) values ('Maria','83')




-- Drop y truncate


select * from test

delete from test -- elimina datos, pero no reinicia el serial

select * from test


insert into test (nombre,telefono) values ('Eduardo','81')
insert into test (nombre,telefono) values ('Jose','82')
insert into test (nombre,telefono) values ('Maria','83')

drop table test -- este borra toda la table reiniciando el serial

truncate table test 

truncate table test restart identity -- reinicia el serial



-- Autoincrementar

create table Test(
idtest serial primary key not null,
	nombre varchar(20),  
    telefono varchar(10)
)





-- Valores por default

select * from test

drop table test -- este borra toda la table reiniciando el serial
-- Autoincrementar

create table Test(
idtest serial primary key not null,
	nombre varchar(20),  
    telefono varchar(20) default 'Desconocido'-- se le añade al no ingresar nada
)

insert into test (nombre,telefono) values ('Eduardo','41')
insert into test (nombre) values ('Montez')






-- Operaciones

create table planilla(
nombre varchar(20),
	nid int primary key not null,
	salario int
	
)

drop table planilla

select * from planilla

insert into planilla(nombre,nid,salario) values ('Eduardo','1','1500')
insert into planilla(nombre,nid,salario) values ('Jose','2','2500')
insert into planilla(nombre,nid,salario) values ('Maria','3','4500')


-- Columnas calculadas

select * from planilla
SELECT Nombre, salario, (salario + 1500)as bono from  planilla

update planilla set salario = salario + 1500
where nombre ='Eduardo'



--Order by

select * from persona order by nombre asc
select * from persona order by nombre desc

select * from persona order by idpersona desc

select * from persona order by 1  /* Ordena por columna */
select * from persona order by 2
select * from persona order by 3

select * from persona order by nombre asc, idpersona desc






-- Like / Daniel, Maria, Jorge
select * from persona
where nombre like '%a%'

select * from persona
where nombre like 'a%' -- al inicio

select * from persona
where nombre like '%l' -- al final

select * from persona
where nombre like '%g_' -- al final


-- Count 

select * from persona

select count (*) from persona

select count (nombre) from persona
where nombre like '%a%'




-- SUM

select * from planilla

select sum(salario) from planilla 

select sum(salario) from planilla 
where nombre like '%a%'

select sum(salario) from planilla 
where nombre like '%e%'



-- max(), min() y Group by

select * from planilla

select min(salario) from planilla 
select max(salario) from planilla 

select nombre, max(salario) from planilla /* Si hay 2 nombres agarra el mayor*/
group by nombre 

select nombre, min(salario) from planilla /* Si hay 2 nombres agarra el mayor*/
group by nombre 





-- max(), min() y Group by

select * from planilla

select min(salario) from planilla 
select max(salario) from planilla 

select nombre, max(salario) from planilla /* Si hay 2 nombres agarra el mayor*/
group by nombre 

select nombre, min(salario) from planilla /* Si hay 2 nombres agarra el mayor*/
group by nombre 



-- AVG
select * from planilla
insert into planilla(nombre,nid,salario) values ('Jose','4','1500')
select AVG(salario) from planilla

select nombre, avg(salario) from planilla
group by nombre -- saca el promedio de 2 duplicados ejemplo de 2 jorges


-- Having

Select * from planilla

select nombre , salario from planilla
where nombre = 'Jose'
group by nombre, salario
having salario > 2000


select nombre, salario from planilla
group by nombre, salario
having salario > 2000


select nombre, salario from planilla
group by nombre, salario
having salario > 2000
order by nombre
