create database ejercicio_tebd;
use ejercicio_tebd;
create table datos(
	curp varchar(20) not null
);

insert into datos values('SASO750909HDFNNS05'),('AABC920415HDFLNN08'),('OOVY020223HDFSRLA6');


-- CURPS
-- SASO750909HDFNNS05
-- AABC920415HDFLNN08
-- OOVY020223HDFSRLA6

-- EDADES DE LOS CURPS
-- 49
-- 32
-- 22

-- CONSULTA
select
	timestampdiff(year,
		str_to_date(
			concat(
				concat(
					(case
						when substring(curp, 17, 1) regexp '^[0-9]$' then concat('19',substring(curp, 5, 2))
						when substring(curp, 17, 1) regexp '^[A-Z]$' then concat('20',substring(curp, 5, 2))
					end), -- anio
					concat('-',substring(curp, 7, 2)) -- mes
				),
				concat('-',substring(curp, 9, 2)) -- dia
			),
			'%Y-%m-%d'
		), -- fecha de nacimiento
		curdate() -- fecha actual
	) as edad
from datos;