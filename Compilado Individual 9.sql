ALTER TABLE `individual`.`producto` 
ADD COLUMN `categoria_idcategoria` TINYINT(6) NOT NULL AFTER `valor`;

ALTER TABLE `individual`.`producto` 
ADD CONSTRAINT `producto_categoria_FK`
  FOREIGN KEY (`categoria_idcategoria`)
  REFERENCES `individual`.`categoria` (`idcategoria`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
