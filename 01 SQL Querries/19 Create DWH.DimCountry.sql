USE [Project]
GO

/****** Object:  Table [STG].[DimCountry]    Script Date: 01-Oct-25 2:27:57 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE DWH.[DimCountry](
    ID INT IDENTITY(1,1) PRIMARY KEY,  -- surrogate key
	[HashKey] [varbinary](8000) NULL,
	[CountryName] [nvarchar](50) NULL,
	[CountryCode] [varchar](2) NOT NULL,
	[DialingCode] [varchar](4) NULL,
	[Currency] [varchar](3) NOT NULL,
	[TimeZone] [varchar](14) NULL,
	LoadDateTime DATETIME NOT NULL DEFAULT GETDATE()
) ON [PRIMARY]
GO

drop table DWH.[DimCountry]
