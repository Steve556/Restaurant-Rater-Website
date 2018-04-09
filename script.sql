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
	ratingid SERIAL primary key,
	userID BIGINT NOT NULL,
	ratingDate DATE,
	price INT,
	food INT NOT NULL,
	mood INT NOT NULL,
	staff INT NOT NULL,
	comments varchar(420),
	restaurantID BIGINT NOT NULL,
	FOREIGN KEY (userID) REFERENCES Rater(userID)
);

CREATE TABLE Restaurant
(
	restaurantID SERIAL PRIMARY KEY,
	restaurantName varchar(128),
	restaurantType varchar(32),
	restaurantWebsite varchar(128)
);

CREATE TABLE Location 
(
	locationID SERIAL PRIMARY KEY,
	firstOpenDate DATE,
	managerName varchar(128),
	phoneNumber varchar(32),
	streetAddress varchar(256),
	openingHour varchar(10),
	closingHour varchar(10),
	restaurantID BIGINT NOT NULL
);

CREATE TABLE MenuItem
(
	itemID SERIAL PRIMARY key,
	itemName varchar(128),
	itemType varchar(64),
	itemCategory varchar(64),
	itemDescription varchar(420),
	itemPrice NUMERIC,
	restaurantID BIGINT NOT NULL
);

CREATE TABLE RatingItem
(
	ratingid SERIAL PRIMARY KEY,
	userID BIGINT NOT NULL,
	ratingDate DATE,
	itemID BIGINT NOT NULL,
	rating varchar(1),
	ratingComment varchar(1000),
	FOREIGN KEY (userID) REFERENCES Rater(userid),
	FOREIGN KEY (itemid) REFERENCES MenuItem(itemid)
);

--Inserting into tables

--Inserting into Raters, 20 raters inserted

INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('admin@gmail.com','Admin', 'Admin', CURRENT_DATE,'Admin', '0', 'password', 'admin');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('nominator@gmail.com','Hannah', 'Montanna', CURRENT_DATE,'Food Critic', '0', 'password', 'nominator');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('miyenho@gmail.com','Miyen', 'Ho', CURRENT_DATE,'Food Critic', '0', 'password', 'miyen_ho');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('jessica@gmail.com','Jess', 'Ica', CURRENT_DATE,'Food Critic', '0', 'password', 'jhess');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('stephaniewhite@gmail.com','Stephanie', 'White', CURRENT_DATE,'Food Critic', '0', 'password', 'stephanie_white');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('stephnien@gmail.com','Steph', 'Nien', CURRENT_DATE,'Food Critic', '0', 'password', 'step9h');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('maimuna@gmail.com','May', 'Muna', CURRENT_DATE,'Food Critic', '0', 'password', 'maimuna');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('eatingcanada@gmail.com','Eating', 'Canada', CURRENT_DATE,'Blog', '0', 'password', 'eating_Canada');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('genevieve@gmail.com','Genevieve', ' Charest', CURRENT_DATE,'Blog', '0', 'password', 'genevieve_Charest');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('chief@gmail.com','Chief', 'Trump', CURRENT_DATE,'Blog', '0', 'password', 'chief');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('michel@gmail.com','John', 'Steven', CURRENT_DATE,'Blog', '0', 'password', 'foodislove');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('eclarke@gmail.com','Emilia', 'Clarke', CURRENT_DATE,'Blog', '0', 'password', 'mrsFoodie');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('hangtun@gmail.com','Hang', 'On', CURRENT_DATE,'Blog', '0', 'password', 'hang_t');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('pollock@gmail.com','Aly', 'Pollock', CURRENT_DATE,'Online', '0', 'password', 'alp');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('jmichael@gmail.com','Joey', 'Michaels', CURRENT_DATE,'Online', '0', 'password', 'jm');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('crica@gmail.com','Costa', 'Rica', CURRENT_DATE,'Online', '0', 'password', 'costa');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('flavours@gmail.com','Fla', 'Voury', CURRENT_DATE,'Online', '0', 'password', 'flavoury');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('succer@gmail.com','Succ', 'Xd', CURRENT_DATE,'Online', '0', 'password', 'suxors');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('eva@gmail.com','Eva', 'Evening', CURRENT_DATE,'Online', '0', 'password', 'Eva');
INSERT INTO Rater(emailaddress,firstname,lastname,joindate,usertype,reputation,password,username) VALUES ('seriousfoodie@gmail.com','Serious', 'Foodie', CURRENT_DATE,'Food Critic', '0', 'password', 'serious_foodie');

--Inserting into Restaurant, 15 restaurants inserted

INSERT INTO Restaurant(restaurantname,restauranttype,restaurantwebsite) VALUES ('Art Is In Bakery','Italian', 'http://www.artisinbakery.com/');
INSERT INTO Restaurant(restaurantname,restauranttype,restaurantwebsite) VALUES ('El Camino','Mexican', 'http://www.eatelcamino.com/');
INSERT INTO Restaurant(restaurantname,restauranttype,restaurantwebsite) VALUES ('Allium','Canadian', 'http://www.alliumrestaurant.com/');
INSERT INTO Restaurant(restaurantname,restauranttype,restaurantwebsite) VALUES ('SuzyQ','Canadian', 'https://suzyq.ca/');
INSERT INTO Restaurant(restaurantname,restauranttype,restaurantwebsite) VALUES ('Elgin Street Diner','American', 'N/A');
INSERT INTO Restaurant(restaurantname,restauranttype,restaurantwebsite) VALUES ('The Smoque Shack','American', 'http://smoqueshack.com/');
INSERT INTO Restaurant(restaurantname,restauranttype,restaurantwebsite) VALUES ('Whalesbone Oyster House','Canadian', 'https://thewhalesbone.com/');
INSERT INTO Restaurant(restaurantname,restauranttype,restaurantwebsite) VALUES ('Play Food & Wine','French', 'N/A');
INSERT INTO Restaurant(restaurantname,restauranttype,restaurantwebsite) VALUES ('Union Local 613','Canadian', 'http://www.union613.ca/');
INSERT INTO Restaurant(restaurantname,restauranttype,restaurantwebsite) VALUES ('Hintonburger','American', 'N/A');
INSERT INTO Restaurant(restaurantname,restauranttype,restaurantwebsite) VALUES ('Town','Italian', 'http://townlovesyou.ca/');
INSERT INTO Restaurant(restaurantname,restauranttype,restaurantwebsite) VALUES ('Baker Street Cafe','Canadian', 'N/A');
INSERT INTO Restaurant(restaurantname,restauranttype,restaurantwebsite) VALUES ('Chez Lucien','Canadian', 'N/A');
INSERT INTO Restaurant(restaurantname,restauranttype,restaurantwebsite) VALUES ('The Manx','American', 'http://manxpub.com/');
INSERT INTO Restaurant(restaurantname,restauranttype,restaurantwebsite) VALUES ('Stoneface Dollys','Canadian', 'N/A');

--Inserting into Rating, 150 ratings inserted each restaurant 10 ratings

INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (1 , CURRENT_DATE, 4, 4, 4, 4, 'Their pastries are massively overrated however and I wouldn''t bother buying any again. We got a variety of them to take home and nothing was memorable. It didn''t feel worth the calories to finish eating the cronuts. Suzy Q still rules the ring-ed pastry scene in my books.', 1);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (1 , CURRENT_DATE, 4, 3, 5, 4, 'The server was quite helpful in his recommendations and explanations, as I wasn''t sure what to order, or how much to order. 3 was a good number for one person, I feel, as the portions aren''t huge, and the tacos themselves are fairly pricey. But I did find the quality and service warranted it. Overall, I''d go back for sure. Just be aware the portions aren''t huge for the amount you''re paying.', 2);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (1 , CURRENT_DATE, 3, 2, 5, 1, 'The surprise appetizer turned out to be a Tuna Tataki. It was artfully assembled with so many intricate details and ingredients all over the platter. It was like a forest with the herbs and greens. The server described every single item for us on the platter, but I definitely didn’t take it all down to memory. ...', 3);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (1 , CURRENT_DATE, 1, 3, 5, 2, 'Probably one of my fav donut places here in ottawa! I’ve only been here twice. And I’ve tried the maple bacon donut, and recently had the mocha fudge donut. The mocha fudge donut was delicious 😍😍😍 and only paid $3 including tax. Everything is freshly made in house and would love to come here more often for sure.', 4);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (1 , CURRENT_DATE, 3, 4, 5, 2, 'It is one of the the “go to” places for a meal in Ottawa. Their Poutine and burgers are fantastic. Very very good service. The dessert spread is a must try. The fact that it is open all day is just the cherry on the cake. Very well priced as well.', 5);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (1 , CURRENT_DATE, 5, 5, 4, 5, 'Love their cornbread, chicken, and mac n cheese. Their red meat isn''t amazing, but it''s still good and tastes great with their excellent sauces.', 6);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (1 , CURRENT_DATE, 3, 3, 3, 4, ' I have been to the Whalesbone in the past few years for lunch at least 6 times, had a good experience each time.', 7);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (1 , CURRENT_DATE, 4, 4, 4, 4, 'C’est un bel endroit, bien situé. On était à l’étage. C’était bien de voir Sussex de là. Le service était bien. Je m’attendais à plus côté saveur. Certains plats étaient extrêmement salés. Je n’y retournerai pas.', 8);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (1 , CURRENT_DATE, 5, 3, 5, 5, 'Came to Union613 for the first time to host my fiancee''s surprise birthday party. Right off the bat they were friendly and accommodating for my reservation. The food was awesome (had the fried chicken and hanger) and their drinks menu had a lot of interesting variety. The service was the best I''ve ever had in Ottawa, which really impressed me since it was such a busy restaurant...', 9);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (1 , CURRENT_DATE, 1, 4, 5, 2, 'Summery place for sure, went here in the summer with a friend of mine and we sat outside! The burgers were good, a little over rated but pretty tasty and filling! Overall quick service and friendly service. I’d come here again for sure', 10);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (2 , CURRENT_DATE, 4, 4, 4, 4, 'Excellent food and service. Each item we ordered was delicious and fresh. Highly recommend the smoked trout deviled eggs and the eggplant lasagna.', 11);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (2 , CURRENT_DATE, 4, 5, 5, 4, 'What a great place to have breakfast. The portions are huge and the food quality amazing. They also have some pretty innovative stuff. The staff and owner are super friendly and the atmosphere is really cool. A must if you are in the Ottawa region.', 12);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (2 , CURRENT_DATE, 3, 3, 3, 3, 'For the extremely high rating on Zomato, the food was disappointing. My friend and I ordered the brie phyllo pastry starter that barely had any Brie. We were looking forward to the burgers and those were aggressively average. Sorry.', 13);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (2 , CURRENT_DATE, 2, 2, 2, 2, 'I like this place. Quaint little bar with great food and beer selection. No TVs, not a typical restaurant, just a bar with good food and drink. A very hipster little place with wholesome comfort food. Had the duck legs and my wife had a burger and wedges, both very good. Check it out!', 14);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (2 , CURRENT_DATE, 1, 1, 1, 1, 'Came here for breakfast. We were a big group, and everyone enjoyed their food! I had the poached egg with salmon and their hollandaise sauce! Overall the food was great, but it’s extremely heavy, so you’ll definitely be full for atleast half the day! Also their iced coffee was exceptional!', 15);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (2 , CURRENT_DATE, 4, 4, 3, 5, ' I''ve come here for lunch many times, and their options have never ceased to impress me. My favourite combination is the Roast Beef 1/2 sandwich with the clam chowder, both of which are flavourful and delicious. The service can sometimes become slow, particularly when it''s busy (during lunch hours), but the place still remains relatively clean and it is clear that the staff are working hard.', 1);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (2 , CURRENT_DATE, 4, 4, 4, 4, 'The place is really busy. Wait time is about 30-40mins. And then more waiting once you''re seated for food. But the wait is worth to! Amazing drinks and amazing tacos! Have tried the beef, deep fried fish, pork, ox, fish tar tar... and the most memorable and delicious was the ox taco!', 2);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (2 , CURRENT_DATE, 3, 3, 3, 4, 'Great cocktails and super appetizers. Mushroom toast was amazing as was the duck entree. Ambience is nice. Wine list good too. Monday tapas are good idea although not best night to go out for many people - they need to pump up special weekend events.', 3);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (2 , CURRENT_DATE, 4, 2, 2, 4, 'These are probably the best donuts in Ottawa. Every single flavor is delicious and they also look really nice (my personal favorites are the cookies and cream and the froot loop ones). The location is a bit out of the way, but in itself is nice. It''s a bit small, but definitely has a cozy cafe feel. The prices are a bit high, but definitely feel worth it after eating one and you get a discount when you buy more.', 4);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (2 , CURRENT_DATE, 4, 1, 5, 4, ' Pretty great diner, good atmosphere, friendly and attentive staff. The food is alright, pretty average diner fair and the portions are really great (I don''t think I''ve been able to finish my food any of the times I''ve gone). It''s really great for a late night or early morning snack, but not someplace I''d personally go out of my way for.', 5);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (3 , CURRENT_DATE, 1, 2, 4, 3, 'This restaurant was shown on the tv show ''You Gotta Eat Here'' and we (9 in total) went based on a suggestion from a person we were travelling with. #BelieveTheHype and visit this place, #Endorsed! ', 6);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (3 , CURRENT_DATE, 1, 2, 3, 4, 'What can I say that already hasn''t been said? This is one of Ottawa''s best restaurants not only when it comes to seafood, but when it comes to a restaurant concept and presentation. A small restaurant that has managed to stand out in the crowd because of its excellent food and signature oyster dishes.', 7);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (3 , CURRENT_DATE, 3, 1, 4, 4, 'Worst meal I have had in a long time. I was visiting from Vancouver and this place was recommended. I had 2 plates- mussels and gnocchi. The mussels were served in a lukewarm soupy tasteless broth. The gnocchi were tasteless soggy pillows sitting amidst undercooked vegetables in a really nasty broth. The restaurant should have been ashamed to serve this meal and I will not be returning.', 8);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (3 , CURRENT_DATE, 5, 4, 4, 5, 'We attended Union after my sister''s wedding ceremony, and couldn''t be happier with the food or hospitality. Our waitress (April) was congratulatory, warm, and adaptable. She treated our party to champagne, and placed my sister''s bouquet in water without being asked. The food was delicious all around, but I most enjoyed my bourbon lemonade....', 9);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (3 , CURRENT_DATE, 1, 2, 2, 1, ' I had high hopes since there used to be line-ups for this place but I was a little disappointed;I won''t lie. My friends were just as disappointing. One thing that I did like was that the hamburger patty had flavour unlike most burger joints.', 10);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (3 , CURRENT_DATE, 3, 4, 4, 3, 'Delicious food!! Excellent service. Great ambiance. The only reason I didn''t give a 5 is because the music was very loud leading people to talk louder.I definitely recommend the place!!', 11);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (3 , CURRENT_DATE, 5, 3, 4, 1, 'Came at 0830 no line up. Staff were really friendly, personable, and funny. Great service! They left a pot of coffee for me on the table so I could drink as much as I want which is a good idea. The food was AMAZING, huge portions. The potatoes were really good and the toast is homemade. They should go the next step though and have homemade jam too, that goes perfectly with homemade toast.', 12);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (3 , CURRENT_DATE, 5, 4, 3, 2, 'I visited this restaurant on recommendations from and almost insistence from a family member. She said if you want a good burger you have to try this place. So we each ordered burgers and i have to say we were both slightly disappointed with the burgers and the fries were underwhelming as well. I do realize that we are definitely...', 13);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (3 , CURRENT_DATE, 1, 4, 4, 5, 'The Manx never disappoints. Had the eggs benedict and a coffee (Sunday brunch). The freshly baked biscuit and lightly seasoned hollandaise sauce we an excellent twist on an old favourite.', 14);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (3 , CURRENT_DATE, 5, 1, 4, 4, 'Great food, friendly environment, at a reasonable price and fast service. The service and Environnement was very friendly. Better than expected.', 15);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (4 , CURRENT_DATE, 4, 4, 4, 4, 'Is always good. Bread can hurt the roof top of your mouth sometimes but so worth it. There is always something to order there. Big line ups though. And the birds flying around can freak you out.', 1);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (4 , CURRENT_DATE, 5, 4, 5, 5, 'I am going to say that El Camino was most definitely delicious. I had the mango salad and eggplant taco. And the guests at my table had a verity of other things. And everything was very tasty but I can not and will not justify returning because the cost of it all was just out of this world. And quite honestly we all left feeling hungry.', 2);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (4 , CURRENT_DATE, 1, 4, 3, 4, 'If i could give our Monday night Tapas meal a 6 out of 5, i would! My wife and i have been waiting years to go try Monday night Tapas. We''re exhausted Monday nights, so it hasn''t happened. We finally did, and WOW! Every dish dish was amazing (had 4 or 5).', 3);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (4 , CURRENT_DATE, 4, 4, 4, 4, 'Delicious home made doughnuts. The only reason why I''m not giving it a 5 is because it is always super busy and usually runs out of the kind of donut I want before I get to the cash, a little disappointed but they are delicious!', 4);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (4 , CURRENT_DATE, 3, 3, 3, 3, 'My wife and I moved out of downtown Ottawa a few years back-- ESD was a place we frequented regularly. We were downtown tonight and decided to place a take out order--two chicken Caesar salads and a piece of chocolate layer cake. This was my treat meal for the week....', 5);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (4 , CURRENT_DATE, 1, 3, 5, 2, 'Stopped by for dinner and the food was delicious. I really enjoyed the "smoqued" corn bread and the macaroni and cheese was super good. Highly recommend for some comfort homemade food.', 6);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (4 , CURRENT_DATE, 4, 4, 4, 4, ' I came here for my birthday and I definitely would do it again. Everything is so fresh in this restaurant. The oysters were very clean and fresh and the main courses were great too. We ordered a variety of things and all tasty.', 7);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (4 , CURRENT_DATE, 3, 3, 3, 3, 'We went here not knowing what to expect. It was pretty good, the service was excellent. The mains were actually quite good but we were a little disappointed with the desserts. It was somewhat pricy. Not sure if we’ll go back but happy that we tried it at least once.', 8);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (4 , CURRENT_DATE, 4, 3, 5, 4, 'It was decent', 9);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (4 , CURRENT_DATE, 4, 4, 4, 4, 'Hintonburger used to be the best burger joint in Ottawa. The key word here is "used to". Not anymore. It is now definitely one of the worst. I went today to the new location for the first time and had a terrible experience. I will not be returning. First of all, the meat was bland and dry. The fries were greasy and unsalted.', 10);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (5 , CURRENT_DATE, 3, 3, 3, 3, 'Fabulous place! We have been there several times. The food has always proven to be delicious, well presented and very fresh! Even providing vegetarian options.', 11);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (5 , CURRENT_DATE, 5, 4, 5, 4, 'Delicious meals prepared in an open kitchen restaurant with delicious vegetarian food options. Great music, nice staff, a variety of seating options, the hours of operation run from 7:30am to 3pm - a bit of line up to get it but it''s totally worth it.', 12);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (5 , CURRENT_DATE, 4, 4, 4, 4, ' Large work affair. Burgers are astounding, albeit a tad greasy. Great burger fixings. Chicken breasts were hard and not tender with adequate seasoning.', 13);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (5 , CURRENT_DATE, 3, 3, 3, 3, ' Favourite restaurant in Ottawa. Simple menu but always really good, great beer selection as well. I hate myself for getting the burger most times that i go but it''s so good i can''t help myself. Lamb curry wrap and pulled pork are also great and my wife loves the chickpea burger', 14);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (5 , CURRENT_DATE, 1, 1, 1, 1, 'Highly recommend this cute little restaurant! Our server was so kind and got our group of 4 in right away even though the place was packed. Pictured are the limited edition omelette with Brie and the Big Breakfast. Our food came out fast from the kitchen on a very busy Saturday morning!', 15);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (5 , CURRENT_DATE, 5, 2, 3, 4, 'Go try a cronut (a mix between a donut and a croissant) and the outstanding bread. I''m a huge fan of the roasted garlic and rosemary sourdough bed and love to get it to go. Be warned it gets very crowded here for brunch, so while they are fast to serve seats can be hard to find at peak hours. ', 1);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (5 , CURRENT_DATE, 1, 4, 4, 3, 'I have been many times to your establishment but obviously you have made a hiring error. When your clients are sitting there waiting for 50min even though a party seating only 2 changes table but then you still don''t offer us the table as we were next on the list. A friend of the bartender comes in a few hand shakes a quick talk to you hostess which refused....', 2);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (5 , CURRENT_DATE, 4, 4, 4, 4, 'The food here is BEAUTIFUL - I don''t know how else to describe it. Presentation is top notch, and so is quality. I had the mushrooms on toast - seems simple, but it''s the most delightful appetizer that could easily be a brunch item, since it''s topped with a poached egg....', 3);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (5 , CURRENT_DATE, 4, 4, 5, 4, 'As a Montrealer, I''m spoiled with access to excellent cuisine, kitschy joints & Instagram-worthy bites at all times. But that doesn''t mean that I don''t enjoy dining in our neighbouring province! I first discovered SuzyQ doughnuts on a birthday trip to Ottawa, planned by my boyfriend...', 4);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (5 , CURRENT_DATE, 1, 1, 1, 1, 'Ambiance is ok. Clean and well-maintained. Our server was not very friendly. The service was slow even though it was not so busy. It was not worth the wait. The food did not taste very good. It was my first and last time.', 5);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (6 , CURRENT_DATE, 3, 4, 5, 4, 'There''s just way too much hype for this place being featured on "You Gotta Eat Here." The restaurant wasn''t fully packed for an early late lunch for 4pm, but still waited an hour to be seated, and another hour for food. Ordered "Hold the Pork" sampler platter along with pulled chicken poutine... sauce was over powering. Chicken and brisket were dry, beef ribs were OK, I''ve had better for a better price....', 6);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (6 , CURRENT_DATE, 3, 4, 2, 4, 'Their Bank St. location is small, warm and cozy. It does get very crowded on a Friday night so be sure to make a reservation. They have a small but very diverse menu which gives a lot of options. Some of their appetizers are quite big and filling, like the mussel bowl I ordered. It was a delicious bowl of mussel, cooked with coconut milk and Thai flavours... ', 7);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (6 , CURRENT_DATE, 3, 4, 5, 2, ' Love their $22 lunch! Plates are tapas size and 2 plates should be filling enough. The halloumi and the grilled steak were delicious! Service is very friendly and attentive. We were a big group and I love that they accommodated for us to be at a table where you can see and talk to everyone (not one of those long tables where you can only talk to the people sitting next to you). ', 8);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (6 , CURRENT_DATE, 1, 4, 1, 4, 'Love this place. Awesome food, cocktails, vibe. One of my favourite spots in Centretown.You can''t go wrong with the fried chicken. Union613 serves up the best fried chicken in the city, in my opinion. I especially love the Thai chili-infused vinegar that comes with it, and am partial to the pinto beans as a side. Although I''m a big fan of the fried chicken...', 9);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (6 , CURRENT_DATE, 1, 2, 5, 3, 'Very yummy food, good quality.. But over priced: 18$ for combo #3 - burger and deep fried pickles. Happy i tried it, but Will not be returning due to price.', 10);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (6 , CURRENT_DATE, 3, 4, 3, 4, 'Town was a great place to drink wine and eat dishes prepared from fresh ingredients. The asparagus was perfectly cooked and the scallop crudo was light and tasty. It looked as though they make their pasta in house which was a treat! Would definitely go again!', 11);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (6 , CURRENT_DATE, 5, 4, 1, 4, 'Came here on a Saturday morning and this place was packed! The decor of the place had a ''British'' theme to it and quirky. We were in line for about 10 mins before we got a table. ', 12);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (6 , CURRENT_DATE, 4, 4, 4, 4, 'Awesome Chez Lucien burger and chicken burger. Both with the best fries we have best fries we have had in a while. Friendly, welcoming staff and warm atmosphere. Glad we came.', 13);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (6 , CURRENT_DATE, 5, 4, 5, 5, 'Great little hole in the wall. My husband and I had heard about this spot from a few people and it did not disappoint. We arrived for a late weekend brunch one afternoon and both had sandwiches. Prices are good. Tap selection good. Ambience good. Wait staff excellent. Most importantly the taste was delicious! Just like homemade, with excellent ingredients! We will return!', 14);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (6 , CURRENT_DATE, 2, 3, 4, 3, 'Been here for brunch. Great experience. Crowded because the restaurant is extremely popular for weekend brunch. Home made bread, fresh delicious eggs Benedict, gluten free tasty options. Coffee was excellent, I absolutely love the glass coffee mugs they serve it in. Always coming back to this spot', 15);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (7 , CURRENT_DATE, 2, 2, 2, 2, 'We ordered two orders of toast, and the avocado toast with the super salad... and that was over $26?!?! How is one entree and 4 pieces of toast $26?! I was shocked when we were paying. I stopped the girl and told her she must of made a mistake because it says the avocado toast is $14.95 (which is already really expensive for breakfast).', 1);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (7 , CURRENT_DATE, 3, 4, 5, 3, ' Nice, modern atmosphere and good tacos but not amazing enough to justify the price. It''s $6 for one taco - just one. They are a moderate size - not huge, but but not tiny either. I heard raves about the ox tongue, but I tried it and it was on the bland side and needed hot sauce and lime for sure (the hot sauce is very good by the way! It''s like a fresh salsa with a tang).', 2);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (7 , CURRENT_DATE, 4, 4, 5, 2, ' Went for tapas on a Monday night. Well worth a visit, as tapas is one night only. Excellent selection with regularly changing menu. Varied wine service with something for everyone. Will have to return on another day to experience the rest of their menu.', 3);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (7 , CURRENT_DATE, 3, 4, 3, 4, 'SuzyQ was delicious. They have unique donut flavours such as Maple Bacon, Lime Coconut and Spicy Pineapple creating a unique donut eating experience. The atmosphere was casual and inviting, and the service was friendly.', 4);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (7 , CURRENT_DATE, 5, 4, 4, 4, 'Having been to a few of Ottawa''s iconic restaurants this was one from the list. We were staying nearby and we had picked up kids from the airport and it was almost midnight and none of us had dinner and were hungry and tired. As this was close by we decided to cross this one off the list...', 5);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (7 , CURRENT_DATE, 3, 4, 3, 4, 'Went here for diner with my girlfriend. She had the spinach salad with steak. Steak was very chewy. I had the picnic plater. A bit overpriced in my opinion. The toilets were pretty dirty and the hallway to get them reeked of vomit, not even kidding.', 6);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (7 , CURRENT_DATE, 3, 3, 3, 3, 'We went to the Bank location. I found the restaurant way too expensive for the portions you get. They ran out of bread apparently the night we went!! I felt the restaurant had an ambiance of a college pub; as such, the noise level was too high, and the place was very tight and cramped. The prices were extravagant and did not match the quality of food or portions you get. Definitely will not be returning.', 7);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (7 , CURRENT_DATE, 3, 4, 5, 3, 'Establishment which is operated by experienced restauranteurs. Decor is unpretentious, standard but still welcoming. The open kitchen adds the "warmth" needed during the long cold Ottawa winters. The crowd is eclectic, which is what I prefer.', 8);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (7 , CURRENT_DATE, 4, 4, 4, 4, 'Great Ottawa "hipster" haunt. Was not aware they had a brunch. Unique and flavourful breakfast. Good service - lots of coffee top-ups. Very affordable for the high quality. About $20 for coffee and a meal. Not crowded at 10am on Saturday. In my top 5 for Ottawa brunches.', 9);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (7 , CURRENT_DATE, 4, 2, 2, 4, 'The most disgusting food I have ever eaten! Not only was the food garbage, it was very overpriced. If the food was ok, price would''ve been justifiable. It was NOT, the fries looked and tasted like it was made a week ago, with old oil, and left a terrible after taste. The burger, I wouldn''t feed to an animal, much less a human. How are they still allowed to serve food? Hintonburger is a disgrace...', 10);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (8 , CURRENT_DATE, 1, 1, 1, 1, 'Cozy and warm atmosphere. Small servings even for the large plates so a little pricey but every dish was excellent. Good service and knowledgeable staff.', 11);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (8 , CURRENT_DATE, 5, 4, 5, 3, 'The only downside to my visit to Baker Street was that there was a big line up to get in. Which actually speaks volumes about how amazing it is! Creative menu with large servings and sumptuous food... I''ll be back again soon!', 12);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (8 , CURRENT_DATE, 1, 1, 1, 4, 'A very busy day for Chez Lucien as "La Machine" was roaming through the market. Service was understandably slow. My chicken sandwich was accompanied by fries and a salad and was very average and a bit on the pricy side. Decor is boring and doesn''t offer much to draw me back for a 2nd try.', 13);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (8 , CURRENT_DATE, 4, 3, 5, 2, 'what can i say, it is always a nice intimate atmosphere. the food is always as great as the last time, and the staff are very personable. always a great treat.', 14);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (8 , CURRENT_DATE, 4, 4, 4, 4, 'I have never had a bad meal here; my husband and I eat brunch here about once a month and we love it! I would 100% recommend this restaurant!', 15);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (8 , CURRENT_DATE, 5, 4, 5, 5, 'I tried the big k burger. They told me it would be extravagant and like a Big Mac?? I tried it. Meat was very red. Undercooked in my opinion. The 1000 islands sauce was ok. Nothing great at all. For $15 go to five guys for a better cheeseburger. Burger was very messy too. Don''t recommend.', 1);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (8 , CURRENT_DATE, 3, 3, 3, 3, 'Fun, trendy place for tacos.  Tacos are definitely delicious, absolutely no complaints there.  But I''m not a fan of the food coming out in bits and pieces.  Our tacos came out whenever they were ready, and not all at once, so one person had one of their tacos, and then 15 minutes later, some more came out. It''s kind of like eating at a traditional Chinese restaurant when the food just comes out when it''s..', 2);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (8 , CURRENT_DATE, 2, 2, 5, 5, 'Came here on a Monday for tapas night. Ordered just about everything on the menu. Overall, great food, drinks and service. Came here with a party of 9 and food came out relatively fast about 15 mins. The drinks were a bit of a wait each time we ordered. Mac and cheese and the tart were a few favourites. Will definitely be back again.', 3);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (8 , CURRENT_DATE, 4, 4, 4, 4, 'My suggestion is try the Boston cream! All the donuts are incredible but the ones with fillings destroy any other donuts I''ve ever had. The cream filling isn''t so much filling as cream permeating pores throughout the donut. When you bite into it there is so much cream it spews out the back and front. Messy and beautiful! The new location is really cosy too.', 4);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (8 , CURRENT_DATE, 4, 3, 3, 4, 'Eggs Benedict were excellent. My friend had the Poutine breakfast which I tasted and I really liked their Poutine!!! The service was a tad slow but the place was fully packed. The servers were very nice. A real diner experience', 5);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (9 , CURRENT_DATE, 4, 3, 3, 4, 'This place wasn''t bad at all, but it also wasn''t spectacular.  I asked how large the small sized poutine was and the waitress mislead me.  I ended up getting the large as a result and it was WAY to much food for one human being (see photo).  The meat was good, but I have had much better at other bbq places. Service wasn''t terrible, but our table was. It was a really cool wooden table but it was unbearably....', 6);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (9 , CURRENT_DATE, 4, 3, 3, 4, 'Excellent service, food and ambiance. The interior is very cozy and rustic. The seafood was very fresh and super delicious. We had the banana cream pie for dessert and it was heavenly. Highly recommend!', 7);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (9 , CURRENT_DATE, 3, 4, 4, 3, 'Wonderful plates. Superb service. Knowledgeable staff. Great ambiance. We are looking forward to our return for more chacuterire and Quebec cheeses.', 8);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (9 , CURRENT_DATE, 2, 4, 5, 2, 'First time we came here and it was for brunch. The vibe here is really awesome. The food is fantastic. Highly recommend the chicken and waffles.', 9);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (9 , CURRENT_DATE, 3, 3, 3, 4, 'First time here and have to say that I definetly will be back if I have a burger crave and I''m in the area. Had to try the Hintonburger combo with a Dr pepper at the recommendation of a friend. The burger meat was juicy and tender. It had other ingredients aside from meat which was obvious from the appearance and taste but that didn''t take away from the overall burger quality...', 10);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (9 , CURRENT_DATE, 2, 1, 5, 3, 'I don''t mind spending money if the food , menu and presentations is upto mark.Food is good but not worth the bucks.Confusing menu and small servings are two of many irritating things.', 11);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (9 , CURRENT_DATE, 4, 3, 5, 3, 'This place actually EXCEEDS it''s reviews and ratings. Beyond fresh, fabulous flavours, exceptionally generous portions, pleasant and welcoming staff. Everyone at my table LOVED their breakfasts and we all ordered different plates: pancakes, French toast, omelette, ham & eggs, campfire eggs, and sausage & eggs. Congrats to the staff and management on a spectacular establishment- you all should be very PROUD!!!', 12);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (9 , CURRENT_DATE, 5, 4, 5, 5, 'Knowing the rating, I was still impressed by the Chez Lucien burger, the poutine, and the cheesecake. This has topped my favourite burger list.', 13);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (9 , CURRENT_DATE, 5, 2, 2, 5, 'Cozy spot on Elgin street. You have to go a little further to get here, but it''s worth the few extra blocks. It has the classic pub atmosphere - complete with books on the shelves. Great selection of beers and food was quite good as well. The bean dip was really good, but the crab cakes were what we found most delicious. Not your traditional pairing, but unique flavours make this dish...', 14);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (9 , CURRENT_DATE, 1, 1, 1, 1, 'Excellent service, friendly and quick. Excellent food. We were a group of 6 and all really enjoyed our experience. We would definitely go back.', 15);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (10 , CURRENT_DATE, 5, 3, 3, 2, 'Fast paced, buzzing atmosphere. Don''t be put off if the line is long or the place looks busy, line moves fast and food is delivered pretty quick as well.', 1);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (10 , CURRENT_DATE, 2, 4, 4, 2, ' Seriously love their Japanese eggplant taco!! Would highly recommend it to anyone! I always get it along with the Lamb taco. I have a habit if taking one bite with no additional sauces or self added topping just to get a good taste. And than I add on whichever sauce I''m feeling that day... usually the spicier the better.', 2);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (10 , CURRENT_DATE, 4, 4, 4, 4, ' I must say our experience was incredible! We started with the duck appetizer, which was delicious. We ordered the salmon and the catch of the day, pork with amazing vegetables and mashed potatoes. The salmon was really small, 2 inches long by 1 inch wide and 1 imch high, considering the plate cost 29$ but the plate was really good. ', 3);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (10 , CURRENT_DATE, 5, 2, 5, 5, 'Best donuts in town. They''re light and fluffy, and have creative flavours like maple bacon and London fog (an icing made from English tea). Great, friendly staff and owners.', 4);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (10 , CURRENT_DATE, 1, 1, 1, 1, 'Always good for a poutine or a nice milkshake. Great job guys! ', 5);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (10 , CURRENT_DATE, 3, 3, 3, 3, 'Love this place. Always head here for birthdays or when I''m in need of a good meat fix! Jerk pork, brisket, corn bread and mac are to die for!', 6);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (10 , CURRENT_DATE, 4, 4, 5, 5, 'Service was amazing and the food was excellent. What I didn''t like was the price vs the portions. I ordered the Cod and the size of fish was approx 2inches by on 1inch. Next was the glasses of wine. Minimum $12 for a 6oz... a bit too much. Would go back for a drink and some Oysters at the bar but wouldn''t go the wine or a meal.', 7);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (10 , CURRENT_DATE, 3, 4, 5, 3, 'The service was excellent, and the atmosphere was lovely. I really like the concept of ordering multiple little dishes as one meal. You get a nice variety of flavours, and the wine pairings are great!', 8);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (10 , CURRENT_DATE, 4, 4, 4, 4, 'The drinks are expensive but definitely worth it. They put a lot of effort and artistry into them. They tasted fabulous. The food was southern style when my friend and I went. Delicious. The atmosphere is laid back but absolutely charming. I''m definitely going back soon to try more drinks and food.', 9);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (10 , CURRENT_DATE, 3, 3, 3, 3, 'Way overrated. This is actually one of the worst burger spots in Ottawa guaranteed. I have been to Hintonburger five times and was disappointed all of the last four. My guests were also disappointed at the experience. The meat is bland and dry, the bun is cheap, and the toppings are average at best. At $14 for the double patty burger, it is also very overpriced for the quality of burger you get...', 10);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (11 , CURRENT_DATE, 5, 4, 5, 5, 'Great quality food. Way too small plate size. Confusing menu. Maybe great for some but not the place for me. Probably meant for really picky, fancy, eaters. Not Fun.', 11);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (11 , CURRENT_DATE, 2, 2, 2, 4, 'First experience there today; Great food, great place, great service! No complaints! Big portions so you pay for what you get. Nice cozy little place. I went for brunch with a friend on a Friday, early afternoon.. No line ups but still busy. Love the vibe there :) I will be back.', 12);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (11 , CURRENT_DATE, 4, 4, 4, 4, 'One of my favourite spots in Ottawa. In my opinion, the Chez Lucien burger with cream cheese and bacon is the best one around! Portions are big and prices are very reasonable.', 13);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (11 , CURRENT_DATE, 4, 4, 5, 4, 'Great food but slow service. We sat with empty beers for over 15 minutes before we got up and got the attention of our server. She was super nice but I watched her sit and socialize with her friends for a lot of our evening.. Not the smartest thing to do in a full pub. Food was excellent! Large portions and tasty. Would go back for the food but hesitant due to the service.', 14);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (11 , CURRENT_DATE, 3, 3, 3, 3, ' Great service, attentive staff. Eggs Benedict were different but very very good! I personally didn''t like the fried/mashed potato but that had no negative effect on my experience there. Very nice atmosphere too. I very much enjoyed and will go back.', 15);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (11 , CURRENT_DATE, 5, 4, 5, 5, 'Best brunch place I''ve been to in Ottawa so far! The food and pastries were amazing. We were five and everyone took something different on the menu and we were all really pleased. I think we''ll make a tradition of going!', 1);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (11 , CURRENT_DATE, 1, 4, 5, 4, 'Hands down the best place in Ottawa to get tacos but in general, my go-to spot. The food is always well crafted and meticulously taken care of and most of the time, the service is excellent. This place isn''t for everyone since the atmosphere is very laid back and the music is loud, but all in all, good times are likely to ensue if you take the stick out of your ass. I will always miss the coconut cream pie..❤️', 2);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (11 , CURRENT_DATE, 1, 4, 4, 1, 'My favorite overall experience in Ottawa. Great food, drinks, dessert, and service. It is a regular spot for us! Oh and get the banoffee pie!', 3);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (11 , CURRENT_DATE, 1, 1, 1, 1, 'There is a reason this donut shop is so popular, the donuts are super delicious and there is a variety of fun innovate flavors along with classics flavors you would expect too. ', 4);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (11 , CURRENT_DATE, 2, 2, 2, 2, 'An Ottawa staple. Elgin Street never disappoints at 2am! Hobble your way over after a few pints. Don''t be surprised to wait in line (it moves fast though!).', 5);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (12 , CURRENT_DATE, 4, 4, 5, 3, 'After having BBQ in Georgia, I find it impossible to find good BBQ in Ottawa or even in Canada for that matter. Once you taste the real deal, anything else will disappoint....', 6);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (12 , CURRENT_DATE, 4, 4, 4, 4, 'The new location is great, everything is wonderfully laid out and it is very enjoyable. The food was prepared to perfection and everyone enjoyed their choices. The staff are friendly and very helpful. The only down side is the noise level. The restaurant was not full but we had a hard time to hear each other in our party of 5', 7);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (12 , CURRENT_DATE, 1, 1, 1, 1, 'Went here for dinner on Saturday. Great selection of interesting plates, attentive & friendly staff. Great food and wine parings!! I''ll be going back!', 8);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (12 , CURRENT_DATE, 4, 4, 4, 4, 'Awesome restaurant and bar, with chic clientele, and attentive and knowledgeable wait and bar staff. Food is southern with a twist, with something for all palates. Complimentary app is steamed peanuts. I keep meaning to change my choice, but I always have the fried chicken with cornbread each time I go. The deviled eggs are positively amazing -- and a unique recipe. Worth a try, and if you are generous...', 9);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (12 , CURRENT_DATE, 4, 4, 5, 4, '$32 for 2 burger combos (Hintonburger and Wellington). Meat patties were pink in the middle - not my preference but would have liked to have been asked if I wanted my burger patty less than well done.', 10);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (12 , CURRENT_DATE, 1, 4, 4, 1, 'Sat at the bar and ordered the fried eggplant and stuffed meatballs... While both were good, there was nothing about them that warranted their price tag. My drink was also overpriced for what it was. The atmosphere was cozy. Overall, I would not recommend.', 11);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (12 , CURRENT_DATE, 2, 3, 3, 2, 'The food is decent...definitely does not live up to all the praise around it. Service was also mediocre and quite slow both of the times I''ve been there but not a huge deal. Overall a meh experience; it is worth trying though.', 12);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (12 , CURRENT_DATE, 3, 2, 2, 3, ' Lucien is like a hole in the wall. Once you open the door you discover a delightful little gastro pub. Chez Lucien is alway full and buzzing. The menu is limited but you can find a mean burger and mussels. My favorite remains by far the croque monsieur. Happy to have found this non-pretentious little gem.', 13);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (12 , CURRENT_DATE, 4, 4, 4, 4, 'Completely conducive to a fun night. Cheers for the management. Love the place. I love the fact that it''s very non-haus khazish. Awesome. Thumbs up!', 14);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (12 , CURRENT_DATE, 5, 2, 2, 5, 'Decent place for brunch but gets packed very fast on the weekends. The food is good but not good enough to have to wait so long for a table. The prices are on the higher side for what you''re getting.', 15);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (13 , CURRENT_DATE, 4, 4, 4, 4, 'Very impressed with the quality of the food. The service was fast and friendly. The only complaint I have is the prices. Otherwise, highly recommend the vegetarian squash sandwich and the brownies.', 1);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (13 , CURRENT_DATE, 3, 4, 4, 3, 'Easily one of my favourite places in the city. The wait can be long depending on when you go, but the tacos are worth it. There''s even a window in case you want to enjoy your food outside. Staff is friendly and attentive, but not overbearing. Usually loud due to how busy it is but personally don''t mind. Recommend the prawn in betel leaf and fish taco.', 2);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (13 , CURRENT_DATE, 5, 3, 4, 5, 'Okay so the rest of the menu is good too. The Tartare was boom, visually beautiful with delicious fois mousse and home made chips. We really enjoyed the pork loin which was hearty like comfort food. The bacon mushroom jam paired well with the juicy pork loin over creamy mash. The cider vinegar really brighten up the dish. ', 3);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (13 , CURRENT_DATE, 5, 4, 2, 3, 'Had my first donut from SuzyQ today. Walked for about half an hour in the snow to get here and I can honestly say it was worth it. The shop itself is very nice and clean and the donuts are all laid out for easy viewing. I had the mocha goat cheese truffle donut and it was amazing. The donut was 3$ which was a decent price. Cutlery and water were provided and easy to find. Bathrooms were spacious...', 4);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (13 , CURRENT_DATE, 5, 2, 3, 4, 'Good comfort food. Almost everything we have ordered has been good from salads, desserts, breakfasts and main courses. If you are looking for a good meal, with in our experiences good friendly staff , you won''t be dissapointed. The rice pudding is amazing and huge!!!', 5);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (13 , CURRENT_DATE, 1, 4, 3, 4, 'Excellent food and people. Really loved the Mac and Cheese and Corn Bread with the jalapeño butter. I had the Pulled Pork which was great and girlfriend had the Steak Salad which she really loved . Definitely will be back. Great local craft beer selection. It''s really nice to see people who actually support the smaller independent brands.', 6);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (13 , CURRENT_DATE, 1, 1, 1, 5, 'Hands down the best restaurant we have ever been to. Cool casual pub like feel. The best high end food you will find anywhere. The staff is friendly and helpful. We are from 6 hours away and we will most definitely be back.', 7);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (13 , CURRENT_DATE, 1, 4, 5, 1, 'Visited here with friends. We had the best waitress. We can''t remember her name but she was from Yorkshire England! She made great suggestions, knew the food, and was laughing with us all night. We ended up tasting almost all the dishes on the menu and none disappoint. Great presentation and interesting flavours abound. A must try in Ottawa.', 8);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (13 , CURRENT_DATE, 4, 4, 4, 4, 'Best fried chicken in town! Nuff'' said. Oh and grits that taste like macaroni & cheese. I think that violates the laws of flavour but who cares. So good! The place describes itself as a "speakeasy" which for you youngins is an illegal bar operating during the progibition era. Last time I checked alcohol was legal in Canada...just a pet peave I have about this overused hipster term.', 9);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (13 , CURRENT_DATE, 3, 3, 3, 3, 'Has to be one of the worst burgers I have ever had. Way overpriced for what seems was a pre-made frozen hamburger. Fries were also awful. Save your money and go to 5guys. I am not sure why there is so much hype surrounding this place.', 10);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (14 , CURRENT_DATE, 2, 4, 4, 2, 'One of THE best meals I have EVER had in Ottawa. Was absolutely incredible! The service was friendly and all servers were on top of it and relaxed. It was a little crowded as their put their tables very close but you don''t even notice. I had their newer beef item and it was incredible, so incredible. It''s a causal high class experience :) 1 app, 2 entrees, 2 glasses of wine and dessert the bill was approx $150.', 11);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (14 , CURRENT_DATE, 1, 3, 5, 1, 'Excellent food and every thing in your plate is fresh and cook the way you want. The ham is out of this world they gave you a good serving and same goes for the fruits in you plate the are fresh. Highly recommended we will definitely go back. Get up early because the place is small and very very busy.', 12);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (14 , CURRENT_DATE, 3, 3, 4, 3, 'Staff were very friendly. Make sure to make reservations as this place is quite small and busy!! Unfortunately my order was messed up (wrong platter). Fortunately, the meal I received was really good anyways! Burgers were delicious. I will go back to try my original order though haha', 13);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (14 , CURRENT_DATE, 3, 2, 5, 4, ' I have been to The Manx many times, over many years, both for lunch and dinner. The space is super tight, but the food is incredible. my favourite: the tofu tacos. I am a total carnivore... but I cannot get enough of this vegetarian dish.', 14);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (14 , CURRENT_DATE, 4, 3, 4, 3, 'What a great spot! Delicious homemade food made with care. Hubby and I had breakfast here and we''re very pleased with the quality of food, friendly service, and warm atmosphere. We''ll be back. We''d like to try dinner some evening based on this experience.', 15);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (14 , CURRENT_DATE, 1, 3, 4, 5, 'We had a wonderful breakfast , every thing was fresh and tasty. Bread was very fresh . The only problem it is very warm inside and noisy. All over all good food', 1);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (14 , CURRENT_DATE, 1, 4, 4, 3, 'Food''s good but too expensive. There a re better places for much better value. X', 2);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (14 , CURRENT_DATE, 4, 4, 4, 4, 'Had a delicious birthday dinner here. The wine list is amazing (found my new favourite wine!). The pork dish I had was (dare I say?) too much pork. Overall great experience though, even though I had to be rolled out because I ate too much.', 3);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (14 , CURRENT_DATE, 3, 4, 4, 3, 'Best donuts in town, soft and always fresh! they sell out quickly and it''s obvious why. Give the mango lassi, dirty chocolate, London fog and salted caramel a try.', 4);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (14 , CURRENT_DATE, 2, 4, 4, 2, 'Regular at this spot for many reasons.1.fast service2. Cheap 3. very good food no matter what it is on the menu you order.4. Friendly staff. I wouldnt order the veggie club but aside from that this place is great.', 5);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (15 , CURRENT_DATE, 4, 4, 4, 4, 'Had supper here with the kids. Service was quick and friendly. Started with a Ceasar salad, it tasted good but the lettuce was kinda warm which doesn''t work well for Ceasar salad. My daughter had the Poutine which was really tasty!', 6);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (15 , CURRENT_DATE, 5, 4, 1, 4, 'We sat at the bar as it was a busy Sunday evening we decided to visit. This place is pretty small so many I would recommend having a reservation. The oysters were fresh and served with many tasty sauces. I had the lobster risotto and thought I had died and gone to heaven. Great food, great service!', 7);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (15 , CURRENT_DATE, 4, 3, 4, 3, 'The small plates at play are always of high quality and the staff can perfectly pair every dish with a glass of wine. Play Food & Wine offers two floors of seating, so it is a good option if you have a larger group.', 8);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (15 , CURRENT_DATE, 1, 2, 2, 1, 'Fun house cocktails, southern comfort style food. Unique and tasty offerings. Boiled peanuts at your table. Don''t forget to check out the Speakeasy in the basement! It is mostly community style seating in the main dining room.', 9);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (15 , CURRENT_DATE, 2, 1, 1, 2, 'Thought I would "treat" myself to Hintonburger tonight. That was a mistake. Average burger (actually seemed smaller than the last time I was there) average small poutine and can of pop. $20.00!!!! Food quality is falling and prices are basically outrageous for chip truck food. Its a shame used to be a great place. I will no longer recommend it or go back. #pricingyourselfoutofbusiness', 10);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (15 , CURRENT_DATE, 1, 1, 3, 3, 'Not enough can be said about Town. Came for a celebratory dinner with a date and we were blown away by the food and service. Extremely knowledgeable staff, great atmosphere and beautiful restaurant.', 11);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (15 , CURRENT_DATE, 4, 2, 4, 2, 'very good. charcuterie was excellent . Ok for desert I had the cheese plate and again well presented. . Not often I give a high rating they deserve it and thank you for the excellent service. ', 12);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (15 , CURRENT_DATE, 4, 4, 4, 4, 'Not a bad burger but not anything mind blowing either. Se ice was attentive. Beer list has a couple of local brews. For the high rating I expected something more', 13);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (15 , CURRENT_DATE, 3, 3, 3, 3, 'Great service. The pork sandwich with kimchi was awesome. Portions were generous and very affordable. Beer (Manx 20 stock ale) was good. I will go again.', 14);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (15 , CURRENT_DATE, 4, 4, 4, 4, 'Food is excellent! Had many vegetarian options. The bobotie with tofu was delicious!! Service slow with reservation of 10 people cause only 1 person serving and bar tending and 2 cooks. Overall good times though!', 15);
INSERT INTO Rating(userid,ratingdate,price,food,mood,staff,comments,restaurantid) VALUES (5 , CURRENT_DATE, 4, 4, 4, 4, 'Their pastries are massively overrated however and I wouldn''t bother buying any again. We got a variety of them to take home and nothing was memorable. It didn''t feel worth the calories to finish eating the cronuts. Suzy Q still rules the ring-ed pastry scene in my books.', 3);

