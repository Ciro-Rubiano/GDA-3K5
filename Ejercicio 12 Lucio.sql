use GDA
--a
select D.id as "Nro Depto", AVG(E.salario)
from depto D, empleados E
where (D.id = E.depto_id)
group by D.id
having AVG(E.salario) > 2000

--b
select P.id, COUNT(I.ord_id) "Numero de Items"
from pedido P, item I
where P.id = I.ord_id
group by P.id
order by "Numero de Items"

--c
select J.id as "Nro Jefe", MIN(E.salario) as "Peor salario"
from empleados E left join empleados J
on (J.id = E.id_jefe)
group by J.id
having MIN(E.salario) > 1000
order by "Peor salario"

--d
select MAX(E.salario) - MIN(E.salario)
from empleados E

--e
select R.id "id region", R.name "nombre region", COUNT(D.id_region)
from region R, depto D
where R.id = D.id_region
group by R.id, R.name
order by R.name
