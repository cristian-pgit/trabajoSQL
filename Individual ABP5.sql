/*1. Desarrolle una consulta que permita generar una secuencia para el campo idcliente de la
tabla clientes. Junto con ello, debe crear un trigger o disparador que, al momento de
insertar un registro, asigne de manera automática el identificador a la tabla.*/

DELIMITER $$
CREATE TRIGGER next_id
before insert
ON clientes FOR EACH ROW BEGIN
	SET new.idcliente = (select max(idcliente)+1 from clientes);
END;
$$
DELIMITER ;

/*2. Genere dos consultas de inserción de registros en la tabla clientes, sin indicar el
identificador de clientes en ella.*/

insert into clientes (nombres, apellidos, direccion, telefono)
values
('Elsa', 'Capuntas', 'Mina Nº10', 000000005),
('Lola', 'Mento', 'Valle Los Lamentos nº100', 000000006);

/*3. Genere una consulta que añada una restricción por chequeo de control de valores en la
tabla ventas al campo cantarticulos, dando opción a que este sea solo un valor entre 1 y 5
(sólo números enteros).*/

DELIMITER $$
CREATE TRIGGER cantarticulos_solo_1a5
before insert
ON ventas FOR EACH ROW BEGIN
	if (new.cantarticulos >5) then
    signal SQLSTATE '45000'
    set message_text = 'Cantidad superior a 5';
    END IF;
END;
$$
DELIMITER ;

insert into ventas (vendedor, cantarticulos, subtotal, impuesto, total, clientes_idcliente)
values
('Elsa Capuntas', 11, 30000, 6000, 12600, 1);