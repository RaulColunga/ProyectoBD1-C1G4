
-----------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCION ALMACENADA --------Devuelve una tabla con las idSecNucleot de todas las filas de
--[SecuenciaDeNucleotidos] que posean la secuencia del idGen ingresado como parámetro-------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------

CREATE FUNCTION F_buscarGenPotencial (@pidGen int) RETURNS TABLE
AS
RETURN  
   (SELECT idSecNucleot
	FROM SecuenciaDeNucleotidos
	WHERE secuencia like concat('%',(SELECT secuencia FROM Gen WHERE idGen = @pidGen) ,'%'));

----------------------------------------------------------------------------------------------------------------------------
-- PROCEDIMIENTO que tiene como entrada un idGen. Utiliza la [secuencia] de ese Gen de entrada para 
-- verificar si esa [secuencia] existe en alguna entrada de la tabla 
-- [SecuenciaDeNucleotidos]. Almacena una referencia en la tabla Secuencia_Gen_Potencial ---------------------------------------------------
-- por cada SecuenciaDeNucleotidos que contenga la secuencia del Gen de entrada-
-----------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE SP_almacenarGenPotencial
@pidGen int
AS
declare @temp table(idSecNucleot int);
insert into @temp(idSecNucleot) select idSecNucleot from F_buscarGenPotencial(@pidGen); --Utiliza la funcion previa
declare @count int = (select count(*) from @temp);

while @count > 0
BEGIN
	declare @idSecNucleot int = (select top(1) idSecNucleot from @temp order by idSecNucleot)
	INSERT INTO Secuencia_Gen_Potencial(idGen, idSecNucleot) VALUES(@pidGen,@idSecNucleot);
	delete @temp where idSecNucleot = @idSecNucleot;
	set @count = (select count(*) from @temp);
END
--------------------------------------------------------------------------------------
-----PROCEDIMIENTO ESCANEAR GENES ----------------------------------------------------
--------------------------------------------------------------------------------------
CREATE PROCEDURE SP_escanearGenes
AS
declare @temp table(idGen int);
insert into @temp(idGen) select idGen from Gen;
declare @count int = (select count(*) from @temp);

while @count > 0
BEGIN
	declare @idGen int = (select top(1) idGen from @temp order by idGen)
	EXEC SP_buscarGenPotencial_test @idGen
	delete @temp where idGen = @idGen;
	set @count = (select count(*) from @temp);
END
------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------
----------------VISTA DE ESPECIES CON SUS TAXONES----------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------

CREATE VIEW vw_especies_taxon
AS
SELECT dom.nombre 'Dominio', r.nombre 'Reino', fil.nombre 'Filo', c.nombre 'Clase', 
o.nombre 'Orden', f.nombre 'Familia',  g.nombre 'Género', sp.epitetoEspecifico 'Epíteto específico',
sp.idEspecie, sp.idGenero, sp.idFamilia, sp.idOrden, sp.idClase, sp.idFilo, sp.idReino, sp.idDominio
FROM Especie sp INNER JOIN Genero g ON (sp.idGenero = g.idGenero)
INNER JOIN Familia f ON (g.idFamilia = f.idFamilia)
INNER JOIN Orden o ON (f.idOrden = o.idOrden)
INNER JOIN Clase c ON (c.idClase = o.idClase)
INNER JOIN Filo fil ON (c.idFilo = fil.idFilo)
INNER JOIN Reino r ON (fil.idReino = r.idReino)
INNER JOIN Dominio dom ON (r.idDominio = dom.idDominio)

SELECT * FROM vw_especies_taxon;
---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------
---------------FUNCION BUSCAR ESPECIE-----utiliza la vista vw_especies_taxon ------------------------------------
----------ingresar string del nombre de género y epíteto específico y devuelve la fila de tal especie--------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
CREATE FUNCTION buscarEspecie (@genero varchar(50), @epEsp varchar(50)) RETURNS TABLE
AS
	RETURN 
	SELECT * FROM vw_especies_taxon
	WHERE (Género = @genero) AND ([Epíteto específico] = @epEsp)

