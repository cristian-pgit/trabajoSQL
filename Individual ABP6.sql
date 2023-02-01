/*--- Individual 6 ---*/
start transaction;
	set autocommit = 0;
	set foreign_key_checks = 0;

	insert into clientes (idcliente, nombres, apellidos) 
	values ('13','Armando', 'Bulla');

	insert into ventas (idventa, cantarticulos, subtotal, impuesto, total, clientes_idcliente) 
	values ('12', '2', '2000', '400', '2400', '13');
	insert into ventas (idventa, vendedor, cantarticulos, subtotal, impuesto, total, clientes_idcliente) 
	values ('13', 'Elsa Capuntas', '5', '5000', '1000', '6000', '13');

	SELECT * FROM clientes;
	SELECT * FROM ventas;

	UPDATE clientes SET direccion = 'Estadio Nacional N100', telefono = '666999666' WHERE idcliente = '13';

	set foreign_key_checks = 1;
	select * from ventas;
	select * from clientes;
	rollback; 
	select * from ventas;
	select * from clientes;
    set autocommit = 1;

/*1.- Genere una consulta de inserción de datos en la tabla clientes. Inserte un registro indicando
solo los campos que no permiten valores nulos.*/
start transaction;
set autocommit = 0;
set foreign_key_checks = 0;

insert into clientes (idcliente, nombres, apellidos) 
values ('13','Armando', 'Bulla');

/*2. Genere dos consultas de inserción de datos en la tabla de ventas. Inserte dos registros
distintos de esta manera, usando dos sintaxis diversas. Ambas ventas ingresadas deben
estar asociadas al cliente ingresado en el ítem anterior.*/
insert into ventas (idventa, cantarticulos, subtotal, impuesto, total, clientes_idcliente) 
values ('12', '2', '2000', '400', '2400', '13');
insert into ventas (idventa, vendedor, cantarticulos, subtotal, impuesto, total, clientes_idcliente) 
values ('13', 'Elsa Capuntas', '5', '5000', '1000', '6000', '13');

/*3. Incluya un comando para confirmar los cambios incluidos en las sentencias anteriores */
SELECT * FROM clientes;
SELECT * FROM ventas;

/*4. Genere una consulta que modifique el registro ingresado en el ítem 1 de este ejercicio, en
específico otorgando valores a los campos que están nulos.*/
UPDATE clientes SET direccion = 'Estadio Nacional N100', telefono = '666999666' WHERE idcliente = '13';

/*5. Incluya un comando para deshacer los cambios realizados anteriormente.*/
set foreign_key_checks = 1;
select * from ventas;
select * from clientes;
rollback; 
select * from ventas;
select * from clientes;
set autocommit = 1;
