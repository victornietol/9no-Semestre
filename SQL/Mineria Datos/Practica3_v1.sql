-- Practica 3
create database if not exists practica3_mineriadatos;
use practica3_mineriadatos;

drop table datos;
create table datos(
	altura_m float not null,
    peso_kg float not null
);

-- Ingreso de datos
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\datosIMC1.csv' 
INTO TABLE datos
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from datos;

-- Practica
-- Obtener IMC
select altura_m, peso_kg, peso_kg/(pow(altura_m,2)) IMC from datos;

-- Escalas de IMC
select consulta.altura_m Altura_m, consulta.peso_kg Peso_kg, consulta.IMC IMC,
	case
		when IMC < 18.5 then "Bajo Peso"
		when IMC >= 18.5 and IMC <= 24.9 then "Peso normal"
		when IMC >= 25.0 and IMC <= 29.9 then "Sobrepeso"
		when IMC >= 30.0 and IMC <= 34.9 then "Obesidad grado I"
		when IMC >= 35.0 and IMC <= 39.9 then "Obesidad grado II"
		when IMC >= 40.0 then "Obesidad grado III"
		else "Valor no establecido"
    end Clasificacion_IMC
from (select altura_m, peso_kg, peso_kg/(pow(altura_m,2)) IMC from datos) consulta;

-- Cuantas personas hay segun cada clasificacion de IMC
select conteo.Clasificacion_IMC, count(*) Numero_Personas from (
	select
		case
			when IMC < 18.5 then "Bajo Peso"
			when IMC >= 18.5 and IMC <= 24.9 then "Peso normal"
			when IMC >= 25.0 and IMC <= 29.9 then "Sobrepeso"
			when IMC >= 30.0 and IMC <= 34.9 then "Obesidad grado I"
			when IMC >= 35.0 and IMC <= 39.9 then "Obesidad grado II"
			when IMC >= 40.0 then "Obesidad grado III"
			else "Valor no establecido"
		end Clasificacion_IMC
	from (select altura_m, peso_kg, peso_kg/(pow(altura_m,2)) IMC from datos) consulta
) conteo group by conteo.Clasificacion_IMC order by Numero_Personas desc;

-- Distribucion Altura
select altura_m from datos order by altura_m desc;

-- Distribucion Peso
select peso_kg from datos order by peso_kg desc;

-- Distribucion IMC
select peso_kg/(pow(altura_m,2)) IMC from datos order by IMC desc;

-- Frecuencia absoluta Altura
select altura_m, count(altura_m) Frecuencia_Abs from datos group by altura_m 
order by altura_m desc;

-- Frecuencia absoluta Peso
select peso_kg, count(peso_kg) Frecuencia_Abs from datos group by peso_kg
order by peso_kg desc;

-- Frecuencia absoluta IMC
select peso_kg/(pow(altura_m,2)) IMC, count(peso_kg/(pow(altura_m,2))) Frecuencia_Abs from datos group by IMC
order by IMC desc;

-- Frecuencia relativa Altura
select altura_m, (count(altura_m)/(select count(*) from datos)) Frecuencia_rel from datos
group by altura_m
order by altura_m desc;

-- Frecuencia relativa Peso
select peso_kg, (count(peso_kg)/(select count(*) from datos)) Frecuencia_rel from datos
group by peso_kg
order by peso_kg desc;

-- Frecuencia relativa IMC
select peso_kg/(pow(altura_m,2)) IMC, 
	(count(peso_kg/(pow(altura_m,2))) / (select count(*) from datos)
	) Frecuencia_rel from datos
group by IMC
order by IMC desc;

-- Media Altura
select sum(altura_m)/count(*) Media_Altura from datos;
-- Utilizando funcion de mysql
select avg(altura_m) Media_Altura from datos; 

-- Media Peso
select  sum(peso_kg)/count(*) Media_Peso from datos;
-- Utilizando funcion de mysql
select avg(peso_kg) Media_Peso from datos;

-- Media IMC
select sum(peso_kg/(pow(altura_m,2))) / count(*) Media_IMC from datos;

-- Utilizando funcion de mysql
select avg(peso_kg/(pow(altura_m,2))) Media_IMC from datos; 

