/*1. Haga las consultas necesarias para convertir las llaves primarias de cada tabla en campos
autonuméricos. /// ok */
ALTER TABLE `capacitacion`.`asistentes` 
CHANGE COLUMN `idasistentes` `idasistentes` INT NOT NULL AUTO_INCREMENT ;

ALTER TABLE `capacitacion`.`capacitacion` 
CHANGE COLUMN `id` `id` INT NOT NULL AUTO_INCREMENT ;

/*2. Genere 3 consultas que permitan ingresar datos sobre la tabla Capacitación, sin asignar el
campo idcapacitacion en la consulta misma*/
insert into capacitacion (rut_cliente, dia, hora, lugar, duracion, num_asistentes) 
values
('1-6', 'Lunes', '09:00','UNAB Sala 105',  35, 15),
('1-7', 'Lunes', '19:00','UNAB Sala 201',  25, 15),
('1-8', 'Lunes', '18:00','UNAB Sala 301',  15, 15);

/*3. Genere 5 consultas que permitan ingresar datos sobre la xtabla Asistentes, sin asignar
el campo idasistente en la consulta misma.*/
insert into asistentes (nombres,edad,capacitacion_idcapacitacion) 
values
('Cindy Nero', 22, 13),
('Debora Melo', 23, 14),
('Elgar Gajo', 23, 15),
('Solomeo Paredes', 23, 14),
('Rosamel Delgado', 24, 15);

/*4. Realice una consulta que permita establecer una restricción de tipo única sobre el campo
nombres de la tabla Asistentes.*/
ALTER TABLE `capacitacion`.`asistentes` 
ADD UNIQUE INDEX `nombres_UNIQUE` (`nombres` ASC) VISIBLE;

/*5. Realice una consulta que permita actualizar los campos dia a “01/01/2020” y hora a “00:00”
de la tabla capacitación, para todos aquellos registros tales que el día y la hora son igual a
un valor nulo.*/
UPDATE capacitacion
SET dia = ('01/01/2020'), hora = ('00:00')
WHERE dia and hora is null;

/*6. Realice una consulta que permita eliminar todas aquellas capacitaciones que no tienen
asistentes. Esto es, aquellas capacitaciones con el campo cantidadasistentes igual a 0, y sin
registros relacionados en la tabla*/
Delete from capacitación
Where num_asistentes = 0 AND capacitacion.id 
not in (Select asistentes.capacitacion_idcapatacion from Asistentes);