--Inserting into Menuitem

INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Art Is In Breakfast Sandwiches', 'Food', 'Breakfast', 'Two fried eggs served on your choice of toasted fresh sourdough or our buttermilk multiseed bread with our house lemon chive mayonnaise.',6.95,1);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Gluten Free Breakfast', 'Food', 'Breakfast', 'Two eggs your way with candied bacon and greens.',6.95,1);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Euro Style Quiche (Vege)', 'Food', 'Breakfast', 'with seasonal veggies and goat cheese served with a dollop of our house maple ketchup and a side salad.',12.95,1);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Euro Style Quiche (Lorraine)', 'Food', 'Breakfast', 'with bacon, ham and gruyere cheese served with a dollop of our house maple ketchup and a side salad.',12.95,1);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Croque Monsieur', 'Food', 'Breakfast', 'French style ham and cheese sandwich on our fresh sourdough bread layered with Havarti cheese and béchamel sauce, topped with golden melted gruyere cheese. Served with a side salad.',13.95,1);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Croque Madame', 'Food', 'Breakfast', 'French style ham and cheese sandwich on our fresh sourdough bread layered with Havarti cheese and béchamel sauce, topped with golden melted gruyere cheese. Topped with a sunny egg. Served with a side salad.', 14.95, 1);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('House Granola', 'Food', 'Breakfast', 'Greek yogurt served under Art Is In chocolate, pecan and cranberry granola topped fresh seasonal fruits.',7.95,1);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Buttermilk Brine Pulled Chicken Caesar Sandwich', 'Food', 'Lunch', 'Tender chicken pieces with bacon, Havarti, tomatoes, arugula and our homemade Caesar dressing served on our Dynamic Cheddar, jalapeno & chive bread.',11.95,1);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Classic Ham and Cheese', 'Food', 'Lunch', 'Ham, cheddar, tomatoes, arugula, home-made lemon chive mayo served on our Dynamite Rosemary bread.',8.95,1);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Tuna Melt','Food','Lunch','Flaked tuna mixed with diced pickkles, onions, celery, carrots, smoked paprika, dill and mayo with cheddar, tomatoes, and arugula served on our Dynamite white.',9.95,1);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Art Is In Roast Beef','Food','Lunch','Slices of house brined roast beef, topped with Provolone, horseradish mayo, caramelized onions, tomato, arugula served on our Dynamite 12 grain & fennel bread.',11.95,1);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Thai Chicken','Food','Lunch','Charcoal grilled Thai marinated chicken with curry maryo, basil, coriander, julienne applies, peanuts pickled green chillies, tomato, arugula, and Havarti cheese on our Dynamite white.',10.95,1);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Squash Caponata','Food','Lunch','Roasted butternut squash, sundried tomatoes, & basil pesto, olives goat cheese, arugula, tomato on our Dynamite 12 grain & fennel bread.',9.95,1);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Classic Grilled Cheese','Food','Lunch','Gruyere, provolone and caramelized onions on our buttermilk multiseed bread served with our house maple ketchup.',7.95,1);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Fried Crispy Pickle Melt','Food','Lunch','Fried dill pcikles with spicy mayo, caramelized onions, arugula and cheddar on our Dynamite cheddar jalapeno bread.',8.95,1);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Super Salad','Food','Lunch','Fresh mixed greens tossed with quinoa, crunchy apples, berries, shredded carrots, cucumbers, tomatoes, peppers, celery and goat cheese. Tossed in our house vinaigrette and drizzled with balsamic reduction.',11.95,1);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Thai Salad','Food','Lunch','Fresh mixed greens, rice noodles, shredded carrots, cucumbers, peanuts, mint, cilantro and basil with an Amerasian vinaigrette.',11.95,1);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Thai Salad /w Curry Chicken','Food','Lunch','Fresh mixed greens, rice noodles, shredded carrots, cucumbers, peanuts, mint, cilantro and basil with an Amerasian vinaigrette. Topped with Curry Chicken.',13.95,1);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Crunchy Garden Salad (Small)','Food','Lunch','Mixed greens, tomato, celery, cucumber, shredded carrots, and our house vinaigrette sprinkled with sesame seeds.',5.25,1);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Crunchy Garden Salad (Large)','Food','Lunch','Mixed greens, tomato, celery, cucumber, shredded carrots, and our house vinaigrette sprinkled with sesame seeds.',9.95,1);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Salad and Soup Combo','Food','Lunch','',10.95,1);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Kevins Clam Chowder','Food','Soups','Fresh and creamy clam chowder with bacon and chunky veggies',6.50,1);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Vegan Tomato Soup','Food','Soups','Classic tomato soup with a touch of coconut milk for extra creaminess',5.95,1);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Triple Fried Fries','Food','Sides','Served with garlic mayo and our house maple ketchup',3.25,1);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Side of Arugula','Food','Sides','Tossed in house vinaigrette',2.95,1);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Queso Fundido','Food','Starter','',13.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Chips & Salsa','Food','Starter','',6.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Pork Taco','Food','Tacos','',5.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Beef Taco','Food','Tacos','',5.50,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Japanese Eggplant Taco','Food','Tacos','',4.50,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Lamb Taco','Food','Tacos','',6.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Crispy Fish Taco','Food','Tacos','',6.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Ox Tongue Taco','Food','Tacos','',6.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Tuna Tartare Crispy Taco w. Queso & Iceberg Lettuce','Food','Tacos','',10.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Crispy Prawn Betel Leaf','Food','NotTacos','',9.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Shrimp Dumplings','Food','NotTacos','',9.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Green Papaya Salad','Food','NotTacos','',10.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Salt & Pepper Squid','Food','NotTacos','',10.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Chilaqulles w. Pork Shoulder, Fresh Curry Leaves, Queso & Juniper Farms Sunny Side Up Egg','Food','NotTacos','',12.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Chill Lime Caramel Pork Belly w. Green Mango, Young Coconut, Peanuts & Thai Basil','Food','NotTacos','',15.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Scallop Crudo w. XO Sauce & Lime Leaf','Food','NotTacos','',16.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Wild Salmon Tartar Tostada w. Avocado, Funky Chill & Pickled Ginger','Food','NotTacos','',14.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Churros w. Salted Caramel','Food','Dessert','',6.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Tequilime Pie','Food','Dessert','',6.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Bourbon Sour','Drink','Cocktails','',10.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Tequlia Sour','Drink','Cocktails','',10.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('El Fuego','Drink','Cocktails','',10.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Camino Club','Drink','Cocktails','',10.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('3 Amigos #2','Drink','Cocktails','',13.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('El Camino Manhattan','Drink','Cocktails','',13.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Margarita','Drink','Cocktails','',13.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Pina Colada','Drink','Cocktails','',13.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('The Way','Drink','Cocktails','',13.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Draft Beer','Drink','Beer','',6.20,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Can Beer (Sapporo)','Drink','Beer','',7.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Can Beer (Stiegl)','Drink','Beer','',6.50,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Can Beer (Tecate)','Drink','Beer','',7.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Sparkling (Glass)','Drink','Wine','',11.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('White (Glass)','Drink','Wine','',12.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Red (Glass)','Drink','Wine','',11.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Sparkling (Bottle)','Drink','Wine','',57.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('White (Bottle)','Drink','Wine','',80.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Red (Bottle)','Drink','Wine','',57.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Tromba Blanco','Drink','Tequila','',5.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Jaral de Berreio','Drink','Tequila','',8.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Los Arrangos Reposado','Drink','Tequila','',9.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Harradura Reposado','Drink','Tequila','',9.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Avion Blanco','Drink','Tequila','',9.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Tromba Reposado','Drink','Tequila','',9.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Espcion Reposado','Drink','Tequila','',11.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Don Julio Blanco','Drink','Tequila','',11.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Tiacuache Mescal','Drink','Tequila','',11.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Dolce Vida Reposado','Drink','Tequila','',11.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Milagro Blanco','Drink','Tequila','',11.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Tromba Anejo','Drink','Tequila','',12.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Tres Generaciones Anejo','Drink','Tequila','',12.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Cabo Wabo Reposado','Drink','Tequila','',13.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Don Julio Reposado','Drink','Tequila','',13.00,2);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Shrimp Cocktail','Food','Apps','',16.00,3);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Mushroom Tart','Food','Apps','',15.00,3);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Smoked Beef Tataki','Food','Apps','',16.00,3);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Root Beer Glazed Duck Breast','Food','Main','',30.00,3);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Bacon Wrapped Pork Belly','Food','Main','',26.00,3);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Wild King Salmon','Food','Main','',28.00,3);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('French Fries - Smoked Chili Aioli','Food','Lunch','',5.00,3);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Cheese Board','Food','Lunch','',15.00,3);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Green Salad','Food','Lunch','',12.00,3);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Burger','Food','Lunch','',15.00,3);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Fresh Pasta','Food','Lunch','',15.00,3);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Yellowfin Tuna','Food','Lunch','',17.00,3);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Lemon Pudding','Food','Dessert','',9.00,3);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Chocolate Ganache','Food','Dessert','',11.00,3);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Local Cheese Board','Food','Dessert','',15.00,3);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Mint Lemonade','Drink','Cocktails','Vodka/Muddle Mint/Lemon Juice/Simple Syrup/Soda',11.00,3);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Chipotle','Drink','Cocktails','Grilled Green Onion/Bacon/Vodka/Worcestershire/Chipotle Purée',10.00,3);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Pom Collins','Drink','Cocktails','Gin/Rosemary/Pomegranate Juice/Lime Juice/Ginger Beer',12.00,3);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Highlander - Glayva','Drink','Coffee','',9.00,3);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Celtic - Baileys/Jameson','Drink','Coffee','',9.00,3);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Jamacian - Spiced Rum','Drink','Coffee','',9.00,3);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('A Dozen Donuts','Food','Dessert','',10.00,4);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Lemon Pistachio','Food','Dessert','',2.00,4);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Salty Caramel','Food','Dessert','',2.00,4);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Blueberry Pancakes','Food','Breakfast','',11.99,5);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('French Toast','Food','Breakfast','',10.99,5);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Smoked Meat Poutine','Food','Poutine','Topped with Montreal Smoked Meat',11.99,5);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('ESD Poutine','Food','Poutine','Topped with fried onions and bacon',11.99,5);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Smoked Festive Platter','Food','Main','Assortment of Smoked Meats',15.99,6);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Deustche Wurst Deluxe','Food','Main','Speciality Smoked German Sausages served with fries',10.99,6);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('The Smoque Criminal','Food','Main','Smoked Meat served with an assortment of sauerkraut, fries, pickle and choice of white or rye bread',17.99,6);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Fish and Chips','Food','Lunch','Pacific Cod served with tartar sauce, lemon, pickled onion and slaw',9.99,7);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Lobster Roll','Food','Lunch','Served with brioche, buttered greens, frites and aioli',11.99,7);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Lobster','Food','Dinner','Fresh Maine Lobster served with polenta, brussel sprout, chorizo chips and a shallot salad',19.99,7);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Steelhead Trout','Food','Dinner','Served with carrots, almonds, parsley and touch of honey',13.99,7);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Grilled Corn','Food','Sides','Topped with cilantro, lime and chili',7.00,8);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Cabbage Slaw','Food','Sides','Topped with corn nut, snap peas, apple cider and yogurt',7.00,8);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Albacore Tuna','Food','Main','Topped with garlic scape aioli, beef, truffle oil and jicama insolia',15.00,8);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Grilled Hanger Steak','Food','Main','Topped with mushrooms, frites, aioli',16.00,8);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Octopus','Food','Main','Topped with jalapeno, creme fraiche, smoked fingerling and red wine glaze',15.00,8);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Dirty Burger','Food','Lunch','duuuuuuuuurty',12.00,9);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Free Range & Southern Fried Chicken','Food','Lunch','Served /w pepper vinegar',12.00,9);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Rancho-Style Pinto Beans','Food','Lunch','Served /w bacon, tomato, jalapeno, & cilantro',4.00,9);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Beef Tartare','Food','Apps','1000 Island sauce, iceberg lettuce, pickled onion, avonlea cheddar, benne, potato chips',14.00,9);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('The Hintonburger','Food','Main','6 oz. bacon cheeseburger with signature bbq sauce, plus fresh cut fries and a drink',15.50,10);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('The Armstrong','Food','Main','4 oz. burger plus fresh cut fries and a drink',12.90,10);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('The Wellington','Food','Main','6 oz. burger plus fresh cut fries and a drink',14.50,10);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Stirling Stacker','Food','Main',' 3 oz. burger with option to stack patties',9.50,10);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Grilled Octupus Salad','Food','Apps','Grilled confit potatoes with gigante beans, corpse reviver lemons, red onion, dried filicetti sausage, picked chili, frisse, and soffritto',18.00,11);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Chilled Porchetta Salad','Food','Apps','Served with fennel zeppoie, apple, celery, fennel, green goddess dressing, fennel saly, caper berries and chilis',17.00,11);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Crispy Fried Eggplant','Food','Main','Served with tomato basil sauce, spicy pickled eggplant, parmesan, ricotta, frie degg, and arugula',17.00,11);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Steak & Eggs','Food','Main','Our char-boiled striploin served with two eggs, home fries, fresh fruit and toast',17.95,12);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Atlantic Smoked Salmon Benedict','Food','Main','Served with home fries and fresh fruit',14.95,12);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Greek Salad','Food','Lunch','Vine riped tomatoes, cucumbers, red onion, peppers, tossed in an olive oil and oregano dressing topped with kalamata olives and of course feta cheese',9.95,12);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Chicken Wings','Food','Sides','BBQ, mild, medium, hot or suicide',10.00,13);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Mussels and Fries','Food','Sides','with daily sauce',10.00,13);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('10 oz Grilled Pork Chop','Food','Main','bulls-eye barbecue sauce',7.00,13);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Soup of the Dat','Food','Lunch','',6.00,14);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Baby Spinach Salad','Food','Lunch','Topped with a potato-apple rosti & cheddar with a red wine vinaigrette',12.00,14);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Moroccan Braised Short Ribs','Food','Dinner','Served over feta, olive & chickpea ragout with a baby spinach salad tossed in preserved lemon dressing',18.00,14);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Breakfast Jerk Ribs','Food','Breakfast','Two eggs any style, half rack of house jerked ribs, home fries and toasted cornbread',17.50,15);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Corned Beef Hash','Food','Breakfast','Two eggs any style, corned beef and homefry hash, sliced tomato, fruit and toasted cornbread',15.25,15);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Scrambled Feta','Food ','Breakfast','3 Scrambled Eggs, Tomato Concasse, Green Onions and Feta with home fries, salad and toast',14.00,15);
INSERT INTO Menuitem(itemname,itemtype,itemcategory,itemdescription,itemprice,restaurantid) VALUES ('Breakfast Club','Food','Breakfast','Two fried eggs, bacon, cheddar, mayo, lettuce, tomato on homemade molasses toast with home fries',13.00,15);

