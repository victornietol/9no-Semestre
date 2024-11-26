create database examen2_mineria_datos;
use examen2_mineria_datos;

create table estados_delitos(
	anio int not null,
    clave_ent int not null,
    entidad varchar(50) not null,
    cve_municipio int not null,
    municipio varchar(100) not null,
    bien_juridico_afectado text not null,
    tipo_delito text not null,
    subtipo_delito text not null,
    modalidad text not null,
    enero int not null,
    febrero int not null,
    marzo int not null,
    abril int not null,
    mayo int not null,
    junio int not null,
    julio int not null,
    agosto int not null,
    septiembre int not null,
    octubre int not null,
    noviembre int not null,
    diciembre int not null
);


load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\delitos_sin_acentos.csv'
into table estados_delitos
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

/*
SET session wait_timeout = 1000000;
SHOW VARIABLES LIKE 'wait_timeout';
SET session max_allowed_packet = 64000000;
show variables like 'max_allowed_packet';
*/

create table poblacion_municipio(
	clave_entidad int not null,
    clave_municipio int not null,
    municipio varchar(100) not null,
    poblacion int not null
);

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Poblacion_sin_acentos.csv'
into table poblacion_municipio
fields terminated by ','
lines terminated by '\n'
ignore 1 rows;


-- 1.1. Delitos totales por municipio de cada mes de todos los años
select * from estados_delitos;
select * from poblacion_municipio;

select  municipio, sum(enero) t_enero, sum(febrero) t_febrero, sum(marzo) t_marzo, sum(abril) t_abril, sum(mayo) t_mayo, sum(junio) t_junio, sum(julio) t_julio, sum(agosto) t_agosto, sum(septiembre) t_sept, sum(octubre) t_oct, sum(noviembre) t_nov, sum(diciembre) t_dic 
from estados_delitos 
where clave_ent = 9
group by municipio;

-- 1.2. Delitos totales por municipio (total general de todos los años) (ciudad de mexico)
select  municipio, sum(enero+febrero+marzo+abril+mayo+junio+julio+agosto+septiembre+octubre+noviembre+diciembre) total_delitos
from estados_delitos 
where clave_ent = 9
group by municipio
order by total_delitos desc;

select  clave_ent, entidad, cve_municipio, municipio, sum(enero+febrero+marzo+abril+mayo+junio+julio+agosto+septiembre+octubre+noviembre+diciembre) total_delitos
from estados_delitos 
where clave_ent = 9
group by municipio, cve_municipio, entidad, clave_ent
order by total_delitos desc;

-- 1.3. join para obtener los habitantes de cada muunicipio y sus delitos totales
select
	*
from (
	-- Subconsulta para obtener los delitos totales por municipio de CDMX
	select  clave_ent, entidad, cve_municipio, municipio, sum(enero+febrero+marzo+abril+mayo+junio+julio+agosto+septiembre+octubre+noviembre+diciembre) total_delitos
	from estados_delitos 
	where clave_ent = 9
	group by municipio, cve_municipio, entidad, clave_ent
	order by total_delitos desc
) as delitos
join poblacion_municipio pm on (delitos.cve_municipio = pm.clave_municipio);




-- 1.4 FINAL .Obtener los 3 municipio mas peligrosos de CDMX en relacion al numero de delitos y habitantes por municipio. Se divide el numero de delitos entre el numero de habitantes para saber cuantos delitos por cada habitante se comenten
select
	delitos.municipio as municipio,
    delitos.total_delitos as total_delitos,
    pm.poblacion as poblacion,
    (delitos.total_delitos/pm.poblacion) as delitos_por_habitante
from (
	-- Subconsulta para obtener los delitos totales por municipio de CDMX
	select  clave_ent, entidad, cve_municipio, municipio, sum(enero+febrero+marzo+abril+mayo+junio+julio+agosto+septiembre+octubre+noviembre+diciembre) total_delitos
	from estados_delitos 
	where clave_ent = 9
	group by municipio, cve_municipio, entidad, clave_ent
	order by total_delitos desc
) as delitos
join poblacion_municipio pm on (delitos.cve_municipio = pm.clave_municipio)
order by delitos_por_habitante desc
limit 3;

-- 1.5 FINAL .Obtener los 3 municipio menos peligrosos de CDMX en relacion al numero de delitos y habitantes por municipio. Se divide el numero de delitos entre el numero de habitantes para saber cuantos delitos por cada habitante se comenten
select
	delitos.municipio as municipio,
    delitos.total_delitos as total_delitos,
    pm.poblacion as poblacion,
    (delitos.total_delitos/pm.poblacion) as delitos_por_habitante
