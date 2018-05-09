USE Lucio_71983

DROP TABLE DetalleFactura
DROP TABLE Peliculas
DROP TABLE Categorias
DROP TABLE Factura
DROP TABLE Socios

CREATE TABLE Socios
(NroSocio INTEGER,
Apellido VARCHAR(50) NOT NULL,
Nombre VARCHAR(50) DEFAULT 'Sin nombre',
NroIngBrutos VARCHAR(10) UNIQUE,
CUIT VARCHAR(10) UNIQUE,
Calle VARCHAR(50),
NroCalle VARCHAR(5),
CondIva VARCHAR(10),
FechaAlta DATETIME,
CONSTRAINT Socios_PK PRIMARY KEY(NroSocio),
CONSTRAINT Socios_alta_ch CHECK(FechaAlta>=getDate())
)

CREATE TABLE Factura
(Tipo VARCHAR(3),
Numero INTEGER,
FechaEmision DATETIME,
NroSocio INTEGER,
CondVenta VARCHAR(10),
Total DECIMAL(8,2),
CONSTRAINT Factura_TipoNro_PK PRIMARY KEY(Tipo, Numero),
CONSTRAINT Factura_NroSocio_FK FOREIGN KEY(NroSocio)
	REFERENCES Socios(NroSocio),
CONSTRAINT Factura_FechaEmision_ch CHECK(FechaEmision>=getDate()),
)

CREATE TABLE Categorias
(IdCategoria VARCHAR(5),
Nombre VARCHAR(30),
CONSTRAINT Categorias_Id_PK PRIMARY KEY(IdCategoria),
)

CREATE TABLE Peliculas
(CodPelicula VARCHAR(10),
Nombre VARCHAR(50),
IdCategoria VARCHAR(5),
CONSTRAINT Peliculas_Cod_PK PRIMARY KEY(CodPelicula),
CONSTRAINT Peliculas_IdCategoria_FK FOREIGN KEY(IdCategoria)
	REFERENCES Categorias(IdCategoria),
)

CREATE TABLE DetalleFactura
(TipoFactura VARCHAR(3),
NroFactura INTEGER,
CodPelicula VARCHAR(10),
FechaPreviaDev DATETIME,
FechaRealDev DATETIME,
CONSTRAINT DetalleFactura_TipoNroCod_PK PRIMARY KEY(TipoFactura, NroFactura, CodPelicula),
CONSTRAINT DetalleFactura_TipoNroFactura_FK FOREIGN KEY(TipoFactura, NroFactura)
	REFERENCES Factura(Tipo, Numero),
CONSTRAINT Detalle_FechaPreviaDev_ch CHECK(FechaPreviaDev>=getDate()),
CONSTRAINT Detalle_FechaRealDev_ch CHECK(FechaRealDev>=FechaPreviaDev),
)

