/*----------- Grupal 4 -----------------*/
start transaction;
	
	insert into capacitacion (id, rut_cliente, lugar, duracion)
	values
	(16, 11, 'UNAB Sala 725', 35);/*ajustar id segun tabla*/
    
    select * from capacitacion;
    
    set autocommit = 1;
	insert into asistentes (capacitacion_id, edad, nombres, idasistente)
	values
	(16, '25', 'Jorge Nitales',  245009),
	(16, '26', 'Elsa Porrito', 245010);/*ajustar id segun tabla*/
    select * from asistentes;
    
    update capacitacion
	set dia ='Lunes', hora='15:00', num_asistentes=12
	where id = 16; /*ajustar id segun tabla*/
    select * from capacitacion;
   
    delete from asistentes
	where capacitacion_id = 16;/*ajustar id segun tabla*/
    select * from asistentes;
    
	ROLLBACK;
    select * from capacitacion;
    select * from asistentes;

/*1. Genere una consulta que permita insertar un registro en la tabla de capacitaciones,
indicando solo los campos que son obligatorios a la consulta.*/
insert into capacitacion (rut_cliente, lugar, duracion)
values
(11, 'UNAB Sala 725', 35);

/*2. Incluya una sentencia que confirme los cambios incorporados en la sentencia anterior.*/

select * from capacitacion;

/*3. Agregue una consulta o instrucción que habilite el auto guardado de instrucciones para un
total de dos sentencias.*/
set autocommit = 1;

/*4. Agregue dos consultas para insertar un registro en la tabla de asistentes en cada una.
Incluya en la consulta todos los campos de la tabla en orden descendente respecto de cómo
aparece en la definición de la tabla. Asocie estos registros a la capacitación creada en el
ítem 1 de este ejercicio.*/
insert into asistentes (capacitacion_idcapacitacion, edad, nombres, idasistentes)
values
(20, '25', 'Jorge Nitales',  245009),
(20, '26', 'Elsa Porrito', 245009);


/*5. Genere una consulta de actualización del registro insertado en la tabla de capacitaciones,
que permita darles valores a los campos que no fueron considerados en la consulta original.*/
update capacitacion
set dia ='Lunes', hora='15:00', num_asistentes=12
where id = 16; /*ajustar id segun tabla*/
select * from capacitacion;

/*6. Genere una consulta que permita eliminar los asistentes anteriormente ingresados, pero en
una sola consulta.*/
delete from asistentes
where capacitacion_id = 16;/*ajustar id segun tabla*/
select * from asistentes;

/*7. Agregue una consulta para deshacer los cambios realizados*/
rollback;

