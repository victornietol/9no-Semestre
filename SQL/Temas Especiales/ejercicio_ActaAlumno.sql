create database bd_pto;
use bd_pto;

create table plan_asinatura(
	plan_cve varchar(100) not null,
    cve_asignatura varchar(100) not null
);

create table acta(
	folio varchar(50) not null,
    grupo varchar(50) not null,
    cve_asignatura varchar(100) not null
);

create table acta_alumno(
	folio varchar(50) not null,
    alm_cuenta varchar(20) not null,
    calificacion int not null
);

create temporary table tabla_aux(
	alm_cuenta int(10) unsigned not null,
    suma_cal int(10) unsigned null,
    cuantas_asig_plan tinyint(3) unsigned null,
    cuantas_asig_cursadas tinyint(3) unsigned null,
    cuantas_oblg_aprob tinyint(3) unsigned null,
    promedio decimal(10,2) unsigned null,
    avance decimal(10,2) unsigned null,
    primary key (alm_cuenta)
);

-- Asignaturaas totales 
-- select 

-- Promedio del alumno
insert into tabla_aux (
select
	sum(if(calificacion='NP',0,calificacion)) as suma,
    count(*) as cuantas
from acta_alumno
where alm_cuenta = " "
group by alm_cuenta);

-- Llenar campo PROMEDIO de la tabla temporal
update tabla_aux
set promedio = (suma/promedio)
where alm_cuenta = "";

