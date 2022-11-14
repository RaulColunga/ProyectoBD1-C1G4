USE bd_genetica
GO

INSERT INTO Conformacion(nombre)
VALUES('Lineal');
INSERT INTO Conformacion(nombre)
VALUES('Circular');

INSERT INTO Organela(nombre)
VALUES('Núcleo');
INSERT INTO Organela(nombre)
VALUES('Mitocondria');
INSERT INTO Organela(nombre)
VALUES('Cloroplasto');
INSERT INTO Organela(nombre)
VALUES('Nucleoide');

INSERT INTO MetodoDeSecuenciacion(nombre)
VALUES('Método Químico de Maxam y Gilbert');
INSERT INTO MetodoDeSecuenciacion(nombre)
VALUES('Método Enzimático de Sanger');
INSERT INTO MetodoDeSecuenciacion(nombre)
VALUES('Reacción en Cadena de la Polimerasa');

INSERT INTO Gen(nombre, secuencia)
VALUES('ACTA1', 'AAATTTAAAAAGGGGGAGGAAAACCCCTTACCCGGGAGAGTTGATGTAGTGGGTAGTATCTCCACTATACCCCACTCATAA');
INSERT INTO Gen(nombre, secuencia)
VALUES('MYO7A', 'TTTTCTCATATCGGCGAGAGGCCCCCGACGCCAGATTTATCGTACTATACTAGC');
INSERT INTO Gen(nombre, secuencia)
VALUES('ALK1', 'TTTTATATATTAGTGTGCCCCCCCGGGGGACCGACGAGACCGGGGGGGGGACCGAGACGCAGCTTATTTATTATCGCTCAGTCGTAGCGCGAGATCGTACGTACGTACGTACGTACGTACGTACGTCAGTCTGACGTCAGTACGTACTGACGTACGTACGTACGTACGTACGTCTACGACTGACTACGTACGACTACGTACGTAGTCAGTACGCGTGTGTGTACGTGTCCGTAACGTTACGACGTAGTCGTGACGTAGT');
INSERT INTO Gen(nombre, secuencia)
VALUES('FOXP2', 'TTTTAACCCACACCACACGGGGGGGGGGGGGCATCCAGTACCATTTTTTTTTGCGACTACTACGGGGGGGGGGGACTACGTCGTACGTATACGACGTACGTGTATGGTGTGTACGTCAACGTTGACGT');
INSERT INTO Gen(nombre, secuencia)
VALUES('microRNA 17', 'GTTACGTCGTAGTCAGTGTCGTGGGACTGTACGTCGAGCCGCCCCCCCCCCCAGCGATCGTATCTGCGTCGCGGGCGTATCAGT');
INSERT INTO Gen(nombre, secuencia)
VALUES('TESTEO', 'TTGACA');
INSERT INTO Gen(nombre, secuencia)
VALUES('TESTEO2', 'TATATATATATATATATATATATATATATATATA');
INSERT INTO Gen(nombre, secuencia)
VALUES('TESTEO3', 'TTAAATTTCGCGCGT');
INSERT INTO Gen(nombre, secuencia)
VALUES('GEN_CON_FALLA', 'TTAYAATTTCGOOCGCGT');


INSERT INTO Dominio(nombre)
VALUES('Eukarya');
INSERT INTO Dominio(nombre)
VALUES('Bacteria');
INSERT INTO Dominio(nombre)
VALUES('Archaea');

INSERT INTO Reino(idDominio, nombre)
VALUES(1, 'Animalia');
INSERT INTO Reino(idDominio, nombre)
VALUES(1, 'Plantae');
INSERT INTO Reino(idDominio, nombre)
VALUES(1, 'Fungi');
INSERT INTO Reino(idDominio, nombre)
VALUES(1, 'Protozoa');
INSERT INTO Reino(idDominio, nombre)
VALUES(1, 'Chromista');
INSERT INTO Reino(idDominio, nombre)
VALUES(2, 'Bacteria');
INSERT INTO Reino(idDominio, nombre)
VALUES(3, 'Archaea');

INSERT INTO Filo(idReino, idDominio, nombre)
VALUES(1,1,'Chordata');
INSERT INTO Filo(idReino, idDominio, nombre)
VALUES(1,1,'Arthropoda');
INSERT INTO Filo(idReino, idDominio, nombre)
VALUES(1,1,'Nematoda');
INSERT INTO Filo(idReino, idDominio, nombre)
VALUES(1,1,'Cnidaria');
INSERT INTO Filo(idReino, idDominio, nombre)
VALUES(1,1,'Platyhelminthes');
INSERT INTO Filo(idReino, idDominio, nombre)
VALUES(1,1,'Echinodermata');

INSERT INTO Clase(idFilo, idReino, idDominio, nombre)
VALUES(1,1,1,'Mammalia');
INSERT INTO Clase(idFilo, idReino, idDominio, nombre)
VALUES(1,1,1,'Amphibia');
INSERT INTO Clase(idFilo, idReino, idDominio, nombre)
VALUES(1,1,1,'Chondrichthyes');
INSERT INTO Clase(idFilo, idReino, idDominio, nombre)
VALUES(2,1,1,'Insecta');
INSERT INTO Clase(idFilo, idReino, idDominio, nombre)
VALUES(2,1,1,'Crustacea');

