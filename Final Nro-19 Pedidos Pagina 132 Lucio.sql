--1
select PR.id_producto, PR.descrip
from productos PR, componentes CM,
where PR.id_producto = CM.id_producto
and PR.id_producto not in (select PROD.id_producto
						   from productos PROD, detallepedidos DP, pedidos P
						   where PROD.id_producto = DP.id_producto
						   and DP.nroPedido = P.nroPedido
						   and P.legajo_emp = 476)
group by PR.id_producto, PR.descrip
having count(*) <= ALL (select count(*)
						 from productos PRODUCTO, componentes COM
						 where PRODUCTO.id_producto = COM.id_producto
						 group by PRODUCTO.id_producto)
order by PR.id_producto desc