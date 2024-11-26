-- PRACTICA 2

USE practica2_mineriadatos;

select * from practica2 where pais = 'chile' or pais = 'santa lucía';
select count(*), continente from practica2 group by continente;

select * from practica2 where continente = 'america';
select * from practica2 where continente = 'africa';
select * from practica2 where continente = 'america';
select * from practica2 where continente = 'europa';
select * from practica2 where continente = 'oceania';

-- 1)
select continente, SUM(oro) Oro, SUM(plata) Plata, SUM(Bronce) Bronce from practica2
group by continente
order by Oro desc, Plata desc, Bronce desc, SUM(atletas) asc;

-- 2)
select pais Pais, round(ifnull(habitantes/oro, 0), 2)  Habitantes_por_oro from practica2
order by Habitantes_por_oro desc;

-- 3)
select pais Pais, round(ifnull(habitantes/plata, 0), 2)  Habitantes_por_plata from practica2
order by Habitantes_por_plata desc;

-- 4)
select pais Pais, round(ifnull(habitantes/bronce, 0), 2)  Habitantes_por_bronce from practica2
order by Habitantes_por_bronce desc;

-- 5) 
select pais Pais, (oro+plata+bronce) Medallas, round(ifnull(habitantes/(oro+plata+bronce), 0), 2) Habitantes_por_medalla from practica2
order by Habitantes_por_medalla desc;

-- 6)
select row_number() over (order by oro desc, plata desc, bronce desc, atletas asc) Lugar, pais Pais, oro Oro, plata Plata, bronce Bronce 
from practica2
where continente = 'AMERICA' and pais <>'Estados Unidos de América - USA'
order by oro desc, plata desc, bronce desc, atletas asc;

-- 7)
select pais Pais, round(ifnull((((oro+plata+bronce)*100)/atletas), 0), 2) Porcentaje_medallas 
from practica2
where ifnull((((oro+plata+bronce)*100)/atletas), 0) <> 0
order by Porcentaje_medallas desc;

