-- Archivo de cargas iniciales

-- Tabla usuario
INSERT INTO usuario VALUES(1,1,sha1('admin'),"Administrador","AP Administrador","AM Administrador","admin",1);
INSERT INTO usuario VALUES(2,1,sha1('revi'),"Revisor","AP Revisor","AM Revisor","revi@hotmail.com",1);

-- Tabla c_tipo_usuario
INSERT INTO cat_tipo_usuario VALUES(1,"Administrador","Administrador principal del sistema.");
INSERT INTO cat_tipo_usuario VALUES(2,"Revisor","Validador de información del sistema.");

-- Tipos de visitantes
INSERT INTO cat_ocupaciones VALUES (1,"Estudiante");
INSERT INTO cat_ocupaciones VALUES (2,"Profesor");
INSERT INTO cat_ocupaciones VALUES (3,"Turista");
INSERT INTO cat_ocupaciones VALUES (4,"Visitante casual");

-- Inserciones para el menu 
-- id_local - nombre de entrada del menu - tipo de entreda - id del padre - nombre de forma
INSERT INTO menus VALUES (1,'Administración',1,0,null);
INSERT INTO menus VALUES (2,'Autores',1,0,null);
INSERT INTO menus VALUES (4,'Reportes',1,0,null); -- Entrada para los reportes

INSERT INTO menus VALUES (32,'Archivos',2,1,'administrarArchivos');
INSERT INTO menus VALUES (33,'Piezas',2,1,'administrarPiezas');