--test--
SELECT * FROM buscarEspecie('Canis', 'lupus');


-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
--PROCEDIMIENTO para simplificar INSERCIÓN en la tabla [SecuenciaDeNucleotidos]-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE SP_insertarSecuencia2 (@secuencia varchar(Max), @fechaRegistro Date, @metodoSec varchar(50),
@anotaciones varchar(300), @organela varchar(30), @cromosoma int, @conformacion varchar(30), @genero varchar(50),
@epEsp varchar(50))
AS
IF (SELECT COUNT(*) FROM buscarEspecie(@genero, @epEsp)) > 0
	BEGIN
	declare @idConformacion int = (SELECT idConformacion FROM Conformacion WHERE nombre = @conformacion);
	declare @idOrganela int = (SELECT idOrganela FROM Organela WHERE nombre = @organela);
	declare @idMetodoSec int = (SELECT idMetodoSec FROM MetodoDeSecuenciacion WHERE nombre like concat('%',@metodoSec,'%'));
	declare @idEspecie int = (SELECT idEspecie FROM buscarEspecie(@genero, @epEsp));
	declare @idGenero int = (SELECT idGenero FROM buscarEspecie(@genero, @epEsp));
	declare @idFamilia int = (SELECT idFamilia FROM buscarEspecie(@genero, @epEsp));
	declare @idOrden int = (SELECT idOrden FROM buscarEspecie(@genero, @epEsp));
	declare @idClase int = (SELECT idClase FROM buscarEspecie(@genero, @epEsp));
	declare @idFilo int = (SELECT idFilo FROM buscarEspecie(@genero, @epEsp));
	declare @idReino int = (SELECT idReino FROM buscarEspecie(@genero, @epEsp));
	declare @idDominio int = (SELECT idDominio FROM buscarEspecie(@genero, @epEsp));
	INSERT INTO SecuenciaDeNucleotidos(secuencia, fechaRegistro, idMetodoSec, 
	anotaciones, idOrganela, nroCromosoma, idConformacion, idEspecie, idGenero, idFamilia, idOrden, idClase, idFilo, 
	idReino, idDominio)
	VALUES(@secuencia, @fechaRegistro, @idMetodoSec, @anotaciones, @idOrganela, @cromosoma, @idConformacion,
	@idEspecie, @idGenero, @idFamilia, @idOrden, @idClase, @idFilo, @idReino, @idDominio);
	END
ELSE 
	BEGIN
	print('El nombre de especie no existe');
	END


----TEST-------
EXEC SP_insertarSecuencia2 'TGTGTGGTGTGTG', '20010513', 'Método Enzimático de Sanger', 'asd', 'Mitocondria', 3, 'Lineal', 'Canis', 'familiaris'

------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

----SELECT * FROM Gen
----WHERE secuencia != ('%A%') OR '%G%' OR '%C%' OR '%T%')

----SELECT LEN(TRIM('     t   '))
----SELECT REPLACE(REPLACE('ccccctcctcttcccc', 'c', ' '), 't', ' ');
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------FUNCION QUE DEVUELVE 0 si la secuencia ingresada contiene solamente caracteres 'A', 'C', 'G' y 'T'
--------ES DECIR, devuelve 0 si la secuencia tiene el formato CORRECTO----------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------

CREATE FUNCTION F_secError2(@secuencia varchar(Max)) RETURNS int
AS
BEGIN
	RETURN LEN(TRIM(REPLACE(REPLACE(REPLACE(REPLACE(@secuencia, 'A', ''), 'T', ''), 'C', ''), 'G', '')))
END

SELECT dbo.F_secError2('GGTGTAGTTCGA')
------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----TRIGGER que impide agregar secuencias de Gen que no tengan el formato correcto--------------------------------------
-----solo se puede insertar un string que tenga solo caracteres 'A', 'T', 'C' o 'G', si hay cualquier otro caracter,
-----el trigger impide insertar el Gen----------------------------------------------------------------------------------

