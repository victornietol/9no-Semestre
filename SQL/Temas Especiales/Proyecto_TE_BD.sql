-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cine
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `cine` ;

-- -----------------------------------------------------
-- Schema cine
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cine` DEFAULT CHARACTER SET utf8 ;
USE `cine` ;

-- -----------------------------------------------------
-- Table `cine`.`estado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cine`.`estado` ;

CREATE TABLE IF NOT EXISTS `cine`.`estado` (
  `id_estado` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`id_estado`),
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cine`.`delegacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cine`.`delegacion` ;

CREATE TABLE IF NOT EXISTS `cine`.`delegacion` (
  `id_delegacion` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `fk_id_estado` INT NOT NULL,
  PRIMARY KEY (`id_delegacion`),
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE,
  INDEX `fk_delegacion_estado_idx` (`fk_id_estado` ASC) VISIBLE,
  CONSTRAINT `fk_estado_delegacion`
    FOREIGN KEY (`fk_id_estado`)
    REFERENCES `cine`.`estado` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cine`.`direccion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cine`.`direccion` ;

CREATE TABLE IF NOT EXISTS `cine`.`direccion` (
  `id_direccion` INT NOT NULL AUTO_INCREMENT,
  `calle` VARCHAR(100) NOT NULL,
  `numero` VARCHAR(10) NOT NULL,
  `colonia` VARCHAR(100) NOT NULL,
  `codigo_postal` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`id_direccion`),
  UNIQUE INDEX `codigo_postal_UNIQUE` (`codigo_postal` ASC) VISIBLE,
  UNIQUE INDEX `uk_direccion` (`calle` ASC, `numero` ASC, `colonia` ASC, `codigo_postal` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cine`.`sucursal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cine`.`sucursal` ;

CREATE TABLE IF NOT EXISTS `cine`.`sucursal` (
  `id_sucursal` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `fk_direccion` INT NOT NULL,
  `fk_delegacion` INT NOT NULL,
  PRIMARY KEY (`id_sucursal`),
  INDEX `fk_sucursal_direccion_idx` (`fk_direccion` ASC) VISIBLE,
  INDEX `fk_sucursal_delegacion1_idx` (`fk_delegacion` ASC) VISIBLE,
  UNIQUE INDEX `uk_sucursal` (`nombre` ASC, `fk_direccion` ASC, `fk_delegacion` ASC) VISIBLE,
  CONSTRAINT `fk_sucursal_direccion`
    FOREIGN KEY (`fk_direccion`)
    REFERENCES `cine`.`direccion` (`id_direccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sucursal_delegacion`
    FOREIGN KEY (`fk_delegacion`)
    REFERENCES `cine`.`delegacion` (`id_delegacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cine`.`tipo_asiento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cine`.`tipo_asiento` ;

CREATE TABLE IF NOT EXISTS `cine`.`tipo_asiento` (
  `id_tipo_asiento` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`id_tipo_asiento`),
  UNIQUE INDEX `descripcion_UNIQUE` (`descripcion` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cine`.`fila_asiento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cine`.`fila_asiento` ;

CREATE TABLE IF NOT EXISTS `cine`.`fila_asiento` (
  `id_fila` INT NOT NULL AUTO_INCREMENT,
  `fila` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_fila`),
  UNIQUE INDEX `fila_UNIQUE` (`fila` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cine`.`tipo_sala`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cine`.`tipo_sala` ;

CREATE TABLE IF NOT EXISTS `cine`.`tipo_sala` (
  `id_tipo_sala` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_tipo_sala`),
  UNIQUE INDEX `descripcion_UNIQUE` (`descripcion` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cine`.`sala`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cine`.`sala` ;

CREATE TABLE IF NOT EXISTS `cine`.`sala` (
  `id_sala` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `fk_tipo_sala` INT NOT NULL,
  `fk_sucursal` INT NOT NULL,
  PRIMARY KEY (`id_sala`),
  INDEX `fk_sala_tipo_sala1_idx` (`fk_tipo_sala` ASC) VISIBLE,
  INDEX `fk_sala_sucursal1_idx` (`fk_sucursal` ASC) VISIBLE,
  UNIQUE INDEX `uk_sala` (`nombre` ASC, `fk_sucursal` ASC) VISIBLE,
  CONSTRAINT `fk_sala_tipo_sala`
    FOREIGN KEY (`fk_tipo_sala`)
    REFERENCES `cine`.`tipo_sala` (`id_tipo_sala`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sala_sucursal`
    FOREIGN KEY (`fk_sucursal`)
    REFERENCES `cine`.`sucursal` (`id_sucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cine`.`asiento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cine`.`asiento` ;

CREATE TABLE IF NOT EXISTS `cine`.`asiento` (
  `id_asiento` INT NOT NULL AUTO_INCREMENT,
  `numero_asiento` VARCHAR(45) NOT NULL,
  `fk_fila` INT NOT NULL,
  `fk_tipo_asiento` INT NOT NULL,
  `fk_sala` INT NOT NULL,
  PRIMARY KEY (`id_asiento`),
  INDEX `fk_asiento_fila_asiento1_idx` (`fk_fila` ASC) VISIBLE,
  INDEX `fk_asiento_tipo_asiento1_idx` (`fk_tipo_asiento` ASC) VISIBLE,
  INDEX `fk_asiento_sala1_idx` (`fk_sala` ASC) VISIBLE,
  UNIQUE INDEX `uk_asiento` (`numero_asiento` ASC, `fk_fila` ASC, `fk_sala` ASC) VISIBLE,
  CONSTRAINT `fk_asiento_fila`
    FOREIGN KEY (`fk_fila`)
    REFERENCES `cine`.`fila_asiento` (`id_fila`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_asiento_tipo_asiento`
    FOREIGN KEY (`fk_tipo_asiento`)
    REFERENCES `cine`.`tipo_asiento` (`id_tipo_asiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_asiento_sala1`
    FOREIGN KEY (`fk_sala`)
    REFERENCES `cine`.`sala` (`id_sala`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cine`.`pais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cine`.`pais` ;

CREATE TABLE IF NOT EXISTS `cine`.`pais` (
  `id_pais` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `paiscol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_pais`),
  UNIQUE INDEX `paiscol_UNIQUE` (`paiscol` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cine`.`director`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cine`.`director` ;

CREATE TABLE IF NOT EXISTS `cine`.`director` (
  `id_director` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `apellido_pat` VARCHAR(50) NULL,
  `apellido_mat` VARCHAR(50) NULL,
  `fecha_nac` DATE NULL,
  `fk_pais_origen` INT NOT NULL,
  PRIMARY KEY (`id_director`),
  INDEX `fk_director_pais1_idx` (`fk_pais_origen` ASC) VISIBLE,
  UNIQUE INDEX `uk_director` (`nombre` ASC, `apellido_pat` ASC, `apellido_mat` ASC) VISIBLE,
  CONSTRAINT `fk_director_pais1`
    FOREIGN KEY (`fk_pais_origen`)
    REFERENCES `cine`.`pais` (`id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cine`.`actor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cine`.`actor` ;

CREATE TABLE IF NOT EXISTS `cine`.`actor` (
  `id_actor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `apellido_pat` VARCHAR(50) NULL,
  `apellido_mat` VARCHAR(50) NULL,
  `fecha_nac` DATE NULL,
  `fk_pais_origen` INT NOT NULL,
  PRIMARY KEY (`id_actor`),
  INDEX `fk_actor_pais1_idx` (`fk_pais_origen` ASC) VISIBLE,
  UNIQUE INDEX `uk_actor` (`nombre` ASC, `apellido_pat` ASC, `apellido_mat` ASC) VISIBLE,
  CONSTRAINT `fk_actor_pais1`
    FOREIGN KEY (`fk_pais_origen`)
    REFERENCES `cine`.`pais` (`id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cine`.`clasificacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cine`.`clasificacion` ;

CREATE TABLE IF NOT EXISTS `cine`.`clasificacion` (
  `id_clasificacion` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`id_clasificacion`),
  UNIQUE INDEX `tipo_UNIQUE` (`tipo` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cine`.`categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cine`.`categoria` ;

CREATE TABLE IF NOT EXISTS `cine`.`categoria` (
  `id_categoria` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE INDEX `tipo_UNIQUE` (`tipo` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cine`.`pelicula`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cine`.`pelicula` ;

CREATE TABLE IF NOT EXISTS `cine`.`pelicula` (
  `id_pelicula` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `sinopsis` MEDIUMTEXT NOT NULL,
  `duracion_minutos` INT NOT NULL,
  `anio` YEAR NOT NULL,
  `fk_clasificacion` INT NOT NULL,
  `fk_pais` INT NOT NULL,
  PRIMARY KEY (`id_pelicula`),
  INDEX `fk_pelicula_clasificacion1_idx` (`fk_clasificacion` ASC) VISIBLE,
  INDEX `fk_pelicula_pais1_idx` (`fk_pais` ASC) VISIBLE,
  UNIQUE INDEX `uk_pelicula` (`nombre` ASC, `anio` ASC, `fk_pais` ASC, `duracion_minutos` ASC) VISIBLE,
  CONSTRAINT `fk_pelicula_clasificacion1`
    FOREIGN KEY (`fk_clasificacion`)
    REFERENCES `cine`.`clasificacion` (`id_clasificacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pelicula_pais1`
    FOREIGN KEY (`fk_pais`)
    REFERENCES `cine`.`pais` (`id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cine`.`dirige`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cine`.`dirige` ;

CREATE TABLE IF NOT EXISTS `cine`.`dirige` (
  `id_dirige` INT NOT NULL AUTO_INCREMENT,
  `fk_director` INT NOT NULL,
  `fk_pelicula` INT NOT NULL,
  UNIQUE INDEX `id_dirige_UNIQUE` (`id_dirige` ASC) VISIBLE,
  INDEX `fk_dirige_director1_idx` (`fk_director` ASC) VISIBLE,
  INDEX `fk_dirige_pelicula1_idx` (`fk_pelicula` ASC) VISIBLE,
  PRIMARY KEY (`fk_director`, `fk_pelicula`),
  CONSTRAINT `fk_dirige_director1`
    FOREIGN KEY (`fk_director`)
    REFERENCES `cine`.`director` (`id_director`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dirige_pelicula1`
    FOREIGN KEY (`fk_pelicula`)
    REFERENCES `cine`.`pelicula` (`id_pelicula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cine`.`actua`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cine`.`actua` ;

CREATE TABLE IF NOT EXISTS `cine`.`actua` (
  `id_actua` INT NOT NULL AUTO_INCREMENT,
  `fk_actor` INT NOT NULL,
  `fk_pelicula` INT NOT NULL,
  UNIQUE INDEX `id_actua_UNIQUE` (`id_actua` ASC) VISIBLE,
  INDEX `fk_actua_actor1_idx` (`fk_actor` ASC) VISIBLE,
  INDEX `fk_actua_pelicula1_idx` (`fk_pelicula` ASC) VISIBLE,
  PRIMARY KEY (`fk_actor`, `fk_pelicula`),
  CONSTRAINT `fk_actua_actor1`
    FOREIGN KEY (`fk_actor`)
    REFERENCES `cine`.`actor` (`id_actor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_actua_pelicula1`
    FOREIGN KEY (`fk_pelicula`)
    REFERENCES `cine`.`pelicula` (`id_pelicula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cine`.`pelicula_categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cine`.`pelicula_categoria` ;

CREATE TABLE IF NOT EXISTS `cine`.`pelicula_categoria` (
  `id_pel_cat` INT NOT NULL AUTO_INCREMENT,
  `fk_pelicula` INT NOT NULL,
  `fk_categoria` INT NOT NULL,
  UNIQUE INDEX `id_pel_cat_UNIQUE` (`id_pel_cat` ASC) VISIBLE,
  INDEX `fk_pelicula_categoria_pelicula1_idx` (`fk_pelicula` ASC) VISIBLE,
  INDEX `fk_pelicula_categoria_categoria1_idx` (`fk_categoria` ASC) VISIBLE,
  PRIMARY KEY (`fk_pelicula`, `fk_categoria`),
  CONSTRAINT `fk_pelicula_categoria_pelicula1`
    FOREIGN KEY (`fk_pelicula`)
    REFERENCES `cine`.`pelicula` (`id_pelicula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pelicula_categoria_categoria1`
    FOREIGN KEY (`fk_categoria`)
    REFERENCES `cine`.`categoria` (`id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cine`.`idioma`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cine`.`idioma` ;

CREATE TABLE IF NOT EXISTS `cine`.`idioma` (
  `id_idioma` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_idioma`),
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cine`.`tipo_proyeccion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cine`.`tipo_proyeccion` ;

CREATE TABLE IF NOT EXISTS `cine`.`tipo_proyeccion` (
  `id_tipo_proyeccion` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_tipo_proyeccion`),
  UNIQUE INDEX `descripcion_UNIQUE` (`descripcion` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cine`.`funcion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cine`.`funcion` ;

CREATE TABLE IF NOT EXISTS `cine`.`funcion` (
  `id_funcion` INT NOT NULL AUTO_INCREMENT,
  `hora_inicio` TIME NOT NULL,
  `fecha` DATE NOT NULL,
  `subtitulos` VARCHAR(20) NULL,
  `fk_pelicula` INT NOT NULL,
  `fk_idioma` INT NOT NULL,
  `fk_tipo_proyeccion` INT NOT NULL,
  `fk_sala` INT NOT NULL,
  PRIMARY KEY (`id_funcion`),
  INDEX `fk_funcion_pelicula1_idx` (`fk_pelicula` ASC) VISIBLE,
  INDEX `fk_funcion_idioma1_idx` (`fk_idioma` ASC) VISIBLE,
  INDEX `fk_funcion_tipo_proyeccion1_idx` (`fk_tipo_proyeccion` ASC) VISIBLE,
  INDEX `fk_funcion_sala1_idx` (`fk_sala` ASC) VISIBLE,
  UNIQUE INDEX `uk_horario` (`hora_inicio` ASC, `fecha` ASC, `fk_sala` ASC) VISIBLE,
  CONSTRAINT `fk_funcion_pelicula1`
    FOREIGN KEY (`fk_pelicula`)
    REFERENCES `cine`.`pelicula` (`id_pelicula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_funcion_idioma1`
    FOREIGN KEY (`fk_idioma`)
    REFERENCES `cine`.`idioma` (`id_idioma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_funcion_tipo_proyeccion1`
    FOREIGN KEY (`fk_tipo_proyeccion`)
    REFERENCES `cine`.`tipo_proyeccion` (`id_tipo_proyeccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_funcion_sala1`
    FOREIGN KEY (`fk_sala`)
    REFERENCES `cine`.`sala` (`id_sala`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cine`.`tipo_boleto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cine`.`tipo_boleto` ;

CREATE TABLE IF NOT EXISTS `cine`.`tipo_boleto` (
  `id_tipo_boleto` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_tipo_boleto`),
  UNIQUE INDEX `descripcion_UNIQUE` (`descripcion` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cine`.`boleto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cine`.`boleto` ;

CREATE TABLE IF NOT EXISTS `cine`.`boleto` (
  `id_boleto` INT NOT NULL AUTO_INCREMENT,
  `fk_tipo_boleto` INT NOT NULL,
  `fk_funcion` INT NOT NULL,
  `fk_asiento` INT NOT NULL,
  PRIMARY KEY (`id_boleto`),
  INDEX `fk_boleto_tipo_boleto1_idx` (`fk_tipo_boleto` ASC) VISIBLE,
  INDEX `fk_boleto_funcion1_idx` (`fk_funcion` ASC) VISIBLE,
  INDEX `fk_boleto_asiento1_idx` (`fk_asiento` ASC) VISIBLE,
  UNIQUE INDEX `uk_funcion` (`fk_funcion` ASC, `fk_asiento` ASC) VISIBLE,
  CONSTRAINT `fk_boleto_tipo_boleto1`
    FOREIGN KEY (`fk_tipo_boleto`)
    REFERENCES `cine`.`tipo_boleto` (`id_tipo_boleto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_boleto_funcion1`
    FOREIGN KEY (`fk_funcion`)
    REFERENCES `cine`.`funcion` (`id_funcion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_boleto_asiento1`
    FOREIGN KEY (`fk_asiento`)
    REFERENCES `cine`.`asiento` (`id_asiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cine`.`tipo_cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cine`.`tipo_cliente` ;

CREATE TABLE IF NOT EXISTS `cine`.`tipo_cliente` (
  `id_tipo_cliente` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_tipo_cliente`),
  UNIQUE INDEX `descripcion_UNIQUE` (`descripcion` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cine`.`cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cine`.`cliente` ;

CREATE TABLE IF NOT EXISTS `cine`.`cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `apellido_pat` VARCHAR(50) NOT NULL,
  `apellido_mat` VARCHAR(50) NOT NULL,
  `fecha_nac` DATE NOT NULL,
  `fk_direccion` INT NOT NULL,
  `fk_tipo_cliente` INT NOT NULL,
  `esta_activo` INT NOT NULL DEFAULT 1 COMMENT '1 = Activo, 0 = No activo',
  PRIMARY KEY (`id_cliente`),
  INDEX `fk_cliente_direccion1_idx` (`fk_direccion` ASC) VISIBLE,
  INDEX `fk_cliente_tipo_cliente1_idx` (`fk_tipo_cliente` ASC) VISIBLE,
  UNIQUE INDEX `uk_cliente` (`nombre` ASC, `apellido_pat` ASC, `apellido_mat` ASC, `fk_direccion` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_direccion1`
    FOREIGN KEY (`fk_direccion`)
    REFERENCES `cine`.`direccion` (`id_direccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_tipo_cliente1`
    FOREIGN KEY (`fk_tipo_cliente`)
    REFERENCES `cine`.`tipo_cliente` (`id_tipo_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cine`.`compras_boletos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cine`.`compras_boletos` ;

CREATE TABLE IF NOT EXISTS `cine`.`compras_boletos` (
  `id_compra` INT NOT NULL AUTO_INCREMENT,
  `importe` DECIMAL(10,2) NOT NULL,
  `fecha` TIMESTAMP NOT NULL,
  `fk_cliente` INT NOT NULL,
  `fk_boleto` INT NOT NULL,
  PRIMARY KEY (`id_compra`),
  INDEX `fk_compras_boletos_cliente1_idx` (`fk_cliente` ASC) VISIBLE,
  INDEX `fk_compras_boletos_boleto1_idx` (`fk_boleto` ASC) VISIBLE,
  UNIQUE INDEX `uk_compra` (`fk_cliente` ASC, `fk_boleto` ASC) VISIBLE,
  CONSTRAINT `fk_compras_boletos_cliente1`
    FOREIGN KEY (`fk_cliente`)
    REFERENCES `cine`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_compras_boletos_boleto1`
    FOREIGN KEY (`fk_boleto`)
    REFERENCES `cine`.`boleto` (`id_boleto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
