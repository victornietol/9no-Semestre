-- Obtener el promedio de las asignaturas obligatorias
-- Obtener el avance academico

use ejercicio_tebd;

drop table plan_asignatura;
create table plan_asignatura(
	plan_cve varchar(100) not null,
    cve_asignatura varchar(100) not null,
    obligatoria int not null
);

drop table acta;
create table acta(
	folio int not null,
    grupo int not null,
    cve_asignatura varchar(100) not null
);


drop table acta_alumno;
create table acta_alumno(
	folio varchar(50) not null,
    alm_cuenta varchar(20) not null,
    calificacion varchar(2) not null
);

drop table tabla_aux;
create temporary table tabla_aux(
	alm_cuenta varchar(10) not null,
    suma_cal int(10) unsigned null,
    cuantas_asig_plan tinyint(3) unsigned null,
    cuantas_asig_cursadas tinyint(3) unsigned null,
    cuantas_oblg_aprob tinyint(3) unsigned null,
    promedio decimal(10,2) unsigned null,
    avance decimal(10,2) unsigned null,
    primary key (alm_cuenta)
);

-- DATOS
-- Asignatura
load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\ejercicio_te\\plan_asignatura.csv'
into table plan_asignatura
fields terminated by ','
-- optionally enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

insert into plan_asignatura values ('2','2001',1),('3','3001',1); 

-- acta
load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\ejercicio_te\\acta_3.csv'
into table acta
fields terminated by ','
-- optionally enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

-- acta_alumno
load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\ejercicio_te\\acta_alumno_3.csv'
into table acta_alumno
fields terminated by ','
-- optionally enclosed by '"'
lines terminated by '\n'
ignore 1 rows;


-- alumno 1: 50 materias    - 3093377892
-- alumno 2: 25 materias    - 2054789653
-- alumno 3: 5 materias	    - 1037466543


-- CONSULTAS INDIVIDUALES

-- 1. Obteniendo suma de calificaciones de las materias obligatorias del plan de estudios correspondiente del alumno
select
	sum(cast(a_l.calificacion as unsigned)) as suma_cal
from acta_alumno a_l
join acta a on (a_l.folio = a.folio)
join plan_asignatura p_a on (a.cve_asignatura = p_a.cve_asignatura)
where 
	a_l.alm_cuenta = '3093377892' and 
	p_a.plan_cve = '1' and 
    a_l.calificacion <> 'NP' and
    p_a.obligatoria = 1;
    

-- 2. Numero total de asignaturas obligatorias del plan de estudios
select
	count(*) as cuantas_asig_plan
from plan_asignatura
where 
	plan_cve = '1' and
    obligatoria = 1; -- 1 = obligatoria; 0 = optativa
    
    
-- 3. Numero total de asignaturas obligatorias cursadas por el alumno
select
	count(*) as cuantas_asig_cursadas
from acta_alumno a_l
join acta a on (a_l.folio = a.folio)
join plan_asignatura p_a on (a.cve_asignatura = p_a.cve_asignatura)
where 
	a_l.alm_cuenta = '3093377892' and 
	p_a.plan_cve = '1' and 
    p_a.obligatoria = 1;

-- 4. Numero total de asignaturas obligatorias aprobadas por el alumno
select
	count(*) as cuantas_oblg_aprob
from acta_alumno a_l
join acta a on (a_l.folio = a.folio)
join plan_asignatura p_a on (a.cve_asignatura = p_a.cve_asignatura)
where 
	a_l.alm_cuenta = '3093377892' and 
	p_a.plan_cve = '1' and 
    a_l.calificacion not in('NP','5') and
    p_a.obligatoria = 1;

    
