USE [library_system]
GO

SELECT *
FROM LIBRARY_BRANCH;


--1.) How many copies of the book titled "The Lost Tribe" are owned by the library branch 
--whose name is "Sharpstown"?
CREATE PROCEDURE [dbo].[drill1]
AS
BEGIN
	--SELECT B.Title, BC.BranchId, BC.Number_Of_Copies
	SELECT BC.Number_Of_Copies
	FROM BOOKS B
	INNER JOIN BOOK_COPIES BC
	ON B.BookID = BC.BookID
	INNER JOIN LIBRARY_BRANCH LB
	ON BC.BranchId = LB.BranchID
	WHERE B.Title = 'The Lost Tribe'
	AND LB.BranchName = 'Sharpstown'
END

--2.) How many copies of the book titled "The Lost Tribe" are owned by each library branch?
CREATE PROCEDURE [dbo].[drill2]
AS
BEGIN
	SELECT B.Title, BC.BranchId, BC.Number_Of_Copies, LB.BranchName
	--SELECT BC.Number_Of_Copies
	FROM BOOKS B
	JOIN BOOK_COPIES BC
	ON B.BookID = BC.BookID
	JOIN LIBRARY_BRANCH LB
	ON BC.BranchId = LB.BranchID
	WHERE B.Title = 'The Lost Tribe'

	SELECT *
	FROM LIBRARY_BRANCH LB
	LEFT JOIN BOOK_COPIES BC
	ON LB.BranchID = BC.BranchId
	LEFT JOIN BOOKS B
	ON BC.BookID = B.BookID
	WHERE B.Title = 'The Lost Tribe'
END

--3.) Retrieve the names of all borrowers who do not have any books checked out.
CREATE PROCEDURE [dbo].[drill3]
AS
BEGIN
	SELECT B.NAME, B.CardNo
	FROM BORROWER B
	LEFT JOIN BOOK_LOANS BL
	ON B.CardNo = BL.CardNo
	WHERE BL.CardNo IS NULL
END

--4.) For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, 
	--retrieve the book title, the borrower's name, and the borrower's address.
CREATE PROCEDURE [dbo].[drill4]
AS
BEGIN
	SELECT B.Title, BR.Name, BR.Address
	--SELECT BC.Number_Of_Copies
	FROM BOOKS B
	JOIN BOOK_LOANS BL
	ON B.BookID = BL.BookID
	JOIN LIBRARY_BRANCH LB
	ON BL.BranchId = LB.BranchID
	JOIN BORROWER BR
	ON BL.CardNo = BR.CardNo
	WHERE LB.BranchName = 'Sharpstown'
	AND BL.DateDue = CAST(GETDATE() AS DATE)
	
END

--5.) For each library branch, retrieve the branch name and 
--the total number of books loaned out from that branch.

CREATE PROCEDURE [dbo].[drill5]
AS
BEGIN
	SELECT LB.BranchName, COUNT(BookID) 'TOTAL'
	FROM LIBRARY_BRANCH LB
	INNER JOIN BOOK_LOANS BL
	ON LB.BranchID = BL.BranchId
	GROUP BY LB.BranchName	
END

--6.) Retrieve the names, addresses, and the number of books checked out for all borrowers 
--who have more than five books checked out.
CREATE PROCEDURE [dbo].[drill6]
AS
BEGIN
	

		SELECT BL.CardNo, COUNT(BL.BookID)
		FROM BOOK_LOANS BL
		GROUP BY BL.CardNo
		HAVING COUNT(BL.BookID) >= 5
	
END

--7.) For each book authored (or co-authored) by "Stephen King", 
--retrieve the title and the number of copies owned by the library branch whose name is "Central".

CREATE PROCEDURE [dbo].[drill7]
AS
BEGIN
	SELECT b.Title, bc.Number_Of_Copies
	FROM BOOK_COPIES BC
	INNER JOIN LIBRARY_BRANCH LB
	ON BC.BranchId = LB.BranchID
	INNER JOIN BOOKS B
	ON BC.BookID = B.BookID
	INNER JOIN BOOK_AUTHORS BA
	ON BC.BookID = BA.BookID
	WHERE BA.AuthorName = 'Stephen King'
	AND LB.BranchName = 'Central'
END
