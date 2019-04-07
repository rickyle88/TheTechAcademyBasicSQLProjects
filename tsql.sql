--T-SQL

PRINT 'Hello World';

--Variable
DECLARE @myVar INT;
SET @myVar = 15;

PRINT @myVar;



--Concatenation
PRINT 'Having fun with ' + 'T-SQL and MS SQL Server';

--CHAR(13): enter key
--CHAR(9): tab key
DECLARE @var1 INT, @var2 INT;
SET @var1 = 3;
SET @var2 = 5;
PRINT 'I have ' + CONVERT(varchar(50),@var1) + CHAR(13) + ' dollars...';

--CONDITION STATEMENT
IF @var1 <= @var2
	BEGIN
		PRINT 'Variable 1: ' + CONVERT(varchar(50),@var1) + ' <= Variable 2: ' + CONVERT(varchar(50),@var2)  +CHAR(13);
	END
ELSE
	BEGIN
		PRINT 'Variable 1 > ' + CONVERT(varchar(50),@var1) + CHAR(13);
	END
