use ejercicio_tebd;

/*
SELECT * FROM ejercicio_tebd.acta_alumno
where alm_cuenta = '2054789653';

select
	*
from acta_alumno a_l
join acta a on (a_l.folio = a.folio)
join plan_asignatura p_a on (a.cve_asignatura = p_a.cve_asignatura)
where 
	a_l.alm_cuenta = '2054789653' and 
	p_a.plan_cve = '1' and 
    -- a_l.calificacion not in('NP','5') and
    p_a.obligatoria = 1;
*/

-- CONSULTAS INDIVIDUALES

-- 1. Obteniendo suma de calificaciones de las materias obligatorias del plan de estudios correspondiente del alumno
select
	a_l.alm_cuenta as alm_cuenta,
	sum(cast(a_l.calificacion as unsigned)) as suma_cal
from acta_alumno a_l
join acta a on (a_l.folio = a.folio)
join plan_asignatura p_a on (a.cve_asignatura = p_a.cve_asignatura)
where
	p_a.plan_cve = '1' and 
    a_l.calificacion <> 'NP' and
    p_a.obligatoria = 1
group by a_l.alm_cuenta;
    

-- 2. Numero total de asignaturas obligatorias del plan de estudios
select
	count(*) as cuantas_asig_plan
from plan_asignatura
where 
	plan_cve = '1' and
    obligatoria = 1; -- 1 = obligatoria; 0 = optativa
    
    
-- 3. Numero total de asignaturas obligatorias cursadas por el alumno
select
	a_l.alm_cuenta as alm_cuenta,
	count(*) as cuantas_asig_cursadas
from acta_alumno a_l
join acta a on (a_l.folio = a.folio)
join plan_asignatura p_a on (a.cve_asignatura = p_a.cve_asignatura)
where 
	p_a.plan_cve = '1' and
    p_a.obligatoria = 1
group by a_l.alm_cuenta;

-- 4. Numero total de asignaturas obligatorias aprobadas por el alumno
select
	count(*) as cuantas_oblg_aprob
from acta_alumno a_l
join acta a on (a_l.folio = a.folio)
join plan_asignatura p_a on (a.cve_asignatura = p_a.cve_asignatura)
where 
	p_a.plan_cve = '1' and 
    a_l.calificacion not in('NP','5') and
    p_a.obligatoria = 1
group by a_l.alm_cuenta;

-- CONSULTAS FINALES
-- 1. OBTENIENDO PROMEDIO
select 
	s.alm_cuenta as alm_cuenta,
	(s.suma_cal/c.cuantas_asig_cursadas) as promedio
from (
		select
			sum(cast(a_l.calificacion as unsigned)) as suma_cal,
            a_l.alm_cuenta as alm_cuenta
		from acta_alumno a_l
		join acta a on (a_l.folio = a.folio)
		join plan_asignatura p_a on (a.cve_asignatura = p_a.cve_asignatura)
		where 
			p_a.plan_cve = '1' and 
			a_l.calificacion <> 'NP' and
			p_a.obligatoria = 1
		group by a_l.alm_cuenta
    ) as s,
    (
		select
			count(*) as cuantas_asig_cursadas,
            a_l.alm_cuenta as alm_cuenta
		from acta_alumno a_l
		join acta a on (a_l.folio = a.folio)
		join plan_asignatura p_a on (a.cve_asignatura = p_a.cve_asignatura)
		where 
			p_a.plan_cve = '1' and
            a_l.calificacion <> 'NP' and
			p_a.obligatoria = 1
		group by a_l.alm_cuenta
    ) as c
where s.alm_cuenta = c.alm_cuenta;
    
    
-- 2. OBTENIENDO PORCENTAJE DE AVANCE
select 
	c_o.alm_cuenta as alm_cuenta,
	((c_o.cuantas_oblg_aprob*100)/c_a.cuantas_asig_plan) as avance
from
	( -- Obteniendo numero de asignaturas obligatorias aprobadas por alumno
		select
			count(*) as cuantas_oblg_aprob,
            a_l.alm_cuenta as alm_cuenta
		from acta_alumno a_l
		join acta a on (a_l.folio = a.folio)
		join plan_asignatura p_a on (a.cve_asignatura = p_a.cve_asignatura)
		where 
			p_a.plan_cve = '1' and 
			a_l.calificacion not in('NP','5') and
			p_a.obligatoria = 1
		group by a_l.alm_cuenta
    ) as c_o,
    ( -- Obteniendo cuantas asignaturas obligatorias tiene el plan
		select
			count(*) as cuantas_asig_plan
		from plan_asignatura
		where 
			plan_cve = '1' and
			obligatoria = 1 -- 1 = obligatoria; 0 = optativa
    ) as c_a;