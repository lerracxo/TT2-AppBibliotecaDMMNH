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
