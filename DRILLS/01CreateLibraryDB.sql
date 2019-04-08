CREATE PROCEDURE [dbo].[library_system]
AS
BEGIN

	/******************************************************
	 * The following prevents any errors from occuring
	 * if the database or tables already exist.
	 * This code will close all active connections to the 
	 * database and then drop it
	 ******************************************************/

	WHILE EXISTS(select * from sys.databases where name='[library_system]')
	BEGIN
		DECLARE @SQL varchar(max)
		SELECT @SQL = COALESCE(@SQL,'') + 'Kill ' + Convert(varchar, SPId) + ';'
		FROM MASTER.sys.sysprocesses
		WHERE DBId = DB_ID(N'db_zoo') AND SPId <> @@SPId
		EXEC(@SQL)
		DROP DATABASE [library_system]
	END
	/******************************************************
	 * The following demonstrates a stored proceedure to 
	 * build the database, tables and then populate the 
	 * tables with data.
	 ******************************************************/

	CREATE DATABASE [library_system]

END