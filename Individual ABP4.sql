/*1. Genere tres consultas de inserción de clientes; en las primeras dos deben ir incorporados
todos los datos, mientras que la restante debe estar considerado solo el identificador de
cliente, nombres y apellidos*/
insert into clientes (idcliente, nombres, apellidos, direccion, telefono)
values
(1, 'Zoila', 'Vaca', 'Pastoreando n 1234', 000000000),
(2, 'Mario', 'Neta', 'Teatro Ventrilocuo n70', 000000001);
insert into clientes (idcliente, nombres, apellidos)
values
(3, 'Benito', 'Camelo');

/*2. Genere cinco consultas de inserción de registros en la tabla ventas. No se pide un formato
específico de consulta de inserción. Estas ventas deben estar asociadas lógicamente a
alguno de los clientes antes creados*/
insert into ventas (vendedor, cantarticulos, subtotal, impuesto, total, clientes_idcliente)
values
('Elsa Capuntas', 10, 10500, 2100, 12600, 1),
('Marcia Anna', 20, 20000, 4000, 24000, 2),
('Elsa Capuntas', 2, 5000, 1000, 6000, 3),
('Elsa Capuntas', 1, 37000, 7400, 44400, 2),
('Marcia Anna', 5, 100000, 20000, 120000, 3);


/*3. Genere una consulta que permita actualizar el campo total de la tabla ventas, igualándolo
a la suma del subtotal y el impuesto.*/
UPDATE ventas
SET total = (subtotal + impuesto)
WHERE total != (subtotal + impuesto);


/*4. Finalmente, genere una consulta en la que se elimine un cliente a través de su identificador
(idcliente), y posterior a eso otra consulta que elimine todas las ventas asociadas a dicho
cliente (siempre de acuerdo con el campo idcliente).*/
/*primera forma -- Notas: */
delete from ventas
where clientes_idcliente = 3;
delete from clientes
where idcliente = 3;

/*segunda forma --- Nota: Alterar la restriccion en la FK para que ON DELETE sea 'CASCADE' 
y al borrar cliente, borrara las ventas asociadas tambien*/

delete from clientes
where idcliente = 3;

/*tercera forma -- Notas: factiblemente el deshabilitar la FK pone en riesgo la 
integridad de la BD por lo cual esta no seria una solucion recomendable */

SET FOREIGN_KEY_CHECKS = 0;
delete from ventas
where clientes_idcliente = 3;
delete from clientes
where idcliente = 3;
SET FOREIGN_KEY_CHECKS = 1;
