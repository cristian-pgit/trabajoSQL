/*01*/
select nombre from producto

/*02*/
select nombre, precio from producto

/*03*/
select * from producto

/*04*/
select nombre, precio, (precio * 1.09)
from producto

/*05*/
select nombre, (precio) as Euros, (precio * 1.09)as US_Dolares
from producto

/*06*/
select upper(nombre), (precio) as EU
from producto

/*07*/
select lower(nombre), (precio) as EU
from producto

/*08*/
select nombre, (upper(substring(nombre, 1, 2))) as Iniciales, (precio) as EU
from producto

/*09*/
select nombre, (round(precio,0)) as EU
from producto

/*10*/
select nombre, ( truncate(precio,0)) as EU
from producto

/*11*/
select id_fabricante
from producto
where nombre is not null

/*12*/
select id_fabricante
from producto
where nombre is not null
group by id_fabricante

/*13*/
select nombre
from fabricante
order by nombre asc

/*14*/
select nombre
from fabricante
order by nombre desc

/*15*/
select nombre, precio
from producto
order by nombre asc, precio desc

/*16*/
select * 
from fabricante
limit 5

/*17*/
select *
from fabricante
limit 3,2
/* o */
select *
from fabricante
where id > 3
limit 2

/*18*/
select nombre, (precio) as EU
from producto
order by precio asc
limit 1

/*19*/
select nombre, (precio) as EU
from producto
order by precio desc
limit 1

/*20*/
select nombre
from producto 
where id_fabricante =2

/*21*/
select nombre
from producto 
where precio < 120

/*22*/
select nombre
from producto 
where precio >= 400

/*23*/
select nombre
from producto 
where precio < 400

/*24*/
select nombre
from producto 
where precio >= 80 and precio <= 300

/*25*/
select nombre
from producto 
where precio between 60 and 200

/*26*/
select nombre
from producto 
where precio > 200 and id_fabricante = 6

/*27*/
select nombre
from producto 
where id_fabricante = 1 or id_fabricante =3 or id_fabricante =5

/*28*/
select nombre
from producto 
where id_fabricante in(1,3,5)

/*29*/
select nombre, ((precio*100))as centimos
from producto

/*30*/
select nombre
from fabricante 
where substring(nombre, 1,1) = 'S'

/*31*/
select nombre
from fabricante 
where nombre like '%e'

/*32*/
select nombre
from fabricante 
where nombre like '%w%'

/*33*/
select nombre
from fabricante 
where length(nombre) =4

/*34*/
select nombre
from producto
where nombre like '%Portatil%'

/*35*/
select nombre
from producto
where nombre like '%Monitor%' and precio < 215

/*36*/
select nombre, precio
from producto
where precio >= 180
order by precio desc, nombre asc

/*------Consultas Multitabla----------*/
/*01*/


/*01*/


/*01*/


/*01*/





