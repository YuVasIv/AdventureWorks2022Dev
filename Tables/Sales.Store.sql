﻿CREATE TABLE [Sales].[Store] (
  [BusinessEntityID] [int] NOT NULL,
  [Name] [dbo].[Name] NOT NULL,
  [SalesPersonID] [int] NULL,
  [Demographics] [xml] (CONTENT Sales.StoreSurveySchemaCollection) NULL,
  [rowguid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Store_rowguid] DEFAULT (newid()) ROWGUIDCOL,
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_Store_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_Store_BusinessEntityID] PRIMARY KEY CLUSTERED ([BusinessEntityID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PRIMARY XML INDEX [PXML_Store_Demographics]
  ON [Sales].[Store] ([Demographics])
GO

CREATE UNIQUE INDEX [AK_Store_rowguid]
  ON [Sales].[Store] ([rowguid])
  ON [PRIMARY]
GO

CREATE INDEX [IX_Store_SalesPersonID]
  ON [Sales].[Store] ([SalesPersonID])
  ON [PRIMARY]
GO

ALTER TABLE [Sales].[Store] WITH NOCHECK
  ADD CONSTRAINT [FK_Store_BusinessEntity_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Person].[BusinessEntity] ([BusinessEntityID])
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing BusinessEntity.BusinessEntityID', 'SCHEMA', N'Sales', 'TABLE', N'Store', 'CONSTRAINT', N'FK_Store_BusinessEntity_BusinessEntityID'
GO

ALTER TABLE [Sales].[Store] WITH NOCHECK
  ADD CONSTRAINT [FK_Store_SalesPerson_SalesPersonID] FOREIGN KEY ([SalesPersonID]) REFERENCES [Sales].[SalesPerson] ([BusinessEntityID])
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing SalesPerson.SalesPersonID', 'SCHEMA', N'Sales', 'TABLE', N'Store', 'CONSTRAINT', N'FK_Store_SalesPerson_SalesPersonID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary XML index.', 'SCHEMA', N'Sales', 'TABLE', N'Store', 'INDEX', N'PXML_Store_Demographics'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Customers (resellers) of Adventure Works products.', 'SCHEMA', N'Sales', 'TABLE', N'Store'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key. Foreign key to Customer.BusinessEntityID.', 'SCHEMA', N'Sales', 'TABLE', N'Store', 'COLUMN', N'BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Name of the store.', 'SCHEMA', N'Sales', 'TABLE', N'Store', 'COLUMN', N'Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ID of the sales person assigned to the customer. Foreign key to SalesPerson.BusinessEntityID.', 'SCHEMA', N'Sales', 'TABLE', N'Store', 'COLUMN', N'SalesPersonID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Demographic informationg about the store such as the number of employees, annual sales and store type.', 'SCHEMA', N'Sales', 'TABLE', N'Store', 'COLUMN', N'Demographics'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Sales', 'TABLE', N'Store', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Sales', 'TABLE', N'Store', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'Sales', 'TABLE', N'Store', 'INDEX', N'AK_Store_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Sales', 'TABLE', N'Store', 'INDEX', N'IX_Store_SalesPersonID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Sales', 'TABLE', N'Store', 'INDEX', N'PK_Store_BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Sales', 'TABLE', N'Store', 'CONSTRAINT', N'PK_Store_BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Sales', 'TABLE', N'Store', 'CONSTRAINT', N'DF_Store_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Sales', 'TABLE', N'Store', 'CONSTRAINT', N'DF_Store_rowguid'
GO