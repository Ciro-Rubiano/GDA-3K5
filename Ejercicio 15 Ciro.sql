--15
--a
select E.nombre, E.apellido, DAY(E.fecha_ingreso) as "DIA", MONTH(E.fecha_ingreso) as "MES"
from empleados E
where E.depto_id = (select M.depto_id
					from Empleados M
					where M.apellido = 'Magee')

--b
select E.id, E.nombre, E.apellido, E.id_usuario
from empleados E
where E.salario >	(select AVG(A.salario)
					 from empleados A )
					 
--c
select E.apellido, D.id, E.titulo
from depto D left join empleados E
on D.id = E.depto_id
where D.id_region = 1 or D.id_region = 2

--d
select E.nombre, E.salario
from empleados E					 
where E.id_jefe = (select empleados.id
					from empleados
					where empleados.apellido = 'Ngao')
					
					
--e
select E.id, E.nombre, E.apellido, E.salario
from empleados E
where E.salario > (select AVG(empleados.salario)
					from empleados)
and E.depto_id in (select empleados.depto_id --in se utiliza cuando hay que buscar que este dentro de un conjunto
					from empleados
					where empleados.apellido like '%t%')
					
--f
select  E.apellido, C.nombre, COUNT(P.id_cliente)
from empleados E, depto D, clientes C  join pedido P on (P.id_cliente = C.id)
where E.titulo = 'Representante de ventas' 
and (E.depto_id = D.id and (D.id_region = 1 or D.id_region = 2)) 
and C.id_vendedor = E.id
group by E.apellido, C.id, C.nombre


--g
select PR.id, PR.nombre, SUM(I.cant_en_stock) as 'Cantidad de Stock'
from producto PR join Inventario I on (PR.id = I.id_producto), item IT, pedido PED
where 5 <= (select COUNT(*)
			from inventario INV
			where INV.Id_producto = PR.id
			group by INV.Id_producto)
and IT.Id_producto = PR.id
and IT.ord_id = PED.id
and 08 = MONTH(PED.fecha_pedido)
group by PR.id, PR.nombre
			    
			    
--h
select C.nombre, COUNT(*) as 'Cantidad de Pedidos'
from pedido P join clientes C on( P.id_cliente = C.id)
where 6 < (select COUNT(IT.item_id)
			from item IT
			where IT.ord_id = P.id)
group by C.nombre
order by COUNT(P.id)