INSERT INTO Orden(idClase, idFilo, idReino, idDominio, nombre)
VALUES(1,1,1,1,'Primates')
INSERT INTO Orden(idClase, idFilo, idReino, idDominio, nombre)
VALUES(1,1,1,1,'Carnivora')
INSERT INTO Orden(idClase, idFilo, idReino, idDominio, nombre)
VALUES(1,1,1,1,'Chiroptera')
INSERT INTO Orden(idClase, idFilo, idReino, idDominio, nombre)
VALUES(1,1,1,1,'Lagomorpha')
INSERT INTO Orden(idClase, idFilo, idReino, idDominio, nombre)
VALUES(1,1,1,1,'Proboscidea')
INSERT INTO Orden(idClase, idFilo, idReino, idDominio, nombre)
VALUES(4,2,1,1,'Lepidoptera')
INSERT INTO Orden(idClase, idFilo, idReino, idDominio, nombre)
VALUES(1,1,1,1,'Díptera')
INSERT INTO Orden(idClase, idFilo, idReino, idDominio, nombre)
VALUES(1,1,1,1,'Coleoptera')
INSERT INTO Orden(idClase, idFilo, idReino, idDominio, nombre)
VALUES(2,1,1,1,'Anura')

INSERT INTO Familia(idOrden, idClase, idFilo, idReino, idDominio, nombre)
VALUES(1,1,1,1,1,'Hominidae')
INSERT INTO Familia(idOrden, idClase, idFilo, idReino, idDominio, nombre)
VALUES(1,1,1,1,1,'Lemuridae')
INSERT INTO Familia(idOrden, idClase, idFilo, idReino, idDominio, nombre)
VALUES(1,1,1,1,1,'Atelidae')
INSERT INTO Familia(idOrden, idClase, idFilo, idReino, idDominio, nombre)
VALUES(1,1,1,1,1,'Hylobatidae')
INSERT INTO Familia(idOrden, idClase, idFilo, idReino, idDominio, nombre)
VALUES(1,1,1,1,1,'Cercopithecidae')
INSERT INTO Familia(idOrden, idClase, idFilo, idReino, idDominio, nombre)
VALUES(2,1,1,1,1,'Canidae')
INSERT INTO Familia(idOrden, idClase, idFilo, idReino, idDominio, nombre)
VALUES(6,4,2,1,1,'Nymphalidae')
INSERT INTO Familia(idOrden, idClase, idFilo, idReino, idDominio, nombre)
VALUES(9,2,1,1,1,'Bufonidae')

INSERT INTO Genero(idFamilia, idOrden, idClase, idFilo, idReino, idDominio, nombre)
VALUES(1,1,1,1,1,1,'Homo');
INSERT INTO Genero(idFamilia, idOrden, idClase, idFilo, idReino, idDominio, nombre)
VALUES(3,1,1,1,1,1,'Alouatta');
INSERT INTO Genero(idFamilia, idOrden, idClase, idFilo, idReino, idDominio, nombre)
VALUES(3,1,1,1,1,1,'Oreonax');
INSERT INTO Genero(idFamilia, idOrden, idClase, idFilo, idReino, idDominio, nombre)
VALUES(1,1,1,1,1,1,'Ateles');
INSERT INTO Genero(idFamilia, idOrden, idClase, idFilo, idReino, idDominio, nombre)
VALUES(6,2,1,1,1,1,'Canis');
INSERT INTO Genero(idFamilia, idOrden, idClase, idFilo, idReino, idDominio, nombre)
VALUES(7,6,4,2,1,1,'Archaeoprepona');
INSERT INTO Genero(idFamilia, idOrden, idClase, idFilo, idReino, idDominio, nombre)
VALUES(8,9,2,1,1,1,'Rhinella');

