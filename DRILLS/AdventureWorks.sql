USE AdventureWorks2014
GO

ALTER PROCEDURE dbo.uspGetAddress 
@City nvarchar(30) = NULL, @AddressLine1 nvarchar(60) = NULL
AS
BEGIN
	SELECT *
	FROM Person.Address
	--WHERE City = @City
	--WHERE City = ISNULL(@City,City)
	WHERE City LIKE '%' + ISNULL(@City,City) + '%'
	AND AddressLine1 LIKE '%' + ISNULL(@AddressLine1,AddressLine1) + '%'
	--WHERE City = ISNULL(@City, City)
END