# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: cosc304.ok.ubc.ca (MySQL 5.5.56-MariaDB)
# Database: group5
# Generation Time: 2017-11-30 04:35:17 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Account
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Account`;

CREATE TABLE `Account` (
  `accountNum` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `accType` varchar(250) DEFAULT NULL,
  `empID` int(11) DEFAULT NULL,
  PRIMARY KEY (`accountNum`),
  UNIQUE KEY `empID` (`empID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;

INSERT INTO `Account` (`accountNum`, `name`, `phone`, `email`, `password`, `accType`, `empID`)
VALUES
	(1,'Devon MacNeil',1234,'thisIs@nemail.com','AdminTest','Administrator',1),
	(2,'Jamie Plett',4567,'anotherFake@email.com','C1Test','Customer',NULL);

/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Address
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Address`;

CREATE TABLE `Address` (
  `addressID` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(20) DEFAULT NULL,
  `provinceState` varchar(20) DEFAULT NULL,
  `postalZIP` varchar(20) DEFAULT NULL,
  `streetAddress` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`addressID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;

INSERT INTO `Address` (`addressID`, `country`, `provinceState`, `postalZIP`, `streetAddress`)
VALUES
	(1,'Canada','British Columbia','v1v 1v1','1234 ramon st.'),
	(2,'Japan','Tokyo','t2t 6j5','9672'),
	(1000,'USA','California','d5d 9e7','Hollywood ave'),
	(1001,'United Kingdom','Wales','z1z 1z1','Fancy Sheep rd.'),
	(1002,'Argentina','Buenos Aires','i5y 5s3','NotThe ave'),
	(1003,'Australia','New South Wales','t8i 6d2','NOTTHESPIDERS st.');

/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table CreditCard
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CreditCard`;

CREATE TABLE `CreditCard` (
  `paymentID` int(11) NOT NULL,
  `cardNumber` int(11) DEFAULT NULL,
  `expDate` date DEFAULT NULL,
  `securityCode` varchar(4) DEFAULT NULL,
  `cardHolderName` varchar(250) DEFAULT NULL,
  `cardType` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`paymentID`),
  CONSTRAINT `CreditCard_ibfk_1` FOREIGN KEY (`paymentID`) REFERENCES `Payment` (`paymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `CreditCard` WRITE;
/*!40000 ALTER TABLE `CreditCard` DISABLE KEYS */;

INSERT INTO `CreditCard` (`paymentID`, `cardNumber`, `expDate`, `securityCode`, `cardHolderName`, `cardType`)
VALUES
	(1,123456789,'2500-06-06','A22b','Devon MacNeil','Visa'),
	(2,34985983,'2019-09-09','342','Jamie Plett','MasterCard');

/*!40000 ALTER TABLE `CreditCard` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Order`;

CREATE TABLE `Order` (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `accountNum` int(11) DEFAULT NULL,
  `totalAmount` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`orderID`),
  KEY `accountNum` (`accountNum`),
  CONSTRAINT `Order_ibfk_1` FOREIGN KEY (`accountNum`) REFERENCES `Account` (`accountNum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Order` WRITE;
/*!40000 ALTER TABLE `Order` DISABLE KEYS */;

INSERT INTO `Order` (`orderID`, `accountNum`, `totalAmount`)
VALUES
	(1, 1, 9677.99),
	(2, 2, 0.00),
	(3, 2, NULL),
	(4, 1, NULL);

/*!40000 ALTER TABLE `Order` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table OrderedProduct
# ------------------------------------------------------------

DROP TABLE IF EXISTS `OrderedProduct`;

CREATE TABLE `OrderedProduct` (
  `orderId` int(11) NOT NULL DEFAULT '0',
  `productId` int(11) NOT NULL DEFAULT '0',
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`orderId`,`productId`),
  KEY `productId` (`productId`),
  CONSTRAINT `OrderedProduct_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `Order` (`orderID`),
  CONSTRAINT `OrderedProduct_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `Product` (`productID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `OrderedProduct` WRITE;
/*!40000 ALTER TABLE `OrderedProduct` DISABLE KEYS */;

