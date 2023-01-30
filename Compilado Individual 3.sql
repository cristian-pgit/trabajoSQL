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
select p.nombre, p.precio, f.nombre
from producto p join fabricante f
on f.id = p.id_fabricante

/*02*/
select p.nombre, p.precio, f.nombre
from producto p join fabricante f
on f.id = p.id_fabricante
order by f.nombre asc

/*03*/
select p.id, p.nombre, f.id, f.nombre
from producto p join fabricante f
on f.id = p.id_fabricante

/*04*/
select p.nombre, p.precio, f.nombre
from producto p join fabricante f
on f.id = p.id_fabricante
where precio = (select min(pp.precio) from producto pp)

/*05*/
select p.nombre, p.precio, f.nombre
from producto p join fabricante f
on f.id = p.id_fabricante
where precio = (select max(pp.precio) from producto pp)

/*06*/
select p.nombre
from producto p join fabricante f
on f.id = p.id_fabricante
where f.nombre = 'Lenovo';

/*07*/
select p.nombre
from producto p join fabricante f
on f.id = p.id_fabricante
where f.nombre = 'Crucial' and p.precio > 200;

/*08*/
select p.nombre
from producto p join fabricante f
on f.id = p.id_fabricante
where f.nombre = 'Asus' or f.nombre = 'Hewlett-Packard' or f.nombre = 'Seagate';

/*09*/
select p.nombre
from producto p join fabricante f
on f.id = p.id_fabricante
where f.nombre in('Asus','Hewlett-Packard','Seagate');

/*10*/
select p.nombre, p.precio
from producto p join fabricante f
on f.id = p.id_fabricante
where f.nombre like '%e';

/*11*/
select p.nombre, p.precio
from producto p join fabricante f
on f.id = p.id_fabricante
where f.nombre like '%w%';

/*12*/
select p.nombre, p.precio, f.nombre
from producto p join fabricante f
on f.id = p.id_fabricante
where p.precio >= 180
order by p.precio desc, p.nombre asc;

/*13*/
select f.id, f.nombre
from producto p join fabricante f
on f.id = p.id_fabricante
where p.nombre is not null;

/*Consultas Multitabla - Composicion Externa*/

/*01*/
select f.id, f.nombre, p.nombre
from fabricante f left join producto p
on f.id = p.id_fabricante;

/*02*/
select f.nombre, p.nombre
from fabricante f left join producto p
on f.id = p.id_fabricante
where p.nombre is null;

/*03*/
/*No se puede tener productos sin asignar pues la tabla producto tiene como propiedad el ser "NOT NULL" 
y ademas es Foreign Key  por lo que no se podria crear un producto que no tenga asosciado un id de fabricante */

/*Consultas resumen*/

/*01*/
select count(id) as Cant_Prod from producto;

/*02*/
select (count(id)) as Cant_Fab from fabricante;

/*03*/
select count(distinct id_fabricante) as N_fabricantes  
from producto;  /*<<--*/

/*04*/
select avg(precio)  from producto;

/*05*/
select min(precio)  from producto;

/*06*/
select max(precio)  from producto;

/*07*/
select nombre, precio
from producto
order by precio asc
limit 1;


/*08*/
select nombre, precio
from producto
order by precio desc
limit 1;

/*09*/
select sum(precio)
from producto;

/*10*/
select count(p.nombre) as Asus
from producto p join fabricante f
on f.id = p.id_fabricante
where f.nombre = 'Asus';

/*11*/
select avg(p.precio) as PrecioPromedio
from producto p join fabricante f
on f.id = p.id_fabricante
where f.nombre = 'Asus';

/*12*/
select min(p.precio) as PrecioBajo
from producto p join fabricante f
on f.id = p.id_fabricante
where f.nombre = 'Asus';

/*13*/
select max(p.precio) as PrecioBajo
from producto p join fabricante f
on f.id = p.id_fabricante
where f.nombre = 'Asus';

/*14*/
select (sum(p.precio)) as SumaPrecios
from producto p join fabricante f
on f.id = p.id_fabricante
where f.nombre = 'Asus';

/*15*/
select (max(precio))as MasAlto, (min(precio))as MasBajo,(avg(precio))as Promedio,(count(p.precio)) as CantProd
from producto p join fabricante f
on f.id = p.id_fabricante
where f.nombre = 'Crucial';

/*16*/
select f.nombre, (count(p.nombre))as CantArticulos
from producto p right join fabricante f /* en este caso es rightJoin pues deje "From Producto join a Fabricante", de ser inverso es un LeftJoin*/
on f.id = p.id_fabricante
group by f.nombre
order by CantArticulos desc;

/*17*/
select f.nombre, max(p.precio)as PrecioMasCaro, min(p.precio)as PrecioMasBarato, avg(p.precio)as PrecioPromedio
from producto p join fabricante f
on f.id = p.id_fabricante
group by f.nombre;

/*18*/
select id_fabricante,max(precio)as PMC, min(precio)as PMB, avg(precio)as PP, count(f.nombre)as TA  
from producto 							/* PMC Precio Mas Caro, PMB PRecio Mas Barato, PP Precio Promedio*/
group by id_fabricante
having avg(precio) > 200;

/*19*/
select f.nombre,max(p.precio)as PMC, min(p.precio)as PMB, avg(p.precio)as PP, count(f.nombre)as TA
from producto p join fabricante f on f.id = id_fabricante	/* PMC Precio Mas Caro, PMB PRecio Mas Barato, PP Precio Promedio, TA Total Articulos*/
group by f.nombre
having avg(precio) > 200;

/*20*/
select count(nombre) as CAB180  /* CAB180: Cantidad de Articulos Bajo 180E*/
from producto 
where precio >= 180;

/*21*/
select f.nombre, count(p.nombre)as CAB180
from producto p join fabricante f on f.id = p.id_fabricante
where precio >= 180
group by f.nombre;

/*22*/
select id_fabricante, avg(precio)as $Promedio
from producto 
group by id_fabricante;

/*23*/
select f.nombre, avg(p.precio)as $Promedio
from fabricante f left join producto p on f.id = p.id_fabricante
group by f.nombre;

/*24*/
select f.nombre, avg(p.precio)as $Promedio
from fabricante f left join producto p on f.id = p.id_fabricante
group by f.nombre
having $Promedio >=150;

/*25*/
select f.nombre, count(p.nombre)as Cant
from fabricante f join producto p on f.id = p.id_fabricante
group by f.nombre
having Cant >= 2;

/*26*/
select f.nombre, avg(precio) as precio_medio
from fabricante f
inner join producto p on p.id_fabricante = f.id
group by f.nombre
having precio_medio >= 200



