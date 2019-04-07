USE AdventureWorks2014
GO

CREATE PROCEDURE dbo.GetPersonFirstLastName 
@Title nvarchar(30) = NULL, @EmailPromotion int = 2
AS
BEGIN 
	SELECT p.FirstName, p.LastName, o.OrderDate, o.ShipDate, o.SubTotal
	FROM Sales.SalesOrderHeader o
	INNER JOIN Sales.PersonCreditCard c
	ON o.CreditCardID = c.CreditCardID
	INNER JOIN Person.Person p
	ON c.BusinessEntityID = p.BusinessEntityID
	WHERE p.Title = @Title 
	AND p.EmailPromotion = @EmailPromotion;	
END