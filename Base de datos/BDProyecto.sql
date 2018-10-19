-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: online_store_db
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `idCATEGORY` int(11) NOT NULL AUTO_INCREMENT,
  `cName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCATEGORY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `image` (
  `idIMAGE` int(11) NOT NULL AUTO_INCREMENT,
  `iFile` varchar(245) NOT NULL,
  PRIMARY KEY (`idIMAGE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `idPRODUCT` int(11) NOT NULL AUTO_INCREMENT,
  `pName` varchar(45) NOT NULL,
  `pDescription` varchar(45) NOT NULL,
  `pPrice` varchar(45) NOT NULL,
  `pUnits` int(11) NOT NULL,
  `idCATEGORY` int(11) NOT NULL,
  `idUSER` int(11) NOT NULL,
  `pDate` datetime NOT NULL,
  `pActive` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idPRODUCT`),
  KEY `idUSER_idx` (`idUSER`),
  KEY `idCATEGORY_idx` (`idCATEGORY`),
  CONSTRAINT `idCATEGORY` FOREIGN KEY (`idCATEGORY`) REFERENCES `category` (`idcategory`),
  CONSTRAINT `idUSER` FOREIGN KEY (`idUSER`) REFERENCES `t_user` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_image` (
  `idPRODUCT` int(11) NOT NULL,
  `idIMAGE` int(11) NOT NULL,
  PRIMARY KEY (`idPRODUCT`,`idIMAGE`),
  KEY `idIMAGE_idx` (`idIMAGE`),
  CONSTRAINT `fkImg` FOREIGN KEY (`idIMAGE`) REFERENCES `image` (`idimage`),
  CONSTRAINT `fkProduct` FOREIGN KEY (`idPRODUCT`) REFERENCES `product` (`idproduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_video`
--

DROP TABLE IF EXISTS `product_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_video` (
  `idPRODUCT_VIDEO` int(11) NOT NULL,
  `idVIDEO` int(11) NOT NULL,
  PRIMARY KEY (`idPRODUCT_VIDEO`,`idVIDEO`),
  KEY `idVIDEO_idx` (`idVIDEO`),
  CONSTRAINT `idPRODUCT_VIDEO` FOREIGN KEY (`idPRODUCT_VIDEO`) REFERENCES `product` (`idproduct`),
  CONSTRAINT `idVIDEO` FOREIGN KEY (`idVIDEO`) REFERENCES `video` (`idvideo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_video`
--

LOCK TABLES `product_video` WRITE;
/*!40000 ALTER TABLE `product_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `review` (
  `idREVIEW` int(11) NOT NULL AUTO_INCREMENT,
  `rating` int(11) NOT NULL,
  `rwcomment` varchar(300) NOT NULL,
  `rwDate` datetime NOT NULL,
  `idUSER` int(11) NOT NULL,
  `idPRODUCT` int(11) NOT NULL,
  PRIMARY KEY (`idREVIEW`),
  KEY `idUSER_idx` (`idUSER`),
  KEY `idPRODUCT_idx` (`idPRODUCT`),
  CONSTRAINT `idPRODUCT` FOREIGN KEY (`idPRODUCT`) REFERENCES `product` (`idproduct`),
  CONSTRAINT `idUserf` FOREIGN KEY (`idUSER`) REFERENCES `t_user` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_order`
--

DROP TABLE IF EXISTS `t_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_order` (
  `idORDER` int(11) NOT NULL AUTO_INCREMENT,
  `idUSER` int(11) NOT NULL,
  `oDate` date NOT NULL,
  PRIMARY KEY (`idORDER`),
  KEY `idUSER_idx` (`idUSER`),
  CONSTRAINT `oidUSERf` FOREIGN KEY (`idUSER`) REFERENCES `t_user` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_order`
--

LOCK TABLES `t_order` WRITE;
/*!40000 ALTER TABLE `t_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_order_product`
--

DROP TABLE IF EXISTS `t_order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_order_product` (
  `op_idOrder` int(11) NOT NULL,
  `op_idProduct` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`op_idOrder`,`op_idProduct`),
  KEY `idPRODUCT_idx` (`op_idProduct`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_idorder` FOREIGN KEY (`op_idOrder`) REFERENCES `t_order` (`idorder`),
  CONSTRAINT `fk_idproduct` FOREIGN KEY (`op_idProduct`) REFERENCES `product` (`idproduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_order_product`
--

LOCK TABLES `t_order_product` WRITE;
/*!40000 ALTER TABLE `t_order_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_user` (
  `idUSER` int(11) NOT NULL AUTO_INCREMENT,
  `uName` varchar(45) NOT NULL,
  `uLastname` varchar(45) NOT NULL,
  `uEmail` varchar(45) NOT NULL,
  `uUsername` varchar(45) NOT NULL,
  `uPassword` varchar(45) NOT NULL,
  `uPhone` varchar(45) DEFAULT NULL,
  `uAddress` varchar(45) DEFAULT NULL,
  `uCity` varchar(45) DEFAULT NULL,
  `uCountry` varchar(45) DEFAULT NULL,
  `uPostalCode` varchar(45) DEFAULT NULL,
  `uImgProfile` varchar(245) DEFAULT NULL,
  `uImgCover` varchar(245) DEFAULT NULL,
  PRIMARY KEY (`idUSER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `video` (
  `idVIDEO` int(11) NOT NULL AUTO_INCREMENT,
  `vfile` varchar(245) NOT NULL,
  PRIMARY KEY (`idVIDEO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'online_store_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertcomment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertcomment`(IN ratingp int,
IN commentparam varchar(300),
IN dateparam date,
IN userparam int,
IN productparam int)
BEGIN
INSERT INTO review (
rating,
rwcomment,
rwDate,
idUSER,
idPRODUCT)
VALUES (
ratingp,
commentparam,
dateparam,
userparam,
productparam);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertimage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertimage`(IN fileparam varchar(200),
IN productparam int)
BEGIN
INSERT INTO image(iFile) VALUES (fileparam);
SELECT idIMAGE FROM image WHERE iFile=fileparam;
INSERT INTO product_image(idPRODUCT,idIMAGE) VALUES (productparam,idImage);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertorder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertorder`(IN id int,
IN pdate date)
BEGIN
INSERT INTO t_order (
idUSER,
oDate)
VALUES (
id,
pDate);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertproduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertproduct`(IN nameparam varchar(45),
IN descriptionparam varchar(300),
IN category INT,
IN priceparam INT,
IN unitparam INT,
IN userparam INT,
IN dateparam date,
IN act tinyint)
BEGIN
INSERT INTO  product (
pName,
pDescription,
pPrice,
pUnits,
idCATEGORY,
idUSER,
pDate,
active)
VALUES (
nameparam,
descriptionparam,
priceparam,
unitparam,
category,
userparam,
dateparam,
act);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertuser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertuser`( IN  pName nvarchar(45), 
IN pLastname nvarchar(45), 
IN email nvarchar(45), 
IN pUsername nvarchar(45), 
IN phone nvarchar(20), 
IN pAddress nvarchar(45), 
IN pCity nvarchar(45), 
IN pCountry nvarchar(45), 
IN pPostal nvarchar(45), 
IN pImg nvarchar(200), 
IN cImg nvarchar(200))
BEGIN
INSERT INTO t_user (uName,uLastname,uEmail,uUsername,uPhone,uAddress,uCity,uCountry,uPostalCode,uProfile,uCover)
VALUES (pName,pLastname,email,pUsername,phone,pAddress,pCity,pCountry,pPostal,pImg,cImg);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertvideo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertvideo`(IN fileparam varchar(200),
IN productparam int)
BEGIN
INSERT INTO video(vFile) VALUES (fileparam);
SELECT idVIDEO FROM video WHERE vFile=fileparam;
INSERT INTO product_video(idPRODUCT_VIDEO,idVIDEO) VALUES (productparam,idVIDEO);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_op` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_op`(IN pProduct int,
IN pAmount int)
BEGIN
INSERT INTO t_order_product(idPRODUCT, quantity)
VALUES (pProduct, pAmount);

UPDATE product
SET quantity = quantity - pAmount
WHERE idPRODUCT = pProduct; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_login`(IN pUsername nvarchar(45), IN pPassword nvarchar(45), OUT uName nvarchar(45))
BEGIN
SELECT uName FROM t_user WHERE uUsername = pUsername AND uPassword = pPassword;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_modcomment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_modcomment`(IN prating int,
IN pcomment varchar(300),
IN id int)
BEGIN
UPDATE review 
SET rating = prating,
	rwcomment = pcomment
WHERE idREVIEW = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_modproduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_modproduct`(IN id int,
IN nameparam varchar(45),
IN descriptionparam varchar(300),
IN category INT,
IN priceparam INT,
IN unitparam INT,
IN dateparam date,
IN act tinyint)
BEGIN
UPDATE product
SET pName = nameparam,
	pDescription = descriptionparam,
    pPrice = priceparam,
    pUnits = unitparam,
    pDate = dateparam,
	active = act
WHERE idPRODUCT = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_moduser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_moduser`(IN id int,
IN pPassword varchar(45),
IN phone nvarchar(20), 
IN pAddress nvarchar(45), 
IN pCity nvarchar(45), 
IN pCountry nvarchar(45), 
IN pPostal nvarchar(45), 
IN pImg nvarchar(200), 
IN cImg nvarchar(200))
BEGIN
UPDATE t_user
SET uPassword = pPassword,
	uPhone = phone,
    uAddress = pAddress,
    uCity = pCity,
    uCountry = pCountry,
    uPostalCode = pPostal,
    uImgProfile = pImg,
    uImgCover = cImg
WHERE idUSER = id;

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

-- Dump completed on 2018-10-19 16:18:52
