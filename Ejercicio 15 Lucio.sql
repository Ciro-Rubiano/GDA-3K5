use Lucio_71983


--a
select E.nombre, E.apellido, DAY(E.fecha_ingreso) as "DIA"
from empleados E
where E.depto_id = (select M.depto_id
					from empleados M
					where M.apellido = 'Magee')
				

--b
select E.id, E.nombre, E.apellido, E.id_usuario
from empleados E
where E.salario > (select AVG(S.salario)
					from empleados S)
					
--c
select E.apellido, E.depto_id, E.titulo
from empleados E join depto D on (E.depto_id = D.id)
where D.id_region = 1
or D.id_region = 2

--d
select E.nombre, E.salario
from empleados E
where E.id_jefe = (select J.id
				   from empleados J
				   where J.apellido = 'Ngao')
				   
--e
select E.id, E.nombre, E.apellido, E.salario
from empleados E
where (E.salario > (select AVG(S.salario)from empleados S))
and (E.depto_id in (select T.depto_id
				  from empleados T
				  where T.apellido like '%t%'))
				  
--f
select E.apellido "Apellido representante", C.nombre "nombre cliente", count(P.id_cliente)
from empleados E, depto D, clientes C, pedido P
where (E.depto_id = D.id and (D.id_region = 1 or D.id_region = 2))
and C.id_vendedor = E.id
and C.id = P.id_cliente
group by E.apellido, C.id, C.nombre

--g
select PR.id, PR.nombre, SUM(I.cant_en_stock) as "Stock Total"
from producto PR, inventario I, pedido P, item IT
where I.Id_producto = PR.id
and 5 <= (select COUNT(INV.id_almacenes)
		  from inventario INV
		  where PR.id = INV.Id_producto)
and PR.id = It.Id_producto
and IT.ord_id = P.id
and month(P.fecha_pedido) = 08
group by PR.id, PR.nombre

--h
select C.nombre, count(P.id_cliente)
from clientes C, pedido P
where C.id = P.id_cliente
and 6 < (select count(IT.item_id)
			from item IT
			where IT.ord_id = P.id
			group by IT.ord_id)
group by C.nombre
