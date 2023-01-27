select dia, duracion, num_asistentes from capacitacion
where (dia = 'Lunes' or dia = 'Miercoles' or dia = 'Viernes')
and num_asistentes >50 and duracion <30;