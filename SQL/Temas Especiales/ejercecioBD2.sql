create database prueba1;
use prueba1;
create table prueba(
	curp varchar(20) not null
);

insert into prueba values('SASO750909HDFNNS05'),('AABC920415HDFLNN08');
insert into prueba values('SASO750909HDFNNS05'),('AABC920415HDFLNN08');

insert into prueba values('OOVY020223HDFSRLA6');




select 
	(case
		when substring(curp, 17, 1) regexp '^[0-9]$' then concat('19',substring(curp, 5, 2))
		when substring(curp, 17, 1) regexp '^[A-Z]$' then concat('20',substring(curp, 5, 2))
	end) as anio,
	substring(curp, 5, 2) as axo,
    substring(curp, 7, 2) as mes,
    substring(curp, 9, 2) as dia,
    
    concat(
		concat(
			(case
				when substring(curp, 17, 1) regexp '^[0-9]$' then concat('19',substring(curp, 5, 2))
				when substring(curp, 17, 1) regexp '^[A-Z]$' then concat('20',substring(curp, 5, 2))
			end), -- anio
			concat('-',substring(curp, 7, 2)) -- mes
		),
		concat('-',substring(curp, 9, 2)) -- dia
	)
from prueba;






-- Consulta
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
from prueba;