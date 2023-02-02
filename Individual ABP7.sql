/*--- Individual 7 ---*/
START TRANSACTION;
	SET autocommit=1;
    insert into clientes (idcliente, nombres, apellidos) 
	values ('14','Aitor', 'Tilla');
	insert into ventas (idventa, vendedor, cantarticulos, subtotal, impuesto, total, clientes_idcliente) 
	values ('21', 'Marcia Anna', '2', '4000', '800', '4800', '14');
	SET autocommit=0;
    delete from ventas
	where clientes_idcliente = 14;
    rollback;

/*1. Genere una sentencia que permita activar el auto guardado de transacciones en la base de
datos.*/
START TRANSACTION;
	SET autocommit=1;

/*2. Genere dos consultas independientes: una que permita insertar un registro en la tabla de
clientes, y otra que inserte una nueva, asociada al cliente antes registrado.*/
insert into clientes (idcliente, nombres, apellidos) 
values ('14','Aitor', 'Tilla');
insert into ventas (idventa, vendedor, cantarticulos, subtotal, impuesto, total, clientes_idcliente) 
values ('21', 'Marcia Anna', '2', '4000', '800', '4800', '14');
commit;

/*3. Genere una sentencia que permita desactivar el auto guardado de transacciones en la base
de datos.*/
SET autocommit=0;

/*4. Incluya una consulta de eliminación de la venta recién creada.*/
delete from ventas
where clientes_idcliente = 14;
commit;
/*5. Genere una consulta que deshaga todos los cambios antes realizados.*/
rollback;
select * from ventas