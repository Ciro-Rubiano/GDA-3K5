--Ejercicio 1

--a

create table PremioXLibro
	(CodLibro varchar(15),
	idGenero varchar(10),
	añoOtorgamiento varchar(4) default year(getDate()),
	codPremio varchar(10) not null,
	constraint PremioXLibro_PK primary key(CodLibro, idGenero, añoOtorgamiento),
	constraint PremioXLibro_libro_genero_FK foreign key(CodLibro, idGenero)
		references Ebook(codigo, idGenero),
	constraint PremioXLibro_codPremio_FK foreign key(codPremio)
		references Premio(codPremio))


--b

insert into Ebook
values(1234, 15, "Farenheit 451", "Quemar libros", 2016, 20, 438)

insert into Ebook
values(3212, 15, "Un mundo feliz", "Control farmacológico", 2013, null, null)

insert into Ebook
values(954, 15, "1984", "Gran hermano", 2018, null, null)

--c

update Descuentos
	set montoSuperior = montoSuperior + montoSuperior*0.20
	where montoInf <= 1000

--si quisiera que se aplique solo a una fila

update top (1) Descuentos
	set montoSuperior = montoSuperior + montoSuperior*0.20
	where montoInf <= 1000

--d

delete from Tarea
where nombre = "Re-entrega"

/*
 La eliminación de una fila en la tabla referenciada no provocará la 
 eliminación de las filas que se encuentren en tablas que contienen
 las referencias y que posean valores coindicentes con los registros
 eliminados.
 
 El problema de que la BD este configurada de este modo es que puede
 generar problemas de integridad referencial al tener referencias a
 registros inexistentes, se poner una restriccion (RESTRICT / NO ACTION)
 para evitar la eliminación de registros referenciados o configurar la
 db como "On Delete Cascade ON".
*/