CREATE TRIGGER TR_check_formato_secuencia
ON Gen
INSTEAD OF INSERT
AS
IF (SELECT dbo.F_secError(secuencia) FROM inserted) = 0
	BEGIN
	declare @nombre varchar(50) = (SELECT nombre FROM inserted)
	declare @secuencia varchar(Max) = (SELECT secuencia FROM inserted)
	INSERT INTO Gen(nombre, secuencia) VALUES(@nombre, @secuencia)
	print('Gen insertado');
	END
ELSE
print('Formato de secuencia del Gen INCORRECTO. No fue posible insertar el Gen en la base de datos. Revise la secuencia, dado que existen caracteres incompatibles.');
RETURN;


INSERT INTO Gen(nombre, secuencia) VALUES('GenCorrecto', 'TTGTTATTGTGAACA');
INSERT INTO Gen(nombre, secuencia) VALUES('GenCorrecto2', 'TTGGGTCA  CCACGATCA');
INSERT INTO Gen(nombre, secuencia) VALUES('GenError1', 'TTGG.GTCACCACGATCA');
INSERT INTO Gen(nombre, secuencia) VALUES('GenError3', 'TTGGGT CA,CCA 6CGATCA');

SELECT dbo.F_secError2('ATTATCGGTGGTAC') as 'Sin error', dbo.F_secError2('ATTATCGJGTGGTAQC') as 'Con error';

------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
----VISTA MÀS COMPLETA------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
-----TESTEO --> testeo ok
SELECT nombre FROM Conformacion
WHERE idConformacion = 1;

SELECT Conf.nombre FROM (SELECT idConformacion, nombre FROM Conformacion) as Conf
WHERE idConformacion = 1;

--consulta de vista
SELECT sec.idSecNucleot, sec.secuencia, sec.fechaRegistro,
ms.nombre, org.nombre, conf.nombre, nroCromosoma, concat(sp.Género, ' ',sp.[Epíteto específico]) as 'Especie', 
sec.anotaciones
FROM SecuenciaDeNucleotidos as sec 
INNER JOIN MetodoDeSecuenciacion as ms ON (sec.idMetodoSec = ms.idMetodoSec)
INNER JOIN Organela as org ON (org.idOrganela = sec.idOrganela)
INNER JOIN Conformacion as conf ON (conf.idConformacion = sec.idConformacion)
INNER JOIN vw_especies_taxon as sp ON (
	sec.idDominio = sp.idDominio AND sec.idReino = sp.idReino AND sec.idFilo = sp.idFilo AND sec.idClase = sp.idClase
	AND sec.idOrden = sp.idOrden AND sec.idFamilia = sp.idFamilia AND sec.idGenero = sp.idGenero 
	AND sec.idEspecie = sp.idEspecie
)

--vista
CREATE VIEW vw_vistaSecNucleotidos
AS
SELECT sec.idSecNucleot, sec.secuencia, sec.fechaRegistro,
ms.nombre 'metodo_secuenciacion', org.nombre 'organela', conf.nombre 'conformacion', nroCromosoma, concat(sp.Género, ' ',sp.[Epíteto específico]) as 'Especie', 
sec.anotaciones
FROM SecuenciaDeNucleotidos as sec 
INNER JOIN MetodoDeSecuenciacion as ms ON (sec.idMetodoSec = ms.idMetodoSec)
INNER JOIN Organela as org ON (org.idOrganela = sec.idOrganela)
INNER JOIN Conformacion as conf ON (conf.idConformacion = sec.idConformacion)
INNER JOIN vw_especies_taxon as sp ON (
	sec.idDominio = sp.idDominio AND sec.idReino = sp.idReino AND sec.idFilo = sp.idFilo AND sec.idClase = sp.idClase
	AND sec.idOrden = sp.idOrden AND sec.idFamilia = sp.idFamilia AND sec.idGenero = sp.idGenero 
	AND sec.idEspecie = sp.idEspecie
)

