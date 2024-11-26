create database practica7_mineriadatos;
use practica7_mineriadatos;

create table datos(
	categoria varchar(50) not null,
    cantidad_ventas int not null
);

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\datosP7.csv'
into table datos
fields terminated by ','
optionally enclosed by ''''
lines terminated by '\n';

select * from datos;

-- Obtener la categoria con la maxima cantidad de ventas
select 
	categoria, 
    cantidad_ventas as max_ventas
from datos
where cantidad_ventas = (select max(cantidad_ventas) from datos);


-- Obtener la categoria con la minima cantidad de ventas
select 
	categoria, 
    cantidad_ventas as min_ventas
from datos
where cantidad_ventas = (select min(cantidad_ventas) from datos);


-- Promedio de la cantidad de ventas
select avg(cantidad_ventas) as promedio from datos;

-- Promedio de la cantidad de ventas
select s.suma_ventas/t.num_categorias as promedio
from (
	select sum(cantidad_ventas) as suma_ventas from datos
) as s,
(
	select count(*) as num_categorias from datos
) as t;


-- Desviacion estandar muestral
select stddev_samp(cantidad_ventas) as desviacion_std_muestral from datos;

-- Desviacion estandar muestral
select sqrt(
	sum(
		pow(cantidad_ventas - (select sum(cantidad_ventas)/count(*) from datos) , 2)
    ) / (count(*)-1)
) as desviacion_std_muestral
from datos;


-- Desviacion estandar poblacional
select stddev(cantidad_ventas) as desviacion_std from datos;

-- Desviacion estandar poblacional
select stddev_pop(cantidad_ventas) as desviacion_std_pob from datos;

-- Desviacion estandar poblacional
select sqrt(
	sum(
		pow(cantidad_ventas - (select sum(cantidad_ventas)/count(*) from datos) , 2)
    ) / (count(*))
) as desviacion_std_poblacional
from datos;