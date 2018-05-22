use GDA
-- 12
select E.id, E.nombre, E.fecha_ingreso
from empleados E
where E.fecha_ingreso between CONVERT(datetime, '09/05/1991', 103) and CONVERT(datetime, '17/06/1991', 103)
--13
--a
select E.nombre, D.id, D.nombre
from empleados E, depto D
where E.depto_id = D.id
--b
select D.id as 'Nro Depto', R.id as 'Id Region', R.name
from depto D, region R
where D.id_region = R.id
--c
select E.apellido, R.name, E.porcent_comision
from empleados E, region R, depto D
where D.id_region = R.id
and E.depto_id = D.id
and E.porcent_comision is NOT NULL
--d
select E.apellido, E.salario, D.id, D.nombre
from empleados E, depto D
where (E.salario > 1000
and D.id = 44)
or D.id = 42
