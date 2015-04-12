drop database ssdi;
create database ssdi;
use ssdi;


CREATE TABLE IF NOT EXISTS users (
  userid INT NOT NULL AUTO_INCREMENT,
  fname VARCHAR(50) NOT NULL,
  lname VARCHAR(50) NOT NULL,
  ssn VARCHAR(45) NULL,
  email VARCHAR(100) NOT NULL,
  dob DATE NOT NULL,
  phone VARCHAR(15) NOT NULL,
  password VARCHAR(20) NOT NULL,
  security VARCHAR(200) NOT NULL,
  answer VARCHAR(200) NOT NULL,
  PRIMARY KEY (userid))
ENGINE = InnoDB
AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS address (
  userid INT NOT NULL,
  addrid INT NOT NULL AUTO_INCREMENT,
  line1 VARCHAR(45) NOT NULL,
  line2 VARCHAR(45) NOT NULL,
  city VARCHAR(45) NOT NULL,
  zip INT NOT NULL,
  country VARCHAR(45) NOT NULL,
  PRIMARY KEY (addrid),
  INDEX addr_userid_idx (userid ASC),
  CONSTRAINT addr_userid
    FOREIGN KEY (userid)
    REFERENCES ssdi.users (userid)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 100;


CREATE TABLE IF NOT EXISTS creditcard (
  userid INT NOT NULL,
  creditcard BIGINT(16) NOT NULL,
  cvv INT NOT NULL,
  expmonth INT NOT NULL,
  expyear INT NOT NULL,
  name VARCHAR(45) NOT NULL,
  type VARCHAR(45) NOT NULL,
  PRIMARY KEY (creditcard),
  INDEX credit_userid_idx (userid ASC),
  CONSTRAINT credit_userid
    FOREIGN KEY (userid)
    REFERENCES users (userid)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
	
	CREATE TABLE IF NOT EXISTS buildings (
  buildingid INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  DESCRIPTION VARCHAR(100) NULL,
  latitude FLOAT(13,9) NOT NULL,
  longitude FLOAT(13,9) NOT NULL,
  PRIMARY KEY (buildingid));

CREATE TABLE Lot(
	LotID INT NOT NULL AUTO_INCREMENT,
    BuildingID INT NOT NULL,
    Name VARCHAR(20) NOT NULL,
	Latitude FLOAT(13,9) NOT NULL,
    Longitude FLOAT(13,9) NOT NULL,
    CONSTRAINT pk_LotID PRIMARY KEY(LotID),
    CONSTRAINT fk_Buildings_BuildingID_Lot_BuildingID FOREIGN KEY (BuildingID) REFERENCES Buildings(BuildingID));
    
CREATE TABLE Slot(
	SlotID INT,
    LotID INT,
    CONSTRAINT pk_SlotID_LotID PRIMARY KEY(SlotID, LotID),
    CONSTRAINT fk_Lot_LotID_Slot_LotID FOREIGN KEY (LotID) REFERENCES Lot(LotID));
    
CREATE TABLE Booking(
	BookingID INT NOT NULL AUTO_INCREMENT,
    LotID INT NOT NULL,
    SlotID INT NOT NULL,
    From_Date DATE NOT NULL,
    From_Time TIME NOT NULL,
	To_Date DATE NOT NULL,
    To_Time TIME NOT NULL,
    UserID INT NOT NULL,
    Cost FLOAT(5,2) NOT NULL,
    CONSTRAINT pk_BookingID PRIMARY KEY(BookingID),
    CONSTRAINT fk_Slot_SlotID_LotID_Booking_SlotID_LotID FOREIGN KEY(SlotID, LotID) REFERENCES Slot(SlotID, LotID),
    CONSTRAINT fk_Users_UserID_Booking_UserID FOREIGN KEY(UserID) REFERENCES Users(UserID));


ALTER TABLE `ssdi`.`users` 
ADD UNIQUE INDEX `email_UNIQUE` (`email` ASC),
ADD UNIQUE INDEX `ssn_UNIQUE` (`ssn` ASC);

INSERT INTO `ssdi`.`users` (`fname`, `lname`, `ssn`, `email`, `dob`, `phone`, `password`, security, answer) VALUES ('sampath', 'kolluru', '542-23-1234', 'skolluru@uncc.edu', '1991-08-23', '3244211123', 'password','question','suj');


INSERT INTO `ssdi`.`users` (`fname`, `lname`, `ssn`, `email`, `dob`, `phone`, `password`, security, answer) VALUES ('lokesh', 'SRIDVI', '312-23-1234', 'lokesh@uncc.edu', '1991-08-23', '3213211123', 'password','question','ans');

INSERT INTO `ssdi`.`users` (`fname`, `lname`, `ssn`, `email`, `dob`, `phone`, `password`, security, answer) VALUES ('bhargav', 'xyz', '312-34-3343', 'bhargav@uncc.edu', '1991-08-24', '2341321113', 'password','question','suj');


INSERT INTO `ssdi`.`users` (`fname`, `lname`, `ssn`, `email`, `dob`, `phone`, `password`, security, answer) VALUES ('sujeeth', 'abc', '312-23-1243', 'sujeeth@uncc.edu', '1993-09-27', '3213213434', 'password','question','ans');

INSERT INTO `ssdi`.`users` (`fname`, `lname`, `ssn`, `email`, `dob`, `phone`, `password`, security, answer) VALUES ('vignesh', 'bcd', '122-23-1234', 'vignesh@uncc.edu', '1991-08-27', '6513211123', 'password','question','suj');
  
  
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('1', 'East Entrance', '35.3080687', '-80.7248944');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('2', 'North Entrance', '35.31293652', '-80.73003352');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('3', 'West Entrance', '35.30200978', '-80.74168503');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('4', 'Foundation', '35.29797317', '-80.73689997');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('5', 'South Entrance', '35.30122174', '-80.73693216');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('6', 'Student Health Centre', '35.31053767', '-80.72952926');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('7', 'Burson', '35.30745582', '-80.73243678');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('8', 'Rose Football Centre', '35.30995983', '-80.73939979');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('9', 'Motorsports Research', '35.31261259', '-80.74024737');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('10', 'Cone University Centre', '35.30523192', '-80.73321998');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('11', 'Niner House', '35.30410244', '-80.72778046');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('12', 'Student Union', '35.30864655', '-80.73371351');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('13', 'Residence Dining Hall', '35.30214112', '-80.73361695');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('14', 'Scott Hall', '35.30173835', '-80.73535502');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('15', 'Hawthorn Hall', '35.31155325', '-80.72743714');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('16', 'Facilities Operations Parking Services', '35.30841891', '-80.73016226');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('17', 'Witherspoon Hall', '35.31093164', '-80.73230803');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('18', 'Sanford Hall', '35.30302547', '-80.7334882');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('19', 'Belk Gym', '35.30541579', '-80.7355696');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('20', 'Memorial Hall', '35.30377847', '-80.73585927');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('21', 'Halton Wagner Complex', '35.30730698', '-80.73667467');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('22', 'Woodward Hall', '35.30752587', '-80.73570907');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('23', 'EPIC', '35.30908431', '-80.74162066');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('24', 'Facilities Management', '35.31220987', '-80.73043048');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('25', 'Grigg Hall', '35.31130811', '-80.74188888');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('26', 'Irwin Belk Track & Field', '35.30549459', '-80.7373184');
INSERT INTO `ssdi`.`buildings` (`buildingid`, `name`, `latitude`, `longitude`) VALUES ('27', 'High School', '35.30885668', '-80.74379861');


UPDATE `ssdi`.`buildings` SET `DESCRIPTION`='East Entrance' WHERE `buildingid`='1';
UPDATE `ssdi`.`buildings` SET `DESCRIPTION`='North Entrance' WHERE `buildingid`='2';
UPDATE `ssdi`.`buildings` SET `DESCRIPTION`='West Entrance' WHERE `buildingid`='3';
UPDATE `ssdi`.`buildings` SET `DESCRIPTION`='Foundation' WHERE `buildingid`='4';
UPDATE `ssdi`.`buildings` SET `DESCRIPTION`='South Entrance' WHERE `buildingid`='5';
UPDATE `ssdi`.`buildings` SET `DESCRIPTION`='Student Health Centre' WHERE `buildingid`='6';
UPDATE `ssdi`.`buildings` SET `DESCRIPTION`='Burson' WHERE `buildingid`='7';
UPDATE `ssdi`.`buildings` SET `DESCRIPTION`='Rose Football Centre' WHERE `buildingid`='8';
UPDATE `ssdi`.`buildings` SET `DESCRIPTION`='Motorsports Research' WHERE `buildingid`='9';
UPDATE `ssdi`.`buildings` SET `DESCRIPTION`='Cone University Centre' WHERE `buildingid`='10';
UPDATE `ssdi`.`buildings` SET `DESCRIPTION`='Niner House' WHERE `buildingid`='11';
UPDATE `ssdi`.`buildings` SET `DESCRIPTION`='Student Union' WHERE `buildingid`='12';
UPDATE `ssdi`.`buildings` SET `DESCRIPTION`='Residence Dining Hall' WHERE `buildingid`='13';
UPDATE `ssdi`.`buildings` SET `DESCRIPTION`='Scott Hall' WHERE `buildingid`='14';
UPDATE `ssdi`.`buildings` SET `DESCRIPTION`='Hawthorn Hall' WHERE `buildingid`='15';
UPDATE `ssdi`.`buildings` SET `DESCRIPTION`='Facilities Operations Parking Services' WHERE `buildingid`='16';
UPDATE `ssdi`.`buildings` SET `DESCRIPTION`='Witherspoon Hall' WHERE `buildingid`='17';
UPDATE `ssdi`.`buildings` SET `DESCRIPTION`='Sanford Hall' WHERE `buildingid`='18';
UPDATE `ssdi`.`buildings` SET `DESCRIPTION`='Belk Gym' WHERE `buildingid`='19';
UPDATE `ssdi`.`buildings` SET `DESCRIPTION`='Memorial Hall' WHERE `buildingid`='20';
UPDATE `ssdi`.`buildings` SET `DESCRIPTION`='Halton Wagner Complex' WHERE `buildingid`='21';
UPDATE `ssdi`.`buildings` SET `DESCRIPTION`='Woodward Hall' WHERE `buildingid`='22';
UPDATE `ssdi`.`buildings` SET `DESCRIPTION`='EPIC' WHERE `buildingid`='23';
UPDATE `ssdi`.`buildings` SET `DESCRIPTION`='Facilities Management' WHERE `buildingid`='24';
UPDATE `ssdi`.`buildings` SET `DESCRIPTION`='Grigg Hall' WHERE `buildingid`='25';
UPDATE `ssdi`.`buildings` SET `DESCRIPTION`='Irwin Belk Track & Field' WHERE `buildingid`='26';
UPDATE `ssdi`.`buildings` SET `DESCRIPTION`='High School' WHERE `buildingid`='27';
		
commit;

INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'East Entrance'), 	'Lot 6',	35.30879574,	-80.72593416	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'North Entrance'), 	'Lot 25',	35.3129015,	-80.73266208	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'West Entrance'), 	'Lot 27',	35.30179964,	-80.74034393	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Foundation'), 	'Lot 101',	35.29711504,	-80.73844492	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'North Entrance'), 	'North Deck',	35.31338301,	-80.73140681	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'South Entrance'), 	'South Village Deck',	35.30064384,	-80.73617041	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Student Health Centre'), 	'Lot 11',	35.31026626,	-80.73013008	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Student Health Centre'), 	'Lot 11A',	35.31094915,	-80.73023736	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Burson'), 	'Lot 15',	35.30793737,	-80.73246896	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Rose Football Centre'), 	'Lot 29',	35.31078281,	-80.73805869	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Rose Football Centre'), 	'Lot 29A',	35.31080907,	-80.73853076	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Motorsports Research'), 	'CRI 3',	35.31287523,	-80.74066579	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Cone University Centre'), 	'Cone Deck 1',	35.30433884,	-80.73438942	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Cone University Centre'), 	'Cone Deck 2',	35.30479414,	-80.73450744	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Niner House'), 	'East Deck 1',	35.30473285,	-80.7276088	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Student Union'), 	'Union Deck',	35.30917186,	-80.73514044	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Residence Dining Hall'), 	'Lot 8A',	35.30150193,	-80.73393881	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Scott Hall'), 	'Lot 8',	35.30050374,	-80.73487222	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Student Health Centre'), 	'Lot 12',	35.31144819,	-80.72876751	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Hawthorn Hall'), 	'Lot 13',	35.31100168,	-80.72751224	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Facilities Operations Parking Services'), 	'Lot 16',	35.30888294,	-80.73050559	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Witherspoon Hall'), 	'Lot 20',	35.31022248,	-80.73258698	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Witherspoon Hall'), 	'Lot 21',	35.31115927,	-80.73113859	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Sanford Hall'), 	'Lot MSU',	35.30260519,	-80.73298395	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'East Entrance'), 	'Lot 4A',	35.30681668,	-80.72517335	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'East Entrance'), 	'Lot 5',	35.30733325,	-80.72691143	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'East Entrance'), 	'Lot 5A',	35.30743831,	-80.72547376	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Belk Gym'), 	'Lot 7',	35.30459276,	-80.73594511	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Memorial Hall'), 	'Lot 7A',	35.30391857,	-80.73646009	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Halton Wagner Complex'), 	'Lot 14',	35.3068517,	-80.73781192	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Woodward Hall'), 	'Lot 18',	35.30919813,	-80.73599875	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Woodward Hall'), 	'Lot 19',	35.30835763,	-80.73566616	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'EPIC'), 	'Lot 23',	35.30940825,	-80.74120224	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Facilities Management'), 	'Lot 26',	35.31243749,	-80.73108494	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Grigg Hall'), 	'CRI 2',	35.31038883,	-80.7432729	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'East Entrance'), 	'East Deck 2',	35.3053545,	-80.72687924	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'East Entrance'), 	'East Deck 3',	35.30597615,	-80.72605312	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'Irwin Belk Track & Field'), 	'West Deck',	35.30542455,	-80.73656738	);
INSERT INTO ssdi.Lot (BuildingID, Name, Latitude, Longitude) VALUES (	(SELECT BuildingID FROM Buildings WHERE Name = 'High School'), 	'CRI Deck 1',	35.30913684,	-80.74348748	);


