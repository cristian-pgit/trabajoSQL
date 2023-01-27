select  lugar, duracion, dia, hora 
from capacitacion
where (select count(*) from asistentes a where capacitacion.id = a.capacitacion_idcapacitacion ) > 3;