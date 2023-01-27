select rut_cliente, dia, hora
from capacitacion
where num_asistentes != (select count(*) from asistentes a where capacitacion.id = a.capacitacion_idcapacitacion );


