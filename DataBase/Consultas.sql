-- Tratamiento de los usuarios 

SELECT distinct id_tipo_usr fROM usuario;
SELECT * FROM c_tipo_usuario;
INSERT INTO usuario VALUES(90,1,0,"revi",sha1('revi'),"Revisor","AP Revisor","AM Revisor","revi@hotmail.com",0,0,0,0,0,0);

SELECT IF(MAX(id_usr) IS NULL, 0, id_usr) fROM usuario WHERE id_usr = 3;

SELECT * FROM usuario;
SELECT * FROM c_tipo_usuario;

-- update usuario set ID_TIPO_USR = 1;
update usuario set password = sha1('admin')	 WHERE id_usr = 3;


SELECT * fROM evento_inbound;
SELECT * fROM evento;

UPDATE usuario SET id_tipo_usr = 1 WHERE id_tipo_usr != 1;
DELETE FROM c_tipo_usuario WHERE id_tipo_usr != 1;

commit;
rollback;
-- Tratamiento de usuarios


-- Tratamiento del menu
SELECT * fROM menus;
SELECT * fROM c_tipo_menus;

-- Tratamiento del menu
SELECT * fROM bloqueo_login;

DELETE from bloqueo_login WHERE id_usr = 3;

SELECT * FROM c_estado_agente;

commit;

SELECT * fROM conexion_agente;

INSERT INTO conexion_agente VALUES (2,7,3,CURDATE(),CURTIME(),1,CURTIME(),0,3);

select * from menus;

SELECT creaMenuDB(1);


SELECT SHA1('Password1') FROM usuario;

SELECT * fROM Menus;

SELECT * FROM c_tipo_usuario;


INSERT INTO c_tipo_usuario VALUES (1,"Administrador","Administrador del sistemusuarioa");

SELECT * fROM c_sistema;


SELECT * FROM seg_registroVisitante;


DESCRIBE seg_registroVisitante;
DESCRIBE cat_ocupaciones;
DESCRIBE cat_razonVisita;

SELECT * fROM cat_razonvisita;

SELECT * FROM cat_ocupaciones;

SELECT * frOM c_tipo_usuario;

SELECT * fROM menus;

DELETE fROM menus WHERE idmenu = 32;

SELECT * fROM usuario;

UPDATE usuario SET EMAIL_USR = 'admin' Where id_usr = 3;
commit;

SELECT IF(MAX(id_usr) IS NULL, 0, id_usr) fROM usuario WHERE email_usr = 'admin' AND 
password = 'd033e22ae348aeb5660fc2140aec35850c4da997' AND estatus_usr = 1; 

SELECT * FROM menus;
INSERT INTO menus VALUES (33,'Piezas',2,1,'administrarPiezas');

SELECT * fROM campana;

SELECT * FROM usuario;

SELECT * FROM cat_tipo_usuario;

UPDATE menus SET forma = 'administrarUsuarios' WHERE idmenu = 7;

SELECT * fROM menus;

SELECT * FROM cat_estado_civil;
SELECT * fROM cat_frecuencia_asistencia;
SELECT * fROM cat_numero_acompanantes;
SELECT * fROM cat_ocupacion;
SELECT * fROM cat_razon_visita;
SELECT * FROM cat_rango_edades;

SELECT * fROM seg_registro_visitante;

SELECT curtime();

INSERT INTO seg_registro_visitante VALUES (0,'H',1,2,1,2,1,2,curdate(), curtime());

-- Consulta para guardar los datos de un visitante
INSERT INTO seg_registro_visitante VALUES (0,'H',
	(SELECT id_rango_edades FROM cat_rango_edades WHERE desc_rango_edades= 'Entre 10 y 15 años'),
	(SELECT id_ocupacion FROM cat_ocupacion WHERE desc_ocupacion = 'Estudiante' ),
	(SELECT id_estado_civil FROM cat_estado_civil WHERE desc_estado_civil = 'Unión libre'),
	(SELECT id_razon_visita FROM cat_razon_visita WHERE desc_razon_visita = 'Me gusta el tema de la exposición'),
	(SELECT id_frecuencia_asistencia FROM cat_frecuencia_asistencia WHERE desc_frecuencia_asistencia = 'Una vez al mes'),
	(SELECT id_numero_acompanantes FROM cat_numero_acompanantes WHERE desc_numero_acompanantes = 'Entre 6 y 10'),
	curdate(), curtime()
	);

DELETE FROM autor;
SELECT * fROM autor;
SELECT * fROM usuario;

SELECT * fROM pieza;
SELECT id_pieza, desc_pieza, nombre, titulo, id_autor FROM pieza ;

SELECT * FROM pieza_multimedia;

SELECT * fROM multimedia;
SELECT * fROM cat_tipo_multimedia;
SELECT id_ocupacion,desc_ocupacion FROM cat_ocupaciones;

SELECT * fROM pieza;
SELECT * fROM pieza_multimedia;

SELECT m.id_multimedia, m.id_tipo_multimedia, 
		m.nombre, m.nombre_archivo, m.nombre_original 
	FROM multimedia m, pieza_multimedia pz
	WHERE pz.id_multimedia = m.id_multimedia 
	AND   pz.id_pieza = 1;

