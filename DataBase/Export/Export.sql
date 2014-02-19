CREATE DATABASE  IF NOT EXISTS `dcpro` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dcpro`;
-- MySQL dump 10.13  Distrib 5.6.13, for osx10.6 (i386)
--
-- Host: localhost    Database: dcpro
-- ------------------------------------------------------
-- Server version	5.5.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `C_CAMPANA`
--

DROP TABLE IF EXISTS `C_CAMPANA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `C_CAMPANA` (
  `ID_C_CAMP` int(11) NOT NULL AUTO_INCREMENT,
  `ID_CAMP` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_C_CAMP`),
  KEY `FK_RELATIONSHIP_21` (`ID_CAMP`),
  CONSTRAINT `FK_RELATIONSHIP_21` FOREIGN KEY (`ID_CAMP`) REFERENCES `CAMPANA` (`ID_CAMP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que contiene los catalogos de campaña';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `C_CAMPANA`
--

LOCK TABLES `C_CAMPANA` WRITE;
/*!40000 ALTER TABLE `C_CAMPANA` DISABLE KEYS */;
/*!40000 ALTER TABLE `C_CAMPANA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agenda`
--

DROP TABLE IF EXISTS `agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agenda` (
  `ID_AGENDA` int(11) NOT NULL AUTO_INCREMENT,
  `ID_CAMP` int(11) NOT NULL,
  PRIMARY KEY (`ID_AGENDA`),
  KEY `FK_RELATIONSHIP_8` (`ID_CAMP`),
  CONSTRAINT `FK_RELATIONSHIP_8` FOREIGN KEY (`ID_CAMP`) REFERENCES `campana` (`ID_CAMP`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agenda`
--

LOCK TABLES `agenda` WRITE;
/*!40000 ALTER TABLE `agenda` DISABLE KEYS */;
INSERT INTO `agenda` VALUES (26,142),(30,151),(31,152),(33,154),(34,155),(35,156),(36,157),(37,158),(38,159),(39,160),(40,161),(41,162),(42,163);
/*!40000 ALTER TABLE `agenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alarmas_externas`
--

DROP TABLE IF EXISTS `alarmas_externas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alarmas_externas` (
  `NUM_MAX_MSGFILA` int(11) NOT NULL,
  `NUM_MAX_LLAMFILA` int(11) NOT NULL,
  `TMP_MAX_FILA` int(11) NOT NULL,
  `ID_ALARMA_EXTERNA` int(11) NOT NULL AUTO_INCREMENT,
  `ID_CAMP_OUT` int(11) DEFAULT NULL,
  `ID_CAMP_IN` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_ALARMA_EXTERNA`),
  KEY `FK_RELATIONSHIP_11` (`ID_CAMP_OUT`),
  KEY `FK_RELATIONSHIP_15` (`ID_CAMP_IN`),
  CONSTRAINT `FK_RELATIONSHIP_11` FOREIGN KEY (`ID_CAMP_OUT`) REFERENCES `campana_outbound` (`ID_CAMP_OUT`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RELATIONSHIP_15` FOREIGN KEY (`ID_CAMP_IN`) REFERENCES `campana_inbound` (`ID_CAMP_IN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1 COMMENT='Tabla que contiene los atributos de alarmas externas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alarmas_externas`
--

LOCK TABLES `alarmas_externas` WRITE;
/*!40000 ALTER TABLE `alarmas_externas` DISABLE KEYS */;
INSERT INTO `alarmas_externas` VALUES (10,10,10,26,18,NULL),(0,0,0,30,NULL,10),(7,9,7,31,21,NULL),(0,0,0,33,NULL,11),(-860410751,-1305904492,-707475102,34,NULL,12),(0,0,0,35,23,NULL),(0,0,0,36,24,NULL),(0,9,0,37,NULL,13),(0,0,0,38,NULL,14),(0,0,0,39,25,NULL),(5,5,5,40,26,NULL),(0,0,0,41,NULL,15),(0,0,0,42,27,NULL);
/*!40000 ALTER TABLE `alarmas_externas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alarmas_internas`
--

DROP TABLE IF EXISTS `alarmas_internas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alarmas_internas` (
  `MIN_AGENTES` int(11) NOT NULL,
  `LIM_TMP_LLAMADA` int(11) NOT NULL,
  `TMP_MAX_PAUSA` int(11) NOT NULL,
  `CAMB_EST_AGENTE` int(11) NOT NULL,
  `ID_ALARMA_INTERNA` int(11) NOT NULL AUTO_INCREMENT,
  `ID_CAMP_IN` int(11) DEFAULT NULL,
  `ID_CAMP_OUT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_ALARMA_INTERNA`),
  KEY `FK_RELATIONSHIP_12` (`ID_CAMP_OUT`),
  KEY `FK_RELATIONSHIP_14` (`ID_CAMP_IN`),
  CONSTRAINT `FK_RELATIONSHIP_12` FOREIGN KEY (`ID_CAMP_OUT`) REFERENCES `campana_outbound` (`ID_CAMP_OUT`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RELATIONSHIP_14` FOREIGN KEY (`ID_CAMP_IN`) REFERENCES `campana_inbound` (`ID_CAMP_IN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alarmas_internas`
--

LOCK TABLES `alarmas_internas` WRITE;
/*!40000 ALTER TABLE `alarmas_internas` DISABLE KEYS */;
INSERT INTO `alarmas_internas` VALUES (10,10,5,10,26,NULL,18),(0,0,0,0,30,10,NULL),(8,7,6,7,31,NULL,21),(0,0,0,0,33,11,NULL),(10,4,5,7,34,12,NULL),(0,0,0,0,35,NULL,23),(0,0,0,0,36,NULL,24),(6,0,0,0,37,13,NULL),(0,0,0,0,38,14,NULL),(0,0,0,0,39,NULL,25),(10,10,2,3,40,NULL,26),(0,0,0,0,41,15,NULL),(0,0,0,0,42,NULL,27);
/*!40000 ALTER TABLE `alarmas_internas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bloqueo_login`
--

DROP TABLE IF EXISTS `bloqueo_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bloqueo_login` (
  `idbloqueo_login` int(11) NOT NULL AUTO_INCREMENT,
  `id_usr` int(11) DEFAULT NULL,
  `intentos` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idbloqueo_login`),
  KEY `fk_usuario_bloqueo` (`id_usr`),
  CONSTRAINT `fk_usuario_bloqueo` FOREIGN KEY (`id_usr`) REFERENCES `usuario` (`ID_USR`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bloqueo_login`
--

LOCK TABLES `bloqueo_login` WRITE;
/*!40000 ALTER TABLE `bloqueo_login` DISABLE KEYS */;
INSERT INTO `bloqueo_login` VALUES (1,3,'5');
/*!40000 ALTER TABLE `bloqueo_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_actividades_paus`
--

DROP TABLE IF EXISTS `c_actividades_paus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_actividades_paus` (
  `ID_ACT_PAUSA` int(11) NOT NULL AUTO_INCREMENT,
  `ID_C_SISTEMA` int(11) DEFAULT NULL,
  `ACTIVIDAD_PAUSA` varchar(15) NOT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_ACT_PAUSA`),
  KEY `FK_RELATIONSHIP_37` (`ID_C_SISTEMA`),
  CONSTRAINT `FK_RELATIONSHIP_37` FOREIGN KEY (`ID_C_SISTEMA`) REFERENCES `c_sistema` (`ID_C_SISTEMA`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COMMENT='Tabla que contiene el catalogo de actividades en pausa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_actividades_paus`
--

LOCK TABLES `c_actividades_paus` WRITE;
/*!40000 ALTER TABLE `c_actividades_paus` DISABLE KEYS */;
INSERT INTO `c_actividades_paus` VALUES (1,1,'Junta','Junta'),(2,1,'Baño','Baño'),(3,1,'Comida','Comida'),(4,1,'Break-descanso','Break-descanso'),(5,1,'Capacitacion','Capacitacion'),(6,1,'Otros','Otros'),(7,1,'Inicio de sesio','Inicio de sesion');
/*!40000 ALTER TABLE `c_actividades_paus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_campana_integracion`
--

DROP TABLE IF EXISTS `c_campana_integracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_campana_integracion` (
  `id_camp` int(11) NOT NULL,
  `id_int_crm` int(11) NOT NULL,
  `estatus` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_camp`,`id_int_crm`),
  KEY `FK_RELATIONSHIP_44` (`id_int_crm`),
  KEY `FK_RELATIONSHIP_59` (`id_camp`),
  CONSTRAINT `FK_RELATIONSHIP_44` FOREIGN KEY (`id_int_crm`) REFERENCES `c_integracion_crm` (`ID_INT_CRM`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RELATIONSHIP_59` FOREIGN KEY (`id_camp`) REFERENCES `campana` (`ID_CAMP`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_campana_integracion`
--

LOCK TABLES `c_campana_integracion` WRITE;
/*!40000 ALTER TABLE `c_campana_integracion` DISABLE KEYS */;
INSERT INTO `c_campana_integracion` VALUES (142,1,1),(142,2,1),(142,3,1),(142,4,1),(142,5,1),(142,6,1),(142,11,1),(142,16,1),(151,1,1),(151,2,1),(151,3,1),(151,4,1),(151,5,1),(151,6,1),(152,1,1),(152,2,1),(152,3,1),(152,4,1),(152,5,1),(152,6,1),(152,13,1),(152,19,1),(154,1,1),(154,2,1),(154,3,1),(154,4,1),(154,5,1),(154,6,1),(154,10,1),(154,11,1),(155,1,1),(155,2,1),(155,3,1),(155,4,1),(155,5,1),(155,6,1),(156,1,1),(156,2,1),(156,3,1),(156,4,1),(156,5,1),(156,6,1),(157,1,1),(157,2,1),(157,3,1),(157,4,1),(157,5,1),(157,6,1),(158,1,1),(158,2,1),(158,3,1),(158,4,1),(158,5,1),(158,6,1),(159,1,1),(159,2,1),(159,3,1),(159,4,1),(159,5,1),(159,6,1),(160,1,1),(160,2,1),(160,3,1),(160,4,1),(160,5,1),(160,6,1),(161,1,1),(161,2,1),(161,3,1),(161,4,1),(161,5,1),(161,6,1),(162,1,1),(162,2,1),(162,3,1),(162,4,1),(162,5,1),(162,6,1),(163,1,1),(163,2,1),(163,3,1),(163,4,1),(163,5,1),(163,6,1);
/*!40000 ALTER TABLE `c_campana_integracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_campana_resultadosin`
--

DROP TABLE IF EXISTS `c_campana_resultadosin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_campana_resultadosin` (
  `id_camp` int(11) NOT NULL,
  `id_res_in` int(11) NOT NULL,
  `estatus` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_camp`,`id_res_in`),
  KEY `FK_RELATIONSHIP_61` (`id_res_in`),
  KEY `FK_RELATIONSHIP_62` (`id_camp`),
  CONSTRAINT `FK_RELATIONSHIP_61` FOREIGN KEY (`id_res_in`) REFERENCES `c_resultados_inbou` (`ID_RES_IN`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RELATIONSHIP_62` FOREIGN KEY (`id_camp`) REFERENCES `campana` (`ID_CAMP`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_campana_resultadosin`
--

LOCK TABLES `c_campana_resultadosin` WRITE;
/*!40000 ALTER TABLE `c_campana_resultadosin` DISABLE KEYS */;
INSERT INTO `c_campana_resultadosin` VALUES (142,1,1),(142,2,1),(142,3,1),(142,4,1),(142,5,1),(151,1,1),(151,2,1),(151,3,1),(151,4,1),(151,5,1),(151,6,1),(151,7,0),(152,1,1),(152,2,1),(152,3,1),(152,4,1),(152,5,1),(154,1,1),(154,2,1),(154,3,1),(154,4,1),(154,5,1),(154,6,1),(154,7,0),(155,1,1),(155,2,1),(155,3,1),(155,4,1),(155,5,1),(155,6,1),(155,7,1),(156,1,1),(156,2,1),(156,3,1),(156,4,1),(156,5,1),(157,1,1),(157,2,1),(157,3,1),(157,4,1),(157,5,1),(158,1,1),(158,2,1),(158,3,1),(158,4,1),(158,5,1),(158,6,1),(158,7,0),(159,1,1),(159,2,1),(159,3,1),(159,4,1),(159,5,1),(159,6,1),(159,7,0),(160,1,1),(160,2,1),(160,3,1),(160,4,1),(160,5,1),(161,1,1),(161,2,1),(161,3,1),(161,4,1),(161,5,1),(162,1,1),(162,2,1),(162,3,1),(162,4,1),(162,5,1),(162,6,1),(162,7,0),(163,1,1),(163,2,1),(163,3,1),(163,4,1),(163,5,1);
/*!40000 ALTER TABLE `c_campana_resultadosin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_campana_resultadosout`
--

DROP TABLE IF EXISTS `c_campana_resultadosout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_campana_resultadosout` (
  `id_camp` int(11) NOT NULL,
  `id_res_out` int(11) NOT NULL,
  `estatus` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_camp`,`id_res_out`),
  KEY `FK_RELATIONSHIP_63` (`id_res_out`),
  KEY `FK_RELATIONSHIP_64` (`id_camp`),
  CONSTRAINT `FK_RELATIONSHIP_63` FOREIGN KEY (`id_res_out`) REFERENCES `c_resultados_outbo` (`ID_RES_OUT`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_RELATIONSHIP_64` FOREIGN KEY (`id_camp`) REFERENCES `campana` (`ID_CAMP`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_campana_resultadosout`
--

LOCK TABLES `c_campana_resultadosout` WRITE;
/*!40000 ALTER TABLE `c_campana_resultadosout` DISABLE KEYS */;
INSERT INTO `c_campana_resultadosout` VALUES (142,1,1),(142,2,1),(142,3,1),(142,4,1),(142,5,1),(142,6,1),(142,7,1),(142,8,1),(142,9,1),(142,10,1),(142,11,1),(142,12,1),(142,13,1),(151,1,1),(151,2,1),(151,3,1),(151,4,1),(151,5,1),(151,6,1),(151,7,1),(151,8,1),(151,9,1),(151,10,1),(151,11,1),(151,12,1),(151,13,1),(152,1,1),(152,2,1),(152,3,1),(152,4,1),(152,5,1),(152,6,1),(152,7,1),(152,8,1),(152,9,1),(152,10,1),(152,11,1),(152,12,1),(152,13,1),(154,1,1),(154,2,1),(154,3,1),(154,4,1),(154,5,1),(154,6,1),(154,7,1),(154,8,1),(154,9,1),(154,10,1),(154,11,1),(154,12,1),(154,13,1),(155,1,1),(155,2,1),(155,3,1),(155,4,1),(155,5,1),(155,6,1),(155,7,1),(155,8,1),(155,9,1),(155,10,1),(155,11,1),(155,12,1),(155,13,1),(156,1,1),(156,2,1),(156,3,1),(156,4,1),(156,5,1),(156,6,1),(156,7,1),(156,8,1),(156,9,1),(156,10,1),(156,11,1),(156,12,1),(156,13,1),(157,1,1),(157,2,1),(157,3,1),(157,4,1),(157,5,1),(157,6,1),(157,7,1),(157,8,1),(157,9,1),(157,10,1),(157,11,1),(157,12,1),(157,13,1),(158,1,1),(158,2,1),(158,3,1),(158,4,1),(158,5,1),(158,6,1),(158,7,1),(158,8,1),(158,9,1),(158,10,1),(158,11,1),(158,12,1),(158,13,1),(159,1,1),(159,2,1),(159,3,1),(159,4,1),(159,5,1),(159,6,1),(159,7,1),(159,8,1),(159,9,1),(159,10,1),(159,11,1),(159,12,1),(159,13,1),(160,1,1),(160,2,1),(160,3,1),(160,4,1),(160,5,1),(160,6,1),(160,7,1),(160,8,1),(160,9,1),(160,10,1),(160,11,1),(160,12,1),(160,13,1),(161,1,1),(161,2,1),(161,3,1),(161,4,1),(161,5,1),(161,6,1),(161,7,1),(161,8,1),(161,9,1),(161,10,1),(161,11,1),(161,12,1),(161,13,1),(162,1,1),(162,2,1),(162,3,1),(162,4,1),(162,5,1),(162,6,1),(162,7,1),(162,8,1),(162,9,1),(162,10,1),(162,11,1),(162,12,1),(162,13,1),(163,1,1),(163,2,1),(163,3,1),(163,4,1),(163,5,1),(163,6,1),(163,7,1),(163,8,1),(163,9,1),(163,10,1),(163,11,1),(163,12,1),(163,13,1),(163,14,1);
/*!40000 ALTER TABLE `c_campana_resultadosout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_desborde`
--

DROP TABLE IF EXISTS `c_desborde`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_desborde` (
  `id_desborde` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_desborde`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_desborde`
--

LOCK TABLES `c_desborde` WRITE;
/*!40000 ALTER TABLE `c_desborde` DISABLE KEYS */;
INSERT INTO `c_desborde` VALUES (1,'Finalizar Llamada'),(2,'Dejar un Mensaje'),(3,'Transferir a una extensión de emergencia');
/*!40000 ALTER TABLE `c_desborde` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_estado_agente`
--

DROP TABLE IF EXISTS `c_estado_agente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_estado_agente` (
  `ID_ESTADO` int(11) NOT NULL AUTO_INCREMENT,
  `ID_C_SISTEMA` int(11) DEFAULT NULL,
  `NOMBRE_EDO` varchar(10) NOT NULL,
  `DESCRIPCION_EDO` text,
  `COLOR` varchar(15) DEFAULT NULL,
  `DESCRIPCION_COLOR` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ID_ESTADO`),
  KEY `FK_RELATIONSHIP_45` (`ID_C_SISTEMA`),
  CONSTRAINT `FK_RELATIONSHIP_45` FOREIGN KEY (`ID_C_SISTEMA`) REFERENCES `c_sistema` (`ID_C_SISTEMA`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COMMENT='Tabla que contiene los catalogos de estao de agente ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_estado_agente`
--

LOCK TABLES `c_estado_agente` WRITE;
/*!40000 ALTER TABLE `c_estado_agente` DISABLE KEYS */;
INSERT INTO `c_estado_agente` VALUES (1,1,'Deconectad','Inicio de sesion','0xFFFFFF','Blanco'),(2,1,'Pausa','Pausas','0xFFFF00','Amarillo'),(3,1,'Disponible','Disponible','0x009900','Verde'),(4,1,'Realizando','Realizando llamada','0x0066CC','Azul'),(5,1,'Recibiendo','Recibiendo llamada','0xCC0000','Rojo'),(6,1,'Post-llama','Post-llamada','0xFF9900','Naranja');
/*!40000 ALTER TABLE `c_estado_agente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_gpo_atn_inbound`
--

DROP TABLE IF EXISTS `c_gpo_atn_inbound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_gpo_atn_inbound` (
  `ID_GPO_ATN_IN` int(11) NOT NULL AUTO_INCREMENT,
  `ID_C_SISTEMA` int(11) DEFAULT NULL,
  `GRUPO_ATENCION` varchar(30) NOT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_GPO_ATN_IN`),
  KEY `FK_RELATIONSHIP_36` (`ID_C_SISTEMA`),
  CONSTRAINT `FK_RELATIONSHIP_36` FOREIGN KEY (`ID_C_SISTEMA`) REFERENCES `c_sistema` (`ID_C_SISTEMA`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='Tabla que contiene el catalogo de Grupos de Atencion';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_gpo_atn_inbound`
--

LOCK TABLES `c_gpo_atn_inbound` WRITE;
/*!40000 ALTER TABLE `c_gpo_atn_inbound` DISABLE KEYS */;
INSERT INTO `c_gpo_atn_inbound` VALUES (1,1,'Asignado','Cuando el evento fue asigado por envox'),(2,1,'Atendido','Cuando se trata de una llamada que atendio un agente'),(3,1,'Abandono','Cuando el cliente abandona la llamada'),(4,1,'Mensaje','Cuando el cliente decide dejar un mensaje de voz en horario laboral'),(5,1,'Mensaje no laboral','Cuando el cliente decide dejar un mensaje en horario no laboral');
/*!40000 ALTER TABLE `c_gpo_atn_inbound` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_integracion_crm`
--

DROP TABLE IF EXISTS `c_integracion_crm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_integracion_crm` (
  `ID_INT_CRM` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(20) NOT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  `ESTATUS` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID_INT_CRM`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COMMENT='Tabla que contiene el catalogo de integraciones CRM';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_integracion_crm`
--

LOCK TABLES `c_integracion_crm` WRITE;
/*!40000 ALTER TABLE `c_integracion_crm` DISABLE KEYS */;
INSERT INTO `c_integracion_crm` VALUES (1,'SIBEL',NULL,0),(2,'REMEDY',NULL,0),(3,'GOLDMINE',NULL,0),(4,'SALESFORCE',NULL,1),(5,'MICROSOFT CRM',NULL,1),(6,'CRM A DEMANDA SUGAR',NULL,1),(8,'Prueba 3',NULL,0),(10,'Prueba 4',NULL,1),(11,'Prueba 5',NULL,1),(12,'Prueba 6','Agregar',0),(13,'Prueba 7',NULL,1),(14,'Prueba 8',NULL,1),(15,'Prueba 9','Agregar',1),(16,'Prueba 10',NULL,1),(18,'Prueba 12',NULL,1),(19,'Prueba 13',NULL,1),(20,'Prueba 14',NULL,1),(21,'Prueba 15',NULL,1),(22,'Prueba 16','Agregar',1),(23,'prueba 17',NULL,1),(24,'Prueba 19',NULL,1),(25,'prueba X',NULL,1);
/*!40000 ALTER TABLE `c_integracion_crm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_perfiles_agenda`
--

DROP TABLE IF EXISTS `c_perfiles_agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_perfiles_agenda` (
  `ID_PERF_AGENDA` int(11) NOT NULL AUTO_INCREMENT,
  `PERFIL` varchar(15) NOT NULL,
  `DESCRIPCCION` varchar(100) DEFAULT NULL,
  `COLOR` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID_PERF_AGENDA`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='Tabla que contiene el catalogo de perfiles de Agenda';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_perfiles_agenda`
--

LOCK TABLES `c_perfiles_agenda` WRITE;
/*!40000 ALTER TABLE `c_perfiles_agenda` DISABLE KEYS */;
INSERT INTO `c_perfiles_agenda` VALUES (1,'Labora',NULL,NULL),(2,'Fin de Semana',NULL,NULL),(3,'Cerrado',NULL,NULL),(4,'Especial',NULL,NULL);
/*!40000 ALTER TABLE `c_perfiles_agenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_resultados_inbou`
--

DROP TABLE IF EXISTS `c_resultados_inbou`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_resultados_inbou` (
  `ID_RES_IN` int(11) NOT NULL AUTO_INCREMENT,
  `RESULTADO` varchar(50) NOT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_RES_IN`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_resultados_inbou`
--

LOCK TABLES `c_resultados_inbou` WRITE;
/*!40000 ALTER TABLE `c_resultados_inbou` DISABLE KEYS */;
INSERT INTO `c_resultados_inbou` VALUES (1,'soporte',NULL),(2,'informacion',NULL),(3,'quejas',NULL),(4,'ventas',NULL),(5,'transferencia a otra extension',NULL),(6,'sin resultado',NULL),(7,'uno',NULL);
/*!40000 ALTER TABLE `c_resultados_inbou` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_resultados_outbo`
--

DROP TABLE IF EXISTS `c_resultados_outbo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_resultados_outbo` (
  `ID_RES_OUT` int(11) NOT NULL AUTO_INCREMENT,
  `RESULTADO` varchar(50) NOT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_RES_OUT`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COMMENT='Tabla que contiene el catalogo de Resultados Outbound';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_resultados_outbo`
--

LOCK TABLES `c_resultados_outbo` WRITE;
/*!40000 ALTER TABLE `c_resultados_outbo` DISABLE KEYS */;
INSERT INTO `c_resultados_outbo` VALUES (1,'ocupado',NULL),(2,'no contesta',NULL),(3,'equivocado',NULL),(4,'ahi no vive',NULL),(5,'fallecio',NULL),(6,'intentar mas tarde',NULL),(7,'no volver a llamar',NULL),(8,'ventas',NULL),(9,'soporte concluido',NULL),(10,'datos actualizados',NULL),(11,'gestion concluida',NULL),(12,'fax',NULL),(13,'ocupado',NULL),(14,'sin resultado',NULL);
/*!40000 ALTER TABLE `c_resultados_outbo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_rubro_inbound`
--

DROP TABLE IF EXISTS `c_rubro_inbound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_rubro_inbound` (
  `ID_RUBRO_INBOUND` int(11) NOT NULL AUTO_INCREMENT,
  `ID_C_SISTEMA` int(11) DEFAULT NULL,
  `RUBRO_EVENTO` varchar(30) NOT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_RUBRO_INBOUND`),
  KEY `FK_RELATIONSHIP_47` (`ID_C_SISTEMA`),
  CONSTRAINT `FK_RELATIONSHIP_47` FOREIGN KEY (`ID_C_SISTEMA`) REFERENCES `c_sistema` (`ID_C_SISTEMA`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='Tabla que contiene el catalogo del Rubro de Evento';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_rubro_inbound`
--

LOCK TABLES `c_rubro_inbound` WRITE;
/*!40000 ALTER TABLE `c_rubro_inbound` DISABLE KEYS */;
INSERT INTO `c_rubro_inbound` VALUES (1,1,'Transferencia Operadora','El cliente decide ser transferido a la operadora'),(2,1,'Transferencia Extensión','El cliente proporciona extensión a la que desea  ser transferido'),(3,1,'Distbución Envox','Cuando envox la distribuye ya sea llamada o mensaje de voz');
/*!40000 ALTER TABLE `c_rubro_inbound` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_sistema`
--

DROP TABLE IF EXISTS `c_sistema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_sistema` (
  `ID_C_SISTEMA` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID_C_SISTEMA`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Tabla que contiene los catalogos de Sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_sistema`
--

LOCK TABLES `c_sistema` WRITE;
/*!40000 ALTER TABLE `c_sistema` DISABLE KEYS */;
INSERT INTO `c_sistema` VALUES (1);
/*!40000 ALTER TABLE `c_sistema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_tipo_alarma`
--

DROP TABLE IF EXISTS `c_tipo_alarma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_tipo_alarma` (
  `id_tipo_alarma` int(11) NOT NULL AUTO_INCREMENT,
  `alarma` varchar(45) DEFAULT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_alarma`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_tipo_alarma`
--

LOCK TABLES `c_tipo_alarma` WRITE;
/*!40000 ALTER TABLE `c_tipo_alarma` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_tipo_alarma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_tipo_evento`
--

DROP TABLE IF EXISTS `c_tipo_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_tipo_evento` (
  `ID_TIPO_EVENTO` int(11) NOT NULL AUTO_INCREMENT,
  `ID_C_SISTEMA` int(11) DEFAULT NULL,
  `NOMBRE_EVENTO` varchar(15) NOT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  `ESTATUS` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_TIPO_EVENTO`),
  KEY `FK_RELATIONSHIP_33` (`ID_C_SISTEMA`),
  CONSTRAINT `FK_RELATIONSHIP_33` FOREIGN KEY (`ID_C_SISTEMA`) REFERENCES `c_sistema` (`ID_C_SISTEMA`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_tipo_evento`
--

LOCK TABLES `c_tipo_evento` WRITE;
/*!40000 ALTER TABLE `c_tipo_evento` DISABLE KEYS */;
INSERT INTO `c_tipo_evento` VALUES (1,1,'Inbound','Llamada de entrada',1),(2,1,'Outbound','Llamada realizada por Envox',1),(3,1,'Dialer','Llamada realizada por el Agente',1),(4,1,'Mensaje','Mensaje de voz',1),(5,1,'Web Call Back','Llamada automatico de salida con base de datos proporcionada por el cliente',0),(6,1,'CRM','Llamada iniciada desde el CRM',0);
/*!40000 ALTER TABLE `c_tipo_evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_tipo_marcacion`
--

DROP TABLE IF EXISTS `c_tipo_marcacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_tipo_marcacion` (
  `ID_TIPO_MARC` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO_MARCACION` varchar(15) NOT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  `NUMERO_DIGITOS` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_TIPO_MARC`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='Tabla que contiene el catalogo de tipos de Marcacion';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_tipo_marcacion`
--

LOCK TABLES `c_tipo_marcacion` WRITE;
/*!40000 ALTER TABLE `c_tipo_marcacion` DISABLE KEYS */;
INSERT INTO `c_tipo_marcacion` VALUES (1,'local',NULL,10),(2,'Celular Local',NULL,10),(3,'Celular Foraneo',NULL,10),(4,'Internacional',NULL,12);
/*!40000 ALTER TABLE `c_tipo_marcacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_tipo_usuario`
--

DROP TABLE IF EXISTS `c_tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_tipo_usuario` (
  `ID_TIPO_USR` int(11) NOT NULL AUTO_INCREMENT,
  `ID_C_SISTEMA` int(11) DEFAULT NULL,
  `NOMBRE_TIPO` varchar(20) NOT NULL,
  `DESCRIPCION_TIPO` text,
  PRIMARY KEY (`ID_TIPO_USR`),
  KEY `FK_RELATIONSHIP_46` (`ID_C_SISTEMA`),
  CONSTRAINT `FK_RELATIONSHIP_46` FOREIGN KEY (`ID_C_SISTEMA`) REFERENCES `c_sistema` (`ID_C_SISTEMA`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Tabla que contiene el catalogo de tipos de Usuario';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_tipo_usuario`
--

LOCK TABLES `c_tipo_usuario` WRITE;
/*!40000 ALTER TABLE `c_tipo_usuario` DISABLE KEYS */;
INSERT INTO `c_tipo_usuario` VALUES (1,1,'Supervisor','Supervisa Sistema');
/*!40000 ALTER TABLE `c_tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendario`
--

DROP TABLE IF EXISTS `calendario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendario` (
  `ID_CALENDARIO` int(11) NOT NULL AUTO_INCREMENT,
  `ID_CAMP` int(11) DEFAULT NULL,
  `year` varchar(15) NOT NULL,
  PRIMARY KEY (`ID_CALENDARIO`),
  KEY `FK_RELATIONSHIP_25` (`ID_CAMP`),
  CONSTRAINT `FK_RELATIONSHIP_25` FOREIGN KEY (`ID_CAMP`) REFERENCES `campana` (`ID_CAMP`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendario`
--

LOCK TABLES `calendario` WRITE;
/*!40000 ALTER TABLE `calendario` DISABLE KEYS */;
INSERT INTO `calendario` VALUES (6,142,'2012'),(17,142,'2012'),(23,142,'2012'),(32,142,'2012'),(40,142,'2013'),(55,142,'2013'),(60,142,'2013'),(65,142,'2013'),(70,142,'2013'),(77,142,'2012'),(85,142,'2013'),(97,142,'2012'),(105,142,'2012'),(112,155,'2012'),(114,142,'2013'),(115,151,'2013'),(116,152,'2013'),(117,154,'2013'),(118,155,'2013'),(119,156,'2013'),(120,142,'2013'),(121,151,'2013'),(122,152,'2013'),(123,154,'2013'),(124,155,'2013'),(125,156,'2013'),(126,142,'2013'),(127,151,'2013'),(128,152,'2013'),(129,154,'2013'),(130,155,'2013'),(131,156,'2013'),(132,142,'2013'),(133,151,'2013'),(134,152,'2013'),(135,154,'2013'),(136,155,'2013'),(137,156,'2013'),(138,142,'2013'),(139,151,'2013'),(140,152,'2013'),(141,154,'2013'),(142,155,'2013'),(143,156,'2013'),(144,142,'2013'),(145,151,'2013'),(146,152,'2013'),(147,154,'2013'),(148,155,'2013'),(149,156,'2013'),(150,142,'2013'),(151,151,'2013'),(152,152,'2013'),(153,154,'2013'),(154,155,'2013'),(155,156,'2013'),(156,142,'2013'),(157,142,'2013'),(159,151,'2012'),(160,152,'2012'),(161,154,'2012'),(162,155,'2012'),(163,156,'2012'),(164,142,'2012'),(165,151,'2012'),(167,154,'2012'),(168,155,'2012'),(169,156,'2012'),(170,157,'2012'),(171,157,'2012'),(172,142,'2012');
/*!40000 ALTER TABLE `calendario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caller`
--

DROP TABLE IF EXISTS `caller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caller` (
  `ID_CALLER` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(20) DEFAULT NULL,
  `A_PATERNO` varchar(20) DEFAULT NULL,
  `A_MATERNO` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_CALLER`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Tabla de registros de numeros telefonicos para marcacion de ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caller`
--

LOCK TABLES `caller` WRITE;
/*!40000 ALTER TABLE `caller` DISABLE KEYS */;
INSERT INTO `caller` VALUES (1,'Maria Petunia','De los Santos','y Santos'),(2,'Ana Maria','Vera','Vera');
/*!40000 ALTER TABLE `caller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campana`
--

DROP TABLE IF EXISTS `campana`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campana` (
  `ID_CAMP` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_CAMP` varchar(100) NOT NULL,
  `TERM_LLAMADA` tinyint(1) NOT NULL,
  `ID_USR` int(11) NOT NULL,
  `MARCACION_SALIDA` tinyint(4) NOT NULL,
  `tipo_camp` tinyint(4) NOT NULL,
  `id_int_crm` int(11) DEFAULT NULL,
  `id_desborde` int(11) DEFAULT NULL,
  `num_extension` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ID_CAMP`),
  KEY `FK_RELATIONSHIP_55` (`ID_USR`),
  KEY `FK_RELATIONSHIP_60` (`id_int_crm`),
  KEY `FK_RELATIONSHIP` (`id_desborde`),
  CONSTRAINT `FK_RELATIONSHIP` FOREIGN KEY (`id_desborde`) REFERENCES `c_desborde` (`id_desborde`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_RELATIONSHIP_55` FOREIGN KEY (`ID_USR`) REFERENCES `usuario` (`ID_USR`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RELATIONSHIP_60` FOREIGN KEY (`id_int_crm`) REFERENCES `c_integracion_crm` (`ID_INT_CRM`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=latin1 COMMENT='Tabla campaña';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campana`
--

LOCK TABLES `campana` WRITE;
/*!40000 ALTER TABLE `campana` DISABLE KEYS */;
INSERT INTO `campana` VALUES (142,'Multifón',1,2,0,0,NULL,1,''),(151,'Echo',1,1,0,1,NULL,1,'9089'),(152,'Echo again',0,2,0,0,NULL,2,''),(154,'Shiawase',0,5,0,1,NULL,2,''),(155,'Peasant',0,1,0,1,NULL,1,''),(156,'Flawless',0,5,0,0,NULL,2,''),(157,'Banamex',0,7,0,0,NULL,1,NULL),(158,'Pruebas',1,5,1,1,NULL,3,'911'),(159,'PKTest',1,70,1,1,NULL,2,NULL),(160,'green pace',1,73,0,0,NULL,3,'750'),(161,'Rtony',1,71,1,0,NULL,1,NULL),(162,'Green Inbound',0,72,0,1,NULL,1,NULL),(163,'Multifón',1,4,1,0,NULL,1,NULL);
/*!40000 ALTER TABLE `campana` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campana_agente`
--

DROP TABLE IF EXISTS `campana_agente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campana_agente` (
  `ID_USR` int(11) NOT NULL,
  `ID_CAMP` int(11) NOT NULL,
  `NIVEL_EXPERIENCIA` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_USR`,`ID_CAMP`),
  KEY `FK_RELATIONSHIP_106` (`ID_CAMP`),
  CONSTRAINT `FK_RELATIONSHIP_106` FOREIGN KEY (`ID_CAMP`) REFERENCES `campana` (`ID_CAMP`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RELATIONSHIP_107` FOREIGN KEY (`ID_USR`) REFERENCES `usuario` (`ID_USR`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campana_agente`
--

LOCK TABLES `campana_agente` WRITE;
/*!40000 ALTER TABLE `campana_agente` DISABLE KEYS */;
INSERT INTO `campana_agente` VALUES (2,161,5),(5,158,5),(30,151,10),(74,159,10),(75,160,10),(76,159,10),(77,160,10),(78,160,10),(79,159,10),(80,159,10),(81,159,10),(82,161,4),(83,161,7),(84,161,2),(85,162,5),(86,162,3),(87,162,9),(88,162,2);
/*!40000 ALTER TABLE `campana_agente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campana_inbound`
--

DROP TABLE IF EXISTS `campana_inbound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campana_inbound` (
  `ID_CAMP` int(11) NOT NULL,
  `MAX_CICLOS` int(11) NOT NULL,
  `ID_CAMP_IN` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID_CAMP_IN`),
  KEY `FK_RELATIONSHIP_13` (`ID_CAMP`),
  CONSTRAINT `FK_RELATIONSHIP_13` FOREIGN KEY (`ID_CAMP`) REFERENCES `campana` (`ID_CAMP`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campana_inbound`
--

LOCK TABLES `campana_inbound` WRITE;
/*!40000 ALTER TABLE `campana_inbound` DISABLE KEYS */;
INSERT INTO `campana_inbound` VALUES (151,123,10),(154,4,11),(155,9,12),(158,5,13),(159,10,14),(162,5,15);
/*!40000 ALTER TABLE `campana_inbound` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campana_outbound`
--

DROP TABLE IF EXISTS `campana_outbound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campana_outbound` (
  `ID_CAMP` int(11) NOT NULL,
  `MAX_TONOS` int(11) NOT NULL,
  `PRIORIDAD_AG_CALLE` tinyint(1) NOT NULL,
  `ID_CAMP_OUT` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID_CAMP_OUT`),
  KEY `FK_RELATIONSHIP_9` (`ID_CAMP`),
  CONSTRAINT `FK_RELATIONSHIP_9` FOREIGN KEY (`ID_CAMP`) REFERENCES `campana` (`ID_CAMP`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campana_outbound`
--

LOCK TABLES `campana_outbound` WRITE;
/*!40000 ALTER TABLE `campana_outbound` DISABLE KEYS */;
INSERT INTO `campana_outbound` VALUES (142,5,0,18),(152,23,1,21),(156,0,0,23),(157,10,0,24),(160,6,0,25),(161,10,1,26),(163,4,0,27);
/*!40000 ALTER TABLE `campana_outbound` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conexion_agente`
--

DROP TABLE IF EXISTS `conexion_agente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conexion_agente` (
  `ID_ESTADO` int(11) NOT NULL,
  `ID_ACT_PAUSA` int(11) DEFAULT NULL,
  `ID_USR` int(11) NOT NULL,
  `FECHA_CONEXION` date NOT NULL,
  `HORA_CONEXION` time NOT NULL,
  `ESTADO_CONEXION` tinyint(1) NOT NULL,
  `HORA_ESTADO` time NOT NULL,
  `ACUMULADO_PAUSA` time NOT NULL,
  `blaze_clientid` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID_USR`),
  KEY `FK_RELATIONSHIP_48` (`ID_ESTADO`),
  KEY `FK_RELATIONSHIP_54` (`ID_ACT_PAUSA`),
  CONSTRAINT `FK_RELATIONSHIP_105` FOREIGN KEY (`ID_USR`) REFERENCES `usuario` (`ID_USR`),
  CONSTRAINT `FK_RELATIONSHIP_48` FOREIGN KEY (`ID_ESTADO`) REFERENCES `c_estado_agente` (`ID_ESTADO`),
  CONSTRAINT `FK_RELATIONSHIP_54` FOREIGN KEY (`ID_ACT_PAUSA`) REFERENCES `c_actividades_paus` (`ID_ACT_PAUSA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que contiene la informacion de Conexion de un Agente a';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conexion_agente`
--

LOCK TABLES `conexion_agente` WRITE;
/*!40000 ALTER TABLE `conexion_agente` DISABLE KEYS */;
INSERT INTO `conexion_agente` VALUES (2,7,3,'2014-02-18','11:11:03',1,'11:11:03','00:00:00',NULL),(2,7,6,'2012-10-12','12:07:09',1,'12:07:09','00:00:00',NULL),(2,7,30,'2012-10-10','13:21:35',1,'13:21:35','00:00:00',NULL),(2,7,59,'2012-09-27','16:23:53',1,'16:23:53','00:00:00',NULL),(2,7,60,'2012-09-27','16:34:22',1,'16:34:22','00:00:00',NULL),(2,7,62,'2012-10-11','10:17:39',1,'10:17:39','00:00:00',NULL),(2,7,70,'2012-10-04','18:15:27',1,'18:15:27','00:00:00',NULL),(2,7,71,'2012-10-04','13:37:35',1,'13:37:35','00:00:00',NULL),(2,7,72,'2012-10-04','18:09:15',1,'18:09:15','00:00:00',NULL),(2,7,73,'2012-10-04','15:36:36',1,'15:36:36','00:00:00',NULL),(3,7,74,'2012-10-04','19:02:47',1,'19:04:52','00:00:00',NULL),(2,7,76,'2012-10-04','18:03:32',1,'18:18:19','00:00:00',NULL),(3,7,77,'2012-10-04','18:47:14',1,'18:55:58','00:00:00',NULL),(6,7,82,'2012-10-04','18:56:23',1,'18:57:26','00:00:00',NULL),(3,7,83,'2012-10-04','19:11:21',1,'19:18:29','00:00:00',NULL),(3,7,84,'2012-10-04','19:09:21',1,'19:09:54','00:00:00',NULL),(2,7,85,'2012-10-04','19:18:56',1,'19:18:56','00:00:00',NULL),(5,7,87,'2012-10-04','19:27:45',1,'19:28:28','00:00:00',NULL),(2,7,88,'2012-10-04','19:15:50',1,'19:15:50','00:00:00',NULL);
/*!40000 ALTER TABLE `conexion_agente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configurador`
--

DROP TABLE IF EXISTS `configurador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configurador` (
  `id_configurador` int(11) NOT NULL,
  `ip_bd` varchar(15) DEFAULT NULL,
  `usuario_bd` varchar(15) DEFAULT NULL,
  `password_bd` varchar(15) DEFAULT NULL,
  `ip_envox` varchar(15) DEFAULT NULL,
  `crm` tinyint(4) NOT NULL,
  `terminacion_llamada` tinyint(4) NOT NULL,
  `marcacion_salida` tinyint(4) NOT NULL,
  `prioridad_ag_calle` tinyint(4) NOT NULL,
  `desborde` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_configurador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configurador`
--

LOCK TABLES `configurador` WRITE;
/*!40000 ALTER TABLE `configurador` DISABLE KEYS */;
INSERT INTO `configurador` VALUES (1,'192.168.2.197','sa','dbadmin','192.168.2.197',0,1,1,1,1);
/*!40000 ALTER TABLE `configurador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dias`
--

DROP TABLE IF EXISTS `dias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dias` (
  `ID_DIA` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_DIA` varchar(10) NOT NULL,
  PRIMARY KEY (`ID_DIA`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dias`
--

LOCK TABLES `dias` WRITE;
/*!40000 ALTER TABLE `dias` DISABLE KEYS */;
INSERT INTO `dias` VALUES (1,'lunes'),(2,'martes'),(3,'miercoles'),(4,'jueves'),(5,'viernes'),(6,'sabado'),(7,'domingo');
/*!40000 ALTER TABLE `dias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dias_especiales`
--

DROP TABLE IF EXISTS `dias_especiales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dias_especiales` (
  `ID_DIA_ESPECIAL` int(11) NOT NULL AUTO_INCREMENT,
  `ID_CALENDARIO` int(11) NOT NULL,
  `FECHA_DIA` date DEFAULT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_DIA_ESPECIAL`),
  KEY `FK_RELATIONSHIP_26` (`ID_CALENDARIO`),
  CONSTRAINT `FK_RELATIONSHIP_26` FOREIGN KEY (`ID_CALENDARIO`) REFERENCES `calendario` (`ID_CALENDARIO`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=latin1 COMMENT='Tabla que contiene los dias especiales del calendario';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dias_especiales`
--

LOCK TABLES `dias_especiales` WRITE;
/*!40000 ALTER TABLE `dias_especiales` DISABLE KEYS */;
INSERT INTO `dias_especiales` VALUES (6,6,'2012-09-25','Cumpleaños'),(17,17,'2012-09-07','dia 07 festivo '),(23,23,'2012-10-10','Dia 10 de octubre '),(32,32,'2012-11-29','dia 29 de noviembre'),(40,40,'2013-01-01','Año nuevo'),(55,55,'2013-05-01','Día del Trabajo'),(60,60,'2013-09-16','Día de la Independencia'),(65,65,'2013-11-18','Día de la Revolución Mexicana'),(70,70,'2013-12-25','Día de Navidad'),(77,77,'2012-09-19','Le puedo guardar símbolos raros?? *o*'),(85,85,'2013-12-27','ASDFGHJKL'),(97,97,'2012-09-20','Ésta se puede borrar'),(105,105,'2012-11-02','Cumple Edgar '),(112,112,'2012-09-30','Fecha especial de pruena'),(114,114,'2013-01-01','Año nuevo'),(115,115,'2013-01-01','Año nuevo'),(116,116,'2013-01-01','Año nuevo'),(117,117,'2013-01-01','Año nuevo'),(118,118,'2013-01-01','Año nuevo'),(119,119,'2013-01-01','Año nuevo'),(120,120,'2013-02-04','Día de la Constitución'),(121,121,'2013-02-04','Día de la Constitución'),(122,122,'2013-02-04','Día de la Constitución'),(123,123,'2013-02-04','Día de la Constitución'),(124,124,'2013-02-04','Día de la Constitución'),(125,125,'2013-02-04','Día de la Constitución'),(126,126,'2013-03-18','Natalicio de Don Benito Juárez'),(127,127,'2013-03-18','Natalicio de Don Benito Juárez'),(128,128,'2013-03-18','Natalicio de Don Benito Juárez'),(129,129,'2013-03-18','Natalicio de Don Benito Juárez'),(130,130,'2013-03-18','Natalicio de Don Benito Juárez'),(131,131,'2013-03-18','Natalicio de Don Benito Juárez'),(132,132,'2013-05-01','Día del Trabajo'),(133,133,'2013-05-01','Día del Trabajo'),(134,134,'2013-05-01','Día del Trabajo'),(135,135,'2013-05-01','Día del Trabajo'),(136,136,'2013-05-01','Día del Trabajo'),(137,137,'2013-05-01','Día del Trabajo'),(138,138,'2013-09-16','Día de la Independencia'),(139,139,'2013-09-16','Día de la Independencia'),(140,140,'2013-09-16','Día de la Independencia'),(141,141,'2013-09-16','Día de la Independencia'),(142,142,'2013-09-16','Día de la Independencia'),(143,143,'2013-09-16','Día de la Independencia'),(144,144,'2013-11-18','Día de la Revolución Mexicana'),(145,145,'2013-11-18','Día de la Revolución Mexicana'),(146,146,'2013-11-18','Día de la Revolución Mexicana'),(147,147,'2013-11-18','Día de la Revolución Mexicana'),(148,148,'2013-11-18','Día de la Revolución Mexicana'),(149,149,'2013-11-18','Día de la Revolución Mexicana'),(150,150,'2013-12-25','Día de Navidad'),(151,151,'2013-12-25','Día de Navidad'),(152,152,'2013-12-25','Día de Navidad'),(153,153,'2013-12-25','Día de Navidad'),(154,154,'2013-12-25','Día de Navidad'),(155,155,'2013-12-25','Día de Navidad'),(156,156,'2013-10-08','prueba 2'),(157,157,'2013-10-09','prueba 3'),(159,159,'2012-10-11','prueba 4'),(160,160,'2012-10-11','prueba 4'),(161,161,'2012-10-11','prueba 4'),(162,162,'2012-10-11','prueba 4'),(163,163,'2012-10-11','prueba 4'),(164,164,'2012-10-28','Dia especial inventado por mi'),(165,165,'2012-10-28','Dia especial inventado por mi parte edición'),(167,167,'2012-10-28','Dia especial inventado por mi'),(168,168,'2012-10-28','Dia especial inventado por mi'),(169,169,'2012-10-28','Dia especial inventado por mi'),(170,170,'2012-10-28','Dia especial inventado por mi'),(171,171,'2012-10-16','Aniversario Banamex'),(172,172,'2012-10-18','Aniversario de la campaña ');
/*!40000 ALTER TABLE `dias_especiales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento` (
  `ID_EVENTO` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ID_CALLER` int(11) DEFAULT NULL,
  `ID_TIPO_EVENTO` int(11) DEFAULT NULL,
  `ID_TIPO_MARC` int(11) DEFAULT NULL,
  `ID_PROGRESO_EVENTO` int(11) DEFAULT NULL,
  `ID_USR` int(11) DEFAULT NULL,
  `FECH_ATENCION` date DEFAULT NULL,
  `HORA_ATENCION` time DEFAULT NULL,
  `FECH_FIN_LLAMADA` date DEFAULT NULL,
  `HORA_FIN_LLAMADA` time DEFAULT NULL,
  `FECH_POST_LLAMADA` date DEFAULT NULL,
  `HORA_POST_LLAMADA` time DEFAULT NULL,
  `PUERTO` int(11) DEFAULT NULL,
  `NUM_TELEFONO` varchar(15) DEFAULT NULL,
  `FECHA_INICIO_LLAMADA` date DEFAULT NULL,
  `HORA_INICIO_LLAMADA` time DEFAULT NULL,
  `FECHA_TRANS` date DEFAULT NULL,
  `HORA_TRANS` time DEFAULT NULL,
  `ID_CAMP` int(11) DEFAULT NULL,
  `FOLIO_EVENTO` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_EVENTO`),
  KEY `FK_RELATIONSHIP_108` (`ID_USR`),
  KEY `FK_RELATIONSHIP_28` (`ID_CALLER`),
  KEY `FK_RELATIONSHIP_32` (`ID_TIPO_EVENTO`),
  KEY `FK_RELATIONSHIP_38` (`ID_TIPO_MARC`),
  KEY `FK_RELATIONSHIP_40` (`ID_PROGRESO_EVENTO`),
  KEY `FK_RELATIONSHIP_66` (`ID_CAMP`),
  CONSTRAINT `FK_RELATIONSHIP_108` FOREIGN KEY (`ID_USR`) REFERENCES `usuario` (`ID_USR`),
  CONSTRAINT `FK_RELATIONSHIP_28` FOREIGN KEY (`ID_CALLER`) REFERENCES `caller` (`ID_CALLER`),
  CONSTRAINT `FK_RELATIONSHIP_32` FOREIGN KEY (`ID_TIPO_EVENTO`) REFERENCES `c_tipo_evento` (`ID_TIPO_EVENTO`),
  CONSTRAINT `FK_RELATIONSHIP_38` FOREIGN KEY (`ID_TIPO_MARC`) REFERENCES `c_tipo_marcacion` (`ID_TIPO_MARC`),
  CONSTRAINT `FK_RELATIONSHIP_40` FOREIGN KEY (`ID_PROGRESO_EVENTO`) REFERENCES `progreso_eventos` (`ID_PROGRESO_EVENTO`),
  CONSTRAINT `FK_RELATIONSHIP_66` FOREIGN KEY (`ID_CAMP`) REFERENCES `campana` (`ID_CAMP`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1 COMMENT='Tabla de Evento';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES (1,1,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,123,'58594182','2012-09-28','11:15:10','2012-09-28','11:32:10',151,NULL),(2,NULL,3,1,13,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'58594182','2012-10-04','11:01:41','2012-10-04','11:02:09',151,1),(4,NULL,1,1,1,30,NULL,NULL,NULL,NULL,NULL,NULL,22,'27749661','2012-10-04','12:33:04','2012-10-04','13:00:05',151,2),(6,1,4,1,1,30,'2012-10-04','13:32:18','2012-10-04','13:32:05','2012-10-04','13:32:01',22,'58594182','2012-10-04','12:35:35','2012-10-04','13:32:16',151,3),(7,1,4,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,'57828645','2012-10-04','12:36:44',NULL,NULL,151,4),(8,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,'47657445','2012-10-04','12:37:05',NULL,NULL,151,5),(9,NULL,3,1,13,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'58594182','2012-10-04','13:04:12','2012-10-04','13:06:57',151,6),(10,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,'58594182','2012-10-04','13:53:06',NULL,NULL,151,7),(11,2,4,2,2,77,'2012-10-04','18:47:45','2012-10-04','18:55:58','2012-10-04','18:55:19',30,'12','2012-10-04','17:11:23','2012-10-04','18:47:45',160,1),(12,1,3,1,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,'22664477','2012-10-04','17:24:06',NULL,NULL,159,1),(13,1,3,1,3,74,NULL,NULL,NULL,NULL,NULL,NULL,22,'22664477','2012-10-04','17:40:52','2012-10-04','17:41:26',159,2),(14,1,3,1,3,76,NULL,NULL,'2012-10-04','17:54:00','2012-10-04','17:52:50',22,'22664477','2012-10-04','17:47:11','2012-10-04','17:48:45',159,3),(15,NULL,3,1,13,76,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'545888','2012-10-04','18:08:24',NULL,NULL,159,4),(16,1,3,1,1,74,NULL,NULL,NULL,NULL,NULL,NULL,22,'22664477','2012-10-04','18:10:32','2012-10-04','18:11:12',159,5),(17,1,3,1,1,74,NULL,NULL,NULL,NULL,NULL,NULL,22,'22664477','2012-10-04','18:18:39','2012-10-04','18:20:02',159,6),(18,1,4,1,1,74,NULL,NULL,NULL,NULL,NULL,NULL,22,'22664477','2012-10-04','18:29:38','2012-10-04','18:31:49',159,7),(19,1,4,1,1,74,NULL,NULL,NULL,NULL,NULL,NULL,22,'22664477','2012-10-04','18:37:29','2012-10-04','18:38:25',159,8),(20,1,4,1,1,82,NULL,NULL,NULL,NULL,NULL,NULL,22,'22664477','2012-10-04','18:52:30','2012-10-04','18:57:01',161,1),(21,1,4,1,3,74,'2012-10-04','19:04:38','2012-10-04','19:04:52','2012-10-04','19:04:48',22,'22664477','2012-10-04','19:03:40','2012-10-04','19:04:37',159,9),(22,2,4,2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,60,'12','2012-10-04','19:09:51',NULL,NULL,162,1),(23,1,4,1,3,83,'2012-10-04','19:17:21','2012-10-04','19:18:29','2012-10-04','19:17:42',22,'22213411','2012-10-04','19:15:53','2012-10-04','19:17:20',161,2),(24,2,4,2,2,87,'2012-10-04','19:28:28',NULL,NULL,NULL,NULL,60,'12','2012-10-04','19:24:38','2012-10-04','19:28:25',162,2);
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento_inbound`
--

DROP TABLE IF EXISTS `evento_inbound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento_inbound` (
  `ID_EVENTO_INBOUND` int(11) NOT NULL AUTO_INCREMENT,
  `ID_EVENTO` int(11) unsigned NOT NULL,
  `ID_RES_IN` int(11) DEFAULT NULL,
  `ID_RUBRO_INBOUND` int(11) DEFAULT NULL,
  `ID_GPO_ATN_IN` int(11) DEFAULT NULL,
  `NUM_CICLOS` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_EVENTO_INBOUND`),
  KEY `FK_RELATIONSHIP_30` (`ID_EVENTO`),
  KEY `FK_RELATIONSHIP_51` (`ID_RES_IN`),
  KEY `FK_RELATIONSHIP_52` (`ID_GPO_ATN_IN`),
  KEY `FK_RELATIONSHIP_53` (`ID_RUBRO_INBOUND`),
  CONSTRAINT `FK_RELATIONSHIP_30` FOREIGN KEY (`ID_EVENTO`) REFERENCES `evento` (`ID_EVENTO`),
  CONSTRAINT `FK_RELATIONSHIP_51` FOREIGN KEY (`ID_RES_IN`) REFERENCES `c_resultados_inbou` (`ID_RES_IN`),
  CONSTRAINT `FK_RELATIONSHIP_52` FOREIGN KEY (`ID_GPO_ATN_IN`) REFERENCES `c_gpo_atn_inbound` (`ID_GPO_ATN_IN`),
  CONSTRAINT `FK_RELATIONSHIP_53` FOREIGN KEY (`ID_RUBRO_INBOUND`) REFERENCES `c_rubro_inbound` (`ID_RUBRO_INBOUND`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COMMENT='Tabla que contiene los atributos de un evento Inbound';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento_inbound`
--

LOCK TABLES `evento_inbound` WRITE;
/*!40000 ALTER TABLE `evento_inbound` DISABLE KEYS */;
INSERT INTO `evento_inbound` VALUES (1,1,NULL,NULL,NULL,NULL),(2,4,4,1,1,NULL),(3,6,6,1,1,NULL),(4,7,1,1,1,NULL),(5,8,1,1,1,NULL),(6,10,NULL,NULL,NULL,NULL),(7,11,1,2,2,NULL),(8,19,1,1,1,NULL),(9,20,1,1,1,NULL),(10,21,3,1,1,NULL),(11,22,2,2,2,NULL),(12,23,2,1,1,NULL),(13,24,2,2,2,NULL);
/*!40000 ALTER TABLE `evento_inbound` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento_outbound`
--

DROP TABLE IF EXISTS `evento_outbound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento_outbound` (
  `ID_EVENTO_OUTBOUND` int(11) NOT NULL AUTO_INCREMENT,
  `ID_EVENTO` int(11) unsigned NOT NULL,
  `ID_RES_OUT` int(11) DEFAULT NULL,
  `NUM_INTENTOS` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_EVENTO_OUTBOUND`),
  KEY `FK_RELATIONSHIP_31` (`ID_EVENTO`),
  KEY `FK_RELATIONSHIP_50` (`ID_RES_OUT`),
  CONSTRAINT `FK_RELATIONSHIP_31` FOREIGN KEY (`ID_EVENTO`) REFERENCES `evento` (`ID_EVENTO`),
  CONSTRAINT `FK_RELATIONSHIP_50` FOREIGN KEY (`ID_RES_OUT`) REFERENCES `c_resultados_outbo` (`ID_RES_OUT`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento_outbound`
--

LOCK TABLES `evento_outbound` WRITE;
/*!40000 ALTER TABLE `evento_outbound` DISABLE KEYS */;
INSERT INTO `evento_outbound` VALUES (1,2,NULL,NULL),(2,9,NULL,NULL),(3,12,NULL,NULL),(4,13,NULL,NULL),(5,14,NULL,NULL),(6,15,NULL,NULL),(7,16,NULL,NULL),(8,17,NULL,NULL),(9,18,NULL,NULL);
/*!40000 ALTER TABLE `evento_outbound` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_alarmas`
--

DROP TABLE IF EXISTS `historico_alarmas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historico_alarmas` (
  `id_historico_alarma` int(11) NOT NULL,
  `id_camp` int(11) NOT NULL,
  `id_tipo_alarma` int(11) NOT NULL,
  `fecha_alarma` date NOT NULL,
  `hora_alarma` time NOT NULL,
  `descripcion_alarma` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_historico_alarma`),
  KEY `FK_RELATIONSHIP_AL` (`id_tipo_alarma`),
  KEY `FK_RELATIONSHIP_CAMP` (`id_camp`),
  CONSTRAINT `FK_RELATIONSHIP_AL` FOREIGN KEY (`id_tipo_alarma`) REFERENCES `c_tipo_alarma` (`id_tipo_alarma`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RELATIONSHIP_CAMP` FOREIGN KEY (`id_camp`) REFERENCES `campana` (`ID_CAMP`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_alarmas`
--

LOCK TABLES `historico_alarmas` WRITE;
/*!40000 ALTER TABLE `historico_alarmas` DISABLE KEYS */;
/*!40000 ALTER TABLE `historico_alarmas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horas`
--

DROP TABLE IF EXISTS `horas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horas` (
  `ID_HORA` int(11) NOT NULL AUTO_INCREMENT,
  `HORA` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_HORA`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horas`
--

LOCK TABLES `horas` WRITE;
/*!40000 ALTER TABLE `horas` DISABLE KEYS */;
INSERT INTO `horas` VALUES (1,'00:00'),(2,'00:30'),(3,'01:00'),(4,'01:30'),(5,'02:00'),(6,'02:30'),(7,'03:00'),(8,'03:30'),(9,'04:00'),(10,'04:30'),(11,'05:00'),(12,'05:30'),(13,'06:00'),(14,'06:30'),(15,'07:00'),(16,'07:30'),(17,'08:00'),(18,'08:30'),(19,'09:00'),(20,'09:30'),(21,'10;00'),(22,'10;30'),(23,'11:00'),(24,'11:30'),(25,'12:00'),(26,'12:30'),(27,'13:00'),(28,'13:30'),(29,'14:00'),(30,'14:30'),(31,'15:00'),(32,'15:30'),(33,'16:00'),(34,'16:30'),(35,'17:00'),(36,'17:30'),(37,'18:00'),(38,'18:30'),(39,'19:00'),(40,'19:30'),(41,'20:00'),(42,'20:30'),(43,'21:00'),(44,'21:30'),(45,'22:00'),(46,'22:30'),(47,'23:00'),(48,'23:30');
/*!40000 ALTER TABLE `horas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mapa_call`
--

DROP TABLE IF EXISTS `mapa_call`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mapa_call` (
  `ID_MAPA` int(11) NOT NULL AUTO_INCREMENT,
  `NUM_FILAS` int(11) DEFAULT NULL,
  `NUM_COLUMNAS` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_MAPA`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Tabla que contiene el tamaño real de la vista aerea del Call';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mapa_call`
--

LOCK TABLES `mapa_call` WRITE;
/*!40000 ALTER TABLE `mapa_call` DISABLE KEYS */;
INSERT INTO `mapa_call` VALUES (1,5,5);
/*!40000 ALTER TABLE `mapa_call` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `idmenu` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `idpadre` varchar(45) DEFAULT NULL,
  `forma` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idmenu`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Administración',1,'0',NULL),(2,'Supervisión',1,'0',NULL),(3,'Atención',1,'0',NULL),(4,'Reportes',1,'0',NULL),(5,'Cambiar Contraseña',2,'1','CambioContraseña'),(6,'Calendario',2,'1','catalogoCalendario'),(7,'Usuarios',2,'1','catalogoUsuarios'),(8,'Campañas',2,'1','CatalogoCampanas'),(9,'Catálogos',1,'1',NULL),(10,'Configurar Sistema',2,'1','ConfigurarSistema'),(11,'Resultados Inbound',2,'9','catalogoResultadosInbound'),(12,'Resultados Outbound',2,'9','CatalogoResultadosOutbound'),(13,'Integración CRM ',2,'9','integracionCRM'),(14,'Configurar Posiciones de Call Center',2,'2','PosicionAgentes'),(15,'Monitorear Agentes',2,'2','monitorearAgentes'),(16,'Visualizar Indicadores',2,'2','VisualizarIndicadores'),(17,'Proyectar Wallboard',2,'2',NULL),(18,'Enviar Mensaje',2,'2',NULL),(19,'Atender Eventos',2,'3','Atender_Evento'),(20,'Nivel de Servicio',1,'4',NULL),(21,'Productividad',1,'4',NULL),(22,'Tráfico de Llamadas',1,'4',NULL),(23,'Utilización',1,'4',NULL),(24,'Tiempos Generales de Nivel de Servicio',2,'20',NULL),(25,'Operación Diaria',2,'21',NULL),(26,'Atención de Eventos',2,'21',NULL),(27,'Duración de Servicio',2,'21',NULL),(28,'Tráfico de Llamadas',2,'22',NULL),(29,'Destino de Llamadas',2,'23',NULL),(30,'Nivel de Atención por Fecha',2,'23',NULL),(31,'Nivel de Atención por Hora',2,'23',NULL);
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posiciones_call`
--

DROP TABLE IF EXISTS `posiciones_call`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posiciones_call` (
  `ID_POSICION` int(11) NOT NULL AUTO_INCREMENT,
  `COORDENADA_POS` varchar(10) NOT NULL,
  PRIMARY KEY (`ID_POSICION`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COMMENT='Tabla que guarda registros de posiciones de los agentes dent';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posiciones_call`
--

LOCK TABLES `posiciones_call` WRITE;
/*!40000 ALTER TABLE `posiciones_call` DISABLE KEYS */;
INSERT INTO `posiciones_call` VALUES (1,'1:1'),(2,'1:2'),(3,'1:3'),(4,'1:4'),(5,'1:5'),(6,'2:1'),(7,'2:2'),(8,'2:3'),(9,'2:4'),(10,'2:5'),(11,'3:1'),(12,'3:2'),(13,'3:3'),(14,'3:4'),(15,'3:5'),(16,'4:1'),(17,'4:2'),(18,'4:3'),(19,'4:4'),(20,'4:5'),(21,'5:1'),(22,'5:2'),(23,'5:3'),(24,'5:4'),(25,'5:5');
/*!40000 ALTER TABLE `posiciones_call` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progreso_eventos`
--

DROP TABLE IF EXISTS `progreso_eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `progreso_eventos` (
  `ID_PROGRESO_EVENTO` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  `PROGRESO_EVENTO` varchar(40) NOT NULL,
  PRIMARY KEY (`ID_PROGRESO_EVENTO`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COMMENT='Tabla que contiene el catalogo de Progresos de un Evento';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progreso_eventos`
--

LOCK TABLES `progreso_eventos` WRITE;
/*!40000 ALTER TABLE `progreso_eventos` DISABLE KEYS */;
INSERT INTO `progreso_eventos` VALUES (1,'Evento Finalizado','Evento_Finalizado'),(2,'Bienvenida-Menus','Bienvenida_Menus'),(3,'Llamada en espera','Llamada en espera'),(4,'Tranfiriendo','Trandfiriendo'),(5,'Extensión Auxiliar','Extensi{on Auxiliar'),(6,'Outbound/Progresivo','Outbound/Progresivo'),(7,'Fin de llamada por disuasion','Fin de llamada por  disuasion'),(8,'Mensaje','Mensaje'),(9,'Reproduce Mensaje','Reproduce Mensaje'),(10,'IVR/Audiotextos','IVR/Audiotextos'),(11,'VoiceMail','VoiceMail'),(12,'Post-llamada','Post-Llamada'),(13,'Dialer','Dialer'),(14,'Web call back','Web call back'),(15,'CRM','CRM'),(16,'Abandono','Abandono'),(17,'Mensaje en espera','Mensaje en espera'),(18,'Atención','Atención'),(19,'Desborde disuación','Desborde disuación');
/*!40000 ALTER TABLE `progreso_eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supervisor_agente`
--

DROP TABLE IF EXISTS `supervisor_agente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supervisor_agente` (
  `ID_SUPERVISOR_AGENTE` int(11) NOT NULL AUTO_INCREMENT,
  `ID_AGENTE` int(11) DEFAULT NULL,
  `ID_SUPERVISOR` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_SUPERVISOR_AGENTE`),
  KEY `FK_RELATIONSHIP_109` (`ID_AGENTE`),
  CONSTRAINT `FK_RELATIONSHIP_109` FOREIGN KEY (`ID_AGENTE`) REFERENCES `usuario` (`ID_USR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervisor_agente`
--

LOCK TABLES `supervisor_agente` WRITE;
/*!40000 ALTER TABLE `supervisor_agente` DISABLE KEYS */;
/*!40000 ALTER TABLE `supervisor_agente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono_caller`
--

DROP TABLE IF EXISTS `telefono_caller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefono_caller` (
  `ID_CALLER` int(11) NOT NULL,
  `TELEFONO_CALLER` varchar(18) NOT NULL,
  PRIMARY KEY (`ID_CALLER`),
  CONSTRAINT `FK_RELATIONSHIP_29` FOREIGN KEY (`ID_CALLER`) REFERENCES `caller` (`ID_CALLER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono_caller`
--

LOCK TABLES `telefono_caller` WRITE;
/*!40000 ALTER TABLE `telefono_caller` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefono_caller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `ID_USR` int(11) NOT NULL AUTO_INCREMENT,
  `ID_TIPO_USR` int(11) NOT NULL,
  `USR` varchar(35) NOT NULL,
  `PASSWORD` varchar(50) NOT NULL,
  `NOMBRE_USR` varchar(30) NOT NULL,
  `APELLIDO_PATERNO_USR` varchar(30) NOT NULL,
  `APELLIDO_MATERNO_USR` varchar(30) NOT NULL,
  `EMAIL_USR` varchar(50) NOT NULL,
  `ESTATUS_USR` int(11) NOT NULL,
  PRIMARY KEY (`ID_USR`),
  KEY `FK_RELATIONSHIP_2` (`ID_TIPO_USR`),
  CONSTRAINT `FK_RELATIONSHIP_2` FOREIGN KEY (`ID_TIPO_USR`) REFERENCES `c_tipo_usuario` (`ID_TIPO_USR`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1 COMMENT='Tabla que contiene la informacion de Usuarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,1,'sdiaz','6b1f893805e29582969095a741d60a5f43734af8','Sinuhe','Diaz','Luna','sdiaz@123.com',0),(2,1,'mlopez','8c667793de6c248a7bcc373ed0338890ad484b7c','Marco','Lopez','Lopez','sdiaz@123.com',0),(3,1,'admin','d033e22ae348aeb5660fc2140aec35850c4da997','Administrador','Xw','Y','admin@123.com',1),(4,1,'dflores4','b256f67ad74af99b776161300174d3a9632e46c8','Daniel ','Flores','Gonzalez','dflores@crucialsoft.com',1),(5,1,'rriva5','20b5cd647bf3e99e6d71015f8e1ffe266c8afbed','Roberto','Riva','Palacios','rpalacios@crucislsoft.com',1),(6,1,'gjuarez6','817864780913999b8ac239bb81e349dce44a0c7d','Gabriela','Juarez','Sedas','gjseda@crucialsoft.com',1),(7,1,'avelázquez7','da39a3ee5e6b4b0d3255bfef95601890afd80709','Ana Rosa','Velázquez','Cordero','avelazquez@crucialsoft.com.mx',1),(30,1,'mflores30','9fc0ad954c5cbb3a454107e13fb13bc45db81b50','mijael','flores','gonzalez','dflores@crucialsoft.com',1),(59,1,'rpalacio59','d1870b374be0e2dc74132d6c073d48aa1f77b7a3','Roberto','Palacio','Correa','',1),(60,1,'mon60','b4809c209f480d6645c01114840b10e51f1c987e','miguel','ON','','',1),(61,1,'mvalle61','77edf1ab0dc5841409f40b6f718a794bb4af0e7d','margarita','valle','valle','mago@valle.com',1),(62,1,'avelazquez62','d91a87fdf3b7fc0551b6827130e674de7fd7120e','Ana','velazquez','velazquez','ana@dcpro.com',1),(63,1,'avalles63','5193ddcafbbab74cdc96a8f68a6ff3de20595880','abraham','valles','valles','abraham@dcpro.com',1),(64,1,'sdasda64','9d987207ef2b15fb1ad26970335609eb6d60ea62','sadsa','dasda','dasd','asa@dcpro.com',1),(65,1,'pprueba65','d791dbc5626e0800c4a67d6af318c6e834ce874c','prueba1','prueba','prueba','prueba@dcpro.com',1),(66,1,'acuevas66','ae11efe67e57b58d9d6b61aab4986e34835691bc','alejandro','cuevas','cuevas','alejandro@dcpro.com',1),(67,1,'aamezcua67','699663efc417a735acf6068b6f86fd5d59328df5','aldul','amezcua','amezcua','aldul@dcpro.com',1),(68,1,'rcortes68','bfcefac611b1c9f55e921c8a0e2dd6d6590f3dd4','reyna','cortes','cortes','reyna@dcpro.com',1),(69,1,'avalles6369','6acab607c6840fdd3dc679e68dd9a16efcab7d3e','abraam','valles','valles','abraham@dcpro.com',1),(70,1,'rgonzalez70','04e7fcf9c74a9f7240a18c9ba908846f9ebaa3f6','rafael ','gonzalez','gonzalez','rafael@dcpro.com',1),(71,1,'mlopez71','ad0b12b7a6dcc735f98e1ff9c2018442929ae833','maria','lopez','lopez','maria@dcpro.com',1),(72,1,'sperez72','39fe020102bcdd34b76c5dc0e4c16c52e0a9f98c','sandra','perez','perez','sandra@dcpro.com',1),(73,1,'mvera73','7a6e458247806778d318b18bd5d7a18f44365f91','marco','vera','vera','marco@dcpro.com',1),(74,1,'kpoke74','0dcdb41bfaab7902443adb30a680bcf6a2f2b5b8','Keldeo','Poke','','keldeo@dcpro.com',1),(75,1,'jmarte75','6dc4702c5533be817cf034c1683652ac8df75a71','Javier','Marte','Marte','javier@dcpro.com',1),(76,1,'zblack76','c9c5a09c1fe1f77795edbf185ee389b3986b7e45','Zecrom','Black','','zecrom@dcpro.com',1),(77,1,'mrios77','696a2b7a0676d742c5fb66556af1fbf40b8c8bfb','marina','rios','rios','mrios@dcpro.com',1),(78,1,'hmarquez78','b83b7598b0d4815a3b0d4fde15f903a23d494a36','hanibal','marquez','marquez','hmarquez@dcpro.com',1),(79,1,'rsk79','98cb408a57318d15440b0037705e61add58b4110','Rita','SK','','rita@dcpro.com',1),(80,1,'rreal80','e7a107bc0203079b6fa09e488569292b3081a288','Rose','Real','','rose@dcpro.com',1),(81,1,'avargas81','448adf714117a70e3a0d2cf6b8737942ff00bdf8','Alejandra','Vargas','','ale@dcpro.com',1),(82,1,'aramones82','49529594e90d3a41501dfc82119c141e27ab82d9','Adal','Ramones','','adal@dcpro.com',1),(83,1,'amadness83','8a6d864ed8534507ef74293c274cb7fcbb6ebaa9','Alice','Madness','','alice@dcpro.com',1),(84,1,'vcamacho84','2eca43bed97566e1d74aab1806cdb7fcf144aa59','Van','Camacho','','van@dcpro.com',1),(85,1,'aislas85','02ec003267a75e874519c5f4625a3f4467b9f4ff','alicia','islas','islas','alicia@dcpro.com',1),(86,1,'odiaz86','f2564e5c98269cda7fcb54fb491ca7edf01dd8d8','osmar','diaz','diaz','osmar@dcpro.com',1),(87,1,'rjimenez87','cb5e138013b978eab675393ba9b9f8cec58af1e8','raul','jimenez','jimenez','raul@dcpro.com',1),(88,1,'gromo88','792e66d186239b1f425d7d2b8040a2aefd1a611f','gerardo','romo','romo','gerardo@dcpro.com',1),(89,1,'mlima89','fbdb01280cc04e89edd765776e8ed2b1aed3c6cd','manuel','lima','lima','manuel@dcpro.com',1),(90,1,'revi','50c14c03e808d297b970654149350b614583aa5d','Revisor','AP Revisor','AM Revisor','revi@hotmail.com',0);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voces`
--

DROP TABLE IF EXISTS `voces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voces` (
  `ID_VOCES` int(11) NOT NULL AUTO_INCREMENT,
  `ID_CAMP` int(11) NOT NULL,
  `BVN_HRO_LABORAL` varchar(150) NOT NULL,
  `BVN_FIN_SEMANA` varchar(150) NOT NULL,
  `BVN_HRO_ESPECIAL` varchar(150) NOT NULL,
  `BVN_HRO_CERRADO` varchar(150) NOT NULL,
  `BVN_BUZON_DIURNO` varchar(150) NOT NULL,
  `BVN_BUZON_NOCTURNO` varchar(150) NOT NULL,
  `TRANSFERENCIA` varchar(150) NOT NULL,
  `OPCION_INVALIDA` varchar(150) NOT NULL,
  `DESPEDIDA` varchar(150) NOT NULL,
  `AGENTES_NO_DISP` varchar(150) NOT NULL,
  `IND_MUSICA1` varchar(150) NOT NULL,
  `IND_MUSICA2` varchar(150) DEFAULT NULL,
  `IND_MUSICA3` varchar(150) DEFAULT NULL,
  `ESPERA1` varchar(150) NOT NULL,
  `ESPERA2` varchar(150) DEFAULT NULL,
  `ESPERA3` varchar(150) DEFAULT NULL,
  `MENSAJE` varchar(150) NOT NULL,
  `DISUASION` varchar(150) NOT NULL,
  PRIMARY KEY (`ID_VOCES`),
  KEY `FK_RELATIONSHIP_7` (`ID_CAMP`),
  CONSTRAINT `FK_RELATIONSHIP_7` FOREIGN KEY (`ID_CAMP`) REFERENCES `campana` (`ID_CAMP`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voces`
--

LOCK TABLES `voces` WRITE;
/*!40000 ALTER TABLE `voces` DISABLE KEYS */;
INSERT INTO `voces` VALUES (25,142,'C:\\Program Files\\DCPro\\Laboral','C:\\Program Files\\DCPro\\Semana','C:\\Program Files\\DCPro\\Especial','C:\\Program Files\\DCPro\\Cerrado','C:\\Program Files\\DCPro\\BuzonDiurno','C:\\Program Files\\DCPro\\BuzonNocturno','C:\\Program Files\\DCPro\\Transferencia','C:\\Program Files\\DCPro\\OpcionInvalida','C:\\Program Files\\DCPro\\Despedida','C:\\Program Files\\DCPro\\NoDisponibles','C:\\Program Files\\DCPro\\Indice1','C:\\Program Files\\DCPro\\Indice2','C:\\Program Files\\DCPro\\Indice3','C:\\Program Files\\DCPro\\Espera1','C:\\Program Files\\DCPro\\Espera2','C:\\Program Files\\DCPro\\Espera3','C:\\Program Files\\DCPro\\Mensaje','C:\\Program Files\\DCPro\\Disuasion'),(29,151,'C:\\Program Files\\DCPro\\Laboral','C:\\Program Files\\DCPro\\Semana','C:\\Program Files\\DCPro\\Especial','C:\\Program Files\\DCPro\\Cerrado','C:\\Program Files\\DCPro\\BuzonDiurno','C:\\Program Files\\DCPro\\BuzonNocturno','C:\\Program Files\\DCPro\\Transferencia','C:\\Program Files\\DCPro\\OpcionInvalida','C:\\Program Files\\DCPro\\Despedida','C:\\Program Files\\DCPro\\NoDisponibles','C:\\Program Files\\DCPro\\Indice1','C:\\Program Files\\DCPro\\Indice2','C:\\Program Files\\DCPro\\Indice3','C:\\Program Files\\DCPro\\Espera1','C:\\Program Files\\DCPro\\Espera2','C:\\Program Files\\DCPro\\Espera3','C:\\Program Files\\DCPro\\Mensaje','C:\\Program Files\\DCPro\\Disuasion'),(30,152,'C:\\Program Files\\DCPro\\Laboral','C:\\Program Files\\DCPro\\Semana','C:\\Program Files\\DCPro\\Especial','C:\\Program Files\\DCPro\\Cerrado','C:\\Program Files\\DCPro\\BuzonDiurno','C:\\Program Files\\DCPro\\BuzonNocturno','C:\\Program Files\\DCPro\\Transferencia','C:\\Program Files\\DCPro\\OpcionInvalida','C:\\Program Files\\DCPro\\Despedida','C:\\Program Files\\DCPro\\NoDisponibles','C:\\Program Files\\DCPro\\Indice1','C:\\Program Files\\DCPro\\Indice2','C:\\Program Files\\DCPro\\Indice3','C:\\Program Files\\DCPro\\Espera1','C:\\Program Files\\DCPro\\Espera2','C:\\Program Files\\DCPro\\Espera3','C:\\Program Files\\DCPro\\Mensaje','C:\\Program Files\\DCPro\\Disuasion'),(32,154,'C:\\Program Files\\DCPro\\Laboral','C:\\Program Files\\DCPro\\Semana','C:\\Program Files\\DCPro\\Especial','C:\\Program Files\\DCPro\\Cerrado','C:\\Program Files\\DCPro\\BuzonDiurno','C:\\Program Files\\DCPro\\BuzonNocturno','C:\\Program Files\\DCPro\\Transferencia','C:\\Program Files\\DCPro\\OpcionInvalida','C:\\Program Files\\DCPro\\Despedida','C:\\Program Files\\DCPro\\NoDisponibles','C:\\Program Files\\DCPro\\Indice1','C:\\Program Files\\DCPro\\Indice2','C:\\Program Files\\DCPro\\Indice3','C:\\Program Files\\DCPro\\Espera1','C:\\Program Files\\DCPro\\Espera2','C:\\Program Files\\DCPro\\Espera3','C:\\Program Files\\DCPro\\Mensaje','C:\\Program Files\\DCPro\\Disuasion'),(33,155,'C:\\Program Files\\DCPro\\Laboral','C:\\Program Files\\DCPro\\Semana','C:\\Program Files\\DCPro\\Especial','C:\\Program Files\\DCPro\\Cerrado','C:\\Program Files\\DCPro\\BuzonDiurno','C:\\Program Files\\DCPro\\BuzonNocturno','C:\\Program Files\\DCPro\\Transferencia','C:\\Program Files\\DCPro\\OpcionInvalida','C:\\Program Files\\DCPro\\Despedida','C:\\Program Files\\DCPro\\NoDisponibles','C:\\Program Files\\DCPro\\Indice1','C:\\Program Files\\DCPro\\Indice2','C:\\Program Files\\DCPro\\Indice3','C:\\Program Files\\DCPro\\Espera1','C:\\Program Files\\DCPro\\Espera2','C:\\Program Files\\DCPro\\Espera3','C:\\Program Files\\DCPro\\Mensaje','C:\\Program Files\\DCPro\\Disuasion'),(34,156,'C:\\Program Files\\DCPro\\Laboral','C:\\Program Files\\DCPro\\Semana','C:\\Program Files\\DCPro\\Especial','C:\\Program Files\\DCPro\\Cerrado','C:\\Program Files\\DCPro\\BuzonDiurno','C:\\Program Files\\DCPro\\BuzonNocturno','C:\\Program Files\\DCPro\\Transferencia','C:\\Program Files\\DCPro\\OpcionInvalida','C:\\Program Files\\DCPro\\Despedida','C:\\Program Files\\DCPro\\NoDisponibles','C:\\Program Files\\DCPro\\Indice1','C:\\Program Files\\DCPro\\Indice2','C:\\Program Files\\DCPro\\Indice3','C:\\Program Files\\DCPro\\Espera1','C:\\Program Files\\DCPro\\Espera2','C:\\Program Files\\DCPro\\Espera3','C:\\Program Files\\DCPro\\Mensaje','C:\\Program Files\\DCPro\\Disuasion'),(35,157,'C:\\Program Files\\DCPro\\Laboral','C:\\Program Files\\DCPro\\Semana','C:\\Program Files\\DCPro\\Especial','C:\\Program Files\\DCPro\\Cerrado','C:\\Program Files\\DCPro\\BuzonDiurno','C:\\Program Files\\DCPro\\BuzonNocturno','C:\\Program Files\\DCPro\\Transferencia','C:\\Program Files\\DCPro\\OpcionInvalida','C:\\Program Files\\DCPro\\Despedida','C:\\Program Files\\DCPro\\NoDisponibles','C:\\Program Files\\DCPro\\Indice1','C:\\Program Files\\DCPro\\Indice2','C:\\Program Files\\DCPro\\Indice3','C:\\Program Files\\DCPro\\Espera1','C:\\Program Files\\DCPro\\Espera2','C:\\Program Files\\DCPro\\Espera3','C:\\Program Files\\DCPro\\Mensaje','C:\\Program Files\\DCPro\\Disuasion'),(36,158,'C:\\Program Files\\DCPro\\Laboral','C:\\Program Files\\DCPro\\Semana','C:\\Program Files\\DCPro\\Especial','C:\\Program Files\\DCPro\\Cerrado','C:\\Program Files\\DCPro\\BuzonDiurno','C:\\Program Files\\DCPro\\BuzonNocturno','C:\\Program Files\\DCPro\\Transferencia','C:\\Program Files\\DCPro\\OpcionInvalida','C:\\Program Files\\DCPro\\Despedida','C:\\Program Files\\DCPro\\NoDisponibles','C:\\Program Files\\DCPro\\Indice1','C:\\Program Files\\DCPro\\Indice2','C:\\Program Files\\DCPro\\Indice3','C:\\Program Files\\DCPro\\Espera1','C:\\Program Files\\DCPro\\Espera2','C:\\Program Files\\DCPro\\Espera3','C:\\Program Files\\DCPro\\Mensaje','C:\\Program Files\\DCPro\\Disuasion'),(37,159,'C:\\Program Files\\DCPro\\Laboral','C:\\Program Files\\DCPro\\Semana','C:\\Program Files\\DCPro\\Especial','C:\\Program Files\\DCPro\\Cerrado','C:\\Program Files\\DCPro\\BuzonDiurno','C:\\Program Files\\DCPro\\BuzonNocturno','C:\\Program Files\\DCPro\\Transferencia','C:\\Program Files\\DCPro\\OpcionInvalida','C:\\Program Files\\DCPro\\Despedida','C:\\Program Files\\DCPro\\NoDisponibles','C:\\Program Files\\DCPro\\Indice1','C:\\Program Files\\DCPro\\Indice2','C:\\Program Files\\DCPro\\Indice3','C:\\Program Files\\DCPro\\Espera1','C:\\Program Files\\DCPro\\Espera2','C:\\Program Files\\DCPro\\Espera3','C:\\Program Files\\DCPro\\Mensaje','C:\\Program Files\\DCPro\\Disuasion'),(38,160,'C:\\Program Files\\DCPro\\Laboral','C:\\Program Files\\DCPro\\Semana','C:\\Program Files\\DCPro\\Especial','C:\\Program Files\\DCPro\\Cerrado','C:\\Program Files\\DCPro\\BuzonDiurno','C:\\Program Files\\DCPro\\BuzonNocturno','C:\\Program Files\\DCPro\\Transferencia','C:\\Program Files\\DCPro\\OpcionInvalida','C:\\Program Files\\DCPro\\Despedida','C:\\Program Files\\DCPro\\NoDisponibles','C:\\Program Files\\DCPro\\Indice1','C:\\Program Files\\DCPro\\Indice2','C:\\Program Files\\DCPro\\Indice3','C:\\Program Files\\DCPro\\Espera1','C:\\Program Files\\DCPro\\Espera2','C:\\Program Files\\DCPro\\Espera3','C:\\Program Files\\DCPro\\Mensaje','C:\\Program Files\\DCPro\\Disuasion'),(39,161,'C:\\Program Files\\DCPro\\Laboral','C:\\Program Files\\DCPro\\Semana','C:\\Program Files\\DCPro\\Especial','C:\\Program Files\\DCPro\\Cerrado','C:\\Program Files\\DCPro\\BuzonDiurno','C:\\Program Files\\DCPro\\BuzonNocturno','C:\\Program Files\\DCPro\\Transferencia','C:\\Program Files\\DCPro\\OpcionInvalida','C:\\Program Files\\DCPro\\Despedida','C:\\Program Files\\DCPro\\NoDisponibles','C:\\Program Files\\DCPro\\Indice1','C:\\Program Files\\DCPro\\Indice2','C:\\Program Files\\DCPro\\Indice3','C:\\Program Files\\DCPro\\Espera1','C:\\Program Files\\DCPro\\Espera2','C:\\Program Files\\DCPro\\Espera3','C:\\Program Files\\DCPro\\Mensaje','C:\\Program Files\\DCPro\\Disuasion'),(40,162,'C:\\Program Files\\DCPro\\Laboral','C:\\Program Files\\DCPro\\Semana','C:\\Program Files\\DCPro\\Especial','C:\\Program Files\\DCPro\\Cerrado','C:\\Program Files\\DCPro\\BuzonDiurno','C:\\Program Files\\DCPro\\BuzonNocturno','C:\\Program Files\\DCPro\\Transferencia','C:\\Program Files\\DCPro\\OpcionInvalida','C:\\Program Files\\DCPro\\Despedida','C:\\Program Files\\DCPro\\NoDisponibles','C:\\Program Files\\DCPro\\Indice1','C:\\Program Files\\DCPro\\Indice2','C:\\Program Files\\DCPro\\Indice3','C:\\Program Files\\DCPro\\Espera1','C:\\Program Files\\DCPro\\Espera2','C:\\Program Files\\DCPro\\Espera3','C:\\Program Files\\DCPro\\Mensaje','C:\\Program Files\\DCPro\\Disuasion'),(41,163,'C:\\Program Files\\DCPro\\Laboral','C:\\Program Files\\DCPro\\Semana','C:\\Program Files\\DCPro\\Especial','C:\\Program Files\\DCPro\\Cerrado','C:\\Program Files\\DCPro\\BuzonDiurno','C:\\Program Files\\DCPro\\BuzonNocturno','C:\\Program Files\\DCPro\\Transferencia','C:\\Program Files\\DCPro\\OpcionInvalida','C:\\Program Files\\DCPro\\Despedida','C:\\Program Files\\DCPro\\NoDisponibles','C:\\Program Files\\DCPro\\Indice1','C:\\Program Files\\DCPro\\Indice2','C:\\Program Files\\DCPro\\Indice3','C:\\Program Files\\DCPro\\Espera1','C:\\Program Files\\DCPro\\Espera2','C:\\Program Files\\DCPro\\Espera3','C:\\Program Files\\DCPro\\Mensaje','C:\\Program Files\\DCPro\\Disuasion');
/*!40000 ALTER TABLE `voces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dcpro'
--

--
-- Dumping routines for database 'dcpro'
--
/*!50003 DROP FUNCTION IF EXISTS `creaMenuDB` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `creaMenuDB`(id_usuario INT) RETURNS varchar(65000) CHARSET latin1
BEGIN    
   DECLARE record_not_found     INTEGER DEFAULT 0;
   DECLARE descripcion0         VARCHAR(100) DEFAULT "";
   DECLARE descripcionhijo      VARCHAR(100) DEFAULT "";
   DECLARE descripcionnieto     VARCHAR(100) DEFAULT "";
   
   DECLARE forma0               VARCHAR(100) DEFAULT "";
   DECLARE formahijo            VARCHAR(100) DEFAULT "";	
   DECLARE formanieto           VARCHAR(100) DEFAULT "";
   
   DECLARE menu                 VARCHAR(65000) DEFAULT ""; 
   DECLARE idmenucur            INT DEFAULT 0;
   DECLARE idmenucurhijo        INT DEFAULT 0;
   DECLARE idmenucurnieto       INT DEFAULT 0; 
   DECLARE tipomenu             INT DEFAULT 0;
   DECLARE tipomenunieto        INT DEFAULT 0;
   DECLARE id_tipo_usuario      INT DEFAULT 0;
   DECLARE bandera_padre        INT DEFAULT 0;
   DECLARE bandera_hijo         INT DEFAULT 0;
   
   DECLARE my_cursor     CURSOR FOR SELECT descripcion, forma, idmenu FROM menus WHERE idpadre = 0 ORDER BY descripcion;
   DECLARE cur_hijos     CURSOR FOR SELECT descripcion, forma, idmenu, tipo FROM menus WHERE idpadre = idmenucur ORDER BY descripcion;
   DECLARE cur_nietos    CURSOR FOR SELECT descripcion, forma, idmenu, tipo  FROM menus WHERE idpadre = idmenucurhijo ORDER BY descripcion;
   
   
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET record_not_found = 1;
   
   SELECT id_tipo_usr INTO id_tipo_usuario FROM usuario WHERE id_usr = id_usuario;

   SET menu="<menus>";
   
   OPEN my_cursor;    
   
   ciclo_padre: LOOP 
   FETCH my_cursor INTO descripcion0, forma0, idmenucur; 
   IF record_not_found THEN
		CLOSE my_cursor;
		LEAVE ciclo_padre; 
   END IF; 

	CASE id_tipo_usuario
		WHEN 1 THEN	
			IF LCASE(descripcion0) = "administraci�n" OR LCASE(descripcion0) = "supervisi�n" OR LCASE(descripcion0) = "reportes" THEN
				IF forma0 IS NULL THEN
					SET menu= CONCAT(menu,"<menu0 label=",'"',descripcion0,'"'," forma=",'""'," >");
				ELSE
					SET menu= CONCAT(menu,"<menu0 label=",'"',descripcion0,'"'," forma=",'"',forma0,'"'," >");
				END IF;
                SET bandera_padre = 1;
            ELSE
                SET bandera_padre = 0;
			END IF;
		WHEN 2 THEN 
			IF LCASE(descripcion0) = "administraci�n" OR LCASE(descripcion0) = "supervisi�n" OR LCASE(descripcion0) = "atenci�n" THEN
				IF forma0 IS NULL THEN
					SET menu= CONCAT(menu,"<menu0 label=",'"',descripcion0,'"'," forma=",'""'," >");
				ELSE
					SET menu= CONCAT(menu,"<menu0 label=",'"',descripcion0,'"'," forma=",'"',forma0,'"'," >");
				END IF;
				SET bandera_padre = 1;
            ELSE
                SET bandera_padre = 0;
			END IF;
		WHEN 3 THEN 
			IF LCASE(descripcion0) = "administraci�n" OR LCASE(descripcion0) = "supervisi�n" OR LCASE(descripcion0) = "reportes" THEN
				IF forma0 IS NULL THEN
					SET menu= CONCAT(menu,"<menu0 label=",'"',descripcion0,'"'," forma=",'""'," >");
				ELSE
					SET menu= CONCAT(menu,"<menu0 label=",'"',descripcion0,'"'," forma=",'"',forma0,'"'," >");
				END IF;
				SET bandera_padre = 1;
            ELSE
                SET bandera_padre = 0;
			END IF;
		WHEN 4 THEN 
			IF LCASE(descripcion0) = "administraci�n" THEN
				IF forma0 IS NULL THEN
					SET menu= CONCAT(menu,"<menu0 label=",'"',descripcion0,'"'," forma=",'""'," >");
				ELSE
					SET menu= CONCAT(menu,"<menu0 label=",'"',descripcion0,'"'," forma=",'"',forma0,'"'," >");
				END IF;
                SET bandera_padre = 1;
			ELSE
                SET bandera_padre = 0;
			END IF;
	END CASE;
	OPEN cur_hijos;
        ciclo_hijos: LOOP
         FETCH cur_hijos INTO descripcionhijo, formahijo, idmenucurhijo, tipomenu;
            IF record_not_found THEN 
                CLOSE cur_hijos;
                SET record_not_found = 0;
                LEAVE ciclo_hijos;
            END IF;
            IF tipomenu = 1 THEN
				CASE id_tipo_usuario
					WHEN 1 THEN	
						IF LCASE(descripcionhijo) = "cat�logos" OR LCASE(descripcionhijo) = "nivel de servicio" OR LCASE(descripcionhijo) = "Productividad" OR
						   LCASE(descripcionhijo) = "tr�fico de llamadas" OR LCASE(descripcionhijo) = "utilizaci�n" THEN
							IF formahijo IS NULL THEN
								SET menu= CONCAT(menu,"<menu1 label=",'"',descripcionhijo,'"'," forma=",'""'," >");
							ELSE
								SET menu= CONCAT(menu,"<menu1 label=",'"',descripcionhijo,'"'," forma=",'"',formahijo,'"'," >");
							END IF;
							set bandera_hijo = 1;
						else
							set bandera_hijo = 0;
						END IF;
					WHEN 2 THEN	
						SET menu= CONCAT(menu,"");
						SET bandera_hijo = 0;
					WHEN 3 THEN 
						IF LCASE(descripcionhijo) = "cat�logos" OR LCASE(descripcionhijo) = "nivel de servicio" OR LCASE(descripcionhijo) = "Productividad" OR
						   LCASE(descripcionhijo) = "tr�fico de llamadas" OR LCASE(descripcionhijo) = "utilizaci�n" THEN
							IF formahijo IS NULL THEN
								SET menu= CONCAT(menu,"<menu1 label=",'"',descripcionhijo,'"'," forma=",'""'," >");
							ELSE
								SET menu= CONCAT(menu,"<menu1 label=",'"',descripcionhijo,'"'," forma=",'"',formahijo,'"'," >");
							END IF;
							set bandera_hijo = 1;
						else
							set bandera_hijo = 0;
						END IF;
					WHEN 4 THEN 
						SET menu= CONCAT(menu,"");
						SET bandera_hijo = 0;
				END CASE;
            OPEN cur_nietos;
                ciclo_nietos: LOOP
                FETCH cur_nietos INTO descripcionnieto, formanieto, idmenucurnieto, tipomenunieto ;
                IF record_not_found THEN 
                CLOSE cur_nietos;
                SET record_not_found = 0;
                LEAVE ciclo_nietos;
                END IF;
                IF tipomenunieto = 1 THEN
				   
				   
				   SET menu= CONCAT(menu,"");
					
					
					
					
					
					
					
					
					
					
					
                
				
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                ELSE 
					CASE id_tipo_usuario
						WHEN 1 THEN	
							IF LCASE(descripcionnieto) = "resultados inbound" OR LCASE(descripcionnieto) = "resultados outbound" OR LCASE(descripcionnieto) = "integraci�n crm" OR 
							   LCASE(descripcionnieto) = "tiempos generales de nivel de servicio" OR LCASE(descripcionnieto) = "operaci�n diaria" OR 
							   LCASE(descripcionnieto) = "atenci�n de eventos" OR LCASE(descripcionnieto) = "duraci�n de servicio" OR LCASE(descripcionnieto) = "tr�fico de llamadas" OR
							   LCASE(descripcionnieto) = "destino de llamadas" OR LCASE(descripcionnieto) = "nivel de atenci�n por fecha" OR LCASE(descripcionnieto) = "nivel de atenci�n por hora" THEN
								IF formanieto IS NULL THEN
									SET menu= CONCAT(menu,"<menuitem label=",'"',descripcionnieto,'"'," forma=",'""'," />");
								ELSE
									SET menu= CONCAT(menu,"<menuitem label=",'"',descripcionnieto,'"'," forma=",'"',formanieto,'"'," />");
								END IF;
							END IF;
						WHEN 2 THEN	
							SET menu= CONCAT(menu,"");
						WHEN 3 THEN 
							IF LCASE(descripcionnieto) = "resultados inbound" OR LCASE(descripcionnieto) = "resultados outbound" OR LCASE(descripcionnieto) = "integraci�n crm" OR 
							   LCASE(descripcionnieto) = "tiempos generales de nivel de servicio" OR LCASE(descripcionnieto) = "operaci�n diaria" OR 
							   LCASE(descripcionnieto) = "atenci�n de eventos" OR LCASE(descripcionnieto) = "duraci�n de servicio" OR LCASE(descripcionnieto) = "tr�fico de llamadas" OR
							   LCASE(descripcionnieto) = "destino de llamadas" OR LCASE(descripcionnieto) = "nivel de atenci�n por fecha" OR LCASE(descripcionnieto) = "nivel de atenci�n por hora" THEN
								IF formanieto IS NULL THEN
									SET menu= CONCAT(menu,"<menuitem label=",'"',descripcionnieto,'"'," forma=",'""'," />");
								ELSE
									SET menu= CONCAT(menu,"<menuitem label=",'"',descripcionnieto,'"'," forma=",'"',formanieto,'"'," />");
								END IF;
							END IF;
						WHEN 4 THEN 
							SET menu= CONCAT(menu,"");
					END CASE;
                END IF;
                END LOOP ciclo_nietos;
				IF bandera_hijo = 1 THEN
                    SET menu = CONCAT(menu,"</menu1>");
				END IF;
            ELSE 
				CASE id_tipo_usuario
					WHEN 1 THEN	
						IF LCASE(descripcionhijo) != "configurar sistema" AND LCASE(descripcionhijo) != "atender eventos" THEN
							IF formahijo IS NULL THEN
								SET menu= CONCAT(menu,"<menuitem label=",'"',descripcionhijo,'"'," forma=",'""',"/>");
							ELSE
								SET menu= CONCAT(menu,"<menuitem label=",'"',descripcionhijo,'"'," forma=",'"',formahijo,'"',"/>");
							END IF;
						END IF;
					WHEN 2 THEN	
						IF LCASE(descripcionhijo) = "cambiar contrase�a"  OR LCASE(descripcionhijo) = "enviar mensaje" OR LCASE(descripcionhijo) = "atender eventos" THEN
							IF formahijo IS NULL THEN
								SET menu= CONCAT(menu,"<menuitem label=",'"',descripcionhijo,'"'," forma=",'""',"/>");
							ELSE
								SET menu= CONCAT(menu,"<menuitem label=",'"',descripcionhijo,'"'," forma=",'"',formahijo,'"',"/>");
							END IF;
						END IF;
					WHEN 3 THEN 
						IF LCASE(descripcionhijo) != "configurar sistema" AND LCASE(descripcionhijo) != "atender eventos" THEN
							IF formahijo IS NULL THEN
								SET menu= CONCAT(menu,"<menuitem label=",'"',descripcionhijo,'"'," forma=",'""',"/>");
							ELSE
								SET menu= CONCAT(menu,"<menuitem label=",'"',descripcionhijo,'"'," forma=",'"',formahijo,'"',"/>");
							END IF;
						END IF;
					WHEN 4 THEN 
						IF LCASE(descripcionhijo) = "cambiar contrase�a"  OR LCASE(descripcionhijo) = "configurar sistema" THEN
							IF formahijo IS NULL THEN
								SET menu= CONCAT(menu,"<menuitem label=",'"',descripcionhijo,'"'," forma=",'""',"/>");
							ELSE
								SET menu= CONCAT(menu,"<menuitem label=",'"',descripcionhijo,'"'," forma=",'"',formahijo,'"',"/>");
							END IF;
						END IF;
				END CASE;
            END IF; 
         END LOOP ciclo_hijos;
		IF bandera_padre = 1 THEN
		SET menu = CONCAT(menu,"</menu0>");
    END IF;
   END LOOP ciclo_padre;    
   SET menu = CONCAT(menu,"</menus>");    
   RETURN menu; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-19  8:47:04
