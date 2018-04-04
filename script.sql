Create SCHEMA php_project AUTHORIZATION postgres;

set search_path="php_project";

CREATE TABLE Rater
(
	userID SERIAL primary key,
	emailAddress varchar(64),
	firstName varchar(16),
	lastName varchar(16),
	joinDate DATE,
	userType varchar(16),
	reputation varchar(1),
	password varchar(256),
	username varchar(16)
);

CREATE TABLE Rating
(
	userID BIGINT NOT NULL,
	ratingDate DATE,
	price INT,
	food varchar(1),
	mood varchar(1),
	staff varchar(1),
	comments varchar(420),
	restaurantID varchar(16),
	Primary key(userID, ratingDate)
);

CREATE TABLE Restaurant
(
	restaurantID SERIAL PRIMARY KEY,
	restaurantName varchar(16),
	restaurantType varchar(16),
	restaurantWebsite varchar(20)
);

CREATE TABLE MenuItem
(
	itemID SERIAL PRIMARY key,
	itemName varchar(32),
	itemType varchar(32),
	itemCategory varchar(32),
	itemDescription varchar(32),
	itemPrice INT,
	restaurantID BIGINT NOT NULL
);

CREATE TABLE RatingItem
(
	userID BIGINT NOT NULL,
	ratingDate DATE,
	itemID BIGINT NOT NULL,
	rating varchar(1),
	ratingComment varchar(420)
);