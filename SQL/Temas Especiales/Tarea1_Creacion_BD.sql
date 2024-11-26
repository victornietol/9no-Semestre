-- Insercion de todos los datos juntos
create database te_tarea1;
use te_tarea1;

create table clientes(
	id int not null auto_increment,
    rfc varchar(13) not null,
    tipo_persona varchar(20) not null,
    primary key (id)
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\datos_tarea1.csv' 
INTO TABLE clientes
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from clientes where tipo_persona = 'fisica';

