/*
MODELO DE DATOS:  LABORATORIO GDA - UTN-FRC
PRODUCTO:  	  SQL SERVER 2000
FECHA:		  09/05/2011 - v1.2
*/
-- drop constraints
--create database _3k3_gda;
use _3k3_gda;

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[inventario_id_almacenes_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1) ALTER TABLE [dbo].[inventario] DROP CONSTRAINT inventario_id_almacenes_fk
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[pedido_id_cliente_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1) ALTER TABLE [dbo].[pedido] DROP CONSTRAINT pedido_id_cliente_fk
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[empleados_dept_id_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1) ALTER TABLE [dbo].[empleados] DROP CONSTRAINT empleados_dept_id_fk
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[s_id_almacenes_jefe_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1) ALTER TABLE [dbo].[almacenes] DROP CONSTRAINT s_id_almacenes_jefe_fk
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Ventas_rep_id_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1) ALTER TABLE [dbo].[clientes] DROP CONSTRAINT Ventas_rep_id_fk
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[empleados_id_jefe_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1) ALTER TABLE [dbo].[empleados] DROP CONSTRAINT empleados_id_jefe_fk
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[pedido_Ventas_rep_id_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1) ALTER TABLE [dbo].[pedido] DROP CONSTRAINT pedido_Ventas_rep_id_fk
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[producto_image_id_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1) ALTER TABLE [dbo].[producto] DROP CONSTRAINT producto_image_id_fk
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[item_ord_id_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1) ALTER TABLE [dbo].[item] DROP CONSTRAINT item_ord_id_fk
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[inventario_Id_producto_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1) ALTER TABLE [dbo].[inventario] DROP CONSTRAINT inventario_Id_producto_fk
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[item_Id_producto_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1) ALTER TABLE [dbo].[item] DROP CONSTRAINT item_Id_producto_fk
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[s_id_almacenes_region_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1) ALTER TABLE [dbo].[almacenes] DROP CONSTRAINT s_id_almacenes_region_fk
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[clientes_id_region_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1) ALTER TABLE [dbo].[clientes] DROP CONSTRAINT clientes_id_region_fk
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[depto_id_region_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1) ALTER TABLE [dbo].[depto] DROP CONSTRAINT depto_id_region_fk
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[producto_longtext_id_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1) ALTER TABLE [dbo].[producto] DROP CONSTRAINT producto_longtext_id_fk
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[empleadotitulo_fk]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1) ALTER TABLE [dbo].[empleados] DROP CONSTRAINT empleadotitulo_fk
-- drop tables
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[almacenes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[almacenes]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[clientes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[clientes]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[depto]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[depto]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[empleados]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[empleados]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[imagen]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[imagen]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[inventario]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[inventario]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[item]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[item]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[pedido]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[pedido]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[producto]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[producto]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[region]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[region]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[textolargo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[textolargo]
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[titulo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[titulo]

-- Crear tablas.

CREATE TABLE clientes 
(id                         INT 
   CONSTRAINT clientes_id_nn NOT NULL,
 nombre                     VARCHAR(50) 
   CONSTRAINT clientes_name_nn NOT NULL,
 telefono                   VARCHAR(25),
 direccion                  VARCHAR(400),
 ciudad                     VARCHAR(30),
 estado                     VARCHAR(20),
 pais                       VARCHAR(30),
 cod_postal                 VARCHAR(75),
 calificacion_CREDITO       VARCHAR(9),
 id_vendedor                INT,
 id_region                  INT,
 comentarios                VARCHAR(255),
     CONSTRAINT clientes_id_pk PRIMARY KEY (id),
     CONSTRAINT clientes_CREDITO_rating_ck
        CHECK (calificacion_CREDITO IN ('EXCELENTE', 'BUENA', 
'POBRE')))

INSERT INTO clientes VALUES (
   201, 'Unisports', '55-2066101',
   '72 Via Bahia', 'San Pablo', NULL, 'Brasil', NULL,
   'EXCELENTE', 12, 2, NULL)
INSERT INTO clientes VALUES (
   202, 'OJ Atheletics', '81-20101',
   '6741 Takashi Blvd.', 'Osaka', NULL, 'Japon', NULL,
   'POBRE', 14, 4, NULL)
INSERT INTO clientes VALUES (
   203, 'Delhi Sports', '91-10351',
   '11368 Chanakya', 'New Delhi', NULL, 'India', NULL,
   'BUENA', 14, 4, NULL)
INSERT INTO clientes VALUES (
   204, 'Womansport', '1-206-104-0103',
   '281 King Street', 'Seattle', 'Washington', 'USA', NULL,
   'EXCELENTE', 11, 1, NULL)
INSERT INTO clientes VALUES (
   205, 'Kam''s Sporting BUENAs', '852-3692888',
   '15 Henessey Road', 'Hong Kong', NULL, NULL, NULL,
   'EXCELENTE', 15, 4, NULL)
INSERT INTO clientes VALUES (
   206, 'Sportique', '33-2257201',
   '172 Rue de Rivoli', 'Cannes', NULL, 'Francia', NULL,
   'EXCELENTE', 15, 5, NULL)
INSERT INTO clientes VALUES (
   207, 'Sweet Rock Sports', '234-6036201',
   '6 SaINT Antoine', 'Lagos', NULL, 'Nigeria', NULL,
   'BUENA', NULL, 3, NULL)
INSERT INTO clientes VALUES (
   208, 'Muench Sports', '49-527454',
   '435 Gruenestrasse', 'Stuttgart', NULL, 'Alemania', NULL,
   'BUENA', 15, 5, NULL)
INSERT INTO clientes VALUES (
   209, 'Beisbol Si!', '809-352689',
   '792 Playa Del Mar', 'San Pedro de Macon''s', NULL, 'Republica 
Dominicana', 
   NULL, 'EXCELENTE', 11, 1, NULL)
INSERT INTO clientes VALUES (
   210, 'Futbol Sonora', '52-404562',
   '3 Via Saguaro', 'Nogales', NULL, 'Mexico', NULL,
   'EXCELENTE', 12, 2, NULL)
INSERT INTO clientes VALUES (
   211, 'Kuhn''s Sports', '42-111292',
   '7 Modrany', 'Prague', NULL, 'Checoeslovaquia', NULL,
   'EXCELENTE', 15, 5, NULL)
INSERT INTO clientes VALUES (
   212, 'Hamada Sport', '20-1209211',
   '57A Corniche', 'Alexandria', NULL, 'Egipto', NULL,
   'EXCELENTE', 13, 3, NULL)
INSERT INTO clientes VALUES (
   213, 'Big John''s Sports Emporium', '1-415-555-6281',
   '4783 18th Street', 'San Francisco', 'CA', 'USA', NULL,
   'EXCELENTE', 11, 1, NULL)
INSERT INTO clientes VALUES (
   214, 'Ojibway Retail', '1-716-555-7171',
   '415 Main Street', 'Buffalo', 'NY', 'USA', NULL,
   'POBRE', 11, 1, NULL)
INSERT INTO clientes VALUES (
   215, 'Sporta Russia', '7-3892456',
   '6000 Yekatamina', 'SaINT Petersburg', NULL, 'Rusia', NULL,
   'POBRE', 15, 5, NULL)


CREATE TABLE depto 
(id                    INT 
   CONSTRAINT depto_id_nn NOT NULL,
 nombre                VARCHAR(25) 
   CONSTRAINT depto_nombre_nn NOT NULL,
 id_region             INT,
     CONSTRAINT depto_id_pk PRIMARY KEY (id),
     CONSTRAINT depto_nombre_id_region_uk UNIQUE (nombre, id_region))

INSERT INTO depto VALUES (
   10, 'Finanzas', 1)
INSERT INTO depto VALUES (
   31, 'Ventas', 1)
INSERT INTO depto VALUES (
   32, 'Ventas', 2)
INSERT INTO depto VALUES (
   33, 'Ventas', 3)
INSERT INTO depto VALUES (
   34, 'Ventas', 4)
INSERT INTO depto VALUES (
   35, 'Ventas', 5)
INSERT INTO depto VALUES (
   41, 'Operaciones', 1)
INSERT INTO depto VALUES (
   42, 'Operaciones', 2)
INSERT INTO depto VALUES (
   43, 'Operaciones', 3)
INSERT INTO depto VALUES (
   44, 'Operaciones', 4)
INSERT INTO depto VALUES (
   45, 'Operaciones', 5)
INSERT INTO depto VALUES (
   50, 'Administracion', 1)



CREATE TABLE empleados 
(id                         INT 
   CONSTRAINT empleados_id_nn NOT NULL,
 apellido                  VARCHAR(25) 
   CONSTRAINT empleados_nombre_nn NOT NULL,
 nombre                   VARCHAR(25),
 id_usuario                 VARCHAR(8),
 fecha_ingreso              DATETIME,
 comentarios                VARCHAR(255),
 id_jefe                    INT,
 titulo                      VARCHAR(25),
 depto_id                    INT,
 salario                     DECIMAL(11,2),
 porcent_comision             DECIMAL(4,2),
     CONSTRAINT empleados_id_pk PRIMARY KEY (id),
     CONSTRAINT empleados_id_usuario_uk UNIQUE (id_usuario),
     CONSTRAINT empleados_porcent_comision_ck
        CHECK (porcent_comision IN (10, 12.5, 15, 17.5, 20)))


INSERT INTO empleados VALUES (
  1, 'Velasquez', 'Carmen', 'cvelasqu',
   cast('03/03/90 8:30' as DATETIME), NULL, NULL, 
'Presidente',
   50, 2500, NULL)
INSERT INTO empleados VALUES (
   2, 'Ngao', 'LaDoris', 'lngao',
   cast('08/03/90' as DATETIME) , NULL, 1, 'VP, Operaciones',
   41, 1450, NULL)
INSERT INTO empleados VALUES (
   3, 'Nagayama', 'Midori', 'mnagayam',
   cast('17/03/91' as DATETIME), NULL, 1, 'VP, Ventas',
   31, 1400, NULL)
INSERT INTO empleados VALUES (
   4, 'Quick/To/See', '03k', 'mquickto', 
   cast('07/04/90' as DATETIME), NULL, 1, 'VP, Finanzas', 
   10, 1450, NULL)
INSERT INTO empleados VALUES (
   5, 'Ropeburn', 'Audry', 'aropebur',
   cast('04/03/90' as DATETIME), NULL, 1, 'VP, Administracion',
   50, 1550, NULL)
INSERT INTO empleados VALUES (
   6, 'Urguhart', 'Molly', 'murguhar',
   cast('18/01/91' as DATETIME), NULL, 2, 'Jefe de almacenes',
   41, 1200, NULL)
INSERT INTO empleados VALUES (
   7, 'Menchu', 'Roberta', 'rmenchu',
   cast('14/05/90' as DATETIME), NULL, 2, 'Jefe de almacenes',
   42, 1250, NULL)
INSERT INTO empleados VALUES (
   8, 'Biri', 'Ben', 'bbiri',
   cast('07/04/90' as DATETIME), NULL, 2, 'Jefe de almacenes',
   43, 1100, NULL)
INSERT INTO empleados VALUES (
   9, 'Catchpole', 'Antoinette', 'acatchpo',
   cast('09/02/92' as DATETIME), NULL, 2, 'Jefe de almacenes',
   44, 1300, NULL)
INSERT INTO empleados VALUES (
   10, 'Havel', '03ta', 'mhavel',
   cast('27/02/91' as DATETIME), NULL, 2, 'Jefe de almacenes',
   45, 1307, NULL)
INSERT INTO empleados VALUES (
   11, 'Magee', 'Colin', 'cmagee',
   cast('14/05/90' as DATETIME), NULL, 3, 'Representante de Ventas',
   31, 1400, 10)
INSERT INTO empleados VALUES (
   12, 'Giljum', 'Henry', 'hgiljum',
   cast('18/01/92' as DATETIME), NULL, 3, 'Representante de Ventas',
   32, 1490, 12.5)
INSERT INTO empleados VALUES (
   13, 'Sedeghi', 'Yasmin', 'ysedeghi',
   cast('18/02/91' as DATETIME), NULL, 3, 'Representante de Ventas',
   33, 1515, 10)
INSERT INTO empleados VALUES (
   14, 'Nguyen', 'Mai', 'mnguyen',
   cast('22/01/92' as DATETIME), NULL, 3, 'Representante de Ventas',
   34, 1525, 15)
INSERT INTO empleados VALUES (
   15, 'Dumas', 'Andre', 'adumas',
   cast('09/10/91' as DATETIME), NULL, 3, 'Representante de Ventas',
   35, 1450, 17.5)
INSERT INTO empleados VALUES (
   16, 'Maduro', 'Elena', 'emaduro',
   cast('07/02/92' as DATETIME), NULL, 6, 'Agente de Stock',
   41, 1400, NULL)
INSERT INTO empleados VALUES (
   17, 'Smith', 'George', 'gsmith',
   cast('08/03/90' as DATETIME), NULL, 6, 'Agente de Stock',
   41, 940, NULL)
INSERT INTO empleados VALUES (
   18, 'Nozaki', 'Akira', 'anozaki',
   cast('09/02/91' as DATETIME), NULL, 7, 'Agente de Stock',
   42, 1200, NULL)
INSERT INTO empleados VALUES (
   19, 'Patel', 'Vikram', 'vpatel',
   cast('06/08/91' as DATETIME), NULL, 7, 'Agente de Stock',
   42, 795, NULL)
INSERT INTO empleados VALUES (
   20, 'Newman', 'Chad', 'cnewman',
   cast('21/07/91' as DATETIME), NULL, 8, 'Agente de Stock',
   43, 750, NULL)
INSERT INTO empleados VALUES (
   21, '03karian', 'Alexander', 'a03kari',
   cast('26/05/91' as DATETIME), NULL, 8, 'Agente de Stock',
   43, 850, NULL)
INSERT INTO empleados VALUES (
   22, 'Chang', 'Eddie', 'echang',
   cast('30/11/90' as DATETIME), NULL, 9, 'Agente de Stock',
   44, 800, NULL)
INSERT INTO empleados VALUES (
   23, 'Patel', 'Radha', 'rpatel',
   cast('17/10/90' as DATETIME), NULL, 9, 'Agente de Stock',
   34, 795, NULL)
INSERT INTO empleados VALUES (
   24, 'Dancs', 'Bela', 'bdancs',
   cast('17/03/91' as DATETIME), NULL, 10, 'Agente de Stock',
   45, 860, NULL)
INSERT INTO empleados VALUES (
   25, 'Schwartz', 'Sylvie', 'sschwart',
   cast('09/05/91' as DATETIME), NULL, 10, 'Agente de Stock',
   45, 1100, NULL)

CREATE TABLE imagen 
(id                         INT 
   CONSTRAINT imagen_id_nn NOT NULL,
 formato                     VARCHAR(25),
 usa_nombre_archivo  VARCHAR(1),
 nombre_archivo                   VARCHAR(255),
 imagen                      IMAGE,
     CONSTRAINT imagen_id_pk
        PRIMARY KEY (id),
     CONSTRAINT imagen_format_ck
        CHECK (formato in ('JGIFF', 'JTIFF')),
     CONSTRAINT imagen_us_arch_nom_ck
        CHECK (usa_nombre_archivo in ('S', 'N')))

INSERT INTO imagen VALUES (
   1001, 'JTIFF', 'S', 'bunboot.tif', NULL)
INSERT INTO imagen VALUES (
   1002, 'JTIFF', 'S', 'aceboot.tif', NULL)
INSERT INTO imagen VALUES (
   1003, 'JTIFF', 'S', 'proboot.tif', NULL)
INSERT INTO imagen VALUES (
   1011, 'JTIFF', 'S', 'bunpole.tif', NULL)
INSERT INTO imagen VALUES (
   1012, 'JTIFF', 'S', 'acepole.tif', NULL)
INSERT INTO imagen VALUES (
   1013, 'JTIFF', 'S', 'propole.tif', NULL)
INSERT INTO imagen VALUES (
   1291, 'JTIFF', 'S', 'gpbike.tif', NULL)
INSERT INTO imagen VALUES (
   1296, 'JTIFF', 'S', 'himbike.tif', NULL)
INSERT INTO imagen VALUES (
   1829, 'JTIFF', 'S', 'safthelm.tif', NULL)
INSERT INTO imagen VALUES (
   1381, 'JTIFF', 'S', 'probar.tif', NULL)
INSERT INTO imagen VALUES (
   1382, 'JTIFF', 'S', 'curlbar.tif', NULL)
INSERT INTO imagen VALUES (
   1119, 'JTIFF', 'S', 'baseball.tif', NULL)
INSERT INTO imagen VALUES (
   1223, 'JTIFF', 'S', 'chaphelm.tif', NULL)
INSERT INTO imagen VALUES (
   1367, 'JTIFF', 'S', 'grglove.tif', NULL)
INSERT INTO imagen VALUES (
   1368, 'JTIFF', 'S', 'alglove.tif', NULL)
INSERT INTO imagen VALUES (
   1369, 'JTIFF', 'S', 'stglove.tif', NULL)
INSERT INTO imagen VALUES (
   1480, 'JTIFF', 'S', 'cabbat.tif', NULL)
INSERT INTO imagen VALUES (
   1482, 'JTIFF', 'S', 'pucbat.tif', NULL)
INSERT INTO imagen VALUES (
   1486, 'JTIFF', 'S', 'winbat.tif', NULL)



CREATE TABLE inventario 
(Id_producto                 INT 
   CONSTRAINT inventario_Id_producto_nn NOT NULL,
 id_almacenes               INT 
   CONSTRAINT inventario_id_almacenes_nn NOT NULL,
 cant_en_stock            INT,
 punto_repedido              INT,
 max_en_stock               INT,
 explic_de_no_stock 	    VARCHAR(255),
 fecha_de_restock               DATETIME,
     CONSTRAINT inventario_prodid_warid_pk
        PRIMARY KEY (Id_producto, id_almacenes))

INSERT INTO inventario VALUES (
   10011, 101, 650, 625, 1100, NULL, NULL)
INSERT INTO inventario VALUES (
   10012, 101, 600, 560, 1000, NULL, NULL)
INSERT INTO inventario VALUES (
   10013, 101, 400, 400, 700, NULL, NULL)
INSERT INTO inventario VALUES (
   10021, 101, 500, 425, 740, NULL, NULL)
INSERT INTO inventario VALUES (
   10022, 101, 300, 200, 350, NULL, NULL)
INSERT INTO inventario VALUES (
   10023, 101, 400, 300, 525, NULL, NULL)
INSERT INTO inventario VALUES (
   20106, 101, 993, 625, 1000, NULL, NULL)
INSERT INTO inventario VALUES (
   20108, 101, 700, 700, 1225, NULL, NULL)
INSERT INTO inventario VALUES (
   20201, 101, 802, 800, 1400, NULL, NULL)
INSERT INTO inventario VALUES (
   20510, 101, 1389, 850, 1400, NULL, NULL)
INSERT INTO inventario VALUES (
   20512, 101, 850, 850, 1450, NULL, NULL)
INSERT INTO inventario VALUES (
   30321, 101, 2000, 1500, 2500, NULL, NULL)
INSERT INTO inventario VALUES (
   30326, 101, 2100, 2000, 3500, NULL, NULL)
INSERT INTO inventario VALUES (
   30421, 101, 1822, 1800, 3150, NULL, NULL)
INSERT INTO inventario VALUES (
   30426, 101, 2250, 2000, 3500, NULL, NULL)
INSERT INTO inventario VALUES (
   30433, 101, 650, 600, 1050, NULL, NULL)
INSERT INTO inventario VALUES (
   32779, 101, 2120, 1250, 2200, NULL, NULL)
INSERT INTO inventario VALUES (
   32861, 101, 505, 500, 875, NULL, NULL)
INSERT INTO inventario VALUES (
   40421, 101, 578, 350, 600, NULL, NULL)
INSERT INTO inventario VALUES (
   40422, 101, 0, 350, 600, 'Ventas Fenomenales...', cast('08-FEB-93' as datetime))
INSERT INTO inventario VALUES (
   41010, 101, 250, 250, 437, NULL, NULL)
INSERT INTO inventario VALUES (
   41020, 101, 471, 450, 750, NULL, NULL)
INSERT INTO inventario VALUES (
   41050, 101, 501, 450, 750, NULL, NULL)
INSERT INTO inventario VALUES (
   41080, 101, 400, 400, 700, NULL, NULL)
INSERT INTO inventario VALUES (
   41100, 101, 350, 350, 600, NULL, NULL)
INSERT INTO inventario VALUES (
   50169, 101, 2530, 1500, 2600, NULL, NULL)
INSERT INTO inventario VALUES (
   50273, 101, 233, 200, 350, NULL, NULL)
INSERT INTO inventario VALUES (
   50417, 101, 518, 500, 875, NULL, NULL)
INSERT INTO inventario VALUES (
   50418, 101, 244, 100, 275, NULL, NULL)
INSERT INTO inventario VALUES (
   50419, 101, 230, 120, 310, NULL, NULL)
INSERT INTO inventario VALUES (
   50530, 101, 669, 400, 700, NULL, NULL)
INSERT INTO inventario VALUES (
   50532, 101, 0, 100, 175, 'Espera para la primavera', cast('12/04/93' as datetime))
INSERT INTO inventario VALUES (
   50536, 101, 173, 100, 175, NULL, NULL)
INSERT INTO inventario VALUES (
   20106, 201, 220, 150, 260, NULL, NULL)
INSERT INTO inventario VALUES (
   20108, 201, 166, 150, 260, NULL, NULL)
INSERT INTO inventario VALUES (
   20201, 201, 320, 200, 350, NULL, NULL)
INSERT INTO inventario VALUES (
   20510, 201, 175, 100, 175, NULL, NULL)
INSERT INTO inventario VALUES (
   20512, 201, 162, 100, 175, NULL, NULL)
INSERT INTO inventario VALUES (
   30321, 201, 96, 80, 140, NULL, NULL)
INSERT INTO inventario VALUES (
   30326, 201, 147, 120, 210, NULL, NULL)
INSERT INTO inventario VALUES (
   30421, 201, 102, 80, 140, NULL, NULL)
INSERT INTO inventario VALUES (
   30426, 201, 200, 120, 210, NULL, NULL)
INSERT INTO inventario VALUES (
   30433, 201, 130, 130, 230, NULL, NULL)
INSERT INTO inventario VALUES (
   32779, 201, 180, 150, 260, NULL, NULL)
INSERT INTO inventario VALUES (
   32861, 201, 132, 80, 140, NULL, NULL)
INSERT INTO inventario VALUES (
   50169, 201, 225, 220, 385, NULL, NULL)
INSERT INTO inventario VALUES (
   50273, 201, 75, 60, 100, NULL, NULL)
INSERT INTO inventario VALUES (
   50417, 201, 82, 60, 100, NULL, NULL)
INSERT INTO inventario VALUES (
   50418, 201, 98, 60, 100, NULL, NULL)
INSERT INTO inventario VALUES (
   50419, 201, 77, 60, 100, NULL, NULL)
INSERT INTO inventario VALUES (
   50530, 201, 62, 60, 100, NULL, NULL)
INSERT INTO inventario VALUES (
   50532, 201, 67, 60, 100, NULL, NULL)
INSERT INTO inventario VALUES (
   50536, 201, 97, 60, 100, NULL, NULL)
INSERT INTO inventario VALUES (
   20510, 301, 69, 40, 100, NULL, NULL)
INSERT INTO inventario VALUES (
   20512, 301, 28, 20, 50, NULL, NULL)
INSERT INTO inventario VALUES (
   30321, 301, 85, 80, 140, NULL, NULL)
INSERT INTO inventario VALUES (
   30421, 301, 102, 80, 140, NULL, NULL)
INSERT INTO inventario VALUES (
   30433, 301, 35, 20, 35, NULL, NULL)
INSERT INTO inventario VALUES (
   32779, 301, 102, 95, 175, NULL, NULL)
INSERT INTO inventario VALUES (
   32861, 301, 57, 50, 100, NULL, NULL)
INSERT INTO inventario VALUES (
   40421, 301, 70, 40, 70, NULL, NULL)
INSERT INTO inventario VALUES (
   40422, 301, 65, 40, 70, NULL, NULL)
INSERT INTO inventario VALUES (
   41010, 301, 59, 40, 70, NULL, NULL)
INSERT INTO inventario VALUES (
   41020, 301, 61, 40, 70, NULL, NULL)
INSERT INTO inventario VALUES (
   41050, 301, 49, 40, 70, NULL, NULL)
INSERT INTO inventario VALUES (
   41080, 301, 50, 40, 70, NULL, NULL)
INSERT INTO inventario VALUES (
   41100, 301, 42, 40, 70, NULL, NULL)
INSERT INTO inventario VALUES (
   20510, 401, 88, 50, 100, NULL, NULL)
INSERT INTO inventario VALUES (
   20512, 401, 75, 75, 140, NULL, NULL)
INSERT INTO inventario VALUES (
   30321, 401, 102, 80, 140, NULL, NULL)
INSERT INTO inventario VALUES (
   30326, 401, 113, 80, 140, NULL, NULL)
INSERT INTO inventario VALUES (
   30421, 401, 85, 80, 140, NULL, NULL)
INSERT INTO inventario VALUES (
   30426, 401, 135, 80, 140, NULL, NULL)
INSERT INTO inventario VALUES (
   30433, 401, 0, 100, 175, 'Un envío defectuoso fué remitido a Hong 
Kong ' +
   'y fue necesario devolverlo. Lo antes que ACME puede reponerlo es ' 
+
   'a inicio de Febrero.', cast('07-SEP-92' as datetime))
INSERT INTO inventario VALUES (
   32779, 401, 135, 100, 175, NULL, NULL)
INSERT INTO inventario VALUES (
   32861, 401, 250, 150, 250, NULL, NULL)
INSERT INTO inventario VALUES (
   40421, 401, 47, 40, 70, NULL, NULL)
INSERT INTO inventario VALUES (
   40422, 401, 50, 40, 70, NULL, NULL)
INSERT INTO inventario VALUES (
   41010, 401, 80, 70, 220, NULL, NULL)
INSERT INTO inventario VALUES (
   41020, 401, 91, 70, 220, NULL, NULL)
INSERT INTO inventario VALUES (
   41050, 401, 169, 70, 220, NULL, NULL)
INSERT INTO inventario VALUES (
   41080, 401, 100, 70, 220, NULL, NULL)
INSERT INTO inventario VALUES (
   41100, 401, 75, 70, 220, NULL, NULL)
INSERT INTO inventario VALUES (
   50169, 401, 240, 200, 350, NULL, NULL)
INSERT INTO inventario VALUES (
   50273, 401, 224, 150, 280, NULL, NULL)
INSERT INTO inventario VALUES (
   50417, 401, 130, 120, 210, NULL, NULL)
INSERT INTO inventario VALUES (
   50418, 401, 156, 100, 175, NULL, NULL)
INSERT INTO inventario VALUES (
   50419, 401, 151, 150, 280, NULL, NULL)
INSERT INTO inventario VALUES (
   50530, 401, 119, 100, 175, NULL, NULL)
INSERT INTO inventario VALUES (
   50532, 401, 233, 200, 350, NULL, NULL)
INSERT INTO inventario VALUES (
   50536, 401, 138, 100, 175, NULL, NULL)
INSERT INTO inventario VALUES (
   10012, 10501, 300, 300, 525, NULL, NULL)
INSERT INTO inventario VALUES (
   10013, 10501, 314, 300, 525, NULL, NULL)
INSERT INTO inventario VALUES (
   10022, 10501, 502, 300, 525, NULL, NULL)
INSERT INTO inventario VALUES (
   10023, 10501, 500, 300, 525, NULL, NULL)
INSERT INTO inventario VALUES (
   20106, 10501, 150, 100, 175, NULL, NULL)
INSERT INTO inventario VALUES (
   20108, 10501, 222, 200, 350, NULL, NULL)
INSERT INTO inventario VALUES (
   20201, 10501, 275, 200, 350, NULL, NULL)
INSERT INTO inventario VALUES (
   20510, 10501, 57, 50, 87, NULL, NULL)
INSERT INTO inventario VALUES (
   20512, 10501, 62, 50, 87, NULL, NULL)
INSERT INTO inventario VALUES (
   30321, 10501, 194, 150, 275, NULL, NULL)
INSERT INTO inventario VALUES (
   30326, 10501, 277, 250, 440, NULL, NULL)
INSERT INTO inventario VALUES (
   30421, 10501, 190, 150, 275, NULL, NULL)
INSERT INTO inventario VALUES (
   30426, 10501, 423, 250, 450, NULL, NULL)
INSERT INTO inventario VALUES (
   30433, 10501, 273, 200, 350, NULL, NULL)
INSERT INTO inventario VALUES (
   32779, 10501, 280, 200, 350, NULL, NULL)
INSERT INTO inventario VALUES (
   32861, 10501, 288, 200, 350, NULL, NULL)
INSERT INTO inventario VALUES (
   40421, 10501, 97, 80, 140, NULL, NULL)
INSERT INTO inventario VALUES (
   40422, 10501, 90, 80, 140, NULL, NULL)
INSERT INTO inventario VALUES (
   41010, 10501, 151, 140, 245, NULL, NULL)
INSERT INTO inventario VALUES (
   41020, 10501, 224, 140, 245, NULL, NULL)
INSERT INTO inventario VALUES (
   41050, 10501, 157, 140, 245, NULL, NULL)
INSERT INTO inventario VALUES (
   41080, 10501, 159, 140, 245, NULL, NULL)
INSERT INTO inventario VALUES (
   41100, 10501, 141, 140, 245, NULL, NULL)



CREATE TABLE item 
(ord_id                     INT 
   CONSTRAINT item_ord_id_nn NOT NULL,
 item_id                    INT 
   CONSTRAINT item_item_id_nn NOT NULL,
 Id_producto                 INT 
   CONSTRAINT item_Id_producto_nn NOT NULL,
 precio                      DECIMAL(11,2),
 cantidad                   INT,
 cantidad_enviada           INT,
     CONSTRAINT item_ordid_itemid_pk PRIMARY KEY (ord_id, item_id),
     CONSTRAINT item_ordid_prodid_uk UNIQUE (ord_id, Id_producto))

INSERT INTO item VALUES (
   100, 1, 10011, 135, 500, 500)
INSERT INTO item VALUES (
   100, 2, 10013, 380, 400, 400)
INSERT INTO item VALUES (
   100, 3, 10021, 14, 500, 500)
INSERT INTO item VALUES (
   100, 5, 30326, 582, 600, 600)
INSERT INTO item VALUES (
   100, 7, 41010, 8, 250, 250)
INSERT INTO item VALUES (
   100, 6, 30433, 20, 450, 450)
INSERT INTO item VALUES (
   100, 4, 10023, 36, 400, 400)
INSERT INTO item VALUES (
   101, 1, 30421, 16, 15, 15)
INSERT INTO item VALUES (
   101, 3, 41010, 8, 20, 20)
INSERT INTO item VALUES (
   101, 5, 50169, 4.29, 40, 40)
INSERT INTO item VALUES (
   101, 6, 50417, 80, 27, 27)
INSERT INTO item VALUES (
   101, 7, 50530, 45, 50, 50)
INSERT INTO item VALUES (
   101, 4, 41100, 45, 35, 35)
INSERT INTO item VALUES (
   101, 2, 40422, 50, 30, 30)
INSERT INTO item VALUES (
   102, 1, 20108, 28, 100, 100)
INSERT INTO item VALUES (
   102, 2, 20201, 123, 45, 45)
INSERT INTO item VALUES (
   103, 1, 30433, 20, 15, 15)
INSERT INTO item VALUES (
   103, 2, 32779, 7, 11, 11)
INSERT INTO item VALUES (
   104, 1, 20510, 9, 7, 7)
INSERT INTO item VALUES (
   104, 4, 30421, 16, 35, 35)
INSERT INTO item VALUES (
   104, 2, 20512, 8, 12, 12)
INSERT INTO item VALUES (
   104, 3, 30321, 1669, 19, 19)
INSERT INTO item VALUES (
   105, 1, 50273, 22.89, 16, 16)
INSERT INTO item VALUES (
   105, 3, 50532, 47, 28, 28)
INSERT INTO item VALUES (
   105, 2, 50419, 80, 13, 13)
INSERT INTO item VALUES (
   106, 1, 20108, 28, 46, 46)
INSERT INTO item VALUES (
   106, 4, 50273, 22.89, 75, 75)
INSERT INTO item VALUES (
   106, 5, 50418, 75, 98, 98)
INSERT INTO item VALUES (
   106, 6, 50419, 80, 27, 27)
INSERT INTO item VALUES (
   106, 2, 20201, 123, 21, 21)
INSERT INTO item VALUES (
   106, 3, 50169, 4.29, 125, 125)
INSERT INTO item VALUES (
   107, 1, 20106, 11, 50, 50)
INSERT INTO item VALUES (
   107, 3, 20201, 115, 130, 130)
INSERT INTO item VALUES (
   107, 5, 30421, 16, 55, 55)
INSERT INTO item VALUES (
   107, 4, 30321, 1669, 75, 75)
INSERT INTO item VALUES (
   107, 2, 20108, 28, 22, 22)
INSERT INTO item VALUES (
   108, 1, 20510, 9, 9, 9)
INSERT INTO item VALUES (
   108, 6, 41080, 35, 50, 50)
INSERT INTO item VALUES (
   108, 7, 41100, 45, 42, 42)
INSERT INTO item VALUES (
   108, 5, 32861, 60, 57, 57)
INSERT INTO item VALUES (
   108, 2, 20512, 8, 18, 18)
INSERT INTO item VALUES (
   108, 4, 32779, 7, 60, 60)
INSERT INTO item VALUES (
   108, 3, 30321, 1669, 85, 85)
INSERT INTO item VALUES (
   109, 1, 10011, 140, 150, 150)
INSERT INTO item VALUES (
   109, 5, 30426, 18.25, 500, 500)
INSERT INTO item VALUES (
   109, 7, 50418, 75, 43, 43)
INSERT INTO item VALUES (
   109, 6, 32861, 60, 50, 50)
INSERT INTO item VALUES (
   109, 4, 30326, 582, 1500, 1500)
INSERT INTO item VALUES (
   109, 2, 10012, 175, 600, 600)
INSERT INTO item VALUES (
   109, 3, 10022, 21.95, 300, 300)
INSERT INTO item VALUES (
   110, 1, 50273, 22.89, 17, 17)
INSERT INTO item VALUES (
   110, 2, 50536, 50, 23, 23)
INSERT INTO item VALUES (
   111, 1, 40421, 65, 27, 27)
INSERT INTO item VALUES (
   111, 2, 41080, 35, 29, 29)
INSERT INTO item VALUES (
   97, 1, 20106, 9, 1000, 1000)
INSERT INTO item VALUES (
   97, 2, 30321, 1500, 50, 50)
INSERT INTO item VALUES (
   98, 1, 40421, 85, 7, 7)
INSERT INTO item VALUES (
   99, 1, 20510, 9, 18, 18)
INSERT INTO item VALUES (
   99, 2, 20512, 8, 25, 25)
INSERT INTO item VALUES (
   99, 3, 50417, 80, 53, 53)
INSERT INTO item VALUES (
   99, 4, 50530, 45, 69, 69)
INSERT INTO item VALUES (
   112, 1, 20106, 11, 50, 50)



CREATE TABLE textolargo 
(id                         INT 
   CONSTRAINT s_longtext_id_nn NOT NULL,
 usa_nombre_archivo        VARCHAR(1),
 nombre_archivo               VARCHAR(255),
 texto                       VARCHAR(2000),
     CONSTRAINT texto_largo_id_pk PRIMARY KEY (id),
     CONSTRAINT textolargo_usa_arc_nombre_ck
        CHECK (usa_nombre_archivo in ('S', 'N')))

INSERT INTO textolargo VALUES (
   1017, 'N', NULL, 
   'Rodilleras para todo tipo de actividades físicas incluyendo ' +
   'ciclismo y skating (4-ruedas, en-linea e hielo).  Tambien soporta ' 
+
   'actividades de esfuerzo como levantamiento de pesas.  El cierr de 
Velcro ' +
   'permite el fácil ajuste para cualquier talle.')
INSERT INTO textolargo VALUES (
   1019, 'N', NULL, 
   'Coderas para todo tipo de actividades físicas incluyendo ' +
   'ciclismo y skating (4-ruedas, en-linea e hielo).  Tambien soporta ' 
+
   'actividades de esfuerzo como levantamiento de pesas.  El cierr de 
Velcro ' +
   'permite el fácil ajuste para cualquier talle.')
INSERT INTO textolargo VALUES (
   1037, NULL, NULL, NULL)
INSERT INTO textolargo VALUES (
   1039, NULL, NULL, NULL)
INSERT INTO textolargo VALUES (
   1043, NULL, NULL, NULL)
INSERT INTO textolargo VALUES (
   1286, 'N', NULL, 
   'Pruebe la cantimplora Slaker Water.  Con su capacidad de 1 cuarto 
litro ' +
   'es la única cantimplora. Es liviana, durable, y garantizada de por 
vida.')
INSERT INTO textolargo VALUES (
   1368, NULL, NULL, NULL)
INSERT INTO textolargo VALUES (
   517, NULL, NULL, NULL)
INSERT INTO textolargo VALUES (
   518, 'N', NULL, 
   'Perfecta para el novato.')
INSERT INTO textolargo VALUES (
   519, 'N', NULL, 
   'Esta bota INTermedia viene en un paquete con los anclajes 
auto-ajustables ' +
   'que se adaptarán a sus habilidades y velocidad. Las botas son 
diseñadas ' +
   'para un agarre extra en slopes y saltos.')
INSERT INTO textolargo VALUES (
   520, 'N', NULL, 
   'La bota Pro ski boot es una bota avanceda que combinas alta 
tecnología con ' +
   'comfort.  Esta hecha de fibra.')
INSERT INTO textolargo VALUES (
   527, NULL, NULL, NULL)
INSERT INTO textolargo VALUES (
   528, 'N', NULL, 
   'Palo de aleación liviana de aluminio, viene en una variedad de 
tamaños y colore ' +
   'neon.  Agarres ajustables y Confortables.')
INSERT INTO textolargo VALUES (
   529, NULL, NULL, NULL)
INSERT INTO textolargo VALUES (
   530, NULL, NULL, NULL)
INSERT INTO textolargo VALUES (
   557, NULL, NULL, NULL)
INSERT INTO textolargo VALUES (
   587, NULL, NULL, NULL)
INSERT INTO textolargo VALUES (
   607, NULL, NULL, NULL)
INSERT INTO textolargo VALUES (
   613, NULL, NULL, NULL)
INSERT INTO textolargo VALUES (
   615, NULL, NULL, NULL)
INSERT INTO textolargo VALUES (
   676, NULL, NULL, NULL)
INSERT INTO textolargo VALUES (
   708, NULL, NULL, NULL)
INSERT INTO textolargo VALUES (
   780, NULL, NULL, NULL)
INSERT INTO textolargo VALUES (
   828, NULL, NULL, NULL)
INSERT INTO textolargo VALUES (
   833, NULL, NULL, NULL)
INSERT INTO textolargo VALUES (
   924, NULL, NULL, NULL)
INSERT INTO textolargo VALUES (
   925, NULL, NULL, NULL)
INSERT INTO textolargo VALUES (
   926, NULL, NULL, NULL)
INSERT INTO textolargo VALUES (
   927, NULL, NULL, NULL)
INSERT INTO textolargo VALUES (
   928, NULL, NULL, NULL)
INSERT INTO textolargo VALUES (
   929, NULL, NULL, NULL)
INSERT INTO textolargo VALUES (
   933, 'N', NULL, 
   'La mejor cubierta para mountain bike .')
INSERT INTO textolargo VALUES (
   940, NULL, NULL, NULL)



CREATE TABLE pedido 
(id                         INT 
   CONSTRAINT pedido_id_nn NOT NULL,
 id_cliente                INT 
   CONSTRAINT pedido_id_cliente_nn NOT NULL,
 fecha_pedido               DATETIME,
 fecha_enviado               DATETIME,
 Ventas_rep_id               INT,
 total                      DECIMAL(11,2),
 tipo_pago               VARCHAR(8),
 pedido_completo               VARCHAR(1),
     CONSTRAINT pedido_id_pk PRIMARY KEY (id),
     CONSTRAINT pedido_payment_type_ck
        CHECK (tipo_pago in ('EFECTIVO', 'CREDITO')),
     CONSTRAINT pedido_order_filled_ck
        CHECK (pedido_completo in ('S', 'N')))

INSERT INTO pedido VALUES (
   100, 204, cast('31/08/92' as datetime), cast('10/09/92' as datetime),
   11, 601100, 'CREDITO', 'S')
INSERT INTO pedido VALUES (
   101, 205, cast('31/08/92' as datetime), cast('15/09/92' as datetime),
   14, 8056.6, 'CREDITO', 'S')
INSERT INTO pedido VALUES (
   102, 206, cast('01/09/92' as datetime), cast('08/09/92' as datetime),
   15, 8335, 'CREDITO', 'S')
INSERT INTO pedido VALUES (
   103, 208, cast('02/09/92' as datetime), cast('22/09/92' as datetime),
   15, 377, 'EFECTIVO', 'S')
INSERT INTO pedido VALUES (
   104, 208, cast('03/09/92' as datetime), cast('23/09/92' as datetime),
   15, 32430, 'CREDITO', 'S')
INSERT INTO pedido VALUES (
   105, 209, cast('04/09/92' as datetime), cast('18/09/92' as datetime),
   11, 2722.24, 'CREDITO', 'S')
INSERT INTO pedido VALUES (
   106, 210, cast('07/09/92' as datetime), cast('15/09/92' as datetime),
   12, 15634, 'CREDITO', 'S')
INSERT INTO pedido VALUES (
   107, 211, cast('07/09/92' as datetime), cast('21/09/92' as datetime),
   15, 142171, 'CREDITO', 'S')
INSERT INTO pedido VALUES (
   108, 212, cast('07/09/92' as datetime), cast('10/09/92' as datetime),
   13, 149570, 'CREDITO', 'S')
INSERT INTO pedido VALUES (
   109, 213, cast('08/09/92' as datetime), cast('28/09/92' as datetime),
   11, 1020935, 'CREDITO', 'S')
INSERT INTO pedido VALUES (
   110, 214, cast('09/09/92' as datetime), cast('21/09/92' as datetime),
   11, 1539.13, 'EFECTIVO', 'S')
INSERT INTO pedido VALUES (
   111, 204, cast('09/09/92' as datetime), cast('21/09/92' as datetime),
   11, 2770, 'EFECTIVO', 'S')
INSERT INTO pedido VALUES (
   97, 201, cast('28/08/92' as datetime), cast('17/09/92' as datetime),
   12, 84000, 'CREDITO', 'S')
INSERT INTO pedido VALUES (
   98, 202, cast('31/08/92' as datetime), cast('10/09/92' as datetime),
   14, 595, 'EFECTIVO', 'S')
INSERT INTO pedido VALUES (
   99, 203, cast('31/08/92' as datetime), cast('18/09/92' as datetime),
   14, 7707, 'CREDITO', 'S')
INSERT INTO pedido VALUES (
   112, 210, cast('31/08/92' as datetime), cast('10/09/92' as datetime),
   12, 550, 'CREDITO', 'S')


CREATE TABLE producto 
(id                         INT 
   CONSTRAINT s_Id_producto_nn NOT NULL,
 nombre                       VARCHAR(50) 
   CONSTRAINT producto_name_nn NOT NULL,
 descripc_corta                 VARCHAR(255),
 texto_largo_id                INT,
 imagen_id                   INT,
 precio_sugerido      DECIMAL(11,2),
 unidades                VARCHAR(25),
     CONSTRAINT Id_producto_pk PRIMARY KEY (id),
     CONSTRAINT producto_name_uk UNIQUE (nombre))

INSERT INTO producto VALUES (
   10011, 'Bunny Boot',
   'Bota de ski para principiantes',
   518, 1001,
   150, NULL)
INSERT INTO producto VALUES (
   10012, 'Ace Ski Boot',
   'Bota de ski para INTermedios',
   519, 1002,
   200, NULL)
INSERT INTO producto VALUES (
   10013, 'Pro Ski Boot',
   'Bota de ski Avanzada',
   520, 1003,
   410, NULL)
INSERT INTO producto VALUES (
   10021, 'Bunny Ski Pole',
   'Bastón de ski principiantes',
   528, 1011,
   16.25, NULL)
INSERT INTO producto VALUES (
   10022, 'Ace Ski Pole',
   'Baston de ski INTermedio',
   529, 1012,
   21.95, NULL)
INSERT INTO producto VALUES (
   10023, 'Pro Ski Pole',
   'Baston de ski Avanzado',
   530, 1013,
   40.95, NULL)
INSERT INTO producto VALUES (
   20106, 'Pelota de Futbol Junior',
   'Pelota de Futbol Junior',
   613, NULL,
   11, NULL)
INSERT INTO producto VALUES (
   20108, 'Pelota de Futbol World Cup',
   'Pelota de Futbol World Cup',
   615, NULL,
   28, NULL)
INSERT INTO producto VALUES (
   20201, 'red de fútbol World Cup',
   'red de fútbol World Cup',
   708, NULL,
   123, NULL)
INSERT INTO producto VALUES (
   20510, 'Rodilleras Black Hawk ',
   'Rodill. par',
   1017, NULL,
   9, NULL)
INSERT INTO producto VALUES (
   20512, 'Coderas Black Hawk',
   'Coder. par',
   1019, NULL,
   8, NULL)
INSERT INTO producto VALUES (
   30321, 'Bicicleta Grand Prix',
   'Bicicleta de calle',
   828, 1291,
   1669, NULL)
INSERT INTO producto VALUES (
   30326, 'Himalaya Bicycle',
   'Bicicleta de Montaña ',
   833, 1296,
   582, NULL)
INSERT INTO producto VALUES (
   30421, 'Cubiertas Grand Prix Bicycle',
   'Cubiertas de calle',
   927, NULL,
   16, NULL)
INSERT INTO producto VALUES (
   30426, 'Himalaya Tires',
   'Cubiertas de Montaña',
   933, NULL,
   18.25, NULL)
INSERT INTO producto VALUES (
   30433, 'New Air Pump',
   'Inflador',
   940, NULL,
   20, NULL)
INSERT INTO producto VALUES (
   32779, 'Slaker Water Bottle',
   'Cantimplora',
   1286, NULL,
   7, NULL)
INSERT INTO producto VALUES (
   32861, 'Safe-T Helmet',
   'Casco Ciclista',
   1368, 1829,
   60, NULL)
INSERT INTO producto VALUES (
   40421, 'Alexeyer Pro Lifting Bar',
   'Porta Bicicleta para auto',
   928, 1381,
   65, NULL)
INSERT INTO producto VALUES (
   40422, 'Pro Curling Bar',
   'Barra de pesas Curling ',
   929, 1382,
   50, NULL)
INSERT INTO producto VALUES (
   41010, 'Prostar 10 Pound Weight',
   'Pesa de diez libras',
   517, NULL,
   8, NULL)
INSERT INTO producto VALUES (
   41020, 'Prostar 20 Pound Weight',
   'Pesa de veINTe libras',
   527, NULL,
   12, NULL)
INSERT INTO producto VALUES (
   41050, 'Prostar 50 Pound Weight',
   'pesa de cincuenta libras',
   557, NULL,
   25, NULL)
INSERT INTO producto VALUES (
   41080, 'Prostar 80 Pound Weight',
   'pesa de ochenta libras',
   587, NULL,
   35, NULL)
INSERT INTO producto VALUES (
   41100, 'Prostar 100 Pound Weight',
   'pesa de cien libras',
   607, NULL,
   45, NULL)
INSERT INTO producto VALUES (
   50169, 'Major League Baseball',
   'Baseball',
   676, 1119,
   4.29, NULL)
INSERT INTO producto VALUES (
   50273, 'Chapman Helmet',
   'Casco de bateador',
   780, 1223,
   22.89, NULL)
INSERT INTO producto VALUES (
   50417, 'Griffey Glove',
   'Guante de outfielder',
   924, 1367,
   80, NULL)
INSERT INTO producto VALUES (
   50418, 'Alomar Glove',
   'Guantes de Infielder',
   925, 1368,
   75, NULL)
INSERT INTO producto VALUES (
   50419, 'Steinbach Glove',
   ' Guante de Catcher ',
   926, 1369,
   80, NULL)
INSERT INTO producto VALUES (
   50530, 'Cabrera Bat',
   'Bate de treINTa pulgadas',
   1037, 1480,
   45, NULL)
INSERT INTO producto VALUES (
   50532, 'Puckett Bat',
   'Bate de treINTa y dos pulgadas',
   1039, 1482,
   47, NULL)
INSERT INTO producto VALUES (
   50536, 'Winfield Bat',
   'Bate de treINTa y seis pulgadas',
   1043, 1486,
   50, NULL)



CREATE TABLE region 
(id                         INT 
   CONSTRAINT s_id_region_nn NOT NULL,
 name                       VARCHAR(50) 
   CONSTRAINT region_name_nn NOT NULL,
     CONSTRAINT s_id_region_pk PRIMARY KEY (id),
     CONSTRAINT region_name_uk UNIQUE (name))

INSERT INTO region VALUES (
   1, 'America del Norte')
INSERT INTO region VALUES (
   2, 'America del Sur')
INSERT INTO region VALUES (
   3, 'Africa / Medio Oriente')
INSERT INTO region VALUES (
   4, 'Asia')
INSERT INTO region VALUES (
   5, 'Europa')



CREATE TABLE titulo
(titulo                      VARCHAR(25) 
   CONSTRAINT titulo_title_nn NOT NULL,
	CONSTRAINT titulo_title_pk PRIMARY KEY (titulo))

INSERT INTO titulo VALUES ('Presidente')
INSERT INTO titulo VALUES ('Representante de Ventas')
INSERT INTO titulo VALUES ('Agente de Stock')
INSERT INTO titulo VALUES ('VP, Administracion')
INSERT INTO titulo VALUES ('VP, Finanzas')
INSERT INTO titulo VALUES ('VP, Operaciones')
INSERT INTO titulo VALUES ('VP, Ventas')
INSERT INTO titulo VALUES ('Jefe de almacenes')



CREATE TABLE almacenes 
(id                         INT 
   CONSTRAINT s_id_almacenes_nn NOT NULL,
 region_id                  INT 
   CONSTRAINT s_id_almacenes_region_nn NOT NULL,
 direccion                    VARCHAR(200),
 ciudad                       VARCHAR(30),
 estado                      VARCHAR(20),
 pais                    VARCHAR(30),
 cod_postal                   VARCHAR(75),
 telefono                      VARCHAR(25),
 id_jefe                 INT,
     CONSTRAINT s_id_almacenes_pk PRIMARY KEY (id))

INSERT INTO almacenes VALUES (
   101, 1,
   '283 King Street',
   'Seattle', 'WA', 'USA',
   NULL,
   NULL, 6)
INSERT INTO almacenes VALUES (
   10501, 5,
   '5 Modrany',
   'Bratislava', NULL, 'Checoeslovaquia',
   NULL,
   NULL, 10)
INSERT INTO almacenes VALUES (
   201, 2,
   '68 Via Centrale',
   'San Pablo', NULL, 'Brasil',
   NULL,
   NULL, 7)
INSERT INTO almacenes VALUES (
   301, 3,
   '6921 King Way',
   'Lagos', NULL, 'Nigeria',
   NULL,
   NULL, 8)
INSERT INTO almacenes VALUES (
   401, 4,
   '86 Chu Street',
   'Hong Kong', NULL, NULL,
   NULL,
   NULL, 9)

-- Add foreign key constraints.

ALTER TABLE depto 
   ADD CONSTRAINT depto_id_region_fk
   FOREIGN KEY (id_region) REFERENCES region (id)
ALTER TABLE empleados 
   ADD CONSTRAINT empleados_id_jefe_fk
   FOREIGN KEY (id_jefe) REFERENCES empleados (id)
ALTER TABLE empleados 
   ADD CONSTRAINT empleados_dept_id_fk
   FOREIGN KEY (depto_id) REFERENCES depto (id)
ALTER TABLE empleados 
   ADD CONSTRAINT empleadotitulo_fk
   FOREIGN KEY (titulo) REFERENCES titulo (titulo)
ALTER TABLE clientes 
   ADD CONSTRAINT Ventas_rep_id_fk
   FOREIGN KEY (id_vendedor) REFERENCES empleados (id)
ALTER TABLE clientes 
   ADD CONSTRAINT clientes_id_region_fk
   FOREIGN KEY (id_region) REFERENCES region (id)
ALTER TABLE pedido 
   ADD CONSTRAINT pedido_id_cliente_fk
   FOREIGN KEY (id_cliente) REFERENCES clientes (id)
ALTER TABLE pedido 
   ADD CONSTRAINT pedido_Ventas_rep_id_fk
   FOREIGN KEY (Ventas_rep_id) REFERENCES empleados (id)
ALTER TABLE producto 
   ADD CONSTRAINT producto_image_id_fk
   FOREIGN KEY (imagen_id) REFERENCES imagen (id)
ALTER TABLE producto 
   ADD CONSTRAINT producto_longtext_id_fk
   FOREIGN KEY (texto_largo_id) REFERENCES textolargo (id)
ALTER TABLE item 
   ADD CONSTRAINT item_ord_id_fk
   FOREIGN KEY (ord_id) REFERENCES pedido (id)
ALTER TABLE item 
   ADD CONSTRAINT item_Id_producto_fk
   FOREIGN KEY (Id_producto) REFERENCES producto (id)
ALTER TABLE almacenes 
   ADD CONSTRAINT id_almacenes_jefe_fk
   FOREIGN KEY (id_jefe) REFERENCES empleados (id)
ALTER TABLE almacenes 
   ADD CONSTRAINT id_almacenes_region_fk
   FOREIGN KEY (region_id) REFERENCES region (id)
ALTER TABLE inventario 
   ADD CONSTRAINT inventario_Id_producto_fk
   FOREIGN KEY (Id_producto) REFERENCES producto (id)
ALTER TABLE inventario 
   ADD CONSTRAINT inventario_id_almacenes_fk
   FOREIGN KEY (id_almacenes) REFERENCES almacenes (id)