INSERT INTO Especie(idGenero, idFamilia, idOrden, idClase, idFilo, idReino, idDominio, epitetoEspecifico)
VALUES(1,1,1,1,1,1,1,'sapiens');
INSERT INTO Especie(idGenero, idFamilia, idOrden, idClase, idFilo, idReino, idDominio, epitetoEspecifico)
VALUES(2,3,1,1,1,1,1,'caraya');
INSERT INTO Especie(idGenero, idFamilia, idOrden, idClase, idFilo, idReino, idDominio, epitetoEspecifico)
VALUES(3,3,1,1,1,1,1,'flavicauda');
INSERT INTO Especie(idGenero, idFamilia, idOrden, idClase, idFilo, idReino, idDominio, epitetoEspecifico)
VALUES(5,6,2,1,1,1,1,'familiaris');
INSERT INTO Especie(idGenero, idFamilia, idOrden, idClase, idFilo, idReino, idDominio, epitetoEspecifico)
VALUES(5,6,2,1,1,1,1,'lupus');
INSERT INTO Especie(idGenero, idFamilia, idOrden, idClase, idFilo, idReino, idDominio, epitetoEspecifico)
VALUES(6,7,6,4,2,1,1,'demophoon');
INSERT INTO Especie(idGenero, idFamilia, idOrden, idClase, idFilo, idReino, idDominio, epitetoEspecifico)
VALUES(7,8,9,2,1,1,1,'marina');
INSERT INTO Especie(idGenero, idFamilia, idOrden, idClase, idFilo, idReino, idDominio, epitetoEspecifico)
VALUES(7,8,9,2,1,1,1,'alata');
INSERT INTO Especie(idGenero, idFamilia, idOrden, idClase, idFilo, idReino, idDominio, epitetoEspecifico)
VALUES(7,8,9,2,1,1,1,'acrolopha');
INSERT INTO Especie(idGenero, idFamilia, idOrden, idClase, idFilo, idReino, idDominio, epitetoEspecifico)
VALUES(7,8,9,2,1,1,1,'abei');
INSERT INTO Especie(idGenero, idFamilia, idOrden, idClase, idFilo, idReino, idDominio, epitetoEspecifico)
VALUES(7,8,9,2,1,1,1,'ceratophys');
INSERT INTO Especie(idGenero, idFamilia, idOrden, idClase, idFilo, idReino, idDominio, epitetoEspecifico)
VALUES(7,8,9,2,1,1,1,'fissipes');
INSERT INTO Especie(idGenero, idFamilia, idOrden, idClase, idFilo, idReino, idDominio, epitetoEspecifico)
VALUES(7,8,9,2,1,1,1,'icterica');
INSERT INTO Especie(idGenero, idFamilia, idOrden, idClase, idFilo, idReino, idDominio, epitetoEspecifico)
VALUES(7,8,9,2,1,1,1,'limensis');
INSERT INTO Especie(idGenero, idFamilia, idOrden, idClase, idFilo, idReino, idDominio, epitetoEspecifico)
VALUES(7,8,9,2,1,1,1,'major');
INSERT INTO Especie(idGenero, idFamilia, idOrden, idClase, idFilo, idReino, idDominio, epitetoEspecifico)
VALUES(7,8,9,2,1,1,1,'ocellata');
INSERT INTO Especie(idGenero, idFamilia, idOrden, idClase, idFilo, idReino, idDominio, epitetoEspecifico)
VALUES(7,8,9,2,1,1,1,'proboscidea');

INSERT INTO Titulo(titulo)
VALUES('Licenciado en Ciencias Químicas');
INSERT INTO Titulo(titulo)
VALUES('Licenciado en Genética');
INSERT INTO Titulo(titulo)
VALUES('Licenciado en Ciencias Biológicas');
INSERT INTO Titulo(titulo)
VALUES('Licenciado en Biotecnología');
INSERT INTO Titulo(titulo)
VALUES('Doctor en Ciencias Químicas');
INSERT INTO Titulo(titulo)
VALUES('Doctor en Biotecnología');
INSERT INTO Titulo(titulo)
VALUES('Doctor en Ciencias Biológicas');
INSERT INTO Titulo(titulo)
VALUES('Doctor en Informática');

INSERT INTO Autor(nombre, apellido, dni, descrEspecialidad, idMaxTitulo)
VALUES('Karl', 'Strasser', 2323124, 'Especialista en Genética de Mamíferos con más de 20 años de trayectoria', 1);
INSERT INTO Autor(nombre, apellido, dni, descrEspecialidad, idMaxTitulo)
VALUES('Alexis', 'Collernam', 2312124, 'Investigador de las Ciencias de la Salud apasionado por aportar mi granito de arena', 5);
INSERT INTO Autor(nombre, apellido, dni, descrEspecialidad, idMaxTitulo)
VALUES('Julián Gastón', 'Britez Rinneman', 2112224, 'Especialista en Genómica y Genética Forense', 3);
INSERT INTO Autor(nombre, apellido, dni, descrEspecialidad, idMaxTitulo)
VALUES('Insfran', 'Tiltdo', 2313333, 'Especialista en Fsa con más de 20 años de trayectoria en el poder', 1);
INSERT INTO Autor(nombre, apellido, dni, descrEspecialidad, idMaxTitulo)
VALUES('Federico', 'Gildson', 2312133, '', 1);
INSERT INTO Autor(nombre, apellido, dni, descrEspecialidad, idMaxTitulo)
VALUES('Raual', 'Namekusei Shen Lang', 2313533, '', 1);
INSERT INTO Autor(nombre, apellido, dni, descrEspecialidad, idMaxTitulo)
VALUES('Lee Ander', 'Pons', 2313534, '', 1);

