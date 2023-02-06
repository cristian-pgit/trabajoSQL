CREATE TABLE `indiv12`.`cliente` (
  `id_cliente` INT(9) NOT NULL,
  `nombres` VARCHAR(50) NOT NULL,
  `apellidos` VARCHAR(50) NOT NULL,
  `direccion` VARCHAR(70) NULL,
  `telefono` INT NULL,
  PRIMARY KEY (`id_cliente`));