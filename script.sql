Create SCHEMA php_project AUTHORIZATION postgres;

set search_path="php_project";

CREATE TABLE Rater
(
	userID SERIAL primary key,
	emailAddress varchar(64),
	firstName varchar(32),
	lastName varchar(32),
	joinDate DATE,
	userType varchar(32),
	reputation varchar(1),
	password varchar(256),
	username varchar(32)
);

CREATE TABLE Rating
(
	userID BIGINT NOT NULL,
	ratingDate DATE,
	price INT,
	food INT NOT NULL,
	mood INT NOT NULL,
	staff INT NOT NULL,
	comments varchar(420),
	restaurantID BIGINT NOT NULL,
	Primary key(userID, ratingDate)
);

CREATE TABLE Restaurant
(
	restaurantID SERIAL PRIMARY KEY,
	restaurantName varchar(128),
	restaurantType varchar(32),
	restaurantWebsite varchar(64)
);

CREATE TABLE Location 
(
	locationID SERIAL PRIMARY KEY,
	firstOpenDate DATE,
	managerName varchar(64),
	phoneNumber varchar(32),
	streetAddress varchar(256),
	openingHour varchar(2),
	closingHour varchar(2),
	restaurantID BIGINT NOT NULL
);

CREATE TABLE MenuItem
(
	itemID SERIAL PRIMARY key,
	itemName varchar(64),
	itemType varchar(64),
	itemCategory varchar(64),
	itemDescription varchar(256),
	itemPrice INT,
	restaurantID BIGINT NOT NULL
);

CREATE TABLE RatingItem
(
	userID BIGINT NOT NULL,
	ratingDate DATE,
	itemID BIGINT NOT NULL,
	rating varchar(1),
	ratingComment varchar(1000)
);

--Inserting into tables

--Inserting into Raters, 20 raters inserted

INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('admin@gmail.com','God', 'IsMe', CURRENT_DATE,'God', '0', 'password', 'admin');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('nominator@gmail.com','Hannah', 'Montanna', CURRENT_DATE,'Food Critic', '0', 'password', 'nominator');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('miyenho@gmail.com','Miyen', 'Ho', CURRENT_DATE,'Food Critic', '0', 'password', 'miyen_ho');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('jessica@gmail.com','Jess', 'Ica', CURRENT_DATE,'Food Critic', '0', 'password', 'jhess');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('stephaniewhite@gmail.com','Stephanie', 'White', CURRENT_DATE,'Food Critic', '0', 'password', 'stephanie_white');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('stephnien@gmail.com','Steph', 'Nien', CURRENT_DATE,'Food Critic', '0', 'password', 'step9h');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('maimuna@gmail.com','May', 'Muna', CURRENT_DATE,'Food Critic', '0', 'password', 'maimuna');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('eatingcanada@gmail.com','Eating', 'Canada', CURRENT_DATE,'Blog', '0', 'password', 'eating_Canada');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('genevieve@gmail.com','Genevieve', ' Charest', CURRENT_DATE,'Blog', '0', 'password', 'genevieve_Charest');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('chief@gmail.com','Chief', 'Trump', CURRENT_DATE,'Blog', '0', 'password', 'chief');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('michel@gmail.com','Michel', 'Steven', CURRENT_DATE,'Blog', '0', 'password', 'foodislove');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('eclarke@gmail.com','Emilia', 'Clarke', CURRENT_DATE,'Blog', '0', 'password', 'mrsFoodie');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('hangtun@gmail.com','Hang', 'On', CURRENT_DATE,'Blog', '0', 'password', 'hang_t');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('pollock@gmail.com','Aly', 'Pollock', CURRENT_DATE,'Online', '0', 'password', 'alp');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('jmichael@gmail.com','Joey', 'Michaels', CURRENT_DATE,'Online', '0', 'password', 'jm');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('crica@gmail.com','Costa', 'Rica', CURRENT_DATE,'Online', '0', 'password', 'costa');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('flavours@gmail.com','Fla', 'Voury', CURRENT_DATE,'Online', '0', 'password', 'flavoury');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('succer@gmail.com','Succ', 'Xd', CURRENT_DATE,'Online', '0', 'password', 'suxors');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('eva@gmail.com','Eva', 'Evening', CURRENT_DATE,'Online', '0', 'password', 'Eva');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('seriousfoodie@gmail.com','Serious', 'Foodie', CURRENT_DATE,'Food Critic', '0', 'password', 'serious_foodie');


--Inserting into Restaurant, 15 restaurnts inserted

INSERT INTO Restaurant(restaurantname,restauranttype,restaurantwebsite) VALUES ('Art Is In Bakery','Sandwich, Bakery', 'http://www.artisinbakery.com/');

--INSERT INTO Restaurant(restaurantname,restauranttype,restaurantwebsite) VALUES ('Art Is In Bakery','Sandwich, Bakery', 'http://www.artisinbakery.com/');
--INSERT INTO Restaurant(restaurantname,restauranttype,restaurantwebsite) VALUES ('Art Is In Bakery','Sandwich, Bakery', 'http://www.artisinbakery.com/');
--INSERT INTO Restaurant(restaurantname,restauranttype,restaurantwebsite) VALUES ('Art Is In Bakery','Sandwich, Bakery', 'http://www.artisinbakery.com/');
--INSERT INTO Restaurant(restaurantname,restauranttype,restaurantwebsite) VALUES ('Art Is In Bakery','Sandwich, Bakery', 'http://www.artisinbakery.com/');
--INSERT INTO Restaurant(restaurantname,restauranttype,restaurantwebsite) VALUES ('Art Is In Bakery','Sandwich, Bakery', 'http://www.artisinbakery.com/');
--INSERT INTO Restaurant(restaurantname,restauranttype,restaurantwebsite) VALUES ('Art Is In Bakery','Sandwich, Bakery', 'http://www.artisinbakery.com/');
--INSERT INTO Restaurant(restaurantname,restauranttype,restaurantwebsite) VALUES ('Art Is In Bakery','Sandwich, Bakery', 'http://www.artisinbakery.com/');
--INSERT INTO Restaurant(restaurantname,restauranttype,restaurantwebsite) VALUES ('Art Is In Bakery','Sandwich, Bakery', 'http://www.artisinbakery.com/');
--INSERT INTO Restaurant(restaurantname,restauranttype,restaurantwebsite) VALUES ('Art Is In Bakery','Sandwich, Bakery', 'http://www.artisinbakery.com/');
--INSERT INTO Restaurant(restaurantname,restauranttype,restaurantwebsite) VALUES ('Art Is In Bakery','Sandwich, Bakery', 'http://www.artisinbakery.com/');
--INSERT INTO Restaurant(restaurantname,restauranttype,restaurantwebsite) VALUES ('Art Is In Bakery','Sandwich, Bakery', 'http://www.artisinbakery.com/');
--INSERT INTO Restaurant(restaurantname,restauranttype,restaurantwebsite) VALUES ('Art Is In Bakery','Sandwich, Bakery', 'http://www.artisinbakery.com/');
--INSERT INTO Restaurant(restaurantname,restauranttype,restaurantwebsite) VALUES ('Art Is In Bakery','Sandwich, Bakery', 'http://www.artisinbakery.com/');
--INSERT INTO Restaurant(restaurantname,restauranttype,restaurantwebsite) VALUES ('Art Is In Bakery','Sandwich, Bakery', 'http://www.artisinbakery.com/');

--Inserting into Rating, 150 ratings inserted each restaurant 10 ratings








