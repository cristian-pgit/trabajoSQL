1.- 	select * from ventas
		where cantarticulos > '2';

2.- 	select idventa, comprador, cantarticulos from ventas
		where subtotal < '1000';

3.- 	select total, impuesto, subtotal, cantarticulos, vendedor, comprador, idventa from ventas
		where vendedor = 'SONIA GARRIDO' and total >= '5000';

4.- 	select vendedor, comprador, total from ventas
		where comprador = 'LUCAS' or vendedor = 'MARIA';

5.- 	select * from ventas
		where idventa in ('2', '5', '6', '9');