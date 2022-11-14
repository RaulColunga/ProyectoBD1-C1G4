GO
CREATE DATABASE bd_genetica
GO
USE bd_genetica
GO

CREATE TABLE Dominio(
    idDominio int identity(1,1),
	nombre varchar(30) not null,

	CONSTRAINT PK_Dominio PRIMARY KEY(idDominio),
	CONSTRAINT UK_Dominio_nombre UNIQUE(nombre)
);

CREATE TABLE Reino(
	idReino int identity(1,1),
    idDominio int not null,
	nombre varchar(30) not null,

	CONSTRAINT PK_Reino PRIMARY KEY(idReino,idDominio),
	CONSTRAINT FK_Reino_Dominio FOREIGN KEY (idDominio) REFERENCES Dominio(idDominio),
	CONSTRAINT UK_Reino_nombre UNIQUE(nombre)
);

CREATE TABLE Filo(
    idFilo int identity(1,1),
    idReino int not null,
    idDominio int not null,
	nombre varchar(30) not null,

	CONSTRAINT PK_filo PRIMARY KEY(idFilo, idReino, idDominio),
	CONSTRAINT FK_Filo_Reino FOREIGN KEY (idReino, idDominio) REFERENCES Reino(idReino,idDominio),
	CONSTRAINT UK_Filo_nombre UNIQUE(nombre)
);

CREATE TABLE Clase(
    idClase int identity(1,1),
    idFilo int not null,
    idReino int not null,
    idDominio int not null,
	nombre varchar(50) not null,

	CONSTRAINT PK_Clase PRIMARY KEY(idClase, idFilo, idReino, idDominio),
	CONSTRAINT FK_Clase_Filo FOREIGN KEY (idFilo, idReino, idDominio) REFERENCES Filo(idFilo, idReino,idDominio),
	CONSTRAINT UK_Clase_nombre UNIQUE(nombre)
);

CREATE TABLE Orden(
    idOrden int identity(1,1),
    idClase int not null,
    idFilo int not null,
    idReino int not null,
    idDominio int not null,
	nombre varchar(50) not null,

	CONSTRAINT PK_Orden PRIMARY KEY(idOrden, idClase, idFilo, idReino, idDominio),
	CONSTRAINT FK_Orden_Clase FOREIGN KEY (idClase, idFilo, idReino, idDominio) 
	REFERENCES Clase(idClase, idFilo, idReino,idDominio),
	CONSTRAINT UK_Orden_nombre UNIQUE(nombre)
);

CREATE TABLE Familia(
    idFamilia int identity(1,1),
    idOrden int not null,
    idClase int not null,
    idFilo int not null,
    idReino int not null,
    idDominio int not null,
	nombre varchar(50) not null,

	CONSTRAINT PK_familia PRIMARY KEY(idFamilia,idOrden, idClase, idFilo, idReino, idDominio),
	CONSTRAINT FK_Familia_Orden FOREIGN KEY (idOrden, idClase, idFilo, idReino, idDominio) 
	REFERENCES Orden(idOrden, idClase, idFilo, idReino,idDominio),
	CONSTRAINT UK_Familia_nombre UNIQUE(nombre)
);

CREATE TABLE Genero(
    idGenero int identity(1,1),
    idFamilia int not null,
    idOrden int not null,
    idClase int not null,
    idFilo int not null,
    idReino int not null,
    idDominio int not null,
	nombre varchar(50) not null,

	CONSTRAINT PK_Genero PRIMARY KEY(idGenero, idFamilia,idOrden, idClase, idFilo, idReino, idDominio),
	CONSTRAINT FK_Genero_FamiliaFOREIGN FOREIGN KEY (idFamilia, idOrden, idClase, idFilo, idReino, idDominio)
	REFERENCES Familia(idFamilia ,idOrden, idClase, idFilo, idReino,idDominio),
	CONSTRAINT UK_Genero_nombre UNIQUE(nombre)
);


