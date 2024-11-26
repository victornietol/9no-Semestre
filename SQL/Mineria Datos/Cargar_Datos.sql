CREATE DATABASE IF NOT EXISTS Practica2_MineriaDatos;
USE Practica2_MineriaDatos;

DROP TABLE practica2;
CREATE TABLE IF NOT EXISTS practica2(
    pais VARCHAR(70) NOT NULL,
    atletas INT NOT NULL,
    oro INT NOT NULL,
    plata INT NOT NULL,
    bronce INT NOT NULL,
    continente VARCHAR(50) NOT NULL,
    habitantes BIGINT NOT NULL
);

-- Activando local_infile
SHOW GLOBAL VARIABLES LIKE 'local_infile'; -- Debe estar en ON
SET GLOBAL local_infile = true;
SHOW VARIABLES LIKE 'secure_file_priv'; -- Verificar ruta que permite cargar archivos

-- Cargando archivos csv
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Equipo2.csv' 
INTO TABLE practica2
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Equipo3.csv' 
INTO TABLE practica2
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Equipo4.csv' 
INTO TABLE practica2
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Equipo5.csv' 
INTO TABLE practica2
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Insercion de todos los datos juntos
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\DatosPractica2.csv' 
INTO TABLE practica2
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Leer registros
SELECT * FROM practica2 order by pais desc;
select count(*) from practica2 group by pais; -- Ver si hay paises repetidos