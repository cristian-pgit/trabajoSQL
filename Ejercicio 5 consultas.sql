//primero
select id, hora, dia, rut_cliente from capacitacion;
//segundo
select * from capacitacion
where duracion=60 and num_asistentes >30;
//tercero
select num_asistentes, duracion, lugar, hora, dia, rut_cliente, id from capacitacion
where rut_cliente in ('1-9', '2-7') and lugar = 'La Florida';
//cuarto
select * from capacitacion
where (duracion > 30 and Duracion < 90) or num_asistentes <10;
/o
select id, duracion, num_asistentes from capacitacion
where duracion between 31 and 89 or num_asistentes <10;
// quinto
select dia, duracion, num_asistentes from capacitacion
where (dia = 'Lunes' or dia = 'Miercoles' or dia = 'Viernes')
and num_asistentes >50 and duracion <30;