SELECT * FROM vw_vistaSecNucleotidos

EXEC SP_insertarSecuencia2 'TGTTTATTATTTTTGGTAGCCGGTGTG', '20060513', 'Método Enzimático de Sanger', 'no', 'Núcleo', 2, 'Lineal', 'Rhinella', 'marina'
EXEC SP_insertarSecuencia2 'TGTCCGCTTGGTATATTTTTATTACGGTGTG', '20160715', 'Método Enzimático de Sanger', 'no', 'Núcleo', 2, 'Lineal', 'Rhinella', 'marina'
EXEC SP_insertarSecuencia2 'CGGGCCTTACATATGTG', '20180215', 'Método Enzimático de Sanger', 'no', 'Núcleo', 3, 'Lineal', 'Rhinella', 'abei'
EXEC SP_insertarSecuencia2 'AGAGGTTAGATTTGACCG', '20200301', 'Método Enzimático de Sanger', 'no', 'Núcleo', 2, 'Lineal', 'Rhinella', 'alata'
EXEC SP_insertarSecuencia2 'AGAGGTTAGATTTGACCG', '20190823', 'Método Enzimático de Sanger', 'no', 'Mitocondria', null, 'Circular', 'Rhinella', 'alata'
EXEC SP_insertarSecuencia2 'ATTGGTGTGTGGTAAACCG', '20170417', 'Método Enzimático de Sanger', 'no', 'Núcleo', 5, 'Lineal', 'Rhinella', 'icterica'


SELECT idSecNucleot, secuencia, Especie FROM vw_vistaSecNucleotidos
WHERE Especie like 'Rhinella %' AND nroCromosoma = 2 AND fechaRegistro BETWEEN '20150523' AND '20200523'

---VISTA PARA OCULTAR COLUMNA----------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE VIEW vw_autor
AS
SELECT idAutor, nombre, apellido
FROM Autor


------------------------------------------------------------------------------------------------------------------------------
------------------------ÍNDICES------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------




---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------PROCEDIMIENTO PARA INSERCIÓN CON TRANSACCIONES------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
CREATE FUNCTION buscarEspecie (@genero varchar(50), @epEsp varchar(50)) RETURNS TABLE
AS
	RETURN 
	SELECT * FROM vw_especies_taxon
	WHERE (Género = @genero) AND ([Epíteto específico] = @epEsp)

CREATE FUNCTION buscarAutor (@dniAutor int) RETURNS TABLE
AS
	RETURN 
	SELECT * FROM Autor
	WHERE (dni = @dniAutor)

SELECT * FROM dbo.buscarAutor(2323124)

EXEC SP_insertarSecuencia7 'ATATTTGT', '20220114', 'Maxam', null, 'Núcleo', 7, 'Lineal',  
'Bufonidae', 'Ansonia', 'echinata', 'Esteban', 'Manolacc', 25389123

SELECT * FROM vw_vistaSecNucleotidos

CREATE PROCEDURE SP_insertarSecuencia7 (@secuencia varchar(Max), @fechaRegistro Date, @metodoSec varchar(50),
@anotaciones varchar(300), @organela varchar(30), @cromosoma int, @conformacion varchar(30), @familia varchar(50), @genero varchar(50), @epEsp varchar(50), @nombreAutor varchar(50),
@apeAutor varchar(50), @dniAutor int)
AS
	declare @idConformacion int = (SELECT idConformacion FROM Conformacion WHERE nombre = @conformacion);
	declare @idOrganela int = (SELECT idOrganela FROM Organela WHERE nombre = @organela);
	declare @idMetodoSec int = (SELECT idMetodoSec FROM MetodoDeSecuenciacion WHERE nombre like concat('%',@metodoSec,'%'));
	declare @idEspecie int;
	declare @idGenero int;
	declare @idFamilia int;
	declare @idOrden int;
	declare @idClase int;
	declare @idFilo int;
	declare @idReino int;
	declare @idDominio int;

