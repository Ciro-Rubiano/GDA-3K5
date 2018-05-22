use GDA
--12
select E.nombre, E.apellido, E.fecha_ingreso
from empleados E
where E.fecha_ingreso between convert(datetime, '09/05/1991', 103) and CONVERT(datetime, '17/06/1991', 103)


--13
--a
select E.nombre, E.depto_id,  D.id, D.nombre
from empleados E, depto D
where E.depto_id = D.id

--b
select D.id as 'ID DEPARTAMENTO', R.id as 'id Zona', R.name
from depto D, region R
where D.id_region = R.id

--c
select E.apellido as 'Apellido Empleado', R.name as 'Nombre Region', E.porcent_comision as '% Comision'
from empleados E, region R, depto D
where E.depto_id = D.id
and D.id_region = R.id
and E.porcent_comision is not null

--d
select E.nombre, E.apellido, E.salario,  D.id, D.nombre
from empleados E, depto D
where (D.id = 44 and E.salario >= 1000)
or D.id = 42
order by E.salario
