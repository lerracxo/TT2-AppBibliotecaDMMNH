-- Archivo de cargas iniciales

-- Tabla usuario
INSERT INTO usuario VALUES(1,1,sha1('admin'),"Administrador","AP Administrador","AM Administrador","admin",1);
INSERT INTO usuario VALUES(2,1,sha1('revi'),"Revisor","AP Revisor","AM Revisor","revi@hotmail.com",1);

-- Tabla c_tipo_usuario
INSERT INTO cat_tipo_usuario VALUES(1,"Administrador","Administrador principal del sistema.");
INSERT INTO cat_tipo_usuario VALUES(2,"Revisor","Validador de información del sistema.");

-- Tipos de visitantes
INSERT INTO cat_ocupacion VALUES (1,"Estudiante");
INSERT INTO cat_ocupacion VALUES (2,"Profesor");
INSERT INTO cat_ocupacion VALUES (3,"Turista");
INSERT INTO cat_ocupacion VALUES (4,"Visitante casual");

-- catálogo de estado civil
INSERT INTO cat_estado_civil VALUES(1,"Soltero(a)");
INSERT INTO cat_estado_civil VALUES(2,"Unión libre");
INSERT INTO cat_estado_civil VALUES(3,"Casado(a)");
INSERT INTO cat_estado_civil VALUES(4,"Divorciado(a)");
INSERT INTO cat_estado_civil VALUES(5,"Viudo(a)");

-- Catálogo de Frecuencia de asistencia
INSERT INTO cat_frecuencia_asistencia VALUES(1,"Una vez a la semana");
INSERT INTO cat_frecuencia_asistencia VALUES(2,"Una vez al mes");
INSERT INTO cat_frecuencia_asistencia VALUES(3,"Una vez al año");
INSERT INTO cat_frecuencia_asistencia VALUES(4,"Entre dos o tres veces al año");
INSERT INTO cat_frecuencia_asistencia VALUES(5,"Más de tres veces al año");

-- Catálogo de rango de edades
INSERT INTO cat_rango_edad VALUES (1,"Entre 10 y 15 años");
INSERT INTO cat_rango_edad VALUES (2,"Entre 16 y 20 años");
INSERT INTO cat_rango_edad VALUES (3,"Entre 21 y 25 años");
INSERT INTO cat_rango_edad VALUES (4,"Entre 26 y 30 años");
INSERT INTO cat_rango_edad VALUES (5,"Entre 31 y 40 años");
INSERT INTO cat_rango_edad VALUES (6,"Entre 41 y 50 años");
INSERT INTO cat_rango_edad VALUES (7,"Entre 51 y 60 años");
INSERT INTO cat_rango_edad VALUES (8,"Mayores a 60 años");

-- Catálogo de razones de visita
INSERT INTO cat_razon_visita VALUES (1,"Me mandaron");
INSERT INTO cat_razon_visita VALUES (2,"Me gusta el tema");
INSERT INTO cat_razon_visita VALUES (3,"Por recomendación");
INSERT INTO cat_razon_visita VALUES (4,"Acompañé a alguien más");


-- Catálogo numero acompañantes
INSERT INTO cat_numero_acompanantes VALUES (1,"Ninguno");
INSERT INTO cat_numero_acompanantes VALUES (2,"Uno");
INSERT INTO cat_numero_acompanantes VALUES (3,"Entre 2 y 5");
INSERT INTO cat_numero_acompanantes VALUES (4,"Entre 6 y 10");
INSERT INTO cat_numero_acompanantes VALUES (5,"Más de 10");

-- Catálogo tipo_multimedia
INSERT INTO cat_tipo_multimedia VALUES (1,"Audio",null);
INSERT INTO cat_tipo_multimedia VALUES (2,"Imagen",null);
INSERT INTO cat_tipo_multimedia VALUES (3,"Video",null);
INSERT INTO cat_tipo_multimedia VALUES (4,"Texto",null);

-- Visitantes precargados
INSERT INTO seg_registro_visitante VALUES (1,'M',1,1,1,1,1,1,CURRENT_DATE(),CURRENT_TIME());
INSERT INTO seg_registro_visitante VALUES (2,'M',2,4,2,1,3,2,CURRENT_DATE(),CURRENT_TIME());
INSERT INTO seg_registro_visitante VALUES (3,'M',2,3,4,1,2,1,CURRENT_DATE(),CURRENT_TIME());
INSERT INTO seg_registro_visitante VALUES (4,'M',3,2,1,1,2,1,CURRENT_DATE(),CURRENT_TIME());
INSERT INTO seg_registro_visitante VALUES (5,'M',1,2,4,5,3,1,CURRENT_DATE(),CURRENT_TIME());
INSERT INTO seg_registro_visitante VALUES (6,'M',2,1,3,5,3,1,CURRENT_DATE(),CURRENT_TIME());
INSERT INTO seg_registro_visitante VALUES (7,'M',1,1,1,1,1,1,CURRENT_DATE(),CURRENT_TIME());
INSERT INTO seg_registro_visitante VALUES (8,'F',2,2,2,2,2,2,CURRENT_DATE(),CURRENT_TIME());




