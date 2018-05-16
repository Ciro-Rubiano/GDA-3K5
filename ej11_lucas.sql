use GDA

SELECT E.depto_id, E.apellido, E.id_jefe
FROM empleados E

SELECT E.apellido, E.salario * 12 as Anual, E.porcent_comision
FROM empleados E 	

SELECT E.apellido, (E.salario*12)+100 as Compensacion_Anual, E.porcent_comision
FROM empleados E

SELECT E.apellido, E.titulo, E.salario, (E.salario*E.porcent_comision)/100 AS Comision, E.porcent_comision
FROM empleados E

SELECT DISTINCT D.nombre
FROM depto D
WHERE D.nombre LIKE '%o%'

SELECT E.apellido, E.nombre, E.titulo, E.salario, E.titulo
FROM empleados E
WHERE E.apellido='Magee'

SELECT I.*, I.cantidad*I.precio as Precio_Total
FROM item I 
WHERE I.item_id=1

SELECT E.*
FROM empleados E
WHERE E.nombre LIKE 'C_r%'

SELECT P.*
FROM pedido P
WHERE (P.fecha_pedido BETWEEN CONVERT(DATE,'30/06/92') AND CONVERT(DATE,'05/09/92')) 
AND (P.tipo_pago LIKE 'CREDITO') 
AND ((P.fecha_enviado-P.fecha_pedido) <= 15)
ORDER BY P.fecha_pedido DESC

SELECT E.*
FROM empleados E
WHERE E.id_jefe IS NULL

SELECT C.*
FROM clientes C
WHERE C.id_vendedor is NOT NULL

SELECT C.nombre, C.id, C.direccion
FROM clientes C
WHERE C.pais LIKE 'USA' 
AND C.id_vendedor=11
ORDER BY C.nombre DESC


