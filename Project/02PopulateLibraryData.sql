USE [library_system]
GO


CREATE PROCEDURE [dbo].[Populate_library_system]
AS
BEGIN

	/******************************************************
	 * If our tables already exist, drop and recreate them
	 ******************************************************/
	--IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES tbl_species)
	--	DROP TABLE tbl_species, tbl_animalia, tbl_care, tbl_class, tbl_habitat, tbl_nutrition, tbl_order, tbl_specialist;
		
		
	/******************************************************
	 * Build our database tables and define ther schema
	 ******************************************************/
	CREATE TABLE BOOKS (
		BookID INT PRIMARY KEY NOT NULL,
		Title VARCHAR(100) NOT NULL,
		PublisherName VARCHAR(50) NOT NULL
	);


	CREATE TABLE PUBLISHER (
		PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
		Address VARCHAR(50) NOT NULL,
		Phone VARCHAR(50) NOT NULL
	);


	CREATE TABLE LIBRARY_BRANCH (
		BranchID INT PRIMARY KEY NOT NULL,
		BranchName VARCHAR(50) NOT NULL,
		Address VARCHAR(50) NOT NULL
	);


	CREATE TABLE BORROWER (
		CardNo INT PRIMARY KEY NOT NULL,
		Name VARCHAR(50) NOT NULL,
		Address VARCHAR(50) NOT NULL,
		Phone VARCHAR(50) NOT NULL
	);


	CREATE TABLE BOOK_AUTHORS (
		BookID INT NOT NULL,
		AuthorName VARCHAR(50) NOT NULL
	);


	CREATE TABLE BOOK_COPIES (
		BookID INT NOT NULL,
		BranchId INT NOT NULL,
		Number_Of_Copies INT NOT NULL
	);


	CREATE TABLE BOOK_LOANS (
		BookID INT NOT NULL,
		BranchId INT NOT NULL,
		CardNo INT NOT NULL,
		DateOut Date,
		DateDue Date
	);

	ALTER TABLE BOOK_AUTHORS     
		ADD CONSTRAINT FK_BookId FOREIGN KEY (BookId)     
		REFERENCES BOOKS (BookId)     
		ON DELETE CASCADE    
		ON UPDATE CASCADE    
	;    

	ALTER TABLE BOOKS   
		ADD CONSTRAINT FK_BookId_To_PUBLISHER FOREIGN KEY (PublisherName)     
		REFERENCES PUBLISHER (PublisherName)     
		ON DELETE CASCADE    
		ON UPDATE CASCADE    
	;    

	ALTER TABLE BOOK_COPIES 
		ADD CONSTRAINT FK_BookId_To_BOOKS FOREIGN KEY (BookID)     
		REFERENCES BOOKS (BookID)     
		ON DELETE CASCADE    
		ON UPDATE CASCADE, 
		CONSTRAINT FK_BranchId_To_LIBRARY_BRANCH FOREIGN KEY (BranchID)     
		REFERENCES LIBRARY_BRANCH (BranchID)     
		ON DELETE CASCADE    
		ON UPDATE CASCADE   
	; 

	ALTER TABLE BOOK_LOANS 
		ADD CONSTRAINT FK_BookLoans_BookId_To_BOOKS_ FOREIGN KEY (BookID)     
		REFERENCES BOOKS (BookID)     
		ON DELETE CASCADE    
		ON UPDATE CASCADE, 
		CONSTRAINT FK_BookLoans_BranchId_To_LIBRARY_BRANCH FOREIGN KEY (BranchID)     
		REFERENCES LIBRARY_BRANCH (BranchID)     
		ON DELETE CASCADE    
		ON UPDATE CASCADE, 
		CONSTRAINT FK_CardNo_To_BORROWER FOREIGN KEY (CardNo)     
		REFERENCES BORROWER (CardNo)     
		ON DELETE CASCADE    
		ON UPDATE CASCADE  
	; 
	   



	/******************************************************
	 * Now that the tables are built, we populate them
	 ******************************************************/
	 INSERT INTO PUBLISHER
		(PublisherName, Address, Phone)
		VALUES 
		('Algodata Infosystems','123 ABC', '65334'),
		('New Moon Books','342 AFW','6555'),
		('Binnet & Hardley','423 FWEE','2322'),
		('Houghton Mifflin','411 HRT','5344'),
		('Mallinson Rendel','542 TRTR','6345')


		;

	INSERT INTO BOOKS
		(BookID,Title, PublisherName)
		VALUES 
		(1,'The Busy Executive''s Database Guide', 'Algodata Infosystems'),
		(2,'Cooking with Computers: Surreptitious Balance Sheets','Algodata Infosystems'),
		(3,'You Can Combat Computer Stress!','New Moon Books'),
		(4,'Straight Talk About Computers','Algodata Infosystems'),
		(5,'Silicon Valley Gastronomic Treats','Binnet & Hardley'),
		(6,'The Gourmet Microwave','Binnet & Hardley'),
		(7,'The Psychology of Computer Cooking','Binnet & Hardley'),
		(8,'But Is It User Friendly?','Algodata Infosystems'),
		(9,'Secrets of Silicon Valley','Algodata Infosystems'),
		(10,'Computer Phobic AND Non-Phobic Individuals','Binnet & Hardley'),
		(11,'Is Anger the Enemy?','New Moon Books'),
		(12,'Life Without Fear','New Moon Books'),
		(13,'Prolonged Data Deprivation: Four Case Studies','New Moon Books'),
		(14,'Emotional Security: A New Algorithm','New Moon Books'),
		(15,'Onions, Leeks, and Garlic: Cooking Secrets','Binnet & Hardley'),
		(16,'Fifty Years in Buckingham Palace Kitchens','Binnet & Hardley'),
		(17,'The Hobbit','Houghton Mifflin'),
		(18,'Slinky Malinki','Mallinson Rendel'),
		(19,'The Lost Tribe','Mallinson Rendel'),
		(20,'ABC','New Moon Books'),
		(21,'DEF','New Moon Books')
	;

	


	INSERT INTO BOOK_AUTHORS
		(BookID, AuthorName)
		VALUES 
		(1, 'Marjorie'),
		(2,'Michael'),
		(3,'Marjorie'),
		(4,'Dean'),
		(5,'Innes'),
		(6,'DeFrance'),
		(7,'Nicky'),
		(8,'Rachel'),
		(9,'Dull'),
		(9,'Hunter'),
		(10,'MacFeather'),
		(10,'Karsen'),
		(11,'Ringer'),
		(11,'Ane'),
		(12,'Ringer'),
		(13,'White'),
		(14,'Blotchet'),
		(14,'Locksley'),
		(15,'Panteley'),
		(16,'Miffin'),
		(17,'Stephen King'),
		(18,'Stephen King')

	;
	SELECT * FROM BOOK_AUTHORS;



	INSERT INTO LIBRARY_BRANCH
		(BranchID, BranchName,Address)
		VALUES 
		(1,'Sharpstown','Westminster'),
		(2,'Central','Anaheim'),
		(3,'Branch C','Moon'),
		(4,'Branch D','Sun')
	;
	SELECT * FROM LIBRARY_BRANCH;


	INSERT INTO BOOK_COPIES
		(BookID, BranchId, Number_Of_Copies)
		VALUES 
		(1, 1, 2),
		(2, 1, 3),
		(3, 1, 5),
		(4, 1, 2),
		(5, 1, 2),
		(6, 1, 2),
		(7, 1, 23),
		(8, 1, 6),
		(9, 1, 20),
		(10, 1, 26),
		(11, 2, 32),
		(12, 2, 22),
		(13, 2, 52),
		(14, 2, 12),
		(15, 2, 52),
		(16, 2, 32),
		(17, 2, 32),
		(18, 2, 22),
		(19, 1, 62),
		(20, 2, 42)
	;
	SELECT * FROM BOOK_COPIES;

	INSERT INTO BORROWER
		(CardNo, Name, Address, Phone)
		VALUES 
		(99, 'A', 'Add 99', 5443),
		(100, 'Mike', 'Add 1', 54222),
		(101, 'An', 'Add 2', 54122),
		(102, 'Lu', 'Add 3', 5422),
		(103, 'Peter', 'Add 4', 5422),
		(104, 'Lisa', 'Add 5', 5412222),
		(105, 'Mick', 'Add 6', 541222),
		(106, 'Goods', 'Add 7', 4232),
		(107, 'Tim', 'Add 8', 43),
		(108, 'Link', 'Add 9', 54222),
		(109, 'Tjhi', 'Add 10', 54322),
		(110, 'Howe', 'Add 12', 54232),
		(111, 'Ric,', 'Add 12', 4)
	;
	SELECT * FROM BORROWER;


	INSERT INTO BOOK_LOANS
		(BookID, BranchId, CardNo, DateOut, DateDue)
		VALUES 
		(1, 1, 100, '2006-05-30', CAST(GETDATE() AS DATE)),
		(2, 1, 100, '2006-05-30', CAST(GETDATE() AS DATE)),
		(3, 1, 101, '2006-05-30', '2006-12-30'),
		(4, 1, 101, '2006-05-30', '2006-12-30'),
		(5, 1, 103, '2006-05-30', '2006-12-30'),
		(6, 1, 104, '2006-05-30', '2006-12-30'),
		(7, 1, 105, '2006-05-30', '2006-12-30'),
		(8, 1, 106, '2006-05-30', '2006-12-30'),
		(9, 1, 108, '2006-05-30', '2006-12-30'),
		(10, 1, 109, '2006-05-30', '2006-12-30'),
		(1, 1, 110, '2006-05-30', '2006-12-30'),
		(2, 1, 111, '2006-05-30', '2006-12-30'),
		(3, 1, 100, '2006-05-30', '2006-12-30'),
		(4, 1, 100, '2006-05-30', '2006-12-30'),
		(5, 1, 101, '2006-05-30', '2006-12-30'),
		(6, 1, 102, '2006-05-30', '2006-12-30'),
		(7, 1, 103, '2006-05-30', '2006-12-30'),
		(8, 1, 104, '2006-05-30', '2006-12-30'),
		(9, 1, 101, '2006-05-30', '2006-12-30'),
		(10, 1, 102, '2006-05-30', '2006-12-30'),

		(11, 2, 101, '2006-05-30', '2006-12-30'),
		(12, 2, 102, '2006-05-30', '2006-12-30'),
		(13, 2, 103, '2006-05-30', '2006-12-30'),
		(14, 2, 104, '2006-05-30', '2006-12-30'),
		(15, 2, 105, '2006-05-30', '2006-12-30'),
		(16, 2, 106, '2006-05-30', '2006-12-30'),
		(17, 2, 107, '2006-05-30', '2006-12-30'),
		(18, 2, 108, '2006-05-30', '2006-12-30'),
		(19, 1, 109, '2006-05-30', '2006-12-30'),
		(20, 2, 110, '2006-05-30', '2006-12-30'),
		(11, 2, 111, '2006-05-30', '2006-12-30'),
		(12, 2, 101, '2006-05-30', '2006-12-30'),
		(13, 2, 102, '2006-05-30', '2006-12-30'),
		(14, 2, 103, '2006-05-30', '2006-12-30'),
		(15, 2, 104, '2006-05-30', '2006-12-30'),
		(16, 2, 105, '2006-05-30', '2006-12-30'),
		(17, 2, 106, '2006-05-30', '2006-12-30'),
		(18, 2, 107, '2006-05-30', '2006-12-30'),
		(19, 1, 108, '2006-05-30', '2006-12-30'),
		(20, 2, 109, '2006-05-30', '2006-12-30'),
		(11, 2, 110, '2006-05-30', '2006-12-30'),
		(12, 2, 102, '2006-05-30', '2006-12-30'),
		(13, 2, 102, '2006-05-30', '2006-12-30'),
		(14, 2, 101, '2006-05-30', '2006-12-30'),
		(15, 2, 103, '2006-05-30', '2006-12-30'),
		(16, 2, 103, '2006-05-30', '2006-12-30'),
		(17, 2, 104, '2006-05-30', '2006-12-30'),
		(18, 2, 105, '2006-05-30', '2006-12-30'),
		(19, 1, 106, '2006-05-30', '2006-12-30'),
		(20, 2, 107, '2006-05-30', '2006-12-30')
	;
	SELECT * FROM BOOK_LOANS;	
END

GO
