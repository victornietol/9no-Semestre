-- Consulta 2) Cuantas calificaciones se obtuvieron de cada calificacion por alumno
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