-- 8) Crear nueva tabla y carga de datos de los paises del mundo
create table paises_mundo(
	continente varchar(70),
    pais varchar(70)
);
insert into paises_mundo values ('EUROPA','Albania'),('EUROPA','Alemania'),('EUROPA','Andorra'),('EUROPA','Armenia'),('EUROPA','Austria'),('EUROPA','Azerbaiyán'),('EUROPA','Bélgica'),('EUROPA','Bielorrusia'),('EUROPA','Bosnia y Herzegovina'),('EUROPA','Bulgaria'),('EUROPA','Chipre'),('EUROPA','Ciudad del Vaticano'),('EUROPA','Croacia'),('EUROPA','Dinamarca'),('EUROPA','Eslovaquia'),('EUROPA','Eslovenia'),('EUROPA','España'),('EUROPA','Estonia'),('EUROPA','Finlandia'),('EUROPA','Francia'),('EUROPA','Georgia'),('EUROPA','Grecia'),('EUROPA','Hungría'),('EUROPA','Irlanda'),('EUROPA','Islandia'),('EUROPA','Italia'),('EUROPA','Kazajistán'),('EUROPA','Letonia'),('EUROPA','Liechtenstein'),('EUROPA','Lituania'),('EUROPA','Luxemburgo'),('EUROPA','Macedonia del Norte'),('EUROPA','Malta'),('EUROPA','Moldavia'),('EUROPA','Mónaco'),('EUROPA','Montenegro'),('EUROPA','Noruega'),('EUROPA','Países Bajos'),('EUROPA','Polonia'),('EUROPA','Portugal'),('EUROPA','Gran Bretaña'),('EUROPA','República Checa'),('EUROPA','Rumanía'),('EUROPA','San Marino'),('EUROPA','Serbia'),('EUROPA','Suecia'),('EUROPA','Suiza'),('EUROPA','Turquía'),('EUROPA','Ucrania'),('AMERICA','Antigua y Barbuda'),('AMERICA','Argentina'),('AMERICA','Bahamas'),('AMERICA','Barbados'),('AMERICA','Belice'),('AMERICA','Bolivia'),('AMERICA','Brasil'),('AMERICA','Canadá'),('AMERICA','Chile'),('AMERICA','Colombia'),('AMERICA','Costa Rica'),('AMERICA','Cuba'),('AMERICA','Dominica'),('AMERICA','Ecuador'),('AMERICA','El Salvador'),('AMERICA','Estados Unidos de América - USA'),('AMERICA','Granada'),('AMERICA','Guatemala'),('AMERICA','Guyana'),('AMERICA','Haití'),('AMERICA','Honduras'),('AMERICA','Jamaica'),('AMERICA','México'),('AMERICA','Nicaragua'),('AMERICA','Panamá'),('AMERICA','Paraguay'),('AMERICA','Perú'),('AMERICA','República Dominicana'),('AMERICA','San Cristóbal y Nieves'),('AMERICA','San Vicente y las Granadinas'),('AMERICA','Santa Lucía'),('AMERICA','Surinam'),('AMERICA','Trinidad y Tobago'),('AMERICA','Uruguay'),('AMERICA','Venezuela'),('ASIA','Afganistán'),('ASIA','Arabia Saudita'),('ASIA','Armenia'),('ASIA','Azerbaiyán'),('ASIA','Bangladés'),('ASIA','Baréin'),('ASIA','Birmania / Myanmar'),('ASIA','Brunéi'),('ASIA','Bután'),('ASIA','Camboya'),('ASIA','Catar'),('ASIA','China Taipéi'),('ASIA','Chipre'),('ASIA','Corea del Norte'),('ASIA','Corea del Sur'),('ASIA','Emiratos Árabes Unidos'),('ASIA','Filipinas'),('ASIA','Georgia'),('ASIA','India'),('ASIA','Indonesia'),('ASIA','Irak'),('ASIA','Irán'),('ASIA','Israel'),('ASIA','Japón'),('ASIA','Jordania'),('ASIA','Kazajistán'),('ASIA','Kirguistán'),('ASIA','Kuwait'),('ASIA','Laos'),('ASIA','Líbano'),('ASIA','Malasia'),('ASIA','Maldivas'),('ASIA','Mongolia'),('ASIA','Nepal'),('ASIA','Omán'),('ASIA','Pakistán'),('ASIA','Rusia'),('ASIA','Singapur'),('ASIA','Siria'),('ASIA','Sri Lanka'),('ASIA','Tailandia'),('ASIA','Tayikistán'),('ASIA','Timor Oriental'),('ASIA','Turkmenistán'),('ASIA','Turquía'),('ASIA','Uzbekistán'),('ASIA','Vietnam'),('ASIA','Yemen'),('AFRICA','Angola'),('AFRICA','Argelia'),('AFRICA','Benín'),('AFRICA','Botsuana'),('AFRICA','Burkina Faso'),('AFRICA','Burundi'),('AFRICA','Cabo Verde'),('AFRICA','Camerún'),('AFRICA','Chad'),('AFRICA','Comoras - COM'),('AFRICA','Costa de Marfil'),('AFRICA','Egipto'),('AFRICA','Eritrea'),('AFRICA','Etiopía'),('AFRICA','Gabón'),('AFRICA','Gambia'),('AFRICA','Ghana'),('AFRICA','Guinea'),('AFRICA','Guinea-Bisáu'),('AFRICA','Guinea Ecuatorial'),('AFRICA','Kenia'),('AFRICA','Lesoto'),('AFRICA','Liberia'),('AFRICA','Libia'),('AFRICA','Madagascar'),('AFRICA','Malaui'),('AFRICA','Malí'),('AFRICA','Marruecos'),('AFRICA','Mauricio'),('AFRICA','Mauritania'),('AFRICA','Mozambique'),('AFRICA','Namibia'),('AFRICA','Níger'),('AFRICA','Nigeria'),('AFRICA','República Centroafricana'),('AFRICA','Congo'),('AFRICA','República Democrática del Congo'),('AFRICA','Ruanda'),('AFRICA','Santo Tomé y Príncipe'),('AFRICA','Senegal'),('AFRICA','Seychelles'),('AFRICA','Sierra Leona'),('AFRICA','Somalia'),('AFRICA','Suazilandia'),('AFRICA','Sudáfrica'),('AFRICA','Sudán'),('AFRICA','Sudán del Sur'),('AFRICA','Tanzania'),('AFRICA','Togo'),('AFRICA','Túnez'),('AFRICA','Uganda'),('AFRICA','Yibuti'),('AFRICA','Zambia'),('AFRICA','Zimbabue'),('OCEANIA','Australia'),('OCEANIA','Fiji'),('OCEANIA','Islas Marshall'),('OCEANIA','Islas Salomón'),('OCEANIA','Kiribati'),('OCEANIA','Estados Federados de Micronesia'),('OCEANIA','Nauru'),('OCEANIA','Nueva Zelanda'),('OCEANIA','Palau o Palaos'),('OCEANIA','Papúa Nueva Guinea'),('OCEANIA','Samoa'),('OCEANIA','Tonga'),('OCEANIA','Tuvalu'),('OCEANIA','Vanuatu');

