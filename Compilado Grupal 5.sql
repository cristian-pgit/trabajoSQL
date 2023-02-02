/*1. Genere un set de consultas que permitan crear las tablas indicadas en el modelo. Tenga en
consideración las llaves primarias, los tipos de dato indicados y las condiciones de nulidad.*/
CREATE TABLE `grupal`.`cliente` (
  `rutcliente` TINYINT(9) NOT NULL,
  `nombres` VARCHAR(30) NOT NULL,
  `apellidos` VARCHAR(30) NOT NULL,
  `telefono` VARCHAR(20) NOT NULL DEFAULT '000000000',
  `afp` VARCHAR(30) NULL DEFAULT 'Fonasa',
  `sistemasalud` TINYINT(2) NULL DEFAULT 0,
  `direccion` VARCHAR(70) NULL,
  `comuna` VARCHAR(50) NULL,
  `edad` TINYINT(3) NOT NULL,
  PRIMARY KEY (`rutcliente`));
  
  CREATE TABLE `grupal`.`capacitacion` (
  `idcapacitacion` TINYINT(9) NOT NULL,
  `fecha` DATETIME NULL,
  `hora` DATETIME NULL,
  `lugar` VARCHAR(50) NOT NULL,
  `duracion` TINYINT(3) NULL,
  `cantidadasistentes` TINYINT(5) NOT NULL,
  `cliente_rutcliente` TINYINT(9) NOT NULL,
  PRIMARY KEY (`idcapacitacion`));
  
  CREATE TABLE `grupal`.`accidente` (
  `accidenteid` TINYINT(9) NOT NULL,
  `nombres` VARCHAR(100) NOT NULL,
  `edad` TINYINT(3) NOT NULL,
  `capacitacion_idcapacitacion` TINYINT(9) NOT NULL,
  PRIMARY KEY (`accidenteid`));
  
  CREATE TABLE `grupal`.`asistentes` (
  `idasistentes` TINYINT(9) NOT NULL,
  `nombres` VARCHAR(100) NOT NULL,
  `edad` TINYINT(3) NOT NULL,
  `capacitacion_idcapacitacion` TINYINT(9) NOT NULL,
  PRIMARY KEY (`idasistentes`));
  
/*2. Desarrolle consultas que permitan crear las llaves foráneas antes indicadas, respetando el
sentido lógico de su creación.*/
ALTER TABLE `grupal`.`capacitacion` 
ADD INDEX `Capacitacion_Cliente_FK_idx` (`cliente_rutcliente` ASC) VISIBLE;
;
ALTER TABLE `grupal`.`capacitacion` 
ADD CONSTRAINT `Capacitacion_Cliente_FK`
  FOREIGN KEY (`cliente_rutcliente`)
  REFERENCES `grupal`.`cliente` (`rutcliente`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE `grupal`.`accidente` 
ADD INDEX `Cliente_Accidente_FK_idx` (`cliente_rutcliente` ASC) VISIBLE;
;
ALTER TABLE `grupal`.`accidente` 
ADD CONSTRAINT `Cliente_Accidente_FK`
  FOREIGN KEY (`cliente_rutcliente`)
  REFERENCES `abpro5`.`cliente` (`rutcliente`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE `grupal`.`asistentes` 
ADD INDEX `Asistentes_Capacitacion_FK_idx` (`capacitacion_idcapacitacion` ASC) VISIBLE;
;
ALTER TABLE `grupal`.`asistentes` 
ADD CONSTRAINT `Asistentes_Capacitacion_FK`
  FOREIGN KEY (`capacitacion_idcapacitacion`)
  REFERENCES `grupal`.`capacitacion` (`idcapacitacion`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


/*3. Genere una consulta que permita crear una restricción de valor único sobre el campo
“telefono” de la tabla Cliente.*/
ALTER TABLE `abpro5`.`cliente` 
ADD UNIQUE INDEX `telefono_UNIQUE` (`telefono` ASC) VISIBLE;
;

/*4. Genere una consulta que permita restringir los valores posibles del campo sistemasalud de
la tabla Cliente al conjunto {1,2}.*/
DROP TRIGGER IF EXISTS abpro5.sistemasalud_t;
DELIMITER $$
CREATE TRIGGER sistemasalud_t
before insert
ON cliente FOR EACH ROW BEGIN
	if (new.sistemasalud != (1 or 2)) then
    signal SQLSTATE '45000'
    set message_text = 'Valor no corresponde: sistema salud solo admite 1 o 2';
    END IF;
END;
$$
DELIMITER ;

/*5. Genere las consultas para insertar cuatro registros en la tabla Cliente, y consultas para
insertar siete registros en la tabla Accidente, asociados a los clientes recién ingresados. */
insert into cliente (rutcliente, nombres, apellidos, telefono, afp, sistemasalud, direccion, comuna, edad)
values
('11', 'Perico','Lospalotes', 111222111, 'Provida', 1, 'GranEstafa','Santiasco',21),
('12', 'Lola','Mento', 111222333, 'Modelo', 1, 'A Mares n800','Puente Asalto',19),
('13', 'Elsa','Capuntas', 111222444, 'Cuprum', 2, 'GranEstafa','Nunoa',23),
('14', 'Florencio','FloresdelCampo', 111222555, 'Habitat', 2, 'Campo Lindo n900','Graneros',41);
INSERT INTO `grupal`.`accidente` (`accidenteid`, `nombres`, `edad`, `cliente_rutcliente`) VALUES 
('1', 'Perico', '21', '11'),
('2', 'Lola', '19', '12'),
('3', 'Elsa', '23', '13'),
('4', 'Perico', '21', '11'),
('5', 'Elsa', '23', '13'),
('6', 'Florencio', '41', '14'),
('7', 'Perico', '18', '11');


