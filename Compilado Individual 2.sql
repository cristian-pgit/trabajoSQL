-------/---------
select *
from ventas 
where (subtotal + impuesto) != total;
-------//---------
select sum(total)
from ventas;
-------///---------
select v.cantarticulos, v.subtotal, v.impuesto, v.total
from ventas v join clientes c
on v.clientes_idcliente = c.idcliente
where concat(c.nombres, ' ', c.apellidos) = 'Antonia Aranda';
-------////----------
select idcliente, concat(nombres, ' ', apellidos) as cliente
from clientes
where direccion is null;
-------/////----------
select min(total), max(total)
from ventas;