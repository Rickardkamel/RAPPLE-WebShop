USE RappleDB;

DROP TABLE Product_Category;
DROP TABLE [Order];
DROP TABLE [User];
DROP TABLE Product;
DROP TABLE Category;


CREATE TABLE [User]
(
	ID INT PRIMARY KEY IDENTITY NOT NULL,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Age INT NOT NULL,
	Email NVARCHAR(150) UNIQUE NOT NULL,
	[Password] NVARCHAR(35) NOT NULL,
	WantsOffers BIT NOT NULL
);


CREATE TABLE [Order]
(
	ID INT PRIMARY KEY IDENTITY NOT NULL,
	OrderDate DATETIME NOT NULL,
	Price INT NOT NULL,
	UserId INT FOREIGN KEY REFERENCES [User](ID) NOT NULL,	
);


CREATE TABLE Category
(
	ID INT PRIMARY KEY IDENTITY NOT NULL,
	Name NVARCHAR(70) NOT NULL
);


CREATE TABLE Product
(
	ID INT PRIMARY KEY IDENTITY NOT NULL,
	Name NVARCHAR(70) NOT NULL,
	Price INT NOT NULL,
	Details NVARCHAR(MAX) NOT NULL,
	ImagePath NVARCHAR(1000) NOT NULL
	
);


INSERT INTO Category (Name)
VALUES	('Mac'), ('IPhone'), ('IPad'), ('TV'), ('Retina')


INSERT INTO Product (Name, Price, Details, ImagePath)
VALUES	('MacBook Air 13', 11999, 'MacBook Air with the fifth -generation
		 Intel Core processor delivers power that lasts all day.
		 Intel Core i5 / 1.6 GHz, Intel HD Graphics 6000, 4GB RAM / 128GB Flash Memory',
		 'Images/macbookair.jpg'),

		('iMac 27', 15999, 'Apple iMac delivers performance and design like 
		never before. Ultra-slim design, Full HD IPS LED screen, 
		Intel i5 processor, NVIDIA graphics and OS X Mountain Lion. 
		Take advantage of the unique experience.', 'Images/imac27.jpg'),

		('iMac 21.5', 11999, 'Apple iMac delivers incredible performance
		 in its ultra-thin design, beautiful Full HD IPS LED screen, 
		 Intel i5 procossor and the operating system OS X Mavericks.', 'Images/imac21.jpg'), 

		('MacBook Pro Retina 13', 15399, 'MacBook Pro is equipped with an 
		incredible Retina display, the fifth-generation Intel Core i5 processor 
		and flash memory, while it has a thin and light design.', 'Images/macbookproretina.jpg'), 

		('iPhone 6', 4999, 'iPhone 6 is not only bigger, it is thinner and better 
		in every way. Among other things, it has an ultra-fast A8 processor, 
		iOS 8 and NFC - for payment.', 'Images/iphone6.jpg'), 

		('iPhone 6s', 5999, 'iPhone 6s from Apple comes with unique 3D Touch technology 
		and super fast A9 processor. This gives you a quick and effective everyday 
		when you surf, work, taking pictures and calling.', 'Images/iphone6s.jpg'),

		('iPhone 5', 2599, 'Classy looks and a host of advanced features makes Apple iPhone 5 a superb device. 
		Equipped with 4 inch multi-touch retina display, 8 megapixels rear camera and full HD recording, 
		this smart phone delivers unmatched performance.', 'Images/iphone5.jpg'),

		('iPhone 5s', 3999, 'iPhone 5s 4" Retina display , 
		iOS 7 operating system, the A7 processor, 8 -megapixel iSight 
		camera and fingerprint reader.', 'Images/iphone5s.jpg'), 

		('iPad 3 Retina 32GB', 2999, 'iPad 3 is a better tablet with 
		impressive Retina display, 5 - megapixel iSight camera and 
		amazing performance with quad-core graphics.', 'Images/ipad3retina.jpg'), 

		('iPad Pro 128GB', 11999, 'With a 12.9 -inch Retina display, 
		powerful A9X processor and multitasking capability, 
		you get higher performance with the iPad Pro, 
		no matter where you are.', 'Images/ipadpro.jpg'), 

		('iPad 2 16GB', 2199, 'iPad Air 2 is thinner and lighter than 
		previous generations and combines incredible power, a brilliant 
		Retina display and advanced iOS 8 in a single device.', 'Images/ipad2.jpg'), 

		('Apple TV', 699, 'Apple TV is a compact and stylish 
		media player that can stream movies and videos wirelessly 
		in full HD from an iOS device to your TV.', 'Images/appletv.jpg') 

CREATE INDEX ProductIndex ON Product(Name)

INSERT INTO [User] (FirstName, LastName, Age, Email, [Password], WantsOffers)
VALUES	('Rickard', 'Kamel', 23, 'Rickardkamel@gmail.com', 'hej123', 1),
		('Johan', 'Granqvist', 23, 'Johangranqvist@gmail.com', 'johan123', 0),
		('Jason', 'Karlsson', 20, 'JasonKarlsson@gmail.com', 'jason123', 1),
		('Kim', 'Johansson', 32, 'Kimjohansson@gmail.com', 'kim123', 0),
		('Anders', 'Filipsson', 19, 'Andersfilipsson@gmail.com', 'anders123', 1),
		('Isabella', 'Knutsson', 44, 'Isabellaknutsson@gmail.com', 'isabella123', 0),
		('Jonas', 'General', 43, 'Jonasgeneral@gmail.com', 'jonas123', 1)


INSERT INTO [Order] (OrderDate, Price, UserId)
VALUES	('2016-03-01', 15999, 1),
		('2016-03-01', 5999, 2),
		('2016-03-02', 699, 3),
		('2016-02-28', 2199, 4),
		('2016-02-22', 2999, 5),
		('2016-02-25', 11999, 6),
		('2016-02-26', 4999, 7)


CREATE TABLE Product_Category
(
	ProductID INT FOREIGN KEY REFERENCES Product(ID) NOT NULL,
	CategoryID INT FOREIGN KEY REFERENCES Category(ID) NOT NULL
);


ALTER TABLE Product_Category
ADD CONSTRAINT PK_CatPro
PRIMARY KEY (ProductID, CategoryID)


INSERT INTO Product_Category (ProductID, CategoryID)
VALUES	(1, 1), (2, 1), (3, 1), 
		(4, 1), (4, 5), (5, 2), 
		(6, 2), (7, 2), (8, 2), 
		(9, 3), (9, 5),	(10, 3), 
		(11, 3), (12, 4)

/* STATISTIK */

SELECT COUNT(*) AS [Number Of Products] FROM Product


SELECT Category.Name AS [Category Name], MIN(Price) AS Lowest, MAX(Price) as Highest
FROM Product_Category
JOIN Product 
ON Product_Category.ProductID = Product.ID
JOIN Category 
ON  Product_Category.CategoryID = Category.ID
GROUP BY Category.Name

SELECT SUM(Price) AS [Total Price] FROM [Order] 

SELECT AVG(Price) AS [Averageprice for orders], [User].WantsOffers AS 'Recieves Offers'
FROM [Order]
JOIN [User] ON [User].ID = [Order].UserId
GROUP BY [User].WantsOffers

/* RANDOM STATISTIK */
SELECT * FROM [User]

SELECT * FROM [Order]

SELECT * FROM Product

SELECT Product.Name AS ProductName, Category.Name AS Category, Product.Price AS Price
FROM Product_Category
JOIN Product ON Product_Category.ProductID = Product.ID
JOIN Category ON  Product_Category.CategoryID = Category.ID