INSERT INTO Pais (iso, nombre) VALUES('AF', 'Afganistán');
INSERT INTO Pais (iso, nombre) VALUES('AX', 'Islas Gland');
INSERT INTO Pais (iso, nombre) VALUES('AL', 'Albania');
INSERT INTO Pais (iso, nombre) VALUES('DE', 'Alemania');
INSERT INTO Pais (iso, nombre) VALUES('AD', 'Andorra');
INSERT INTO Pais (iso, nombre) VALUES('AO', 'Angola');
INSERT INTO Pais (iso, nombre) VALUES('AI', 'Anguilla');
INSERT INTO Pais (iso, nombre) VALUES('AQ', 'Antártida');
INSERT INTO Pais (iso, nombre) VALUES('AG', 'Antigua y Barbuda');
INSERT INTO Pais (iso, nombre) VALUES('AN', 'Antillas Holandesas');
INSERT INTO Pais (iso, nombre) VALUES('SA', 'Arabia Saudí');
INSERT INTO Pais (iso, nombre) VALUES('DZ', 'Argelia');
INSERT INTO Pais (iso, nombre) VALUES('AR', 'Argentina');
INSERT INTO Pais (iso, nombre) VALUES('AM', 'Armenia');
INSERT INTO Pais (iso, nombre) VALUES('AW', 'Aruba');
INSERT INTO Pais (iso, nombre) VALUES('AU', 'Australia');
INSERT INTO Pais (iso, nombre) VALUES('AT', 'Austria');
INSERT INTO Pais (iso, nombre) VALUES('AZ', 'Azerbaiyán');
INSERT INTO Pais (iso, nombre) VALUES('BS', 'Bahamas');
INSERT INTO Pais (iso, nombre) VALUES('BH', 'Bahréin');
INSERT INTO Pais (iso, nombre) VALUES('BD', 'Bangladesh');
INSERT INTO Pais (iso, nombre) VALUES('BB', 'Barbados');
INSERT INTO Pais (iso, nombre) VALUES('BY', 'Bielorrusia');
INSERT INTO Pais (iso, nombre) VALUES('BE', 'Bélgica');
INSERT INTO Pais (iso, nombre) VALUES('BZ', 'Belice');
INSERT INTO Pais (iso, nombre) VALUES('BJ', 'Benin');
INSERT INTO Pais (iso, nombre) VALUES('BM', 'Bermudas');
INSERT INTO Pais (iso, nombre) VALUES('BT', 'Bhután');
INSERT INTO Pais (iso, nombre) VALUES('BO', 'Bolivia');
INSERT INTO Pais (iso, nombre) VALUES('BA', 'Bosnia y Herzegovina');
INSERT INTO Pais (iso, nombre) VALUES('BW', 'Botsuana');
INSERT INTO Pais (iso, nombre) VALUES('BV', 'Isla Bouvet');
INSERT INTO Pais (iso, nombre) VALUES('BR', 'Brasil');
INSERT INTO Pais (iso, nombre) VALUES('BN', 'Brunéi');
INSERT INTO Pais (iso, nombre) VALUES('BG', 'Bulgaria');
INSERT INTO Pais (iso, nombre) VALUES('BF', 'Burkina Faso');
INSERT INTO Pais (iso, nombre) VALUES('BI', 'Burundi');
INSERT INTO Pais (iso, nombre) VALUES('CV', 'Cabo Verde');
INSERT INTO Pais (iso, nombre) VALUES('KY', 'Islas Caimán');
INSERT INTO Pais (iso, nombre) VALUES('KH', 'Camboya');
INSERT INTO Pais (iso, nombre) VALUES('CM', 'Camerún');
INSERT INTO Pais (iso, nombre) VALUES('CA', 'Canadá');
INSERT INTO Pais (iso, nombre) VALUES('CF', 'República Centroafricana');
INSERT INTO Pais (iso, nombre) VALUES('TD', 'Chad');
INSERT INTO Pais (iso, nombre) VALUES('CZ', 'República Checa');
INSERT INTO Pais (iso, nombre) VALUES('CL', 'Chile');
INSERT INTO Pais (iso, nombre) VALUES('CN', 'China');
INSERT INTO Pais (iso, nombre) VALUES('CY', 'Chipre');
INSERT INTO Pais (iso, nombre) VALUES('CX', 'Isla de Navidad');
INSERT INTO Pais (iso, nombre) VALUES('VA', 'Ciudad del Vaticano');
INSERT INTO Pais (iso, nombre) VALUES('CC', 'Islas Cocos');
INSERT INTO Pais (iso, nombre) VALUES('CO', 'Colombia');
INSERT INTO Pais (iso, nombre) VALUES('KM', 'Comoras');
INSERT INTO Pais (iso, nombre) VALUES('CD', 'República Democrática del Congo');
INSERT INTO Pais (iso, nombre) VALUES('CG', 'Congo');
INSERT INTO Pais (iso, nombre) VALUES('CK', 'Islas Cook');
INSERT INTO Pais (iso, nombre) VALUES('KP', 'Corea del Norte');
INSERT INTO Pais (iso, nombre) VALUES('KR', 'Corea del Sur');
INSERT INTO Pais (iso, nombre) VALUES('CI', 'Costa de Marfil');
INSERT INTO Pais (iso, nombre) VALUES('CR', 'Costa Rica');
INSERT INTO Pais (iso, nombre) VALUES('HR', 'Croacia');
INSERT INTO Pais (iso, nombre) VALUES('CU', 'Cuba');
INSERT INTO Pais (iso, nombre) VALUES('DK', 'Dinamarca');
INSERT INTO Pais (iso, nombre) VALUES('DM', 'Dominica');
INSERT INTO Pais (iso, nombre) VALUES('DO', 'República Dominicana');
INSERT INTO Pais (iso, nombre) VALUES('EC', 'Ecuador');
INSERT INTO Pais (iso, nombre) VALUES('EG', 'Egipto');
INSERT INTO Pais (iso, nombre) VALUES('SV', 'El Salvador');
INSERT INTO Pais (iso, nombre) VALUES('AE', 'Emiratos Árabes Unidos');
INSERT INTO Pais (iso, nombre) VALUES('ER', 'Eritrea');
INSERT INTO Pais (iso, nombre) VALUES('SK', 'Eslovaquia');
INSERT INTO Pais (iso, nombre) VALUES('SI', 'Eslovenia');
INSERT INTO Pais (iso, nombre) VALUES('ES', 'España');
INSERT INTO Pais (iso, nombre) VALUES('UM', 'Islas ultramarinas de Estados Unidos');
INSERT INTO Pais (iso, nombre) VALUES('US', 'Estados Unidos');
INSERT INTO Pais (iso, nombre) VALUES('EE', 'Estonia');
INSERT INTO Pais (iso, nombre) VALUES('ET', 'Etiopía');
INSERT INTO Pais (iso, nombre) VALUES('GB', 'Inglaterra');
INSERT INTO Pais (iso, nombre) VALUES('FO', 'Islas Feroe');
INSERT INTO Pais (iso, nombre) VALUES('PH', 'Filipinas');
INSERT INTO Pais (iso, nombre) VALUES('FI', 'Finlandia');
INSERT INTO Pais (iso, nombre) VALUES('FJ', 'Fiyi');
INSERT INTO Pais (iso, nombre) VALUES('FR', 'Francia');
INSERT INTO Pais (iso, nombre) VALUES('GA', 'Gabón');
INSERT INTO Pais (iso, nombre) VALUES('GM', 'Gambia');
INSERT INTO Pais (iso, nombre) VALUES('GE', 'Georgia');
INSERT INTO Pais (iso, nombre) VALUES('GS', 'Islas Georgias del Sur y Sandwich del Sur');
INSERT INTO Pais (iso, nombre) VALUES('GH', 'Ghana');
INSERT INTO Pais (iso, nombre) VALUES('GI', 'Gibraltar');
INSERT INTO Pais (iso, nombre) VALUES('GD', 'Granada');
INSERT INTO Pais (iso, nombre) VALUES('GR', 'Grecia');
INSERT INTO Pais (iso, nombre) VALUES('GL', 'Groenlandia');
INSERT INTO Pais (iso, nombre) VALUES('GP', 'Guadalupe');
INSERT INTO Pais (iso, nombre) VALUES('GU', 'Guam');
INSERT INTO Pais (iso, nombre) VALUES('GT', 'Guatemala');
INSERT INTO Pais (iso, nombre) VALUES('GF', 'Guayana Francesa');
INSERT INTO Pais (iso, nombre) VALUES('GN', 'Guinea');
INSERT INTO Pais (iso, nombre) VALUES('GQ', 'Guinea Ecuatorial');
INSERT INTO Pais (iso, nombre) VALUES('GW', 'Guinea-Bissau');
INSERT INTO Pais (iso, nombre) VALUES('GY', 'Guyana');
INSERT INTO Pais (iso, nombre) VALUES('HT', 'Haití');
INSERT INTO Pais (iso, nombre) VALUES('HM', 'Islas Heard y McDonald');
INSERT INTO Pais (iso, nombre) VALUES('HN', 'Honduras');
INSERT INTO Pais (iso, nombre) VALUES('HK', 'Hong Kong');
INSERT INTO Pais (iso, nombre) VALUES('HU', 'Hungría');
INSERT INTO Pais (iso, nombre) VALUES('IN', 'India');
INSERT INTO Pais (iso, nombre) VALUES('ID', 'Indonesia');
INSERT INTO Pais (iso, nombre) VALUES('IR', 'Irán');
INSERT INTO Pais (iso, nombre) VALUES('IQ', 'Iraq');
INSERT INTO Pais (iso, nombre) VALUES('IE', 'Irlanda');
INSERT INTO Pais (iso, nombre) VALUES('IS', 'Islandia');
INSERT INTO Pais (iso, nombre) VALUES('IL', 'Israel');
INSERT INTO Pais (iso, nombre) VALUES('IT', 'Italia');
INSERT INTO Pais (iso, nombre) VALUES('JM', 'Jamaica');
INSERT INTO Pais (iso, nombre) VALUES('JP', 'Japón');
INSERT INTO Pais (iso, nombre) VALUES('JO', 'Jordania');
INSERT INTO Pais (iso, nombre) VALUES('KZ', 'Kazajstán');
INSERT INTO Pais (iso, nombre) VALUES('KE', 'Kenia');
INSERT INTO Pais (iso, nombre) VALUES('KG', 'Kirguistán');
INSERT INTO Pais (iso, nombre) VALUES('KI', 'Kiribati');
INSERT INTO Pais (iso, nombre) VALUES('KW', 'Kuwait');
INSERT INTO Pais (iso, nombre) VALUES('LA', 'Laos');
INSERT INTO Pais (iso, nombre) VALUES('LS', 'Lesotho');
INSERT INTO Pais (iso, nombre) VALUES('LV', 'Letonia');
INSERT INTO Pais (iso, nombre) VALUES('LB', 'Líbano');
INSERT INTO Pais (iso, nombre) VALUES('LR', 'Liberia');
INSERT INTO Pais (iso, nombre) VALUES('LY', 'Libia');
INSERT INTO Pais (iso, nombre) VALUES('LI', 'Liechtenstein');
INSERT INTO Pais (iso, nombre) VALUES('LT', 'Lituania');
INSERT INTO Pais (iso, nombre) VALUES('LU', 'Luxemburgo');
INSERT INTO Pais (iso, nombre) VALUES('MO', 'Macao');
INSERT INTO Pais (iso, nombre) VALUES('MK', 'ARY Macedonia');
INSERT INTO Pais (iso, nombre) VALUES('MG', 'Madagascar');
INSERT INTO Pais (iso, nombre) VALUES('MY', 'Malasia');
INSERT INTO Pais (iso, nombre) VALUES('MW', 'Malawi');
INSERT INTO Pais (iso, nombre) VALUES('MV', 'Maldivas');
INSERT INTO Pais (iso, nombre) VALUES('ML', 'Malí');
INSERT INTO Pais (iso, nombre) VALUES('MT', 'Malta');
INSERT INTO Pais (iso, nombre) VALUES('FK', 'Islas Malvinas');
INSERT INTO Pais (iso, nombre) VALUES('MP', 'Islas Marianas del Norte');
INSERT INTO Pais (iso, nombre) VALUES('MA', 'Marruecos');
INSERT INTO Pais (iso, nombre) VALUES('MH', 'Islas Marshall');
INSERT INTO Pais (iso, nombre) VALUES('MQ', 'Martinica');
INSERT INTO Pais (iso, nombre) VALUES('MU', 'Mauricio');
INSERT INTO Pais (iso, nombre) VALUES('MR', 'Mauritania');
INSERT INTO Pais (iso, nombre) VALUES('YT', 'Mayotte');
INSERT INTO Pais (iso, nombre) VALUES('MX', 'México');
INSERT INTO Pais (iso, nombre) VALUES('FM', 'Micronesia');
INSERT INTO Pais (iso, nombre) VALUES('MD', 'Moldavia');
INSERT INTO Pais (iso, nombre) VALUES('MC', 'Mónaco');
INSERT INTO Pais (iso, nombre) VALUES('MN', 'Mongolia');
INSERT INTO Pais (iso, nombre) VALUES('MS', 'Montserrat');
INSERT INTO Pais (iso, nombre) VALUES('MZ', 'Mozambique');
INSERT INTO Pais (iso, nombre) VALUES('MM', 'Myanmar');
INSERT INTO Pais (iso, nombre) VALUES('NA', 'Namibia');
INSERT INTO Pais (iso, nombre) VALUES('NR', 'Nauru');
INSERT INTO Pais (iso, nombre) VALUES('NP', 'Nepal');
INSERT INTO Pais (iso, nombre) VALUES('NI', 'Nicaragua');
INSERT INTO Pais (iso, nombre) VALUES('NE', 'Níger');
INSERT INTO Pais (iso, nombre) VALUES('NG', 'Nigeria');
INSERT INTO Pais (iso, nombre) VALUES('NU', 'Niue');
INSERT INTO Pais (iso, nombre) VALUES('NF', 'Isla Norfolk');
INSERT INTO Pais (iso, nombre) VALUES('NO', 'Noruega');
INSERT INTO Pais (iso, nombre) VALUES('NC', 'Nueva Caledonia');
INSERT INTO Pais (iso, nombre) VALUES('NZ', 'Nueva Zelanda');
INSERT INTO Pais (iso, nombre) VALUES('OM', 'Omán');
INSERT INTO Pais (iso, nombre) VALUES('NL', 'Países Bajos');
INSERT INTO Pais (iso, nombre) VALUES('PK', 'Pakistán');
INSERT INTO Pais (iso, nombre) VALUES('PW', 'Palau');
INSERT INTO Pais (iso, nombre) VALUES('PS', 'Palestina');
INSERT INTO Pais (iso, nombre) VALUES('PA', 'Panamá');
INSERT INTO Pais (iso, nombre) VALUES('PG', 'Papúa Nueva Guinea');
INSERT INTO Pais (iso, nombre) VALUES('PY', 'Paraguay');
INSERT INTO Pais (iso, nombre) VALUES('PE', 'Perú');
INSERT INTO Pais (iso, nombre) VALUES('PN', 'Islas Pitcairn');
INSERT INTO Pais (iso, nombre) VALUES('PF', 'Polinesia Francesa');
INSERT INTO Pais (iso, nombre) VALUES('PL', 'Polonia');
INSERT INTO Pais (iso, nombre) VALUES('PT', 'Portugal');
INSERT INTO Pais (iso, nombre) VALUES('PR', 'Puerto Rico');
INSERT INTO Pais (iso, nombre) VALUES('QA', 'Qatar');
INSERT INTO Pais (iso, nombre) VALUES('RE', 'Reunión');
INSERT INTO Pais (iso, nombre) VALUES('RW', 'Ruanda');
INSERT INTO Pais (iso, nombre) VALUES('RO', 'Rumania');
INSERT INTO Pais (iso, nombre) VALUES('RU', 'Rusia');
INSERT INTO Pais (iso, nombre) VALUES('EH', 'Sahara Occidental');
INSERT INTO Pais (iso, nombre) VALUES('SB', 'Islas Salomón');
INSERT INTO Pais (iso, nombre) VALUES('WS', 'Samoa');
INSERT INTO Pais (iso, nombre) VALUES('AS', 'Samoa Americana');
INSERT INTO Pais (iso, nombre) VALUES('KN', 'San Cristóbal y Nevis');
INSERT INTO Pais (iso, nombre) VALUES('SM', 'San Marino');
INSERT INTO Pais (iso, nombre) VALUES('PM', 'San Pedro y Miquelón');
INSERT INTO Pais (iso, nombre) VALUES('VC', 'San Vicente y las Granadinas');
INSERT INTO Pais (iso, nombre) VALUES('SH', 'Santa Helena');
INSERT INTO Pais (iso, nombre) VALUES('LC', 'Santa Lucía');
INSERT INTO Pais (iso, nombre) VALUES('ST', 'Santo Tomé y Príncipe');
INSERT INTO Pais (iso, nombre) VALUES('SN', 'Senegal');
INSERT INTO Pais (iso, nombre) VALUES('CS', 'Serbia y Montenegro');
INSERT INTO Pais (iso, nombre) VALUES('SC', 'Seychelles');
INSERT INTO Pais (iso, nombre) VALUES('SL', 'Sierra Leona');
INSERT INTO Pais (iso, nombre) VALUES('SG', 'Singapur');
INSERT INTO Pais (iso, nombre) VALUES('SY', 'Siria');
INSERT INTO Pais (iso, nombre) VALUES('SO', 'Somalia');
INSERT INTO Pais (iso, nombre) VALUES('LK', 'Sri Lanka');
INSERT INTO Pais (iso, nombre) VALUES('SZ', 'Suazilandia');
INSERT INTO Pais (iso, nombre) VALUES('ZA', 'Sudáfrica');
INSERT INTO Pais (iso, nombre) VALUES('SD', 'Sudán');
INSERT INTO Pais (iso, nombre) VALUES('SE', 'Suecia');
INSERT INTO Pais (iso, nombre) VALUES('CH', 'Suiza');
INSERT INTO Pais (iso, nombre) VALUES('SR', 'Surinam');
INSERT INTO Pais (iso, nombre) VALUES('SJ', 'Svalbard y Jan Mayen');
INSERT INTO Pais (iso, nombre) VALUES('TH', 'Tailandia');
INSERT INTO Pais (iso, nombre) VALUES('TW', 'Taiwán');
INSERT INTO Pais (iso, nombre) VALUES('TZ', 'Tanzania');
INSERT INTO Pais (iso, nombre) VALUES('TJ', 'Tayikistán');
INSERT INTO Pais (iso, nombre) VALUES('IO', 'Territorio Británico del Océano Índico');
INSERT INTO Pais (iso, nombre) VALUES('TF', 'Territorios Australes Franceses');
INSERT INTO Pais (iso, nombre) VALUES('TL', 'Timor Oriental');
INSERT INTO Pais (iso, nombre) VALUES('TG', 'Togo');
INSERT INTO Pais (iso, nombre) VALUES('TK', 'Tokelau');
INSERT INTO Pais (iso, nombre) VALUES('TO', 'Tonga');
INSERT INTO Pais (iso, nombre) VALUES('TT', 'Trinidad y Tobago');
INSERT INTO Pais (iso, nombre) VALUES('TN', 'Túnez');
INSERT INTO Pais (iso, nombre) VALUES('TC', 'Islas Turcas y Caicos');
INSERT INTO Pais (iso, nombre) VALUES('TM', 'Turkmenistán');
INSERT INTO Pais (iso, nombre) VALUES('TR', 'Turquía');
INSERT INTO Pais (iso, nombre) VALUES('TV', 'Tuvalu');
INSERT INTO Pais (iso, nombre) VALUES('UA', 'Ucrania');
INSERT INTO Pais (iso, nombre) VALUES('UG', 'Uganda');
INSERT INTO Pais (iso, nombre) VALUES('UY', 'Uruguay');
INSERT INTO Pais (iso, nombre) VALUES('UZ', 'Uzbekistán');
INSERT INTO Pais (iso, nombre) VALUES('VU', 'Vanuatu');
INSERT INTO Pais (iso, nombre) VALUES('VE', 'Venezuela');
INSERT INTO Pais (iso, nombre) VALUES('VN', 'Vietnam');
INSERT INTO Pais (iso, nombre) VALUES('VG', 'Islas Vírgenes Británicas');
INSERT INTO Pais (iso, nombre) VALUES('VI', 'Islas Vírgenes de los Estados Unidos');
INSERT INTO Pais (iso, nombre) VALUES('WF', 'Wallis y Futuna');
INSERT INTO Pais (iso, nombre) VALUES('YE', 'Yemen');
INSERT INTO Pais (iso, nombre) VALUES('DJ', 'Yibuti');
INSERT INTO Pais (iso, nombre) VALUES('ZM', 'Zambia');
INSERT INTO Pais (iso, nombre) VALUES('ZW', 'Zimbabue');

