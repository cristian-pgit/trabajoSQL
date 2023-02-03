/*---Transaccion----*/
START TRANSACTION;
	ALTER TABLE `individual`.`producto` 
	ADD UNIQUE INDEX `nombreprod_UNIQUE` (`nombreprod` ASC) VISIBLE;
	;
    SET FOREIGN_KEY_CHECKS = 0;
	ALTER TABLE `individual`.`producto` 
	CHANGE COLUMN `idproducto` `idproducto` INT NOT NULL AUTO_INCREMENT ;
	SET FOREIGN_KEY_CHECKS = 1;
    
    insert into producto (nombreprod, valor) 
	values
	('Super8', 300);
    
    insert into producto (nombreprod) 
	values
	('Chokita'),
	('Chocman'),
	('Chocolito');
    
	insert into detalleventa (ventas_idventa, producto_idproducto, cantidad) 
	values
	(1,29,20),
	(2,30,21),
	(3,31,22),
	(4,32,23),
	(5,29,20),
	(6,30,21),
	(7,31,22),
	(8,32,23);
    
    commit;

/*1. Genere una restricción de tipo única para el campo nombreprod de la tabla producto.*/
ALTER TABLE `individual`.`producto` 
ADD UNIQUE INDEX `nombreprod_UNIQUE` (`nombreprod` ASC) VISIBLE;
;

/*2. Genere las consultas para convertir el campo idproducto en un campo de tipo
autoincremental.*/
SET FOREIGN_KEY_CHECKS = 0;
ALTER TABLE `individual`.`producto` 
CHANGE COLUMN `idproducto` `idproducto` INT NOT NULL AUTO_INCREMENT ;
SET FOREIGN_KEY_CHECKS = 1;

/*3. Genere las consultas para insertar cuatro productos en la base de datos. Recuerde hacer
uso de la secuencia.*/
/*---Primer insert para hacer referencia */
insert into producto (nombreprod, valor) 
values
('Super8', 300);
/*---Trigger para hacer secuencia */
DROP TRIGGER IF EXISTS individual.incrementproduct;
DELIMITER $$
CREATE TRIGGER incrementproduct
before insert
ON producto FOR EACH ROW BEGIN
	SET NEW.valor = (select max(valor)+1000 from producto);
    
END;
$$
DELIMITER ;
/*---insercion de lineas */
insert into producto (nombreprod) 
values
('Chokita'),
('Chocman'),
('Chocolito');

/*4. Genere las consultas para insertar ocho registros en la tabla detalleventa.*/
insert into detalleventa (ventas_idventa, producto_idproducto, cantidad) 
values
(1,29,20),
(2,30,21),
(3,31,22),
(4,32,23),
(5,29,20),
(6,30,21),
(7,31,22),
(8,32,23);

/*5. Finalmente, incluya una sentencia de confirmación de la acción.*/
commit;