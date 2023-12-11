SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [dbo].[time] as
 SELECT SalesOrderID, OrderDate,
    OrderDate AT TIME ZONE 'Pacific Standard Time' AS OrderDate_TimeZonePST
FROM Sales.SalesOrderHeader;
GO