INSERT INTO `OrderedProduct` (`orderId`, `productId`, `quantity`, `price`)
VALUES
	(1, 50, 1, 677.00),
	(1, 54, 1, 9000.99),
	(2, 22, 5, 999.00),
	(3, 12, 3, 721.00),
	(3, 34, 3, 1161.00),
	(4, 26, 4, 704.00);

/*!40000 ALTER TABLE `OrderedProduct` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Payment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Payment`;

CREATE TABLE `Payment` (
  `paymentID` int(11) NOT NULL AUTO_INCREMENT,
  `addressID` int(11) DEFAULT NULL,
  `accountNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`paymentID`),
  KEY `accountNum` (`accountNum`),
  KEY `addressID` (`addressID`),
  CONSTRAINT `Payment_ibfk_1` FOREIGN KEY (`accountNum`) REFERENCES `Account` (`accountNum`),
  CONSTRAINT `Payment_ibfk_2` FOREIGN KEY (`addressID`) REFERENCES `Address` (`addressID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;

INSERT INTO `Payment` (`paymentID`, `addressID`, `accountNum`)
VALUES
	(1,1,1),
	(2,2,2);

/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Product`;

CREATE TABLE `Product` (
  `productID` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(9,2) DEFAULT NULL,
  `breed` varchar(255) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `description` varchar(510) DEFAULT NULL,
  `picture` varchar(350) DEFAULT NULL,
  `image` blob,
  PRIMARY KEY (`productID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;



INSERT INTO `Product` (`productID`, `price`, `breed`, `category`, `description`, `picture`, `image`)
VALUES
	(1,500.00,'Afghan Hound','Large','A dog who is both dignified and independent','images/dogs/afghan-hound.jpg',NULL),
	(2,632.00,'Akita','Large','A intelligent friendly dog from old world Japan','images/dogs/Akita-2.jpg',NULL),
	(3,985.00,'Alaskan Husky','Medium','A powerful energetic sensitive dog that is also makes a great protector','images/dogs/alaskan-husky.jpg',NULL),
	(4, 126.00,'American Malamute', 'Large', 'An affectionate playful and devoted companion for those lonely nights', 'images/dogs/alaskan-malamute.jpg', Null),
	(5,126.00,'American Bulldog','Large','An affectionate playful and devoted companion for those lonely nights','images/dogs/american-bulldog-standard-type.jpg',NULL),
	(6,348.00,'American Foxhound','Medium','A Couragous energetic companion with an affectionate out-going personality','images/dogs/american-foxhound.jpg',NULL),
	(7,872.00,'Basset Hound','Large','Being an independent and intelligent indvidual with a loving personality this dog is right for anyone','images/dogs/basset-hounds.jpg',NULL),
	(8,1023.00,'Beagle','Medium','This dog is a gentle devoted friend with an affectionate personality','images/dogs/Beagle-main.jpg',NULL),
	(9,925.00,'Bernese Mountain Dog','Medium','With a friendly and independent pseronality this gental companion also possess great intelligence','images/dogs/Bernese-Mountian-Dog.jpg',NULL),
	(10,555.00,'Black Russian Terrier','Large','This dog makes for an affectionate and loyal companion','images/dogs/Black Russian Terrier.jpg',NULL),
	(11,657.00,'Bloodhound','Large','With lots of energy this dog possess a brave and condident personality','images/dogs/Bloodhound.jpg',NULL),
	(12,3500.00,'Boerboel','Large','This even tempered dog can be stubborn at times but is also extremely affectionate','images/dogs/Boerboel.jpg',NULL),
	(13,721.00,'Border Collie','Large','This dog is both confident and obedient with a fierce intelligence','images/dogs/Border-collie.jpg',NULL),
	(14,425.00,'Borzoi','Medium','A loyal and intelligent companion with a energetic  and proctective personality','images/dogs/Borzoi.jpg',NULL),
	(15,1337.00,'Bouvier des Flandres','Large','This large dog possess a gental and quiet personality with an idependent nature','images/dogs/bouvier-des-flandres.jpg',NULL),
	(16,654.00,'Boxer','Large','Even with its gental personality this intelligent dog can be quite protective','images/dogs/Boxer.jpg',NULL),
	(17,1100.00,'Briard','Medium','A brave, playful and friendly companion with a fierce confidence','images/dogs/Briard.jpg',NULL),
	(18,999.00,'Bulldog','Large','Faithful and loyal with this dogs intelligence it makes a good companion for anyone','images/dogs/Bulldog.jpg',NULL),
	(19,3911.00,'Bullmastiff','Medium','A social dog with a friendly loving personality','images/dogs/Bullmastiff.jpg',NULL),
	(20,2248.00,'Canadian Eskimo Dog','Large','This dog is a calm courageous and loyal forever companion','images/dogs/canadian-eskimo-dog.jpg',NULL),
	(21,293.00,'Caucasian Ovcharka','Large','Calm and powerful this dog makes a wonderful guard companion','images/dogs/Caucasian Ovcharka.jpg',NULL),
	(22,0.00,'Chow Chow','Special','Best boy, all that needs to be said. Special price: Your Soul','images/dogs/chow.jpg',NULL),
	(23,913.00,'Dachshund','Medium','A companion that is clever and playful with a cute stubborn streak','images/dogs/Dachshund.jpg',NULL),
	(24,860.00,'Dalmatian','Large','Spotted ,intelligent with a energetic playfullness this is a wonderful campanion, even with 101 of them','images/dogs/Dalmatian.jpg',NULL),
	(25,431.00,'Doberman Pinscher','Medium','Being extremely intelligent this fearless, loyal and obedient dog make a wonderful companion for anyone','images/dogs/doberman_pinscher.jpg',NULL),
	(26,704.00,'Dutch Shepherd','Large','Highly trainable and obedient there is a reason these affectionate dogs are called shepherds','images/dogs/dutch-shepherd.jpg',NULL),
	(27,919.00,'English Cocker Spaniel','Medium','Friendly and affectionate this dog makes for a wonderful companion','images/dogs/English-cocker-spaniel-med.jpg',NULL),
	(28,264.00,'English Foxhound','Large','This gentle and sociable dog makes for a greta active companion','images/dogs/english-foxhound.jpg',NULL),
	(29,568.00,'Flat-Coated Retriever','Medium','For the optimist this intelligent and friendly dog is for you','images/dogs/flat-coated-retriever.jpg',NULL),
	(30,169.00,'German Shepherd','Large','Obedient, loyal, and intelligent this dog makes for one of the best companions','images/dogs/german-shepherd.jpg',NULL),
	(31,1068.00,'German Shorthaired Pointer','Medium','This dog is perfect for the outdoors when its bold and intelligent personality is combined with its trainability','images/dogs/German-Shorthaired Pointer.jpg',NULL),
	(32,368.00,'Giant Schnauzer','Large','With a Strong Will and intelligence this dog can be a great companion with the right training','images/dogs/Giant Schnauzer.jpg',NULL),
	(33,632.00,'Golden Retriever','Large','One of the most intelligent and friendly these dogs make very trustworth companions','images/dogs/Golden-Retriever.jpg',NULL),
	(34,1161.00,'Gordon Setter','Large','A very happy and confident companion to have','images/dogs/Gordon-Setter-Images.jpg',NULL),
	(35,684.00,'Great Dane','Large','A resevered dog that is also very gental and loving','images/dogs/Great Dane.jpg',NULL),
	(36,1588.00,'Greater Swiss Mountain Dog','Large','This self confident dog makes for a very good natured companion','images/dogs/greater-swiss-mountain-dog.jpg',NULL),
	(37,905.00,'Greyhound','Large','The classic athletic dog can also make for and even tempered and affectionate companion','images/dogs/Greyhound.jpg',NULL),
	(38,1879.00,'Komondor','Large','Independent, Calm, Affectionat, there are many ways do sercribe this companion','images/dogs/Komondor.jpg',NULL),
	(39,993.00,'Labrador Retriever','Medium','Commonely known as a Lab this dogs out-going affectionate personality make for a perfect companion','images/dogs/Labrador Retriever.jpg',NULL),
	(40,1760.00,'Large Munsterlanders','Large','With its intelligence and natural obedience this dog makes for an cheerful easily trained campanion','images/dogs/Large-Munsterlanders.jpg',NULL),
	(41,1032.00,'Maremma Sheepdog','Large','This walking cloud is both fluffy and friendly','images/dogs/Maremma Sheepdog.jpg',NULL),
	(42,466.00,'Neapolitan Mastiff','Large','A stubborn but highly trainable dog that can make for a giant cuddle machine','images/dogs/neapolitan-mastiff-dogs.jpg',NULL),
	(43,930.00,'Old English Sheepdog','Large','Playful and loving this intelligent dog can make a great companion for those who do not mind lots of fur','images/dogs/old-english-sheepdog.jpg',NULL),
	(44,1352.00,'Otterhound','Large','Considered a very amiable and even tempered companion to have','images/dogs/Otterhound.jpg',NULL),
	(45,582.00,'Pembroke Welsh Corgi','Medium','There is a reason that this out going affectionate dog is favoured by royalty','images/dogs/Pembroke-Welsh-Corgi.jpg',NULL),
	(46,388.00,'Picardy Spaniel','Large','This affectionate dog makes for a very energetic and active companion','images/dogs/Picardy Spaniel.jpg',NULL),
	(47,917.00,'Poodle','Medium','A very trainable and faithful companion that requires lots of activity','images/dogs/Poodle.jpg',NULL),
	(48,1608.00,'Rottweiler','Medium','A dog with a bad rap, they are actuakky very intelligent and good natured','images/dogs/Rottweiler.jpg',NULL),
	(49,381.00,'Rough Collier','Large','With this dogs friendly and loyal nature they make for a loveable companion','images/dogs/Rough Collie.jpg',NULL),
	(50,677.00,'Saint Bernard','Large','The well known gentle giant that delivers relief and rescue to lost skiers','images/dogs/saint-bernard.jpg',NULL),
	(51,666.69,'Shiba Inu','Special','So dog, Much Wow, SO lost how did I get here','images/dogs/shiba inu.jpg',NULL),
	(52,780.00,'Siberian Husky','Medium','An increadibly intelligent and gentle dog','images/dogs/Siberian Husky.jpg',NULL),
	(53,759.00,'Tibeatan Mastiff','Large','Very loyal but a little stubborn they make very good work companions','images/dogs/Tibetean-Mastiff-Pics-.jpg',NULL),
	(54,9000.99,'Otter','Special','Water doggo very friendly. Costs alot but worth it','images/dogs/Z-Otter.jpg',NULL),
	(55,0.00,'Programmer','Special','Free to a good home just needs food and water, also internet','images/dogs/z2.jpg',NULL);



/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Review
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Review`;

CREATE TABLE `Review` (
  `productID` int(11) NOT NULL DEFAULT '0',
  `accountNum` int(11) NOT NULL DEFAULT '0',
  `date` date NOT NULL DEFAULT '0000-00-00',
  `rating` int(11) DEFAULT NULL,
  `review` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`productID`,`accountNum`,`date`),
  KEY `accountNum` (`accountNum`),
  CONSTRAINT `Review_ibfk_1` FOREIGN KEY (`accountNum`) REFERENCES `Account` (`accountNum`),
  CONSTRAINT `Review_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `Product` (`productID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Review` WRITE;
/*!40000 ALTER TABLE `Review` DISABLE KEYS */;

