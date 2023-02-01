DROP PROCEDURE IF EXISTS individual.insertNotNull_EJ61;
DELIMITER $$
CREATE PROCEDURE insertNotNull_EJ61 (nombre varchar(50), apellido varchar(50))
BEGIN
	START TRANSACTION;
		SET autocommit=0;
		insert into clientes (nombres, apellidos) values (nombre, apellido);
	COMMIT;
END
$$
	