/*
-- Mediana Altura
select count(*) from datos; -- obtener numero de registros para saber si es impar o par
select altura_m from datos order by altura_m desc limit 1 offset 4;
select * from datos order by altura_m desc;
*/

-- MEDIANA
-- Verificar si el total de registros es un numero par o impar
select count(*) Num_Registros, 
	case
		when (select count(*) from datos) % 2 = 0 then "par"
        else "impar"
	end tipo
from datos limit 1;

-- Altura
-- Obteniendo la posicion del valor central
select ceil((select count(*) from datos)/2) Posicion_Valor_Central;

-- Se obtiene el valor en la posicion 15 correspondiente a la mediana
select altura_m Mediana_Altura from datos order by altura_m asc limit 1 offset 14;

/*
-- Altura
select altura_m from datos order by altura_m desc limit 1 offset 14; -- Obteniendo los valores para obtener el promedio de los valores centrales por ser par y obtener la mediana 
select altura_m from datos order by altura_m desc limit 1 offset 15;

select ((select altura_m from datos order by altura_m desc limit 1 offset 14)+(select altura_m from datos order by altura_m desc limit 1 offset 15))/2 Mediana_Altura;
*/
/*
select
	case
		when (select count(*) from datos) % 2 = 0 then "par"
        else "impar"
	end tipo
from datos limit 1;
-- select ceil((select count(*) from datos)/2)
-- set @valor = floor((select count(*) from datos)/2)
set @valor := floor((select count(*) from datos)/2); -- Obteniendo valor central si es impar
set @valor_par = @valor+1; -- Obteniendo valor si es par
select 
	case
		when tipo = "impar" then 
			(select altura_m from datos order by altura_m desc limit 1 offset @valor)
		when tipo = "par" then
			(((select altura_m from datos order by altura_m desc limit 1 offset @valor)+(select altura_m from datos order by altura_m desc limit 1 offset @valor_par))/2)
        else "No definido"
	end Mediana_Altura
from (
	select  -- Consulta para obtener si el total de numeros es par o impar
		case
			when (select count(*) from datos) % 2 = 0 then "par"
			else "impar"
		end tipo
	from datos limit 1
) tipo;
*/

-- Peso
-- Se obtiene el valor en la posicion 15 correspondiente a la mediana
select peso_kg Mediana_Peso from datos order by peso_kg asc limit 1 offset 14;

/*
select peso_kg from datos order by peso_kg desc limit 1 offset 14; -- Obteniendo los valores para obtener el promedio de los valores centrales por ser par y obtener la mediana 
select peso_kg from datos order by peso_kg desc limit 1 offset 15;
select ((select peso_kg from datos order by peso_kg desc limit 1 offset 14)+(select peso_kg from datos order by peso_kg desc limit 1 offset 15))/2 Mediana_Peso;
*/

-- IMC
 -- Se obtiene el valor en la posicion 15 correspondiente a la media
select peso_kg/(pow(altura_m,2)) Mediana_IMC from datos order by Mediana_IMC asc limit 1 offset 14;

/*
select round(peso_kg/(pow(altura_m,2)), 2) IMC from datos order by IMC desc limit 1 offset 14;
select round(peso_kg/(pow(altura_m,2)), 2) IMC from datos order by IMC desc limit 1 offset 15;
select ((select peso_kg/(pow(altura_m,2)) IMC from datos order by IMC desc limit 1 offset 14)+(select peso_kg/(pow(altura_m,2)) IMC from datos order by IMC desc limit 1 offset 15))/2 Mediana_IMC;
*/


-- Moda Altura
select altura_m Moda_Altura from datos group by altura_m
having count(altura_m) = ( -- Seleccionando los valores con la misma frecuencia maxima obtenida
	select max(frecuencia) from ( -- Obteniendo frecuencia maxima para determinar la moda
		select count(altura_m) frecuencia from datos group by altura_m
    ) max_frec
);

/*
select altura_m from datos group by altura_m
having count(altura_m) = ( -- Seleccionando los valores con la misma frecuencia maxima obtenida
	select frecuencia from ( -- Obteniendo frecuencia maxima para determinar la moda
		select count(altura_m) frecuencia from datos group by altura_m
    ) max_frec order by frecuencia desc limit 1
);
*/

