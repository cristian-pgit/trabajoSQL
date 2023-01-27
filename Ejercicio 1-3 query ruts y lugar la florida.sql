select num_asistentes, duracion, lugar, hora, dia, rut_cliente, id from capacitacion
where rut_cliente in ('1-9', '2-7') and lugar = 'La Florida';
