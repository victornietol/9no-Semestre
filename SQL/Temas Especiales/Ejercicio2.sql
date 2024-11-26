create database te_ejercicios;

use te_ejercicios;

create table if not exists inscripcion(
	num_cuenta varchar(10) not null,
    cve_asig int not null,
    calificacion varchar(2) not null,
    periodo varchar(6) not null,
    tipo_examen varchar(1)
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\datos_prueba1.csv' 
INTO TABLE inscripcion
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from inscripcion;

-- Consulta 1) suma(antes del promedio) y numero de materias de cada alumno
select 
	num_cuenta, 
    count(*) as cuantas,
    sum(
		if(calificacion = 'MB',9,
			if(calificacion = 'B', 8,
				if(calificacion = 'S',6,
					if(calificacion = 'NA',5, cast(calificacion as signed))
                )
            )
        )
	) as suma
from inscripcion
where calificacion != 'NP'
group by num_cuenta;

select 
	num_cuenta, 
    count(*) as cuantas,
    (sum(
		if(calificacion = 'MB',9,
			if(calificacion = 'B', 8,
				if(calificacion = 'S',6,
					if(calificacion = 'NA',5, cast(calificacion as signed))
                )
            )
        )
	)) / count(*) as promedio
from inscripcion
where calificacion != 'NP'
group by num_cuenta;

-- Consulta 2) Cuantas calificaciones se obtuvieron de cada calificacion diferente
select * from inscripcion;

	-- Obtener cuantas calificaciones de un tipo tiene
select 
	num_cuenta,
    count(*) as MB_10
from inscripcion
where calificacion = 'MB' or calificacion = '10'
group by num_cuenta;

select 
	num_cuenta, 
	sum(calificacion = 'MB' or calificacion = '10') as MB_10
from inscripcion
group by num_cuenta;

select * from inscripcion where num_cuenta = '20938465-2';

	-- Consulta final
select
    num_cuenta,
    sum(calificacion = 'MB' or calificacion = '10') as C_MB_10,
    sum(calificacion = '9') as C_9,
    sum(calificacion = 'B' or calificacion = '8') as C_B_8,
    sum(calificacion = '7') as C_7,
    sum(calificacion = 'S' or calificacion = '6') as C_S_6,
    sum(calificacion = '5' or calificacion = 'NA') as C_NA_5
from inscripcion
group by num_cuenta;

-- Version del profe
use te_ejercicios;

select
	num_cuenta,
	(select count(*) from inscripcion as P ON P.num_cuenta = c.num_cuenta AND calificacion IN('MB','10')) as cal10,
	(select count(*) from inscripcion as P ON P.num_cuenta = c.num_cuenta AND calificacion IN('9')) as cal9,
	(select count(*) from inscripcion as P ON P.num_cuenta = c.num_cuenta AND calificacion IN('B','8')) as cal8,
	(select count(*) from inscripcion as P ON P.num_cuenta = c.num_cuenta AND calificacion IN('7')) as cal7,
	(select count(*) from inscripcion as P ON P.num_cuenta = c.num_cuenta AND calificacion IN('S','6')) as cal6,
	(select count(*) from inscripcion as P ON P.num_cuenta = c.num_cuenta AND calificacion IN('5','NA')) as cal5
from inscripcion as c
group by num_cuenta;

SELECT 
    num_cuenta,
    SUM(CASE WHEN calificacion IN ('MB', '10') THEN 1 ELSE 0 END) AS cal10,
    SUM(CASE WHEN calificacion IN ('9') THEN 1 ELSE 0 END) AS cal9,
    SUM(CASE WHEN calificacion IN ('B', '8') THEN 1 ELSE 0 END) AS cal8,
    SUM(CASE WHEN calificacion IN ('7') THEN 1 ELSE 0 END) AS cal7,
    SUM(CASE WHEN calificacion IN ('S', '6') THEN 1 ELSE 0 END) AS cal6,
    SUM(CASE WHEN calificacion IN ('5', 'NA') THEN 1 ELSE 0 END) AS cal5
FROM inscripcion
GROUP BY num_cuenta;