CREATE TABLE Especie(
    idEspecie int identity(1,1),
	idGenero int not null,
    idFamilia int not null,
    idOrden int not null,
    idClase int not null,
    idFilo int not null,
    idReino int not null,
    idDominio int not null,
	epitetoEspecifico varchar(50) not null,

	CONSTRAINT PK_Especie PRIMARY KEY(idEspecie, idGenero, idFamilia,idOrden, idClase, idFilo, idReino, idDominio),
	CONSTRAINT FK_Especie_Genero FOREIGN KEY (idGenero, idFamilia, idOrden, idClase, idFilo, idReino, idDominio) 
	REFERENCES Genero(idGenero, idFamilia ,idOrden, idClase, idFilo, idReino,idDominio)
	--epitetoEspecifico no debe ser UNIQUE, a diferencia del resto
);

CREATE TABLE Gen(
    idGen int identity(1,1) PRIMARY KEY,
	nombre varchar(70) not null,
	secuencia varchar(Max) not null,

	CONSTRAINT UK_Gen_nombreGen UNIQUE(nombre)
);

CREATE TABLE MetodoDeSecuenciacion(
	idMetodoSec int identity(1,1) PRIMARY KEY,
	nombre varchar(50) not null,

	CONSTRAINT UK_MetodoDeSecuenciacion_nombre UNIQUE(nombre)
);

CREATE TABLE Organela(
	idOrganela int identity(1,1) PRIMARY KEY,
	nombre varchar(50) not null 

	CONSTRAINT UK_Organela_nombre UNIQUE(nombre)
);

CREATE TABLE Conformacion(
	idConformacion int identity(1,1) PRIMARY KEY,
	nombre varchar(50) not null 

	CONSTRAINT UK_Conformacion_nombre UNIQUE(nombre)
);

CREATE TABLE SecuenciaDeNucleotidos(
	idSecNucleot int identity(1,1) PRIMARY KEY,
    secuencia  varchar(Max) not null,
	fechaRegistro date not null,
	idMetodoSec int not null,
	anotaciones varchar(300), --permite nulos
	idOrganela int not null,
	nroCromosoma int,         --permite nulos 
	idConformacion int not null,
	--campos de especie
	idEspecie int not null,
	idGenero int not null,
    idFamilia int not null,
    idOrden int not null,
    idClase int not null,
    idFilo int not null,
    idReino int not null,
    idDominio int not null,
	
	
	CONSTRAINT fk_SecuenciaNucl_MetodoSec 
	FOREIGN KEY (idMetodoSec) 
	REFERENCES MetodoDeSecuenciacion(idMetodoSec),

	CONSTRAINT fk_SecuenciaNucl_Organela 
	FOREIGN KEY (idOrganela) 
	REFERENCES Organela(idOrganela),

	CONSTRAINT fk_SecuenciaNucl_Conformacion 
	FOREIGN KEY (idConformacion) 
	REFERENCES Conformacion(idConformacion),

	CONSTRAINT fk_SecuenciaNucl_Especie
	FOREIGN KEY (idEspecie, idGenero, idFamilia, idOrden, idClase, idFilo, idReino,	idDominio)
	REFERENCES Especie(idEspecie, idGenero, idFamilia, idOrden, idClase, idFilo, idReino,	idDominio)
);

CREATE TABLE Titulo(
	idTitulo int identity(1,1) not null PRIMARY KEY,
	titulo varchar(40),

	CONSTRAINT UK_Titulo_titulo UNIQUE(titulo)
);

CREATE TABLE Autor(
	idAutor int identity(1,1) PRIMARY KEY,
	nombre varchar(30) not null,
	apellido varchar(30) not null,
	dni int not null,
	descrEspecialidad varchar(200), --permite nulos
	idMaxTitulo int --permite nulos
	
	CONSTRAINT Fk_Autor_Titulo
	FOREIGN KEY (idMaxTitulo)
	REFERENCES Titulo(idTitulo),

	CONSTRAINT UK_Autor_dni UNIQUE(dni)
);

