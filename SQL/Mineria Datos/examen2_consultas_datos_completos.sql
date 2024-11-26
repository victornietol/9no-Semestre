create database examen2_mineriadatos;
use examen2_mineriadatos;

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

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\delitos_cdmx_hidalgo.csv'
into table estados_delitos
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\n'
ignore 1 rows;


create table poblacion_municipio(
	clave_entidad int not null,
    clave_municipio int not null,
    municipio varchar(100) not null,
    poblacion int not null
);

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Poblacion_Municipal.csv'
into table poblacion_municipio
fields terminated by ','
lines terminated by '\n'
ignore 1 rows;


select * from poblacion_municipio;
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
	where clave_ent = 9 and anio <> 2024
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
	where clave_ent = 9 and anio <> 2024
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
	where clave_ent = 13 and anio <> 2024
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
	where clave_ent = 13 and anio <> 2024
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
    ((delitos.total_delitos/pm.poblacion)*100000) as delitos_100mil_habitantes
from (
	-- Subconsulta para obtener los delitos totales por municipio de CDMX
	select  clave_ent, entidad, cve_municipio, municipio, sum(enero+febrero+marzo+abril+mayo+junio+julio+agosto+septiembre+octubre+noviembre+diciembre) total_delitos
	from estados_delitos 
	where clave_ent = 9 and anio <> 2024
	group by municipio, cve_municipio, entidad, clave_ent
	order by total_delitos desc
) as delitos
join poblacion_municipio pm on (delitos.cve_municipio = pm.clave_municipio)
order by delitos_100mil_habitantes desc;

-- 2.2 Cuantos delitos se cometen cada 1000 habitantes Hidalgo
select
	delitos.municipio as municipio,
    delitos.total_delitos as total_delitos,
    pm.poblacion as poblacion,
    ((delitos.total_delitos/pm.poblacion)*100000) as delitos_100mil_habitantes
from (
	-- Subconsulta para obtener los delitos totales por municipio de CDMX
	select  clave_ent, entidad, cve_municipio, municipio, sum(enero+febrero+marzo+abril+mayo+junio+julio+agosto+septiembre+octubre+noviembre+diciembre) total_delitos
	from estados_delitos 
	where clave_ent = 13 and anio <> 2024
	group by municipio, cve_municipio, entidad, clave_ent
	order by total_delitos desc
) as delitos
join poblacion_municipio pm on (delitos.cve_municipio = pm.clave_municipio)
order by delitos_100mil_habitantes desc;


-- 3. Gobernador mas corrupto
	-- Obtener los delitos totales por año de CDMX (Dos ultimos gobernadores)
    -- 2015 a 2018 : Miguel Angel Mancera
    -- 2019 a 2023 : Claudia Sheinbaum
select 
	anio, 
    clave_ent, 
    entidad,
    sum(enero+febrero+marzo+abril+mayo+junio+julio+agosto+septiembre+octubre+noviembre+diciembre) total_delitos
from estados_delitos
where clave_ent = 9
group by anio, clave_ent, entidad;

	-- 3.1 Delitos en cada periodo, el periodo mas corrupto queda arriba
(select 
	'Miguel Angel Mancera' as gobernador,
    clave_ent,
    entidad,
    sum(enero+febrero+marzo+abril+mayo+junio+julio+agosto+septiembre+octubre+noviembre+diciembre) total_delitos
from estados_delitos
where clave_ent = 9 and anio >= 2015 and anio <= 2018
group by clave_ent, entidad)
union
(select 
	'Claudia Sheinbaum' as gobernador,
    clave_ent, 
    entidad,
    sum(enero+febrero+marzo+abril+mayo+junio+julio+agosto+septiembre+octubre+noviembre+diciembre) total_delitos
from estados_delitos
where clave_ent = 9 and anio >= 2019 and anio <= 2023
group by clave_ent, entidad)
order by total_delitos desc;
	-- Mejorada
(select -- Gobernador de 2015 a noviembre de 2018
	'Miguel Angel Mancera' as gobernador,
    clave_ent,
    entidad,
    (
		(select sum(enero+febrero+marzo+abril+mayo+junio+julio+agosto+septiembre+octubre+noviembre+diciembre) as delitos_2015_2017
		from estados_delitos
		where clave_ent = 9 and anio >= 2015 and anio <= 2017)
        +
		(select sum(enero+febrero+marzo+abril+mayo+junio+julio+agosto+septiembre+octubre+noviembre) as delitos_2018
		from estados_delitos
		where clave_ent = 9 and anio = 2018)
	) as total_delitos
from estados_delitos
where clave_ent = 9
limit 1)
union
(select -- Gobernador de diciembre 2018 a 2023
	'Claudia Sheinbaum' as gobernador,
    clave_ent,
    entidad,
    (
		(select sum(diciembre) as delitos_2018
		from estados_delitos
		where clave_ent = 9 and anio = 2018)
        +
		(select sum(enero+febrero+marzo+abril+mayo+junio+julio+agosto+septiembre+octubre+noviembre+diciembre) as delitos_2019_2023
		from estados_delitos
		where clave_ent = 9 and anio >= 2019 and anio <= 2023)
	) as total_delitos
from estados_delitos
where clave_ent = 9
limit 1)
order by total_delitos desc;

	-- Hidalgo