INSERT INTO Revista_Cientifica(nombreRevista, idPais)
VALUES('Nature Reviews Genetics', 1);
INSERT INTO Revista_Cientifica(nombreRevista, idPais)
VALUES('Nature Genetics', 3);
INSERT INTO Revista_Cientifica(nombreRevista, idPais)
VALUES('Annual Review of Genetics', 5);
INSERT INTO Revista_Cientifica(nombreRevista, idPais)
VALUES('Nature Microbiology', 6);

INSERT INTO Publicacion(tituloPublicacion, fechaPub, idRevistaCientif)
VALUES('A biochemical genomics approach for identifying genes by the activity of their products', '20190512', 1);
INSERT INTO Publicacion(tituloPublicacion, fechaPub, idRevistaCientif)
VALUES('An integrative genomics approach to infer causal associations between gene expression and disease', '20140218', 2);
INSERT INTO Publicacion(tituloPublicacion, fechaPub, idRevistaCientif)
VALUES('The problem of neuronal cell types: a physiological genomics approach', '20200601', 1);
INSERT INTO Publicacion(tituloPublicacion, fechaPub, idRevistaCientif)
VALUES('A functional genomics approach to understand variation in cytokine production in humans', '20160512', 3);
INSERT INTO Publicacion(tituloPublicacion, fechaPub, idRevistaCientif)
VALUES('The molecular analysis of leaf senescence–a genomics approach', '20130112', 4);


