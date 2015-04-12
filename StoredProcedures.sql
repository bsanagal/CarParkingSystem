use ssdi;


-- CALL USP_SubmitUserRegistration('SUJ','M','111-11-1111','SM2@UNCC.EDU', '1990-12-12','+17042324472','SUJ','D','D','DD',33,'NC','CC');
DROP PROCEDURE IF EXISTS USP_SubmitUserRegistration;
DELIMITER //
CREATE PROCEDURE USP_SubmitUserRegistration(
IN FirstName VARCHAR(50)
,IN LastName VARCHAR(50)
,IN SSN VARCHAR(45)
,IN Email VARCHAR(100)
,IN DOB DATE
,IN Phone VARCHAR(15)
,IN UserPassword VARCHAR(20)
<<<<<<< HEAD
,IN Security VARCHAR(150)
,IN ANSWER VARCHAR(50)
=======
>>>>>>> origin/Sprint-2
-- ,IN UserId int
,IN AddressLine1 VARCHAR(45)
,IN AddressLine2 VARCHAR(45)
,IN City VARCHAR(45)
,IN Zip INT 
,IN State VARCHAR(50)
,IN Country VARCHAR(45)
)
BEGIN

DECLARE TempUserId INT;

<<<<<<< HEAD
	INSERT INTO `ssdi`.`users`(fname, lname, ssn, email, dob, phone, `password`, SecurityQ, answer)  
	VALUES(FirstName, LastName, SSN, Email, DOB, Phone, UserPassword, Security, ANSWER);
=======
	INSERT INTO `ssdi`.`users`(fname, lname, ssn, email, dob, phone, `password`)  
	VALUES(FirstName, LastName, SSN, Email, DOB, Phone, UserPassword);
>>>>>>> origin/Sprint-2


	SET TempUserId = (SELECT  userid  FROM `ssdi`.`users` WHERE email = Email AND userid IS NOT NULL LIMIT 1);


	INSERT INTO `ssdi`.`address` (userid, line1, line2, city, zip, country)
	VALUES (TempUserId, AddressLine1, AddressLine2, City, Zip, Country);

END//
DELIMITER ;

<<<<<<< HEAD
DROP PROCEDURE IF EXISTS USP_BookingRegistration;
DELIMITER //
CREATE PROCEDURE USP_BookingRegistration(
=======

DROP PROCEDURE IF EXISTS USP_BookingRegistration;
DELIMITER //
CREATE PROCEDURE USP_BookingRegistration(
IN BID INT(11),
>>>>>>> origin/Sprint-2
IN LID INT(11),
IN SID INT(11),
IN FDate DATE,
IN FTime TIME,
IN TDate DATE,
IN TTime TIME,
IN UsrID INT(11)
)
BEGIN
<<<<<<< HEAD

DECLARE hours INT;

SET hours = (select TIMESTAMPDIFF(HOUR, TIMESTAMP(FDate, FTime),TIMESTAMP(TDate, TTime)) from dual);

	INSERT INTO `ssdi`.`booking`(LotID, SlotID, From_Date, From_Time, To_Date, To_Time, UserID, Cost)  
	VALUES(LID, SID, FDate, FTime, TDate, TTime, UsrID, hours*5 );


END//
DELIMITER ;
=======
DECLARE TempUserId INT;
	INSERT INTO `ssdi`.`booking`(BookingID, LotID, SlotID, From_Date, From_Time, To_Date, To_Time, UserID)  
	VALUES(BID, LID, SID, FDate, FTime, TDate, TTime, UsrID);
END//
DELIMITER ;

>>>>>>> origin/Sprint-2