IF (SELECT COUNT(*) FROM buscarEspecie(@genero, @epEsp)) > 0 AND (SELECT COUNT(*) FROM dbo.buscarAutor(@dniAutor)) > 0
	 --el autor y especie ingresados ya existen en la bd, por lo cual no se insertarán
	BEGIN
	SET @idEspecie = (SELECT idEspecie FROM buscarEspecie(@genero, @epEsp));
	SET @idGenero = (SELECT idGenero FROM buscarEspecie(@genero, @epEsp));
	SET @idFamilia = (SELECT idFamilia FROM buscarEspecie(@genero, @epEsp));
	SET @idOrden = (SELECT idOrden FROM buscarEspecie(@genero, @epEsp));
	SET @idClase = (SELECT idClase FROM buscarEspecie(@genero, @epEsp));
	SET @idFilo = (SELECT idFilo FROM buscarEspecie(@genero, @epEsp));
	SET @idReino = (SELECT idReino FROM buscarEspecie(@genero, @epEsp));
	SET @idDominio = (SELECT idDominio FROM buscarEspecie(@genero, @epEsp));
	INSERT INTO SecuenciaDeNucleotidos(secuencia, fechaRegistro, idMetodoSec, 
	anotaciones, idOrganela, nroCromosoma, idConformacion, idEspecie, idGenero, idFamilia, idOrden, idClase, idFilo, 
	idReino, idDominio)
	VALUES(@secuencia, @fechaRegistro, @idMetodoSec, @anotaciones, @idOrganela, @cromosoma, @idConformacion,
	@idEspecie, @idGenero, @idFamilia, @idOrden, @idClase, @idFilo, @idReino, @idDominio);
	END