INSERT INTO Booking(LotID, SlotID, From_Date, From_Time, To_Date, To_Time, UserID) VALUES (1, 1, '2015-04-06', '08:00:00', '2015-04-06', '10:00:00', 1);
INSERT INTO Booking(LotID, SlotID, From_Date, From_Time, To_Date, To_Time, UserID) VALUES (1, 2, '2015-04-07', '08:00:00', '2015-04-07', '10:00:00', 2);
INSERT INTO Booking(LotID, SlotID, From_Date, From_Time, To_Date, To_Time, UserID) VALUES (1, 3, '2015-04-06', '08:00:00', '2015-04-06', '10:00:00', 3);
INSERT INTO Booking(LotID, SlotID, From_Date, From_Time, To_Date, To_Time, UserID) VALUES (1, 4, '2015-04-06', '09:00:00', '2015-04-06', '11:00:00', 4);
INSERT INTO Booking(LotID, SlotID, From_Date, From_Time, To_Date, To_Time, UserID) VALUES (2, 1, '2015-04-07', '13:00:00', '2015-04-07', '17:00:00', 5);
INSERT INTO Booking(LotID, SlotID, From_Date, From_Time, To_Date, To_Time, UserID) VALUES (2, 2, '2015-04-07', '15:00:00', '2015-04-07', '18:00:00', 6);
INSERT INTO Booking(LotID, SlotID, From_Date, From_Time, To_Date, To_Time, UserID) VALUES (2, 3, '2015-04-08', '08:00:00', '2015-04-08', '10:00:00', 7);
INSERT INTO Booking(LotID, SlotID, From_Date, From_Time, To_Date, To_Time, UserID) VALUES (2, 4, '2015-04-08', '23:00:00', '2015-04-09', '05:00:00', 8);
INSERT INTO Booking(LotID, SlotID, From_Date, From_Time, To_Date, To_Time, UserID) VALUES (25, 1, '2015-04-06', '08:00:00', '2015-04-06', '10:00:00', 1);
INSERT INTO Booking(LotID, SlotID, From_Date, From_Time, To_Date, To_Time, UserID) VALUES (25, 2, '2015-04-07', '08:00:00', '2015-04-07', '10:00:00', 2);
INSERT INTO Booking(LotID, SlotID, From_Date, From_Time, To_Date, To_Time, UserID) VALUES (26, 3, '2015-04-06', '08:00:00', '2015-04-06', '10:00:00', 3);

commit;


select * from Slot LIMIT 0, 100;