-- Moda Peso
select peso_kg Moda_Peso from datos group by peso_kg
having count(peso_kg) = ( -- Seleccionando los valores con la misma frecuencia maxima 
	select max(frecuencia) from ( -- Obteniendo frecuencia maxima para determinar la moda
		select count(peso_kg) frecuencia from datos group by peso_kg
    ) max_frec
);

-- Moda IMC
select peso_kg/(pow(altura_m,2)) IMC from datos group by IMC
having count(peso_kg/(pow(altura_m,2))) = (
	select max(frecuencia) from ( -- Obteniendo frecuencia maxima para determinar la moda
		select count(peso_kg/(pow(altura_m,2))) frecuencia from datos group by peso_kg/(pow(altura_m,2))
    ) max_frec
);

-- Dispersion o variabilidad

-- Rango Altura
select altura_m from datos order by altura_m asc limit 1; -- Obtener valor menor
select altura_m from datos order by altura_m desc limit 1; -- Obtener valor mayor

select (select altura_m from datos order by altura_m desc limit 1)-(select altura_m from datos order by altura_m asc limit 1) Rango_Altura;
-- Uitlizando funciones max y min
select max(altura_m) - min(altura_m) Rango_Altura from datos; 

-- Rango Peso
select peso_kg from datos order by peso_kg asc limit 1; -- Obtener valor menor
select peso_kg from datos order by peso_kg desc limit 1; -- Obtener valor mayor

select (select peso_kg from datos order by peso_kg desc limit 1)-(select peso_kg from datos order by peso_kg asc limit 1) Rango_Peso;
-- Uitlizando funciones max y min
select max(peso_kg) - min(peso_kg) Rango_Peso from datos; 

-- Rango IMC
select round(peso_kg/(pow(altura_m,2)), 2) IMC from datos order by IMC asc limit 1;
select round(peso_kg/(pow(altura_m,2)), 2) IMC from datos order by IMC desc limit 1;

select (select peso_kg/(pow(altura_m,2)) IMC from datos order by IMC desc limit 1)-(select peso_kg/(pow(altura_m,2)) IMC from datos order by IMC asc limit 1) Rango_IMC;
-- Uitlizando funciones max y min
select max(IMC) - min(IMC) Rango_IMC from (select peso_kg/(pow(altura_m,2)) IMC from datos) as IMC; 


-- Varianza Poblacional Altura
select sum(pow(altura_m - (select sum(altura_m)/count(*) from datos), 2)) / count(*) as Varianza_Pob from datos;
-- Utilizando funcion de mysql
select var_pop(altura_m) Varianza_Pob from datos; 

-- Varianza Poblacional Peso
select sum(pow(peso_kg - (select sum(peso_kg)/count(*) from datos), 2)) / count(*) as Varianza_Pob from datos;
-- Utilizando funcion de mysql
select var_pop(peso_kg) Varianza_Pob from datos;

-- Varianza Poblacional IMC
select sum(pow(IMC - media_IMC, 2))/count(*) Varianza_Pob from (
	select peso_kg/pow(altura_m, 2) IMC,  -- Obteniendo IMC
    (select sum(peso_kg/(pow(altura_m,2))) / count(*) from datos) media_IMC -- Obteniendo media del IMC
    from datos) res;
 -- Utilizando funcion de mysql
select var_pop(peso_kg/pow(altura_m, 2)) Varianza_Pob from datos;  


-- Varianza Muestral Altura
select sum(pow(altura_m - (select sum(altura_m)/count(*) from datos), 2)) / (count(*)-1) as Varianza_Muestral from datos;
-- Utilizando funcion de mysql
select var_samp(altura_m) Varianza_Muestral from datos; 

-- Varianza Muestral Peso
select sum(pow(peso_kg - (select sum(peso_kg)/count(*) from datos), 2)) / (count(*)-1) as Varianza_Muestral from datos;
-- Utilizando funcion de mysql
select var_samp(peso_kg) Varianza_Muestral from datos; 