INSERT INTO `Review` (`productID`, `accountNum`, `date`, `rating`, `review`)
VALUES
	(50,1,'2017-11-26',10,'Got a big floofy boy can not go wrong'),
	(54,1,'2017-11-26',10,'WATER DOGGO SUCH SPLASH');

/*!40000 ALTER TABLE `Review` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Shipment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Shipment`;

CREATE TABLE `Shipment` (
  `addressID` int(11) NOT NULL DEFAULT '0',
  `orderID` int(11) NOT NULL DEFAULT '0',
  `warehouseID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`addressID`,`orderID`,`warehouseID`),
  KEY `orderID` (`orderID`),
  KEY `warehouseID` (`warehouseID`),
  CONSTRAINT `Shipment_ibfk_1` FOREIGN KEY (`addressID`) REFERENCES `Address` (`addressID`),
  CONSTRAINT `Shipment_ibfk_2` FOREIGN KEY (`orderID`) REFERENCES `Order` (`orderID`),
  CONSTRAINT `Shipment_ibfk_3` FOREIGN KEY (`warehouseID`) REFERENCES `Warehouse` (`warehouseID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Shipment` WRITE;
/*!40000 ALTER TABLE `Shipment` DISABLE KEYS */;

INSERT INTO `Shipment` (`addressID`, `orderID`, `warehouseID`)
VALUES
	(1,1,4),
	(2,2,2);

