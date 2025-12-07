USE [Project]
GO

/****** Object:  Table [STG].[DimProduct]    Script Date: 01-Oct-25 2:32:05 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE DWH.[DimProduct](
		ID INT IDENTITY(1,1) PRIMARY KEY,  -- surrogate key
	[HashKey] [varbinary](8000) NULL,
	[stockcode] [nvarchar](13) NULL,
	[description] [nvarchar](40) NULL,
		LoadDateTime DATETIME NOT NULL DEFAULT GETDATE()

) ON [PRIMARY]
GO