-- Varianza Muestral IMC
select sum(pow(IMC - media_IMC, 2))/ (count(*)-1) Varianza_Muestral from (
	select peso_kg/pow(altura_m, 2) IMC,  -- Obteniendo IMC
    (select sum(peso_kg/(pow(altura_m,2))) / count(*) from datos) media_IMC -- Obteniendo media del IMC
    from datos) res;
-- Utilizando funcion de mysql
select var_samp(peso_kg/pow(altura_m, 2)) Varianza_Muestral from datos;   



-- Desviacion Estandar Poblacional Altura
select sqrt(sum(pow(altura_m - (select sum(altura_m)/count(*) from datos), 2)) / count(*)) as DesviacionEstand_Pob from datos;
-- Utilizando funcion de mysql
select stddev_pop(altura_m) DesviacionEstand_Pob from datos; 

-- Desviacion Estandar Poblacional Peso
select sqrt(sum(pow(peso_kg - (select sum(peso_kg)/count(*) from datos), 2)) / count(*)) as DesviacionEstand_Pob from datos;
-- Utilizando funcion de mysql
select stddev_pop(peso_kg) DesviacionEstand_Pob from datos;

-- Desviacion Estandar Poblacional IMC
select sqrt(sum(pow(IMC - media_IMC, 2))/count(*)) DesviacionEstand_Pob from (
	select peso_kg/pow(altura_m, 2) IMC,  -- Obteniendo IMC
    (select sum(peso_kg/(pow(altura_m,2))) / count(*) from datos) media_IMC -- Obteniendo media del IMC
    from datos) res;
-- Utilizando funcion de mysql
select stddev_pop(peso_kg/pow(altura_m, 2)) DesviacionEstand_Pob from datos;


-- Desviacion Estandar Muestral Altura
select sqrt(sum(pow(altura_m - (select sum(altura_m)/count(*) from datos), 2)) / (count(*)-1)) as DesviacionEstand_Muestral from datos;
-- Utilizando funcion de mysql
select stddev_samp(altura_m) DesviacionEstand_Muestral from datos; 

-- Desviacion Estandar Muestral Peso
select sqrt(sum(pow(peso_kg - (select sum(peso_kg)/count(*) from datos), 2)) / (count(*)-1)) as DesviacionEstand_Muestral from datos;
-- Utilizando funcion de mysql
select stddev_samp(peso_kg) DesviacionEstand_Muestral from datos; 

-- Desviacion Estandar Muestral IMC
select sqrt(sum(pow(IMC - media_IMC, 2))/ (count(*)-1)) DesviacionEstand_Muestral from (
	select peso_kg/pow(altura_m, 2) IMC,  -- Obteniendo IMC
    (select sum(peso_kg/(pow(altura_m,2))) / count(*) from datos) media_IMC -- Obteniendo media del IMC
    from datos) res;
-- Utilizando funcion de mysql
select stddev_samp(peso_kg/pow(altura_m, 2)) DesviacionEstand_Muestral from datos;   


-- Coeficiente de correlacion entre altura y peso
select (
	(sum((altura_m-promedio_altura)*(peso_kg-promedio_peso))/count(*)) /
    (
		(sqrt(sum(pow(altura_m-promedio_altura,2))/count(*)))*(sqrt(sum(pow(peso_kg-promedio_peso,2))/count(*)))
    ) 
) as Coeficiente_Correlacion
from (
select 
	altura_m, 
	peso_kg, 
    (select avg(altura_m) from datos) promedio_altura, 
    (select avg(peso_kg) from datos) promedio_peso 
from datos
) as valores;

/*
SELECT 
    (SUM((altura_m - promedio_altura) * (peso_kg - promedio_peso)) / SQRT(SUM(POW(altura_m - promedio_altura, 2)) * SUM(POW(peso_kg - promedio_peso, 2)))) AS coeficiente_correlacion
FROM 
    (SELECT 
        altura_m, 
        peso_kg, 
        (SELECT AVG(altura_m) FROM datos) AS promedio_altura, 
        (SELECT AVG(peso_kg) FROM datos) AS promedio_peso 
    FROM 
        datos) AS subconsulta;
*/