from (
	-- Subconsulta para obtener los delitos totales por municipio de CDMX
	select  clave_ent, entidad, cve_municipio, municipio, sum(enero+febrero+marzo+abril+mayo+junio+julio+agosto+septiembre+octubre+noviembre+diciembre) total_delitos
	from estados_delitos 
	where clave_ent = 9
	group by municipio, cve_municipio, entidad, clave_ent
	order by total_delitos desc
) as delitos
join poblacion_municipio pm on (delitos.cve_municipio = pm.clave_municipio)
order by delitos_por_habitante asc
limit 3;


-- 1.6 FINAL .Obtener los 3 municipio mas peligrosos de Hidalgo en relacion al numero de delitos y habitantes por municipio. Se divide el numero de delitos entre el numero de habitantes para saber cuantos delitos por cada habitante se comenten
select
	delitos.municipio as municipio,
    delitos.total_delitos as total_delitos,
    pm.poblacion as poblacion,
    (delitos.total_delitos/pm.poblacion) as delitos_por_habitante
from (
	-- Subconsulta para obtener los delitos totales por municipio de CDMX
	select  clave_ent, entidad, cve_municipio, municipio, sum(enero+febrero+marzo+abril+mayo+junio+julio+agosto+septiembre+octubre+noviembre+diciembre) total_delitos
	from estados_delitos 
	where clave_ent = 13
	group by municipio, cve_municipio, entidad, clave_ent
	order by total_delitos desc
) as delitos
join poblacion_municipio pm on (delitos.cve_municipio = pm.clave_municipio)
order by delitos_por_habitante desc
limit 3;

-- 1.6 FINAL .Obtener los 3 municipio menos peligrosos de Hidalgo en relacion al numero de delitos y habitantes por municipio. Se divide el numero de delitos entre el numero de habitantes para saber cuantos delitos por cada habitante se comenten
select
	delitos.municipio as municipio,
    delitos.total_delitos as total_delitos,
    pm.poblacion as poblacion,
    (delitos.total_delitos/pm.poblacion) as delitos_por_habitante
from (
	-- Subconsulta para obtener los delitos totales por municipio de CDMX
	select  clave_ent, entidad, cve_municipio, municipio, sum(enero+febrero+marzo+abril+mayo+junio+julio+agosto+septiembre+octubre+noviembre+diciembre) total_delitos
	from estados_delitos 
	where clave_ent = 13
	group by municipio, cve_municipio, entidad, clave_ent
	order by total_delitos desc
) as delitos
join poblacion_municipio pm on (delitos.cve_municipio = pm.clave_municipio)
order by delitos_por_habitante asc
limit 3;


-- 2.1 Cuantos delitos se cometen cada 1000 habitantes CDMX
select
	delitos.municipio as municipio,
    delitos.total_delitos as total_delitos,
    pm.poblacion as poblacion,
    ((delitos.total_delitos/pm.poblacion)*1000) as delitos_1000_habitantes
from (
	-- Subconsulta para obtener los delitos totales por municipio de CDMX
	select  clave_ent, entidad, cve_municipio, municipio, sum(enero+febrero+marzo+abril+mayo+junio+julio+agosto+septiembre+octubre+noviembre+diciembre) total_delitos
	from estados_delitos 
	where clave_ent = 9
	group by municipio, cve_municipio, entidad, clave_ent
	order by total_delitos desc
) as delitos
join poblacion_municipio pm on (delitos.cve_municipio = pm.clave_municipio)
order by delitos_1000_habitantes desc;

-- 2.2 Cuantos delitos se cometen cada 1000 habitantes Hidalgo
select
	delitos.municipio as municipio,
    delitos.total_delitos as total_delitos,
    pm.poblacion as poblacion,
    ((delitos.total_delitos/pm.poblacion)*1000) as delitos_1000_habitantes
from (
	-- Subconsulta para obtener los delitos totales por municipio de CDMX
	select  clave_ent, entidad, cve_municipio, municipio, sum(enero+febrero+marzo+abril+mayo+junio+julio+agosto+septiembre+octubre+noviembre+diciembre) total_delitos
	from estados_delitos 
	where clave_ent = 13
	group by municipio, cve_municipio, entidad, clave_ent
	order by total_delitos desc
) as delitos
join poblacion_municipio pm on (delitos.cve_municipio = pm.clave_municipio)
order by delitos_1000_habitantes desc;