ELSE 
	BEGIN
		IF ((SELECT COUNT(*) FROM buscarEspecie(@genero, @epEsp)) > 0)
			BEGIN 
			--Se encontró la especie, pero no el autor: Se inserta en la tabla Autor y en la tabla SecuenciaDeNucleotidos
			--omitimos el código de esta parte por ser redundante
			PRINT('código omitido.');
			END
		ELSE
			IF ((SELECT COUNT(*) FROM dbo.buscarAutor(@dniAutor)) > 0)
				BEGIN
				--Se encontro el autor, pero no la especie: se inserta en las tablas de especie (Especie, Género, Familia,etc y en 
				-- la tabla SecuenciaDeNucleótidos)
				--omitimos el código de esta parte por ser redundante
				PRINT('código omitido.');
				END
			ELSE
				BEGIN

				SET @idFamilia = (SELECT idFamilia FROM Familia WHERE nombre = @familia);
				SET @idOrden = (SELECT idOrden FROM Familia WHERE nombre = @familia);
				SET @idClase = (SELECT idClase FROM Familia WHERE nombre = @familia);
				SET @idFilo = (SELECT TOP(1) idFilo FROM Familia WHERE nombre = @familia);
				SET @idReino = (SELECT TOP(1) idReino FROM Familia WHERE nombre = @familia);
				SET @idDominio = (SELECT TOP(1) idDominio FROM Familia WHERE nombre = @familia);
				declare @error int = 0;

				BEGIN TRAN

					INSERT INTO Autor(nombre, apellido, dni) VALUES(@nombreAutor, @apeAutor, @dniAutor);
					SET @error = @error + @@ERROR;
					
					INSERT INTO Genero(idFamilia, idOrden, idClase, idFilo, idReino, idDominio, nombre) 
					VALUES(@idFamilia, @idOrden, @idClase, @idFilo, @idReino, @idDominio, @genero);
					SET @error = @error + @@ERROR;
					SET @idGenero = (SELECT idGenero FROM Genero WHERE nombre = @genero);
					INSERT INTO Especie(idGenero, idFamilia, idOrden, idClase, idFilo, idReino, idDominio, epitetoEspecifico)
					VALUES(@idGenero, @idFamilia, @idOrden, @idClase, @idFilo, @idReino, @idDominio, @epEsp);
					SET @idEspecie = (SELECT idEspecie FROM Especie WHERE epitetoEspecifico = @epEsp);
					SET @error = @error + @@ERROR;

					INSERT INTO SecuenciaDeNucleotidos(secuencia, fechaRegistro, idMetodoSec, 
					anotaciones, idOrganela, nroCromosoma, idConformacion, idEspecie, idGenero, idFamilia, idOrden, idClase, idFilo, 
					idReino, idDominio)
					VALUES(@secuencia, @fechaRegistro, @idMetodoSec, @anotaciones, @idOrganela, @cromosoma, @idConformacion,
					@idEspecie, @idGenero, @idFamilia, @idOrden, @idClase, @idFilo, @idReino, @idDominio);
					SET @error = @error + @@ERROR;

					IF(@error = 0)
						commit;
					ELSE
						PRINT('La transacción no pudo realizarse.');
						rollback tran;
				END
	END




	SELECT * FROM SecuenciaDeNucleotidos
	SELECT * FROM vw_vistaSecNucleotidos
	SELECT * FROM vw_especies_taxon


	SELECT idSecNucleot FROM SecuenciaDeNucleotidos sec
	INNER JOIN Especie sp ON (sec.idDominio = sp.idDominio AND sec.idReino = sp.idReino AND 
	sec.idFilo = sp.idFilo AND sec.idClase = sp.idClase
	sec.idOrden, sec.idFamilia, sec.idGenero, sec.idEspecie)

	
	CREATE NONCLUSTERED INDEX IX_EspecieFK_SecNucleotidos
	ON SecuenciaDeNucleotidos(idDominio, idReino, idFilo, idClase, idOrden, idFamilia, idGenero, idEspecie)

	CREATE NONCLUSTERED INDEX IX_Gen_nombre
	ON Gen(nombre);

	CREATE NONCLUSTERED INDEX IX_Especie_epEsp
	ON Especie(epitetoEspecifico);

	CREATE NONCLUSTERED INDEX IX_Genero_nombre
	ON Genero(nombre);

	CREATE NONCLUSTERED INDEX IX_Familia_nombre
	ON Familia(nombre);

	CREATE NONCLUSTERED INDEX IX_Publicacion_tituloPublicacion
	ON Publicacion(tituloPublicacion);

	ALTER VIEW vw_especies_taxon
	WITH SCHEMABINDING
	AS
	SELECT dom.nombre 'Dominio', r.nombre 'Reino', fil.nombre 'Filo', c.nombre 'Clase', 
o.nombre 'Orden', f.nombre 'Familia',  g.nombre 'Género', sp.epitetoEspecifico 'Epíteto específico',
sp.idEspecie, sp.idGenero, sp.idFamilia, sp.idOrden, sp.idClase, sp.idFilo, sp.idReino, sp.idDominio
FROM dbo.Especie sp INNER JOIN dbo.Genero g ON (sp.idGenero = g.idGenero)
INNER JOIN dbo.Familia f ON (g.idFamilia = f.idFamilia)
INNER JOIN dbo.Orden o ON (f.idOrden = o.idOrden)
INNER JOIN dbo.Clase c ON (c.idClase = o.idClase)
INNER JOIN dbo.Filo fil ON (c.idFilo = fil.idFilo)
INNER JOIN dbo.Reino r ON (fil.idReino = r.idReino)
INNER JOIN dbo.Dominio dom ON (r.idDominio = dom.idDominio)

	CREATE UNIQUE CLUSTERED INDEX PK_SP 
	ON vw_especies_taxon(idEspecie, idGenero, idFamilia, idOrden, idClase, idFilo, idReino, idDominio)

	CREATE NONCLUSTERED INDEX IX_VWEspecies_especie
	ON vw_especies_taxon([Género], [Epíteto específico]);

	SELECT * FROM vw_especies_taxon
	WHERE [Género] = 'Rhinella' AND [Epíteto específico] = 'marina'

	DROP INDEX vw_especies_taxon.PK_SP

	CREATE FULLTEXT CATALOG ft_catalog AS DEFAULT;
	CREATE FULLTEXT INDEX ON dbo.Gen(nombre)
	KEY INDEX FULLTEXT_nombre_Gen

	
