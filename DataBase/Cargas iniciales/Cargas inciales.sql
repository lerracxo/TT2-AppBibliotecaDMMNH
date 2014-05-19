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

-- catalogo de epocas
INSERT INTO cat_epoca VALUES(1,"Renacimiento Italiano.","Descripción","1600");

-- Catalogo de Autores
INSERT INTO autor VALUES (1,"Leonardo Da Vinci","Leonardo da Vinci 
							(Leonardo di ser Piero da Vinci Loudspeaker.svg escuchar) 
							fue un pintor florentino. Notable polímata del Renacimiento italiano 
							(a la vez anatomista, arquitecto, artista, botánico, científico, escritor, escultor, 
							filósofo, ingeniero, inventor, músico, poeta y urbanista) nació en Vinci el 15 de abril de 
							14522 y falleció en Amboise el 2 de mayo de 1519, a los 67 años, 
							acompañado de su fiel Francesco Melzi, a quien legó sus proyectos, 
							diseños y pinturas.2 Tras pasar su infancia en su ciudad natal, 
							Leonardo estudió con el célebre pintor florentino Andrea de Verrocchio. 
							Sus primeros trabajos de importancia fueron creados en Milán al servicio del duque 
							Ludovico Sforza. Trabajó a continuación en Roma, Bolonia y Venecia, y pasó los últimos 
							años de su vida en Francia, por invitación del rey Francisco I.",
							STR_TO_DATE("15/04/1452","%d/%m/%Y"),1);
INSERT INTO autor VALUES (2,"Fotografo","Anónimo",STR_TO_DATE("15/04/1995","%d/%m/%Y"),1);

-- Piezas registradas
INSERT INTO pieza VALUES (1,"Cuadro de Leonardo Da Vinci","La Virgen, el niño Jesús y santa Ana","La Vierge, l'Enfant Jésus et sainte Anne",1);
INSERT INTO pieza VALUES (2,"Cuadro realizado a Benito Juarez, siendo presidente de la República Mexicana.","Benito Juarez","Cuadro, en él, Benito Juarez",2);

-- Elementos multimedia registrados previamente.
INSERT INTO multimedia VALUES (1,2,"Descripción del primer cuadro","Cuadro","Cuadro1.jpeg","cuadroLeonardo.jpeg");
INSERT INTO multimedia VALUES (2,2,"Descripción 1","Cuadro","http://www.islamicity.com/global/images/photo/IC-Articles/Heart-Love-Sky-Hands-Silhouette__1920x1200.JPG","103154.JPG");

-- Catalogo de multimedia relacionada a las piezas
INSERT INTO pieza_multimedia VALUES (1,1);
INSERT INTO pieza_multimedia VALUES (2,2);


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
INSERT INTO menus VALUES (14,'Visualizar Bitácora',2,0,'visualizarBitacora');
INSERT INTO menus VALUES (15,'Notificación de corrección',1,0,'notificacionNotificacion');