/*!40000 ALTER TABLE `Shipment` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Stock
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Stock`;

CREATE TABLE `Stock` (
  `productID` int(11) NOT NULL DEFAULT '0',
  `warehouseID` int(11) NOT NULL DEFAULT '0',
  `inventory` int(11) DEFAULT NULL,
  PRIMARY KEY (`productID`,`warehouseID`),
  KEY `warehouseID` (`warehouseID`),
  CONSTRAINT `Stock_ibfk_1` FOREIGN KEY (`warehouseID`) REFERENCES `Warehouse` (`warehouseID`),
  CONSTRAINT `Stock_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `Product` (`productID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Stock` WRITE;
/*!40000 ALTER TABLE `Stock` DISABLE KEYS */;

INSERT INTO `Stock` (`productID`, `warehouseID`, `inventory`)
VALUES
	(1,1,10000),
	(2,2,10000),
	(3,3,10000),
	(4,4,10000),
	(5,1,10000),
	(6,2,10000),
	(7,3,10000),
	(8,4,10000),
	(9,1,10000),
	(10,2,10000),
	(11,3,10000),
	(12,4,10000),
	(13,1,10000),
	(14,2,10000),
	(15,3,10000),
	(16,4,10000),
	(17,1,10000),
	(18,2,10000),
	(19,3,10000),
	(20,4,10000),
	(21,1,10000),
	(22,2,10000),
	(23,3,10000),
	(24,4,10000),
	(25,1,10000),
	(26,2,10000),
	(27,3,10000),
	(28,4,10000),
	(29,1,10000),
	(30,2,10000),
	(31,3,10000),
	(32,4,10000),
	(33,1,10000),
	(34,2,10000),
	(35,3,10000),
	(36,4,10000),
	(37,1,10000),
	(38,2,10000),
	(39,3,10000),
	(40,4,10000),
	(41,1,10000),
	(42,2,10000),
	(43,3,10000),
	(44,4,10000),
	(45,1,10000),
	(46,2,10000),
	(47,3,10000),
	(48,4,10000),
	(49,1,10000),
	(50,2,10000),
	(51,3,10000),
	(52,4,10000),
	(53,1,10000),
	(54,2,10000),
	(55,3,1);

/*!40000 ALTER TABLE `Stock` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Warehouse
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Warehouse`;

CREATE TABLE `Warehouse` (
  `warehouseID` int(11) NOT NULL AUTO_INCREMENT,
  `addressID` int(11) DEFAULT NULL,
  PRIMARY KEY (`warehouseID`),
  KEY `addressID` (`addressID`),
  CONSTRAINT `Warehouse_ibfk_1` FOREIGN KEY (`addressID`) REFERENCES `Address` (`addressID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Warehouse` WRITE;
/*!40000 ALTER TABLE `Warehouse` DISABLE KEYS */;

INSERT INTO `Warehouse` (`warehouseID`, `addressID`)
VALUES
	(1,1000),
	(2,1001),
	(3,1002),
	(4,1003);

/*!40000 ALTER TABLE `Warehouse` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
