use GDA

--e con Join
select E.apellido, E.nombre, E.id_jefe, J.apellido, J.nombre
from Empleados E left join Empleados J
on E.id_jefe = J.id

--e con where
select E.apellido, E.nombre, E.id_jefe, J.apellido, J.nombre
from Empleados E, Empleados J
where E.id_jefe = J.id
or E.id_jefe is null


--14
--a
select D.id, AVG(E.salario)
from depto D, Empleados E
where E.depto_id = D.id
group by D.id
having AVG(E.salario) > 2000

--b
select P.id, COUNT(*) as 'Cantidad Pedidos'
from pedido P,item I
where P.id = I.ord_id
group by P.id
order by 'Cantidad Pedidos'

--c
select G.id, MIN(E.salario) as "Peor Salario"
from empleados E left join Empleados G
on E.id_jefe = G.id
group by G.id
having MIN(E.salario) > 1000
order by "Peor Salario"


--d
select MAX(E.salario)-MIN(E.salario)
from empleados E

--e
select R.id, R.name, COUNT(D.id) as "Cantidad de Datos"
from region R left join depto D
on D.id_region = R.id
group by R.id, R.name
order by R.name