--INSERT INTO dbo.vw_autor(nombre, apellido) VALUES('Pedro', 'Aznar')

--------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------PERMISOS------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--CREACIÓN DE ROLES
CREATE ROLE InvestigadorInterno;

DENY UPDATE, INSERT, DELETE, CONTROL, ALTER on dbo.MetodoDeSecuenciacion to InvestigadorInterno;
DENY UPDATE, INSERT, DELETE, CONTROL, ALTER on dbo.Organela to InvestigadorInterno;
DENY UPDATE, INSERT, DELETE, CONTROL, ALTER on dbo.Conformacion to InvestigadorInterno;
DENY UPDATE, INSERT, DELETE, CONTROL, ALTER on dbo.Titulo to InvestigadorInterno;
DENY UPDATE, INSERT, DELETE, CONTROL, ALTER on dbo.Pais to InvestigadorInterno;
--
GRANT SELECT on dbo.MetodoDeSecuenciacion to InvestigadorInterno;
GRANT SELECT on dbo.Conformacion to InvestigadorInterno;
GRANT SELECT on dbo.Organela to InvestigadorInterno;
GRANT SELECT on dbo.Titulo to InvestigadorInterno;
GRANT SELECT on dbo.Pais to InvestigadorInterno;

GRANT SELECT, INSERT on dbo.SecuenciaDeNucleotidos to InvestigadorInterno;
GRANT SELECT, INSERT on dbo.Autor to InvestigadorInterno;
GRANT SELECT, INSERT on dbo.Revista_Cientifica to InvestigadorInterno;
GRANT SELECT, INSERT on dbo.Publicacion to InvestigadorInterno;
GRANT SELECT, INSERT on dbo.Autor_Publicacion to InvestigadorInterno;
GRANT SELECT, INSERT on dbo.Secuencia_Autor to InvestigadorInterno;
GRANT SELECT, INSERT on dbo.Secuencia_Publicacion to InvestigadorInterno;
GRANT SELECT, INSERT on dbo.Gen to InvestigadorInterno;
GRANT SELECT, INSERT on dbo.Secuencia_Gen to InvestigadorInterno;
GRANT SELECT, INSERT on dbo.Secuencia_Gen_Potencial to InvestigadorInterno;
GRANT SELECT, INSERT on dbo.Especie to InvestigadorInterno;
GRANT SELECT, INSERT on dbo.Genero to InvestigadorInterno;
GRANT SELECT, INSERT on dbo.Familia to InvestigadorInterno;
GRANT SELECT, INSERT on dbo.Orden to InvestigadorInterno;
--Al investigador se le permite insertar hasta el nivel de Orden. Los niveles superiores no suelen cambiar.
GRANT SELECT on dbo.vw_especies_taxon to InvestigadorInterno;
GRANT SELECT on dbo.vw_vistaSecNucleotidos to InvestigadorInterno;
GRANT EXEC on SP_insertarSecuencia to InvestigadorInterno;
--GRANT SELECT on dbo.buscarAutor to InvestigadorInterno;
--GRANT SELECT on dbo.buscarEspecie to InvestigadorInterno;
--GRANT SELECT on dbo.F_buscarGenPotencial to InvestigadorInterno;
--GRANT SELECT on dbo.F_secError to InvestigadorInterno;
-----------------------------------------------------------------------------------------------------------------------
USE db_genetica;
CREATE ROLE Curador;
DENY UPDATE, INSERT, DELETE, CONTROL, ALTER on dbo.MetodoDeSecuenciacion to Curador;
DENY UPDATE, INSERT, DELETE, CONTROL, ALTER on dbo.Organela to Curador;
DENY UPDATE, INSERT, DELETE, CONTROL, ALTER on dbo.Conformacion to Curador;