--Insert Location 

INSERT INTO Location(firstopendate,managername,phonenumber,streetaddress,openinghour,closinghour,restaurantid) VALUES (CURRENT_DATE,'Joe Jaden','+1 (613) 695-1226','250 City Centre Avenue, Unit 112, Ottawa, ON K1R1C7','7:00AM','7:00PM',1);
INSERT INTO Location(firstopendate,managername,phonenumber,streetaddress,openinghour,closinghour,restaurantid) VALUES (CURRENT_DATE,'Ruth Shultz','+1 (613) 422-2800','380 Elgin Street, Ottawa, ON K2P1M9', '5:30PM', '2:00AM',2);
INSERT INTO Location(firstopendate,managername,phonenumber,streetaddress,openinghour,closinghour,restaurantid) VALUES (CURRENT_DATE,'Anna Sakz','+1 (613) 792-1313','87 Holland Avenue, Ottawa, ON K1Y0Y1','5:30PM','10:00PM',3);
INSERT INTO Location(firstopendate,managername,phonenumber,streetaddress,openinghour,closinghour,restaurantid) VALUES (CURRENT_DATE,'Orth Gabit','+1 (613) 724-2451','969 Wellington Street West, Ottawa, ON K1Y2Y1','7:00AM','7:00PM',4);
INSERT INTO Location(firstopendate,managername,phonenumber,streetaddress,openinghour,closinghour,restaurantid) VALUES (CURRENT_DATE,'Ribon Jonquist','+1 (613) 237-9700','374 Elgin Street, Ottawa, ON K2P1M9','12:00PM','12:00PM',5);
INSERT INTO Location(firstopendate,managername,phonenumber,streetaddress,openinghour,closinghour,restaurantid) VALUES (CURRENT_DATE,'Zak Luftz','+1 (613) 789-4245','129 York Street, Ottawa, ON K1N7J3','11:30AM','11:00PM',6);
INSERT INTO Location(firstopendate,managername,phonenumber,streetaddress,openinghour,closinghour,restaurantid) VALUES (CURRENT_DATE,'Vladimir Holter','+1 (613) 231-8569','430 Bank Street, Ottawa, ON K2P1Y8','5:00PM','11:00PM',7);
INSERT INTO Location(firstopendate,managername,phonenumber,streetaddress,openinghour,closinghour,restaurantid) VALUES (CURRENT_DATE,'Cropa Shuoit','+1 (613) 667-9207','1 York Street, Ottawa, ON K1N6Z5','5:00PM','11:45PM',8);
INSERT INTO Location(firstopendate,managername,phonenumber,streetaddress,openinghour,closinghour,restaurantid) VALUES (CURRENT_DATE,'Craig Helmt','+1 (613) 231-1010','315 Somerset Street West, Ottawa, ON K2P0J8','5:30PM','2:00AM',9);
INSERT INTO Location(firstopendate,managername,phonenumber,streetaddress,openinghour,closinghour,restaurantid) VALUES (CURRENT_DATE,'Maggie McDonalder','+1 (613) 724-4676','1096 Wellington Street West, Ottawa, ON K1Y2Y4','11:00AM','9:00PM',10);
INSERT INTO Location(firstopendate,managername,phonenumber,streetaddress,openinghour,closinghour,restaurantid) VALUES (CURRENT_DATE,'Freddie Item','+1 (613) 695-8696','296 Elgin Street, Ottawa, ON K2P1M3','5:00PM','11:00PM',11);
INSERT INTO Location(firstopendate,managername,phonenumber,streetaddress,openinghour,closinghour,restaurantid) VALUES (CURRENT_DATE,'Tran Trieu','+1 (613) 761-7171','385 Richmond Road, Ottawa, ON K2A0E7','7:00AM','2:30PM',12);
INSERT INTO Location(firstopendate,managername,phonenumber,streetaddress,openinghour,closinghour,restaurantid) VALUES (CURRENT_DATE,'Igor Vditi','+1 (613) 241-3533','137 Murray Street, Ottawa, ON, K1N5M7','11:00AM','2:00AM',13);
INSERT INTO Location(firstopendate,managername,phonenumber,streetaddress,openinghour,closinghour,restaurantid) VALUES (CURRENT_DATE,'Kane Broadman','+1 (613) 531-2070','370 Elgin Street, Ottawa, ON K2P1N1','11:30AM','2:00AM',14);
INSERT INTO Location(firstopendate,managername,phonenumber,streetaddress,openinghour,closinghour,restaurantid) VALUES (CURRENT_DATE,'Mike Wugsk','+1 (613) 564-2222','416 Preston Street, Ottawa, ON K1S4M9','5:00PM','10:00PM',15);

