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
INSERT INTO cat_razon_visita VALUES (2,"Me gusta el tema de la exposición");
INSERT INTO cat_razon_visita VALUES (3,"Me recomedaron el museo");
INSERT INTO cat_razon_visita VALUES (4,"Acompañé a alguien más");


-- Catálogo numero acompañantes
INSERT INTO cat_numero_acompanantes VALUES (1,"Ninguno");
INSERT INTO cat_numero_acompanantes VALUES (2,"Uno");
INSERT INTO cat_numero_acompanantes VALUES (3,"Entre 2 y 5");
INSERT INTO cat_numero_acompanantes VALUES (4,"Entre 6 y 10");
INSERT INTO cat_numero_acompanantes VALUES (5,"Más de 10");

-- Catálogo tipo_multimedia
INSERT INTO cat_tipo_multimedia VALUES (1,"Audio","mp3");
INSERT INTO cat_tipo_multimedia VALUES (2,"Imagen","jpeg");
INSERT INTO cat_tipo_multimedia VALUES (3,"imagen","jpg");
INSERT INTO cat_tipo_multimedia VALUES (4,"Imagen","png");
INSERT INTO cat_tipo_multimedia VALUES (5,"Video","mp4");

-- catalogo de epocas

-- Inserciones para el menu 
-- id_local - nombre de entrada del menu - tipo de entreda - id del padre - nombre de forma
INSERT INTO menus VALUES (1,'Administración',1,0,null);
INSERT INTO menus VALUES (2,'Autores',1,0,null);
INSERT INTO menus VALUES (4,'Reportes',1,0,null); -- Entrada para los reportes

INSERT INTO menus VALUES (5,'Archivos',2,1,'administrarArchivos');
INSERT INTO menus VALUES (6,'Piezas',2,1,'administrarPiezas');

INSERT INTO menus VALUES (7,'Usuarios',2,1,'administrarUsuario'); -- Administración de usuarios 


