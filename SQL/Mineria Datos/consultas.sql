use examen2_mineria;

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