-- Obteniendo lista de paises que no asistieron por continente 
select * from paises_mundo where pais not in(select pais from practica2) and continente = 'AMERICA'
union
select * from paises_mundo where pais not in(select pais from practica2) and continente = 'ASIA'
union
select * from paises_mundo where pais not in(select pais from practica2) and continente = 'EUROPA'
union
select * from paises_mundo where pais not in(select pais from practica2) and continente = 'AFRICA'
union
select * from paises_mundo where pais not in(select pais from practica2) and continente = 'OCEANIA';

-- 9) Ordenar los paises dependiendo del porcentaje de atletas que tienen respecto a su cantidad de habitantes
select pais Pais, atletas Atletas, habitantes Habitantes, round(ifnull(((atletas*100)/habitantes), 0), 6) Porcentaje_atletas from practica2
order by Porcentaje_atletas desc;

-- 10) Obtener que porcentaje representan las medallas de oro, plata y bronce por disciplina en las medallas totales de Estados Unidos
create table medallero_usa(
	disciplina varchar(50) not null,
    oro int not null,
    plata int not null,
    bronce int not null
);
insert into medallero_usa values ('Atletismo',14,11,9),('Baloncesto',2,0,0),('Baloncesto 3x3',0,0,1),('Boxeo',0,0,1),('Breaking',0,0,1),('Ciclismo BMX freestyle',0,1,0),('Ciclismo de montaña',0,1,0),('Ciclismo en pista',2,0,0),('Ciciismo en ruta',1,0,1),('Escalada deportiva',0,1,1),('Esgrima',2,1,1),('Futbol',1,0,0),('Gimnasía artística',3,1,5),('Golf',1,0,0),('Halterofilia',1,0,1),('Hípica',0,1,0),('Lucha',2,2,3),('Natación',8,13,7),('Natación artística',0,1,0),('Piragüismo eslalon',0,0,1),('Piragüismo esprint',0,1,0),('Remo',1,0,1),('Rugby 7',0,0,1),('Saltos',0,1,0),('Skateboarding',0,2,1),('Surf',1,0,0),('Taekwondo',0,0,1),('Tenis',0,1,1),('Tiro',1,3,1),('Tiro con arco',0,1,1),('Triatlón',0,1,0),('Vela',0,0,1),('Voleibol',0,1,1),('Waterpolo',0,0,1);

select medallero.disciplina Disciplina, medallero.oro Oro, round(ifnull(((medallero.oro*100)/(select (oro+plata+bronce) from practica2 where pais = 'Estados Unidos de América - USA')), 0), 2) Porcentaje_Oro,
medallero.plata Plata, round(ifnull(((medallero.plata*100)/(select (oro+plata+bronce) from practica2 where pais = 'Estados Unidos de América - USA')), 0), 2) Porcentaje_Plata,
medallero.bronce Bronce, round(ifnull(((medallero.bronce*100)/(select (oro+plata+bronce) from practica2 where pais = 'Estados Unidos de América - USA')), 0), 2) Porcentaje_Bronce
from medallero_usa medallero
order by Porcentaje_Oro desc, Porcentaje_Plata desc, Porcentaje_Bronce desc;