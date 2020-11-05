DROP TABLE IF EXISTS `Booking`;
CREATE TABLE `Booking` (
  `agent` varchar(25) NOT NULL,
  `traveler_ssn` int(11) NOT NULL,
  `trip_id` int(11) NOT NULL,
  PRIMARY KEY (`agent`,`traveler_ssn`,`trip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
LOCK TABLES `Booking` WRITE;

INSERT INTO `Booking` VALUES
  ('Derek',1,10),
  ('Derek',1,20),
  ('Derek',3,15),
  ('Jaime',1,25),
  ('Jaime',2,30),
  ('Jaime',3,30),
  ('Jaime',3,40),
  ('Jaime',4,50),
  ('Jaime',5,75),
  ('Nathan',3,50),
  ('Nathan',5,75);
UNLOCK TABLES;

INSERT INTO `Booking` VALUES
  ('Derek',2,10),
  ('Derek',4,20),
  ('Derek',5,15);



DROP TABLE IF EXISTS `Traveller`;
CREATE TABLE `Traveller` (
  `name` varchar(25) NOT NULL,
  `ssn` int(11) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  PRIMARY KEY (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `Traveller` WRITE;
INSERT INTO `Traveller` VALUES
  ('Bill',4,'2010-07-04'),
  ('Carlene',5,'2005-10-03'),
  ('Jon',2,'2001-02-14'),
  ('Kim',3,'2000-12-12'),
  ('Pete',1,'1999-01-01');
UNLOCK TABLES;



DROP TABLE IF EXISTS `Trip`;
CREATE TABLE `Trip` (
  `id` int(11) NOT NULL,
  `start_location` varchar(25) DEFAULT NULL,
  `end_location` varchar(25) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `price` int DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `Trip` WRITE;
INSERT INTO `Trip` VALUES 
  (10,'Gainesville','Atlanta','2020-03-02','2020-03-02', 1000),
  (15,'San Francisco','Paris','2020-05-25','2020-05-30', 2000),
  (20,'Atlanta','St. Louis','2020-03-02','2020-03-06', 3000),
  (25,'Gainesville','New York','2019-06-20','2019-06-29', 4000),
  (30,'San Francisco','Honolulu','2020-08-27','2020-09-03', 5000),
  (40,'San Francisco','Dallas','2020-10-31','2020-12-01', 6000),
  (50,'San Francisco','Los Angelos','2020-12-24','2020-12-30', 7000),
  (75,'New York','Chicago','2020-02-10','2020-02-14',8000);
UNLOCK TABLES;

INSERT INTO `Trip` VALUES 
  (80,'Gainesville','Atlanta','2021-03-02','2021-03-02', 1000),
  (85,'San Francisco','Paris','2021-05-25','2021-05-30', 2000);



DROP TABLE IF EXISTS `TravelAgent`;
CREATE TABLE `TravelAgent` (
  `name` varchar(25) NOT NULL,
  `years_experience` int NOT NULL,
  `phone` varchar(25),
  PRIMARY KEY (`name`,`years_experience`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO TravelAgent( name, years_experience, phone )
  VALUES
  ('Derek', 27, '(904)1234567'),
  ('Jaime', 2, '(351)7654321'),
  ('Nathan', 12, '(813)1234567')
;

DELIMITER |
CREATE TRIGGER new_agent IF NOT EXISTS
BEFORE INSERT ON Booking
FOR EACH ROW
BEGIN
	IF NEW.agent NOT IN
        (SELECT name FROM TravelAgent) THEN
            INSERT INTO TravelAgent(name, years_experience, phone)
            VALUES( NEW.agent, 0, NULL ) ;
    END IF ;
END |
DELIMITER ;




DROP TABLE IF EXISTS `FormedBy`;
CREATE TABLE `FormedBy` (
  `id` int NOT NULL,
  `location` varchar(25) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`id`,`location`,`start_date`,`end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `FormedBy` WRITE;
INSERT INTO `FormedBy` VALUES 
  (1,'tally','2010-07-04','2010-07-04'),
  (2,'Gainesville','2005-10-03','2010-07-04'),
  (2,'San Diego','2005-10-03','2010-07-04'),
  (2,'Log Angeles','2005-10-03','2010-07-04'),
  (3,'Houston','2001-02-14','2010-07-04'),
  (4,'Washington DC','2000-12-12','2010-07-04'),
  (4,'London','1999-01-01','2010-07-04');
UNLOCK TABLES;


DROP TABLE IF EXISTS `GoesOn`;
CREATE TABLE `GoesOn` (
  `ssn` int NOT NULL,
  `id` int NOT NULL,
  PRIMARY KEY (`ssn`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;