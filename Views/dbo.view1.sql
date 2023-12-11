SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [dbo].[view1] 
AS --comment1
SELECT
  *
FROM AdventureWorks2022.Sales.Store
--comment2
GO