(select  -- Gobernador de septiembre 2016 a agosto 2022
	'Omar Fayad Meneses' as gobernador,
    clave_ent,
    entidad,
	(
		(select sum(septiembre+octubre+noviembre+diciembre) as delitos_2016
		from estados_delitos
		where clave_ent = 13 and anio = 2016)
		+
		(select sum(enero+febrero+marzo+abril+mayo+junio+julio+agosto+septiembre+octubre+noviembre+diciembre) as delitos_2017_2021
		from estados_delitos
		where clave_ent = 13 and anio >= 2017 and anio <= 2021)
		+
		(select sum(enero+febrero+marzo+abril+mayo+junio+julio+agosto) as delitos_2022
		from estados_delitos
		where clave_ent = 13 and anio = 2022)
    ) as total_delitos
from estados_delitos
where clave_ent = 13
limit 1)
union
(select -- Gobernador de septiembre 2022 a diciembre 2023
	'Julio Ramon Menchaca' as gobernador,
    clave_ent,
    entidad,
	(
		(select sum(septiembre+octubre+noviembre+diciembre) as delitos_2022
		from estados_delitos
		where clave_ent = 13 and anio = 2022)
		+
		(select sum(enero+febrero+marzo+abril+mayo+junio+julio+agosto+septiembre+octubre+noviembre+diciembre) as delitos_2023
		from estados_delitos
		where clave_ent = 13 and anio = 2023)
    ) as total_delitos
from estados_delitos
where clave_ent = 13
limit 1)
order by total_delitos desc;


-- 4. Distribucion de delitos por año a partir del bien juridico del patrimonio. Tipo de delito 'Fraude'
	-- CDMX
select
	anio,
	clave_ent,
    entidad,
    bien_juridico_afectado,
    tipo_delito,
    sum(enero+febrero+marzo+abril+mayo+junio+julio+agosto+septiembre+octubre+noviembre+diciembre) total_delitos
from estados_delitos
where clave_ent = 9
	and anio <> 2024
	and bien_juridico_afectado like '%patrimonio%' 
    and tipo_delito like '%fraude%'
group by anio, clave_ent, entidad, bien_juridico_afectado, tipo_delito;

	-- Hidalgo
select
	anio,
	clave_ent,
    entidad,
    bien_juridico_afectado,
    tipo_delito,
    sum(enero+febrero+marzo+abril+mayo+junio+julio+agosto+septiembre+octubre+noviembre+diciembre) total_delitos
from estados_delitos
where clave_ent = 13
	and anio <> 2024
	and bien_juridico_afectado like '%patrimonio%' 
    and tipo_delito like '%fraude%'
group by anio, clave_ent, entidad, bien_juridico_afectado, tipo_delito;



-- 5. Distribucion de delitos por año por la vida y la integridad. Tipo de delito 'Lesiones'
	-- CDMX
select
	anio,
    clave_ent,
    entidad,
    bien_juridico_afectado,
    tipo_delito,
    sum(enero+febrero+marzo+abril+mayo+junio+julio+agosto+septiembre+octubre+noviembre+diciembre) total_delitos
from estados_delitos
where clave_ent = 9
	and anio <> 2024
	and bien_juridico_afectado like '%la vida y la integridad%' 
    and tipo_delito like '%lesiones%'
group by anio, clave_ent, entidad, bien_juridico_afectado, tipo_delito;

	-- Hidalgo
select
	anio,
    clave_ent,
    entidad,
    bien_juridico_afectado,
    tipo_delito,
    sum(enero+febrero+marzo+abril+mayo+junio+julio+agosto+septiembre+octubre+noviembre+diciembre) total_delitos
from estados_delitos
where clave_ent = 13
	and anio <> 2024
	and bien_juridico_afectado like '%la vida y la integridad%' 
    and tipo_delito like '%lesiones%'
group by anio, clave_ent, entidad, bien_juridico_afectado, tipo_delito;
