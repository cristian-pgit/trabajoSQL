/*Primera*/
select * from capacitacion
where duracion < 90 and dia = 'Lunes';

/*Segunda*/
select a.nombres, c.rut_cliente, c.lugar, c.duracion
from capacitacion c join asistentes a
on c.id = a.capacitacion_idcapacitacion;

/*Tercera*/
select rut_cliente, dia, hora
from capacitacion
where num_asistentes != (select count(*) from asistentes a where capacitacion.id = a.capacitacion_idcapacitacion );
/*--->Solucion de mejor performance*/
select rut_cliente, dia, hora
from 
(select c.rut_cliente, c.dia, c.hora, c.num_asistentes, 
count(a.capacitacion_idcapacitacion) as totales
from capacitacion c
inner join asistentes a on a.capacitacion_idcapacitacion = c.id
group by c.rut_cliente, c.dia, c.hora, c.num_asistentes
having totales != c.num_asistentes
) as asistencia;

/*Cuarta*/
select  lugar, duracion, dia, hora 
from capacitacion
where (select count(*) from asistentes a where capacitacion.id = a.capacitacion_idcapacitacion ) > 3;
/*Solucion de mejor performance*/
select  lugar, duracion, dia, hora 
from
(select c.lugar, c.duracion, c.dia, c.hora, 
count(a.capacitacion_idcapacitacion) as totales
from capacitacion c
inner join asistentes a on a.capacitacion_idcapacitacion = c.id
group by c.lugar, c.duracion, c.dia, c.hora
having totales > 3
) as asistencia;