INSERT INTO SecuenciaDeNucleotidos(secuencia, fechaRegistro, idMetodoSec, anotaciones, idOrganela, nroCromosoma, idConformacion, idEspecie, idGenero, idFamilia, idOrden, idClase, idFilo, idReino, idDominio)
VALUES('ATCGTGTTGCCCCTTTTAAACGCCGTATCAGTCGATCGTCTGATCGGTCAGTCGTAGAAAACGACGACTCTAGTTATTAGTAGTACGATCGAGACTTATTTTTATCGGACGTATGCATCTGATGCGTAGTCAGTCGTACGTAGTCGTAGTATCTGA',
'20150301', 1,NULL, 1,2,1,1,1,1,1,1,1,1,1
);
INSERT INTO SecuenciaDeNucleotidos(secuencia, fechaRegistro, idMetodoSec, anotaciones, idOrganela, nroCromosoma, idConformacion, idEspecie, idGenero, idFamilia, idOrden, idClase, idFilo, idReino, idDominio)
VALUES('ATCGTATTGGCCGAGGAGACAGGGAACCACGGACGTATGCATCTGATGCGTAGTCTTAATATACGTAGTTTTTTTCGTAGTATCTGA',
'20180301', 1,NULL, 1,2,1,1,1,1,1,1,1,1,1
);
INSERT INTO SecuenciaDeNucleotidos(secuencia, fechaRegistro, idMetodoSec, anotaciones, idOrganela, nroCromosoma, idConformacion, idEspecie, idGenero, idFamilia, idOrden, idClase, idFilo, idReino, idDominio)
VALUES('ATCGTATTGGCCGAGGAGACAGGGAACCAAAATTTAAAAAGGGGGAGGAAAACCCCTTACCCGGGAGAGTTGATGTAGTGGGTAGTATCTCCACTATACCCCACTCATAACGGACGTATGCATCTGATGCGTAGTCTTAATATACGTAGTTTTTTTCGTAGTATCTGA',
'20120421', 1,NULL, 1,2,1,1,1,1,1,1,1,1,1
);
INSERT INTO SecuenciaDeNucleotidos(secuencia, fechaRegistro, idMetodoSec, anotaciones, idOrganela, nroCromosoma, idConformacion, idEspecie, idGenero, idFamilia, idOrden, idClase, idFilo, idReino, idDominio)
VALUES('ATCGTATTGGCCGAGGTTGACATATACCCCACTCATAACGGACGTATGCATCTGATGCGTAGTCTTAATATACGTAGTTTTTTTCGTAGTATCTGA',
'20120421', 1,NULL, 1,2,1,1,1,1,1,1,1,1,1
);
INSERT INTO SecuenciaDeNucleotidos(secuencia, fechaRegistro, idMetodoSec, anotaciones, idOrganela, nroCromosoma, idConformacion, idEspecie, idGenero, idFamilia, idOrden, idClase, idFilo, idReino, idDominio)
VALUES('ATCGTATTGGCCGAGGAGACAGGGAACCAAAATTTAAAAAGGGGGAGTTGACATATGCATCTGATGCGTAGTCTTAATATACGTAGTTTTTTTCGTAGTATCTGA',
'20120421', 1,NULL, 1,2,1,1,1,1,1,1,1,1,1
);
INSERT INTO SecuenciaDeNucleotidos(secuencia, fechaRegistro, idMetodoSec, anotaciones, idOrganela, nroCromosoma, idConformacion, idEspecie, idGenero, idFamilia, idOrden, idClase, idFilo, idReino, idDominio)
VALUES('ATCGTATTGGCCGAGGAGACAGGGAACCAAAATTTAAAAAGGGGGAGGAAAACCCCTTACCCGGGTTGACAAGAGTTGATGTAGTGGGTAGTATCCTGA',
'20120421', 1,NULL, 1,2,1,1,1,1,1,1,1,1,1
);
INSERT INTO SecuenciaDeNucleotidos(secuencia, fechaRegistro, idMetodoSec, anotaciones, idOrganela, nroCromosoma, idConformacion, idEspecie, idGenero, idFamilia, idOrden, idClase, idFilo, idReino, idDominio)
VALUES('ATTTATTACCGGAACTGTATATATATATATATATATATATATATATATATAA',
'20090421', 1,NULL, 1,2,1,1,1,1,1,1,1,1,1
);
INSERT INTO SecuenciaDeNucleotidos(secuencia, fechaRegistro, idMetodoSec, anotaciones, idOrganela, nroCromosoma, idConformacion, idEspecie, idGenero, idFamilia, idOrden, idClase, idFilo, idReino, idDominio)
VALUES('TATATATATATATATATATATATATATATATATAATCGTATTGGCCGAGGAGACAGGGAACCAAAATTTAAAAAGGGGGAGGAAAACCCCTTACCCGGGTTGACAAGAGTTGATGTAGTGGGTAGTATCCTGA',
'20090421', 1,NULL, 1,2,1,1,1,1,1,1,1,1,1
);


