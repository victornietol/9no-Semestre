use examen2_mineria_datos;

-- 1. Obtener los 3 municipio mas peligrosos en relacion al numero de delitos y habitantes por municipio.
	-- Ciudad de Mexico
(select	-- 3 municipios mas peligrosos
	delitos.municipio as municipio,
    delitos.total_delitos as total_delitos,
    pm.poblacion as poblacion,
    (delitos.total_delitos/pm.poblacion) as delitos_por_habitante
from (
	-- Subconsulta para obtener los delitos totales por municipio de CDMX
	select  
		clave_ent, 
		entidad, 
        cve_municipio, 
        municipio, 
        sum(enero+febrero+marzo+abril+mayo+junio+julio+agosto+septiembre+octubre+noviembre+diciembre) total_delitos
	from estados_delitos 
	where clave_ent = 9 and anio <> 2024
	group by municipio, cve_municipio, entidad, clave_ent
	order by total_delitos desc
) as delitos
join poblacion_municipio pm on (delitos.cve_municipio = pm.clave_municipio)
order by delitos_por_habitante desc
limit 3)
union
(select '-','-','-','-') -- Separador para no confundir entre los municipios mas seguros y mas peligrosos
union
(select  -- 3 municipios mas seguros
	delitos.municipio as municipio,
    delitos.total_delitos as total_delitos,
    pm.poblacion as poblacion,
    (delitos.total_delitos/pm.poblacion) as delitos_por_habitante
from (
	-- Subconsulta para obtener los delitos totales por municipio de CDMX
	select  
		clave_ent, 
        entidad, 
        cve_municipio, 
        municipio, 
        sum(enero+febrero+marzo+abril+mayo+junio+julio+agosto+septiembre+octubre+noviembre+diciembre) total_delitos
	from estados_delitos 
	where clave_ent = 9 and anio <> 2024
	group by municipio, cve_municipio, entidad, clave_ent
	order by total_delitos desc
) as delitos
join poblacion_municipio pm on (delitos.cve_municipio = pm.clave_municipio)
order by delitos_por_habitante asc
limit 3);

	-- Hidalgo
(select -- 3 municipios mas peligrosos
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
limit 3)
union
(select '-','-','-','-') -- Separador para no confundir entre los municipios mas seguros y mas peligrosos
union
(select  -- 3 municipios mas peligrosos
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
limit 3);


-- 2. Cuantos delitos se cometen cada 100 mil habitantes por estado
	-- Ciudad de Mexico
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

    -- Hidalgo
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
	-- Ciudad de Mexico
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