GRANT UPDATE, DELETE on dbo.SecuenciaDeNucleotidos to Curador;
GRANT UPDATE, DELETE on dbo.Gen to Curador;
GRANT DELETE on dbo.Secuencia_Gen to Curador;
GRANT DELETE on dbo.Secuencia_Gen_Potencial to Curador;
GRANT UPDATE, DELETE on dbo.Autor to Curador;
GRANT INSERT, SELECT, UPDATE, DELETE on dbo.Titulo to Curador;
GRANT UPDATE, DELETE on dbo.Revista_Cientifica to Curador;
GRANT UPDATE, DELETE on dbo.Publicacion to Curador;
GRANT UPDATE, DELETE on dbo.Especie to Curador;
GRANT UPDATE, DELETE on dbo.Genero to Curador;
GRANT UPDATE, DELETE on dbo.Familia to Curador;
GRANT UPDATE, DELETE on dbo.Orden to Curador;

-----------------------------------------------------------------------------------------------------------------------
CREATE ROLE ConsultorExterno;
DENY UPDATE, INSERT, DELETE, CONTROL, ALTER on dbo.MetodoDeSecuenciacion to ConsultorExterno;
DENY UPDATE, INSERT, DELETE, CONTROL, ALTER on dbo.Organela to ConsultorExterno;
DENY UPDATE, INSERT, DELETE, CONTROL, ALTER on dbo.Conformacion to ConsultorExterno;

GRANT SELECT on dbo.vw_autor to ConsultorExterno;
--Al consultor externo sólo se le permite ver la vista de Autor, la cual oculta el campo DNI. No puede
--ver la tabla Autor
GRANT SELECT on dbo.MetodoDeSecuenciacion to ConsultorExterno;
GRANT SELECT on dbo.Conformacion to ConsultorExterno;
GRANT SELECT on dbo.Organela to ConsultorExterno;
GRANT SELECT on dbo.Titulo to ConsultorExterno;
GRANT SELECT on dbo.Pais to ConsultorExterno;
GRANT SELECT on dbo.SecuenciaDeNucleotidos to ConsultorExterno;
GRANT SELECT on dbo.Revista_Cientifica to ConsultorExterno;
GRANT SELECT on dbo.Publicacion to ConsultorExterno;
GRANT SELECT on dbo.Autor_Publicacion to ConsultorExterno;
GRANT SELECT on dbo.Secuencia_Autor to ConsultorExterno;
GRANT SELECT on dbo.Secuencia_Publicacion to ConsultorExterno;
GRANT SELECT on dbo.Gen to ConsultorExterno;
GRANT SELECT on dbo.Secuencia_Gen to ConsultorExterno;
GRANT SELECT on dbo.Secuencia_Gen_Potencial to ConsultorExterno;
GRANT SELECT on dbo.Especie to ConsultorExterno;
GRANT SELECT on dbo.Genero to ConsultorExterno;
GRANT SELECT on dbo.Familia to ConsultorExterno;
GRANT SELECT on dbo.Orden to ConsultorExterno;
-------
CREATE LOGIN investigador1 with password = '1234';
CREATE USER investigador1 for LOGIN investigador1; 

CREATE LOGIN curador1 with password = '1234'
CREATE USER curador1 for LOGIN curador1;

CREATE LOGIN consultor1 with password = '1234'
CREATE USER consultor1 for LOGIN consultor1;

ALTER ROLE InvestigadorInterno ADD MEMBER investigador1;
ALTER ROLE Curador ADD MEMBER curador1;
ALTER ROLE ConsultorExterno ADD MEMBER consultor1;