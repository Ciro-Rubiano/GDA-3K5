use GDA

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
select PR.id, PR.nombre, SUM(I.cant_en_stock)
from producto PR, inventario I, pedido P, item IT
where I.Id_producto = PR.id
and 5 <= (select COUNT(I.id_almacenes)
		  from inventario I
		  where PR.id = I.Id_producto
		  group by I.Id_producto)
--falta hacer la parte del mes de agosto
group by PR.id, PR.nombre
