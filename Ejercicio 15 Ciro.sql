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
select  PR.id, PR.nombre, SUM(I.cant_en_stock) as "STOCK"
from producto PR, inventario I, pedido P join item It on ()
where I.Id_producto = PR.id
and 
group by PR.id, PR.nombre
having 5>= COUNT(I.id_almacenes)
