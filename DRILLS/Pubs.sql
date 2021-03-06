/****** Script for SelectTopNRows command from SSMS  ******/
USE pubs
GO

SELECT t.title_id, t.title, t. ,p.pub_name, 
FROM dbo.titles t
INNER JOIN dbo.publishers p
ON t.pub_id = p.pub_id;

SELECT t.title_id, t.title, a.au_fname, a.au_lname
FROM dbo.titles t
INNER JOIN dbo.titleauthor ta
ON t.title_id = ta.title_id
INNER JOIN dbo.authors a
ON ta.au_id = a.au_id;


SELECT *
FROM dbo.titleauthor;

SELECT *
FROM dbo.authors;