SELECT * FROM multimedia;

DELETE FROM menus WHERE idmenu = 6;

DESCRIBE  pieza;
DESCRIbE multimedia;
DESCRIBE Autor;

SELECT id_autor, nombre, desc_autor, fecha_nacimiento, id_epoca FROM autor;

INSERT INTO pieza (desc_pieza, nombre,titulo,id_autor) VALUES ("test 1","3","asd",1);

SELECT * fROM autor;
SELECT * fROM PIEZA;

DELETE FROM PIEZA WHERE id_pieza = 0;

SELECT * fROM multimedia;
UPDATE pieza SET desc_pieza= "desc_1", nombre = "nombre1", titulo = "titulo1", id_autor = 1 WHERE id_pieza = 3;

SELECT * FROM pieza;
DELETE FROM cat_razon_visita WHERE id_razon_visita = 3;
INSERT INTO cat_razon_visita VALUES (2,"Me gusta el tema");
INSERT INTO cat_razon_visita VALUES (3,"Por recomendación");


SELECT * FROM cat_razon_visita;
SELECT * fROM multimedia;
SELECT * fROM cat_tipo_multimedia;
SELECT id_tipo_multimedia, desc_tipo_multimedia, extension FROM cat_tipo_multimedia;
SELECT id_pieza, desc_pieza, nombre, titulo, id_autor FROM pieza;

DESCRIBE PIEZA;
DESCRIBE MULTIMEDIA;


SELECT m.id_multimedia, m.id_tipo_multimedia, m.desc_multimedia ,  m.nombre, m.nombre_archivo, m.nombre_original  FROM multimedia m, pieza_multimedia pz  WHERE pz.id_multimedia = m.id_multimedia  AND   pz.id_pieza =1;
SELECT * fROM cat_tipo_multimedia;

DELETE FROM cat_tipo_multimedia;

SELECT * fROM multimedia;
INSERT INTO multimedia VALUES (3,2,"Descripción del primer cuadro","Chami","http://www.islamicity.com/global/images/photo/IC-Articles/Heart-Love-Sky-Hands-Silhouette__1920x1200.JPG","cuadroLeonardo.jpeg");

SELECT * FROM pieza_multimedia;

INSERT INTO pieza_multimedia VALUES(1,3);

SELECT m.id_multimedia, m.id_tipo_multimedia, m.desc_multimedia,   
				 m.nombre, m.nombre_archivo, m.nombre_original  
				 FROM multimedia m, pieza_multimedia pz  
				 WHERE pz.id_multimedia = m.id_multimedia  
				 AND   pz.id_pieza = 1
				ORDER BY m.id_multimedia;
SELECT * fROM cat_tipo_multimedia;
SELECT * fROM usuario;
SELECT * fROM multimedia;
SELECT * FROM pieza_multimedia;

INSERT INTO USUARIO VALUES (1,1,sha1("alopez"),"Omar","Santoyo","Martínez","omars@gmail.com",1 );

DELETE FROM usuario WHERE id_usr = 1;

SELECT * fROM autor;

SELECT * fROM pieza_multimedia;

SELECT sha1("admin");
SELECT * fROm pieza_multimedia WHERE id_pieza = 2;
SELECT * fROM multimedia WHERE id_multimedia in (3,4);
SELECT * fROM multimedia;

SELECT * FROM pieza;
INSERT INTO multimedia (id_tipo_multimedia, desc_multimedia, nombre, nombre_archivo, nombre_original)
	VALUES (2,"De pensar :D","Nuevo","06-05-2014-01-04-42-137.jpg","10338290_1450233855220950_5116624737764795133_n.jpg");

SELECT * fROM seg_registro_visitante;

INSERT INTO seg_registro_visitante (genero,id_rango_edad,id_ocupacion,id_estado_civil,
 id_razon_visita,id_frecuencia_asistencia, id_numero_acompanantes, fecha_visita, hora_visita)
	VALUES ('M',1,1,1,1,1,1,curdate(), curtime());



INSERT INTO seg_registro_visitante (genero,id_rango_edad,id_ocupacion,id_estado_civil, id_razon_visita,id_frecuencia_asistencia, id_numero_acompanantes, fecha_visita, hora_visita)  VALUES ( 'F', 1, 1, 1, 1, 1, 1,curdate(), curtime());

SELECT * fROM seg_registro_visitante;
SELECT * fROM pieza;

SELECT * fROM usuario;

SELECT SHA1('admin');

UPDATE USUARIO SET PASSWORD = SHA1('admin') WHERE id_usr = 3;
SELECT * fROM autor;
SELECT * FROM cat_tipo_multimedia;

DELETE FROM menus WHERE idmenu = 4;


-- Query para el reporte de visitantes
SELECT * fROM seg_registro_visitante;
-- 
SELECT * FROM multimedia;
SELECT * FROM cat_tipo_multimedia;

DELETE FROM menus;
SELECT * fROM menus;

SELECT * fROM usuario;

SELECT creaMenuDB();

UPDATE USUARIO SET PASSWORD = sha1('revi') WHERE id_usr = 1;

DROP FUNCTION creaMenuDB;