-- Catálogo de museos
INSERT INTO museo VALUES (1,"Museo Nacional de Histria","Museo Nacional de Historia","Primera sección del Bosque de ChapultepecCol. San Miguel Chapultepec CP 11580 Miguel Hidalgo, Miguel Hidalgo, Distrito Federal","difusion.mnh@inah.gob.mx","40-40-52-28");

-- Catálogo de exposiciones
INSERT INTO exposicion VALUES (1,"Zapata","Exposición permanente dedicada a Zapata",1);

-- Catálogo de salas
INSERT INTO sala VALUES (1,"Sala 1","Primera sala de la exposición",NOW(),1);


-- catalogo de epocas
INSERT INTO cat_epoca VALUES(1,"Renacimiento Italiano.","Descripción","1600");

-- Catalogo de Autores
INSERT INTO autor VALUES (1,"Leonardo Da Vinci","Leonardo da Vinci 
							(Leonardo di ser Piero da Vinci Loudspeaker.svg escuchar) 
							fue un pintor florentino.",
							STR_TO_DATE("15/04/1452","%d/%m/%Y"),1);
INSERT INTO autor VALUES (2,"Fotografo","Anónimo",STR_TO_DATE("15/04/1995","%d/%m/%Y"),1);

-- Piezas registradas
INSERT INTO pieza VALUES (1,"Cuadro de Leonardo Da Vinci","La Virgen, el niño Jesús y santa Ana","La Vierge, l'Enfant Jésus et sainte Anne",1,0,0,"");
INSERT INTO pieza VALUES (2,"Cuadro realizado a Benito Juarez, siendo presidente de la República Mexicana.","Benito Juarez","Cuadro, en él, Benito Juarez",2,0,0,"");

-- Elementos multimedia registrados previamente.
INSERT INTO multimedia  VALUES (13,4,'Benito Pablo Juárez García nació en San Pablo Guelatao, Oaxaca el 21 de marzo de 1806.','Fecha y lugar de nacimiento','20-05-2014-06-08-27-587.JPG','IMG_1352.JPG');
INSERT INTO multimedia  VALUES (14,4,'Su padre, Marcelino Juárez y su madre Brígida García, eran según sus propias palabras \"indios de la raza primitiva del país\" que fueron agricultores. Ambos murieron cuando él tenía 3 años, su madre durante el alumbramiento de su hermana María Alberta Longinos.','Sus padres',NULL,NULL);
INSERT INTO multimedia  VALUES (15,4,'Benito junto con sus hermanas María Josefa y Rosa quedaron bajo el amparo de sus abuelos paternos Pedro Juárez y Justa López igualmente indios de la \"nación zapoteca\" y su muy pequeña hermana María Longinos con su tía materna Cecilia.','Sus hermanas',NULL,NULL);
INSERT INTO multimedia  VALUES (16,4,'Trabajó como peón del campo y como pastor de ovejas hasta la edad de 12 años. \nEl 18 de octubre de 1821 inició estudios de gramática latina en el Seminario de Santa Cruz como capense.\nIngresó a la carrera de Jurisprudencia en el Instituto de Ciencias y Artes de Oaxaca, en donde obtuvo en 1834 la licenciatura; estudió con gran mérito, desempeñó varias cátedras.\nEl 26 de mayo de 1830 Juárez es nombrado encargado del Aula de Física del Instituto de Ciencias y Artes de Oaxaca.','Sus estudios',NULL,NULL);
INSERT INTO multimedia  VALUES (17,4,'En 1858, Benito Juárez se convirtió en presidente de la República por primera vez. Tuvo que huir de Guanajuato donde fue nombrado, a Guadalajara, Colima y Manzanillo, escapando de Félix María Zuloaga, quien estaba apoyado por el ejército y el clero, clases afectadas por las leyes promulgadas durante el mandato de Comonfort, basadas en la Ley Juárez.','Juárez presidente',NULL,NULL);
INSERT INTO multimedia  VALUES (18,4,'Benito Juárez fallece en la Ciudad de México el 18 de julio de 1872','Fallece',NULL,NULL);
INSERT INTO multimedia  VALUES (19,2,'Benito Juárez firmando óleo sobre tela','Benito Juárez firmando ','20-05-2014-06-34-54-298.jpg','Benito_Juárez,_siglo_XIX,_óleo_sobre_tela.jpg');
INSERT INTO multimedia  VALUES (20,2,'Retrato de Benito Juárez','Retrato','20-05-2014-06-37-56-466.jpg','benitojuarez.jpg');
INSERT INTO multimedia  VALUES (21,2,'Retrato tricolor de Benito Juárez','Retrato tricolor','20-05-2014-06-38-18-883.jpg','Benito-Juarez.jpg');
INSERT INTO multimedia  VALUES (22,2,'Bosquejo del billete de $20 ','propuesta de billete $20','20-05-2014-06-38-48-996.png','BENITOJUAREZ33.png');
INSERT INTO multimedia  VALUES (23,2,'Retrato de Benito Juárez siendo presidente de México','Presidente Benito Juárez','20-05-2014-06-39-43-964.jpg','benito-juarez-240311.jpg');
INSERT INTO multimedia  VALUES (24,2,'Portada de libro de Ética para escuelas de nivel primaria','Portada de libro de texto','20-05-2014-06-40-38-046.jpg','benito-juarez-mural.jpg');
INSERT INTO multimedia  VALUES (25,2,'Billete de $20 actual','Billete de $20 actual','20-05-2014-06-41-52-078.jpg','billete_20_pesos_2007.jpg');
INSERT INTO multimedia  VALUES (26,2,'Billete de $20 descontinuado','Billete de $20 descontinuado','20-05-2014-06-42-21-580.jpg','billete-20-juarez-papel-variedad-pesos-2611-MLM4808221291_082013-F.jpg');
INSERT INTO multimedia  VALUES (27,3,'Diferentes Leyes de Reforma, incluyendo la Ley de Juárez','Leyes de Reforma','20-05-2014-07-04-07-781.mp4','LEYES DE REFORMA.. BENITO JUAREZ.mp4');
INSERT INTO multimedia  VALUES (28,3,'Narración sobre Benito Juárez','El Coloso de Guelatao','20-05-2014-07-11-18-151.mp4','OAXACA, DON BENITO JUAREZ, El Coloso de Guelatao.mp4');
INSERT INTO multimedia  VALUES (29,3,'La otra cara de Benito Juárez','La otra cara de Benito Juárez','20-05-2014-07-13-54-104.mp4','La otra imagen de Benito Jurez La caricatura en la prensa satrica del siglo XIX.mp4');
INSERT INTO multimedia  VALUES (30,1,'Relato de la vida de Benito Juárez','Benito Juárez','20-05-2014-07-27-27-908.mp3','Vida de Benito Juárez.mp3');
INSERT INTO multimedia  VALUES (31,1,'Relato de la vida y las obras de Benito Juárez','Vida y obra','20-05-2014-07-29-49-326.mp3','BENITO JUÁREZ, VIDA Y OBRA. #video de texto.mp3');