CREATE TABLE Pais (
id int not null identity(1,1),
iso varchar(2),
nombre varchar(80),

CONSTRAINT pk_pais PRIMARY KEY (id)
);


CREATE TABLE Revista_Cientifica (
	idRevistaCientif int identity(1,1) PRIMARY KEY,
	nombreRevista varchar(50) not null,
	idPais int not null,
	
	CONSTRAINT FK_Revista_Pais
	FOREIGN KEY(idPais)
	REFERENCES Pais(idPais)
);

CREATE TABLE Publicacion (
	idPublicacion int identity(1,1) PRIMARY KEY,
	tituloPublicacion varchar(250) not null,
	fechaPub date not null,
	idRevistaCientif int not null,
	
	CONSTRAINT FK_Publicacion_Revista
	FOREIGN KEY(idRevistaCientif)
	REFERENCES Revista_Cientifica(idRevistaCientif)
);

CREATE TABLE Autor_Publicacion(
	idAutor int not null,
	idPublicacion int not null,
	CONSTRAINT PK_Autor_Publicacion PRIMARY KEY (idAutor,idPublicacion),

	CONSTRAINT FK_Autor
	FOREIGN KEY(idAutor)
	REFERENCES Autor(idAutor),

	CONSTRAINT FK_Publicacion
	FOREIGN KEY(idPublicacion)
	REFERENCES Publicacion(idPublicacion)
);

CREATE TABLE Secuencia_Autor(
	idSecNucleot int not null,
	idAutor int not null,
	CONSTRAINT PK_Secuencia_Autor PRIMARY KEY (idSecNucleot, idAutor),

	CONSTRAINT FK_SecuenciaAutor_Secuencia
	FOREIGN KEY(idSecNucleot)
	REFERENCES SecuenciaDeNucleotidos(idSecNucleot),

	CONSTRAINT FK_SecuenciaAutor_Autor
	FOREIGN KEY(idAutor)
	REFERENCES Autor(idAutor)
);

CREATE TABLE Secuencia_Publicacion ( 
	idSecNucleot int not null,
	idPublicacion int not null,
	CONSTRAINT PK_Secuencia_Publicacion PRIMARY KEY (idSecNucleot, idPublicacion),

	CONSTRAINT FK_SecuenciaPublicacion_Secuencia
	FOREIGN KEY(idSecNucleot)
	REFERENCES SecuenciaDeNucleotidos(idSecNucleot),

	CONSTRAINT FK_SecuenciaPublicacion_Publicacion
	FOREIGN KEY(idPublicacion)
	REFERENCES Publicacion(idPublicacion)
);

CREATE TABLE Secuencia_Gen(
	idGen int not null,
    idSecNucleot int not null,
	
	CONSTRAINT PK_Secuencia_Gen PRIMARY KEY(idGen, idSecNucleot),

	CONSTRAINT FK_SecuenciaGen_Gen
	FOREIGN KEY(idGen)
	REFERENCES Gen(idGen),

	CONSTRAINT FK_SecuenciaGen_SecNucl 
	FOREIGN KEY (idSecNucleot) 
	REFERENCES SecuenciaDeNucleotidos(idSecNucleot)
);

CREATE TABLE Secuencia_Gen_Potencial(
	idGen int not null,
    idSecNucleot int not null,
	
	CONSTRAINT PK_SecuenciaGenPotencial PRIMARY KEY(idGen, idSecNucleot),

	CONSTRAINT FK_SecuenciaGenPotencial_Gen
	FOREIGN KEY(idGen)
	REFERENCES Gen(idGen),

	CONSTRAINT FK_SecuenciaGenPotencial_SecNucl 
	FOREIGN KEY (idSecNucleot) 
	REFERENCES SecuenciaDeNucleotidos(idSecNucleot)
);

