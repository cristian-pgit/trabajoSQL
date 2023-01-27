select a.nombres, c.rut_cliente, c.lugar, c.duracion, c.id 
from asistentes a join capacitacion c 
on c.id = a.capacitacion_idcapacitacion;