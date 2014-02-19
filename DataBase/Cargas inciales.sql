-- Archivo de cargas iniciales

-- Tabla usuario
INSERT INTO usuario VALUES(1,1,0,"admin",sha1('admin'),"Administrador","AP Administrador","AM Administrador","admin@hotmail.com",0,0,0,0,0,0);
INSERT INTO usuario VALUES(2,1,0,"revi",sha1('revi'),"Revisor","AP Revisor","AM Revisor","revi@hotmail.com",0,0,0,0,0,0);



-- Tabla c_tipo_usuario
INSERT INTO c_tipo_usuario VALUES(1,1,"Administrador","Administrador principal del sistema.");
INSERT INTO c_tipo_usuario VALUES(2,1,"Revisor","Validador de información del sistema.");

-- Tipo de usuarios
INSERT INTO c_tipo_usuario VALUES (1,"Administrador","Administrador del sistema");
INSERT INTO c_tipo_usuario VALUES (2,"Revisor","Revisor del sistema");