-- 5. OBTENIENDO PROMEDIO
select (s.suma_cal/c.cuantas_asig_cursadas) as promedio
from (
		select
			sum(cast(a_l.calificacion as unsigned)) as suma_cal
		from acta_alumno a_l
		join acta a on (a_l.folio = a.folio)
		join plan_asignatura p_a on (a.cve_asignatura = p_a.cve_asignatura)
		where 
			a_l.alm_cuenta = '3093377892' and 
			p_a.plan_cve = '1' and 
			a_l.calificacion <> 'NP' and
			p_a.obligatoria = 1
    ) as s,
    (
		select
			count(*) as cuantas_asig_cursadas
		from acta_alumno a_l
		join acta a on (a_l.folio = a.folio)
		join plan_asignatura p_a on (a.cve_asignatura = p_a.cve_asignatura)
		where 
			a_l.alm_cuenta = '3093377892' and 
			p_a.plan_cve = '1' and
            a_l.calificacion <> 'NP' and
			p_a.obligatoria = 1
    ) as c;
    
    
-- 6. OBTENIENDO PORCENTAJE DE AVANCE
select ((c_o.cuantas_oblg_aprob*100)/c_a.cuantas_asig_plan) as avance
from
	(
		select
			count(*) as cuantas_oblg_aprob
		from acta_alumno a_l
		join acta a on (a_l.folio = a.folio)
		join plan_asignatura p_a on (a.cve_asignatura = p_a.cve_asignatura)
		where 
			a_l.alm_cuenta = '3093377892' and 
			p_a.plan_cve = '1' and 
			a_l.calificacion not in('NP','5') and
			p_a.obligatoria = 1
    ) as c_o,
    (
		select
			count(*) as cuantas_asig_plan
		from plan_asignatura
		where 
			plan_cve = '1' and
			obligatoria = 1 -- 1 = obligatoria; 0 = optativa
    ) as c_a;
	



-- UTILIZANDO UNA TABLA TEMPORAL PARA OBTENER LOS RESULTADOS
-- Llenando tabla temporal para obtener datos
insert into tabla_aux (alm_cuenta, suma_cal, cuantas_asig_plan, cuantas_asig_cursadas, cuantas_oblg_aprob) 
values (
	-- Num cuenta
    ('3093377892'),
    
    -- Suma calificaciones
    (
		select
			sum(cast(a_l.calificacion as unsigned)) as suma_cal
		from acta_alumno a_l
		join acta a on (a_l.folio = a.folio)
		join plan_asignatura p_a on (a.cve_asignatura = p_a.cve_asignatura)
		where 
			a_l.alm_cuenta = '3093377892' and 
			p_a.plan_cve = '1' and 
			a_l.calificacion <> 'NP' and
			p_a.obligatoria = 1
    ),
    
    -- Asignaturas obligatorias totales del plan de estudios (se utiliza para el avance)
    (
		select
			count(*) as cuantas_asig_plan
		from plan_asignatura
		where 
			plan_cve = '1' and
			obligatoria = 1 -- 1 = obligatoria; 0 = optativa
    ),
    
    -- Asignaturas obligatorias cursadas por el alumno (se utiliza para el promedio)
    (
		select
			count(*) as cuantas_asig_cursadas
		from acta_alumno a_l
		join acta a on (a_l.folio = a.folio)
		join plan_asignatura p_a on (a.cve_asignatura = p_a.cve_asignatura)
		where 
			a_l.alm_cuenta = '3093377892' and 
			p_a.plan_cve = '1' and
            a_l.calificacion <> 'NP' and
			p_a.obligatoria = 1
    ),
        
    -- Asignaturas obligatorias cursadas y aprobadas por el alumno (se utiliza para el avance)
    (
		select
			count(*) as cuantas_oblg_aprob
		from acta_alumno a_l
		join acta a on (a_l.folio = a.folio)
		join plan_asignatura p_a on (a.cve_asignatura = p_a.cve_asignatura)
		where 
			a_l.alm_cuenta = '3093377892' and 
			p_a.plan_cve = '1' and 
			a_l.calificacion not in('NP','5') and
			p_a.obligatoria = 1
    )
);

-- Obteniendo PROMEDIO y AVANCE con los campos de la tabla
update tabla_aux
set
	promedio = (select (suma_cal/cuantas_asig_cursadas)),
    avance = (select ((cuantas_oblg_aprob*100)/cuantas_asig_plan))
where alm_cuenta = '3093377892';

select * from tabla_aux;