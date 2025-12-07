USE [Project]
GO

/****** Object:  Table [STG].[DimCustomer]    Script Date: 01-Oct-25 2:30:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE DWH.[DimCustomer](
	ID INT IDENTITY(1,1) PRIMARY KEY,  -- surrogate key
	[HashKey] [varbinary](8000) NULL,
	[CustomerID] [nvarchar](6) NULL,
	LoadDateTime DATETIME NOT NULL DEFAULT GETDATE()

) ON [PRIMARY]
GO


