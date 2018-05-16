use _3k3_gda
-- a
select E.depto_id, E.apellido, E.id_jefe
from empleados E
-- b
select E.apellido, E.salario, E.porcent_comision
from empleados E
-- c
select E.apellido, E.salario, ((E.salario * 12)+100) as "Compensacion Anual"
from empleados E
--d
select E.apellido, E.salario, E.titulo, (E.salario * E.porcent_comision/100) as "Comision Calculada"
from empleados E
--e
select distinct D.nombre
from depto D
where D.nombre like '%O%'
--f
select E.nombre, E.apellido, E.titulo
from empleados E
where E.apellido = 'Magee'
--g
select I.Id_producto, I.precio as 'Precio Unitario', I.cantidad, (I.cantidad * I.precio) as 'Total'
from item I
where I.item_id = 1
--h
select E.*
from empleados E
where E.nombre like 'C_R%'
--i
select P.*
from pedido P
where P.fecha_pedido between convert(datetime, '30/08/1992', 103) and CONVERT(datetime, '05/09/1992', 103)
and P.tipo_pago = 'CREDITO' 
and P.fecha_enviado - P.fecha_pedido <= 15
order by P.fecha_pedido desc
--j
select E.*
from empleados E
where E.id_jefe is NULL
--k
select C.*
from clientes C
where C.id_vendedor is NOT NULL
--l
select C.id, C.nombre, C.direccion
from clientes C
where C.pais = 'USA'
and C.id_vendedor = 11
order by C.nombre desc