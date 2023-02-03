CREATE SCHEMA `grupal6` ;

CREATE TABLE `grupal6`.`cliente` (
  `rutcliente` TINYINT(9) NOT NULL,
  `nombres` VARCHAR(30) NOT NULL,
  `apellidos` VARCHAR(30) NOT NULL,
  `telefono` VARCHAR(20) NOT NULL,
  `afp` VARCHAR(30) NULL,
  `sistemasalud` TINYINT(2),
  `direccion` VARCHAR(70) NULL,
  `comuna` VARCHAR(50) NULL,
  `edad` TINYINT(3) NOT NULL,
  PRIMARY KEY (`rutcliente`));

CREATE TABLE `grupal6`.`capacitacion` (
  `idcapacitacion` TINYINT(9) NOT NULL,
  `fecha` DATETIME NULL,
  `hora` DATETIME NULL,
  `lugar` VARCHAR(50) NOT NULL,
  `duracion` TINYINT(3) NULL,
  `cantidadasistentes` TINYINT(5) NOT NULL,
  `cliente_rutcliente` TINYINT(9) NOT NULL,
  PRIMARY KEY (`idcapacitacion`));

CREATE TABLE `grupal6`.`accidente` (
  `accidenteid` TINYINT(9) NOT NULL,
  `dia` DATETIME NULL,
  `hora` DATETIME NULL,
  `lugar` VARCHAR(50) NOT NULL,
  `origen` VARCHAR(100) NOT NULL,
  `consecuencias` VARCHAR(100) NOT NULL,
  `cliente_idcliente` TINYINT(9) NOT NULL,
  PRIMARY KEY (`accidenteid`));

CREATE TABLE `grupal6`.`asistentes` (
  `idasistentes` TINYINT(9) NOT NULL,
  `nombres` VARCHAR(100) NOT NULL,
  `edad` TINYINT(3) NOT NULL,
  `capacitacion_idcapacitacion` TINYINT(9) NOT NULL,
  PRIMARY KEY (`idasistentes`));

ALTER TABLE `grupal6`.`capacitacion` 
ADD INDEX `Capacitacion_cliente_FK_idx` (`cliente_rutcliente` ASC) VISIBLE;
ALTER TABLE `grupal6`.`capacitacion` 
ADD CONSTRAINT `Capacitacion_cliente_FK`
  FOREIGN KEY (`cliente_rutcliente`)
  REFERENCES `grupal6`.`cliente` (`rutcliente`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `grupal6`.`accidente` 
ADD INDEX `Accidente_Cliente_fk_idx` (`cliente_idcliente` ASC) VISIBLE;
ALTER TABLE `grupal6`.`accidente` 
ADD CONSTRAINT `Accidente_Cliente_fk`
  FOREIGN KEY (`cliente_idcliente`)
  REFERENCES `grupal6`.`cliente` (`rutcliente`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `grupal6`.`asistentes` 
ADD INDEX `Asistentes_Capacitacion_FK_idx` (`capacitacion_idcapacitacion` ASC) VISIBLE;
ALTER TABLE `grupal6`.`asistentes` 
ADD CONSTRAINT `Asistentes_Capacitacion_FK`
  FOREIGN KEY (`capacitacion_idcapacitacion`)
  REFERENCES `grupal6`.`capacitacion` (`idcapacitacion`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

start transaction;
set autocommit = 0;
set foreign_key_checks = 0;

CREATE TABLE `grupal6`.`visita` (
  `idvisita` TINYINT(9) NOT NULL,
  `visfecha` DATETIME NULL,
  `vishora` DATETIME NOT NULL,
  `vislugar` VARCHAR(50) NOT NULL,
  `viscomentario` VARCHAR(250) NOT NULL,
  `cliente_rutcliente` TINYINT(9) NOT NULL,
  PRIMARY KEY (`idvisita`));

ALTER TABLE `grupal6`.`visita` 
ADD INDEX `Visita_cliente_FK_idx` (`cliente_rutcliente` ASC) VISIBLE;
;
ALTER TABLE `grupal6`.`visita` 
ADD CONSTRAINT `Visita_cliente_FK`
  FOREIGN KEY (`cliente_rutcliente`)
  REFERENCES `grupal6`.`cliente` (`rutcliente`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `grupal6`.`cliente` 
CHANGE COLUMN `nombres` `clinombres` VARCHAR(30) NOT NULL ,
CHANGE COLUMN `apellidos` `cliapellidos` VARCHAR(50) NOT NULL ,
CHANGE COLUMN `telefono` `clitelefono` VARCHAR(20) NOT NULL ,
CHANGE COLUMN `afp` `cliafp` VARCHAR(30) NULL DEFAULT NULL ,
CHANGE COLUMN `sistemasalud` `clisistemasalud` TINYINT(2) NULL DEFAULT NULL ,
CHANGE COLUMN `direccion` `clidireccion` VARCHAR(70) NOT NULL ,
CHANGE COLUMN `comuna` `comuna` VARCHAR(50) NOT NULL ,
CHANGE COLUMN `edad` `cliedad` TINYINT(3) NOT NULL ;

ALTER TABLE `grupal6`.`accidente` 
CHANGE COLUMN `accidenteid` `idaccidente` TINYINT(9) NOT NULL ,
CHANGE COLUMN `dia` `accidia` DATETIME NOT NULL ,
CHANGE COLUMN `hora` `accihora` DATETIME NOT NULL ,
CHANGE COLUMN `lugar` `accilugar` VARCHAR(150) NOT NULL ,
CHANGE COLUMN `origen` `acciorigen` VARCHAR(100) NOT NULL ,
CHANGE COLUMN `consecuencias` `acciconsecuencias` VARCHAR(100) NULL ;

ALTER TABLE `grupal6`.`capacitacion` 
DROP COLUMN `cantidadasistentes`,
CHANGE COLUMN `fecha` `capfecha` DATETIME NOT NULL ,
CHANGE COLUMN `hora` `caphora` DATETIME NULL DEFAULT NULL ,
CHANGE COLUMN `lugar` `caplugar` VARCHAR(50) NOT NULL ,
CHANGE COLUMN `duracion` `capduracion` TINYINT(4) NULL DEFAULT NULL ;

ALTER TABLE `grupal6`.`asistentes` 
ADD COLUMN `asistcorreo` VARCHAR(70) NULL AFTER `asistedad`,
ADD COLUMN `asisttelefono` VARCHAR(20) NULL AFTER `asistcorreo`,
CHANGE COLUMN `nombres` `asistnombrecompleto` VARCHAR(100) NOT NULL ,
CHANGE COLUMN `edad` `asistedad` TINYINT NOT NULL ;

set foreign_key_checks = 1;
rollback; 