-- Catalogo de multimedia relacionada a las piezas
INSERT INTO pieza_multimedia VALUES (1,1);
INSERT INTO pieza_multimedia VALUES (2,2);
INSERT INTO pieza_multimedia VALUES (2,13);
INSERT INTO pieza_multimedia VALUES (2,14);
INSERT INTO pieza_multimedia VALUES (2,15);
INSERT INTO pieza_multimedia VALUES (2,16);
INSERT INTO pieza_multimedia VALUES (2,17);
INSERT INTO pieza_multimedia VALUES (2,18);
INSERT INTO pieza_multimedia VALUES (2,19);
INSERT INTO pieza_multimedia VALUES (2,20);
INSERT INTO pieza_multimedia VALUES (2,21);
INSERT INTO pieza_multimedia VALUES (2,22);
INSERT INTO pieza_multimedia VALUES (2,23);
INSERT INTO pieza_multimedia VALUES (2,24);
INSERT INTO pieza_multimedia VALUES (2,25);
INSERT INTO pieza_multimedia VALUES (2,26);
INSERT INTO pieza_multimedia VALUES (2,27);
INSERT INTO pieza_multimedia VALUES (2,28);
INSERT INTO pieza_multimedia VALUES (2,29);
INSERT INTO pieza_multimedia VALUES (2,30);
INSERT INTO pieza_multimedia VALUES (2,31);



-- Inserciones para el menu 
-- id_local - nombre de entrada del menu - tipo de entreda - id del padre - nombre de forma
INSERT INTO menus VALUES (1,'Administración',1,0,null);
INSERT INTO menus VALUES (4,'Reportes',1,0,'administrarReportes'); -- Entrada para los reportes
INSERT INTO menus VALUES (6,'Piezas',2,1,'administrarPiezas');
INSERT INTO menus VALUES (7,'Usuarios',2,1,'administrarUsuarios'); -- Administración de usuarios 
INSERT INTO menus VALUES (8,'Autores',2,1,'administrarAutores');-- Administración de los autores.
INSERT INTO menus VALUES (9,'Epocas',2,1,'administrarEpocas');
INSERT INTO menus VALUES (10,'Información de Museo',1,0,null);
INSERT INTO menus VALUES (11,'Museo',2,10,'administrarMuseo');
INSERT INTO menus VALUES (12,'Exposiciones',2,10,'administrarExposiciones');
INSERT INTO menus VALUES (13,'Salas',2,10,'administrarSalas');
-- INSERT INTO menus VALUES (14,'Visualizar Bitácora',2,0,'visualizarBitacora');
-- INSERT INTO menus VALUES (15,'Notificación de corrección',1,0,'notificacionNotificacion');