--Insert RatingItem

INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (1,'2010/06/02',1,3,'Staple breakfast meal! Very good.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (2,'2010/08/10',1,3,'Amazing and tasty Breakfast.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (3,'2012/08/10',1,4,'Loved it.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (4,'2016/05/20',1,4,'Tasty.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (5,'2016/04/15',1,3,'Lovely, the perfect breakfast.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (6,'2016/10/11',1,3,'Mediocre at best, but still better than most places for breakfast.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (7,'2017/10/01',1,5,'Good.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (8,'2011/12/12',1,2,'Decent, homecooked would have tasted better.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (9,'2016/10/10',1,2,'Could have done better at home.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (10,'2016/07/26',1,4,'Good meal to start the day.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (11,'2012/08/10',1,4,'Very good.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (12,'2016/02/02',1,2,'So-so, not that great to be honest, lacked seasoning for one thing out of many.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (13,'2013/02/10',1,3,'It is alright for a morning meal, nothing special really but it does get the job done.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (14,'2016/07/18',1,4,'Fantastic, everything was made just the way I liked it!');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (15,'2016/09/10',1,3,'It is like a dull plate of eggs and stuff, missed the mark on seasoning.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (16,'2011/01/02',1,1,'Did not like this at all, absolutely terrible.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (17,'2015/12/12',1,1,'Just take your $7 and go eat somewhere else, even McDonalds would suffice.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (18,'2016/01/25',1,2,'Just not up to par, sadly.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (19,'2010/01/15',1,3,'Was alright, for $7 it is not bad.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (20,'2016/03/20',1,4,'Cheap? Yes. Tasty? Yes. Do I recommend? YES.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (1,'2017/03/10',2,3,'Not bad for a Gluten-Free Meal.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (2,'2008/03/13',2,1,'Never again, just didnt taste right at all.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (3,'2008/05/10',2,1,'This really did not hit the mark, at all.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (4,'2005/02/10',2,3,'I do not have any dietary restrictions and I wanted to try this, it was alright I guess.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (5,'2006/11/29',2,2,'It passes, that is all I have to say.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (6,'2007/10/25',2,4,'Finally, a Gluten-Free meal, that actually tastes good!');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (7,'2007/12/12',2,5,'Made just the way I liked it, definitely get this when you come here.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (8,'2008/01/01',2,1,'I feel just like Moe when I buy this screaming, WHY WHY WHY?');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (9,'2016/03/03',2,1,'Absolutely hate this. Why bother?');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (10,'2008/04/05',2,3,'It is $7, can not complain much.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (11,'2016/04/07',2,2,'It flat out is just terrible.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (12,'2008/01/03',2,1,'Taste was dull, plain, and moreorless boring.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (13,'2007/01/15',2,4,'Absolutely loved it, very tasty!');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (14,'2007/04/06',2,3,'Not bad for this type of dish.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (15,'2006/09/10',2,2,'Ok for $7 I suppose, abscence of taste though.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (16,'2017/03/10',2,4,'The perfect meanl for $7, cheap, has taste, and the perfect filler dish.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (17,'2010/03/03',2,5,'Loved it.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (18,'2009/03/07',2,3,'It is ok, but it is missing a huge thing.... MORE SEASONING.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (19,'2006/08/24',2,1,'I rather go to a fast food chain.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (20,'2009/10/13',2,3,'Only buy this because it is cheap.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (1,'2013/03/20',3,3,'Not bad, surprisingly tasty.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (2,'2012/07/10',3,3,'Decent, just decent in taste, in everything really.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (3,'2011/09/22',4,3,'Not bad.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (4,'2013/11/13',4,2,'Below average, sadly.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (5,'2009/11/11',5,4,'Surprisingly, it is very tasty.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (6,'2011/06/21',5,3,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (7,'2013/07/20',6,4,'Extra $1 for an egg? It is worth it.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (8,'2014/09/14',6,4,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (9,'2015/03/10',6,3,'It is good, wouldnt pay extra for an egg though.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (10,'2014/02/10',7,2,'Yogurt served in a fancy way, nothing special');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (11,'2013/03/12',7,1,'Taste is there, but I could make this at home, crazy overpriced in all honesty.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (12,'2011/11/11',7,2,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (13,'2009/03/03',8,5,'This is heavenly, it is actually really good.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (14,'2011/07/15',8,4,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (15,'2013/10/18',9,4,'How can you hate this? It is the perfect combination');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (16,'2008/10/29',9,4,'Delicious!');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (17,'2009/10/16',10,3,'Not bad, could have used more tuna on my dish.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (18,'2010/05/10',10,3,'A decent tuna dish.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (19,'2006/03/10',10,2,'Homemade tastes better.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (20,'2009/09/10',11,3,'Decent dish, but where is the seasoning?.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (1,'2010/05/05',11,4,'How can you go wrong with roast beef? You cant, the taste is great!');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (2,'2003/03/01',12,1,'Just stick with contemporary dishes, why try to incorporate other styles of cuisines?');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (3,'2006/03/13',12,2,'Not a fan of this at all.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (4,'2008/12/10',13,1,'I really did not enjoy this dish at all.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (5,'2009/11/11',14,4,'Grilled cheese sandwich, where can you go wrong with this? You just cant.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (6,'2011/02/20',14,5,'Gave a home-like feeling when eating this dish, loved it.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (7,'2013/05/21',15,2,'Came out very mushy, not enjoyable at all.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (8,'2010/03/20',15,1,'Why even have this item on the menu? Not good at all.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (9,'2011/02/23',16,2,'Could have made this at home.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (10,'2013/05/22',17,3,'Weirdly delicious.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (11,'2010/03/19',18,1,'Combination just did not work at all.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (12,'2003/09/12',18,1,'Tasted pretty bad, subpar.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (13,'2011/10/11',19,3,'Not bad, pretty fresh.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (14,'2006/10/01',19,4,'Fresh veggies, and the perfect mix of greens, tasty!');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (15,'2008/12/12',20,1,'Subpar.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (16,'2004/09/13',20,2,'Tasted worse than I imagined.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (17,'2003/02/10',21,4,'Really good, I liked it.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (18,'2007/01/25',22,2,'Below average taste, really.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (19,'2006/01/03',23,1,'Tasted really bad, cardboard would have tasted better.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (20,'2008/10/29',24,2,'Dish was subpar, could use alot more seasoning.');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (1,'2009/12/12',25,1,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (2,'2005/11/25',26,3,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (3,'2010/11/17',27,4,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (4,'2013/10/16',28,4,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (5,'2005/09/28',28,2,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (6,'2016/04/19',29,1,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (7,'2012/10/28',30,4,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (8,'2006/08/16',30,5,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (9,'2007/10/18',31,6,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (10,'2012/12/28',32,7,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (11,'2013/05/26',33,3,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (12,'2016/10/27',34,4,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (13,'2004/10/18',35,5,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (14,'2006/02/05',36,6,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (15,'2008/07/24',37,1,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (16,'2009/08/28',38,2,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (17,'2007/04/15',39,1,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (18,'2014/10/10',40,2,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (19,'2015/03/28',41,3,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (20,'2005/08/05',42,4,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (1,'2013/08/08',43,1,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (2,'2012/05/06',44,4,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (3,'2011/05/02',45,1,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (4,'2015/08/09',46,4,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (5,'2013/10/29',47,5,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (6,'2009/10/08',48,2,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (7,'2009/05/16',49,3,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (8,'2009/07/08',50,4,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (9,'2008/08/09',51,1,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (10,'2006/08/08',51,2,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (11,'2008/08/06',52,1,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (12,'2012/08/06',53,3,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (13,'2011/04/07',54,4,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (14,'2010/08/06',55,2,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (15,'2005/08/09',56,2,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (16,'2008/10/25',57,1,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (17,'2008/08/03',58,2,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (18,'2007/03/24',59,4,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (19,'2006/08/16',60,1,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (20,'2012/07/25',61,4,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (1,'2013/05/08',62,4,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (2,'2011/04/19',63,5,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (3,'2010/08/29',64,2,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (4,'2011/05/08',65,3,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (5,'2008/05/25',66,4,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (6,'2007/08/24',67,1,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (7,'2005/10/28',68,2,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (8,'2010/08/21',69,3,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (9,'2007/10/27',70,4,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (10,'2005/08/02',71,2,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (11,'2015/07/05',72,1,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (12,'2017/08/08',73,3,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (13,'2008/08/01',74,2,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (14,'2013/11/05',75,1,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (15,'2014/05/06',76,3,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (16,'2013/11/24',77,1,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (17,'2009/05/04',79,3,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (18,'2010/04/05',80,2,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (19,'2010/11/11',81,4,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (20,'2010/12/20',82,1,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (1,'2017/10/20',83,1,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (2,'2014/08/09',84,4,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (3,'2015/05/15',85,3,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (4,'2014/05/04',86,5,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (5,'2011/04/12',87,2,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (6,'2012/08/09',88,5,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (7,'2013/11/23',89,2,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (8,'2013/05/06',90,2,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (9,'2015/10/24',91,2,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (10,'2015/10/25',92,3,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (11,'2011/05/05',93,4,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (12,'2010/10/19',94,3,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (13,'2005/05/05',95,2,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (14,'2008/01/01',96,2,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (15,'2008/04/08',97,1,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (16,'2009/08/01',98,3,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (17,'2010/01/16',99,4,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (18,'2015/01/25',100,5,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (19,'2004/11/15',101,1,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (20,'2008/10/18',102,3,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (1,'2009/12/12',103,1,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (2,'2008/03/03',104,3,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (3,'2005/10/25',105,1,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (4,'2008/10/19',106,2,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (5,'2010/12/21',107,3,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (6,'2008/04/01',108,2,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (7,'2010/04/01',109,1,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (8,'2015/04/01',110,1,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (9,'2009/05/01',111,2,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (10,'2012/04/01',112,3,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (11,'2012/04/06',113,2,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (12,'2008/08/05',115,3,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (13,'2005/08/06',116,4,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (14,'2012/07/01',117,4,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (15,'2013/05/05',118,3,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (16,'2011/09/08',119,2,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (17,'2011/08/25',120,5,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (18,'2008/05/28',121,2,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (19,'2009/08/18',122,1,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (20,'2008/05/02',123,3,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (1,'2015/04/08',124,5,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (2,'2008/02/02',125,2,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (3,'2013/01/01',126,3,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (4,'2013/05/05',127,4,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (5,'2007/10/02',128,2,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (6,'2008/08/08',129,1,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (7,'2012/08/01',130,2,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (8,'2011/05/02',131,3,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (9,'2010/11/15',132,3,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (10,'2017/08/28',133,4,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (11,'2016/03/25',134,2,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (12,'2013/08/08',135,5,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (13,'2012/04/05',136,1,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (14,'2012/09/29',137,2,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (15,'2013/04/05',138,3,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (16,'2013/01/28',139,4,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (17,'2015/05/12',140,2,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (18,'2013/08/18',141,3,'');
INSERT INTO Ratingitem (userid,ratingdate,itemid,rating,ratingcomment) VALUES (19,'2008/07/27',142,1,'');

