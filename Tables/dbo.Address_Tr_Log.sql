CREATE TABLE [dbo].[Address_Tr_Log] (
  [AddressID] [int] IDENTITY NOT FOR REPLICATION,
  [AddressLine1] [nvarchar](60) NOT NULL,
  [AddressLine2] [nvarchar](60) NULL,
  [City] [nvarchar](30) NOT NULL,
  [StateProvinceID] [int] NOT NULL,
  [PostalCode] [nvarchar](15) NOT NULL,
  [SpatialLocation] [geography] NULL,
  [rowguid] [uniqueidentifier] NOT NULL CONSTRAINT [DC_Address_Test_rowguid] DEFAULT (newid()) ROWGUIDCOL,
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DC_Address_Test_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_Address_Test_AddressID] PRIMARY KEY CLUSTERED ([AddressID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE UNIQUE INDEX [AK_Address_rowguid]
  ON [dbo].[Address_Tr_Log] ([rowguid])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCode]
  ON [dbo].[Address_Tr_Log] ([AddressLine1], [AddressLine2], [City], [StateProvinceID], [PostalCode])
  ON [PRIMARY]
GO

CREATE INDEX [IX_Address_StateProvinceID]
  ON [dbo].[Address_Tr_Log] ([StateProvinceID])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[Address_Tr_Log]
  ADD CONSTRAINT [FK_Address_Test_StateProvinceID] FOREIGN KEY ([StateProvinceID]) REFERENCES [Person].[StateProvince] ([StateProvinceID])
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing StateProvince.StateProvinceID.', 'SCHEMA', N'dbo', 'TABLE', N'Address_Tr_Log', 'CONSTRAINT', N'FK_Address_Test_StateProvinceID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Street address information for customers, employees, and vendors.', 'SCHEMA', N'dbo', 'TABLE', N'Address_Tr_Log'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for Address records.', 'SCHEMA', N'dbo', 'TABLE', N'Address_Tr_Log', 'COLUMN', N'AddressID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'First street address line.', 'SCHEMA', N'dbo', 'TABLE', N'Address_Tr_Log', 'COLUMN', N'AddressLine1'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Second street address line.', 'SCHEMA', N'dbo', 'TABLE', N'Address_Tr_Log', 'COLUMN', N'AddressLine2'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Name of the city.', 'SCHEMA', N'dbo', 'TABLE', N'Address_Tr_Log', 'COLUMN', N'City'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique identification number for the state or province. Foreign key to StateProvince table.', 'SCHEMA', N'dbo', 'TABLE', N'Address_Tr_Log', 'COLUMN', N'StateProvinceID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Postal code for the street address.', 'SCHEMA', N'dbo', 'TABLE', N'Address_Tr_Log', 'COLUMN', N'PostalCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Latitude and longitude of this address.', 'SCHEMA', N'dbo', 'TABLE', N'Address_Tr_Log', 'COLUMN', N'SpatialLocation'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'dbo', 'TABLE', N'Address_Tr_Log', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'dbo', 'TABLE', N'Address_Tr_Log', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'dbo', 'TABLE', N'Address_Tr_Log', 'INDEX', N'AK_Address_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'dbo', 'TABLE', N'Address_Tr_Log', 'INDEX', N'IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'dbo', 'TABLE', N'Address_Tr_Log', 'INDEX', N'IX_Address_StateProvinceID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'dbo', 'TABLE', N'Address_Tr_Log', 'INDEX', N'PK_Address_Test_AddressID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'dbo', 'TABLE', N'Address_Tr_Log', 'CONSTRAINT', N'PK_Address_Test_AddressID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'dbo', 'TABLE', N'Address_Tr_Log', 'CONSTRAINT', N'DC_Address_Test_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'dbo', 'TABLE', N'Address_Tr_Log', 'CONSTRAINT', N'DC_Address_Test_rowguid'
GO