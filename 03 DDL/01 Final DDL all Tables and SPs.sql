USE [master]
GO
/****** Object:  Database [Project]    Script Date: 01-Oct-25 10:17:10 PM ******/
CREATE DATABASE [Project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Project.mdf' , SIZE = 270336KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Project_log.ldf' , SIZE = 532480KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Project] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project] SET RECOVERY FULL 
GO
ALTER DATABASE [Project] SET  MULTI_USER 
GO
ALTER DATABASE [Project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Project] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Project', N'ON'
GO
ALTER DATABASE [Project] SET QUERY_STORE = ON
GO
ALTER DATABASE [Project] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Project]
GO
/****** Object:  Schema [DWH]    Script Date: 01-Oct-25 10:17:11 PM ******/
CREATE SCHEMA [DWH]
GO
/****** Object:  Schema [LZ]    Script Date: 01-Oct-25 10:17:11 PM ******/
CREATE SCHEMA [LZ]
GO
/****** Object:  Schema [STG]    Script Date: 01-Oct-25 10:17:11 PM ******/
CREATE SCHEMA [STG]
GO
/****** Object:  Table [DWH].[DimCountry]    Script Date: 01-Oct-25 10:17:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[DimCountry](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HashKey] [varbinary](8000) NULL,
	[CountryName] [nvarchar](50) NULL,
	[CountryCode] [varchar](2) NOT NULL,
	[DialingCode] [varchar](4) NULL,
	[Currency] [varchar](3) NOT NULL,
	[TimeZone] [varchar](14) NULL,
	[LoadDateTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [DWH].[DimCustomer]    Script Date: 01-Oct-25 10:17:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[DimCustomer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HashKey] [varbinary](8000) NULL,
	[CustomerID] [nvarchar](6) NULL,
	[LoadDateTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [DWH].[DimDate]    Script Date: 01-Oct-25 10:17:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[DimDate](
	[DateKey] [int] NOT NULL,
	[FullDate] [date] NOT NULL,
	[DayOfMonth] [tinyint] NOT NULL,
	[DayOfWeek] [tinyint] NOT NULL,
	[DayName] [nvarchar](20) NOT NULL,
	[IsWeekend] [bit] NOT NULL,
	[WeekOfYear] [tinyint] NOT NULL,
	[MonthNumber] [tinyint] NOT NULL,
	[MonthName] [nvarchar](20) NOT NULL,
	[QuarterNumber] [tinyint] NOT NULL,
	[YearNumber] [smallint] NOT NULL,
	[FirstDayOfMonth] [date] NOT NULL,
	[LastDayOfMonth] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [DWH].[DimProduct]    Script Date: 01-Oct-25 10:17:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[DimProduct](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HashKey] [varbinary](8000) NULL,
	[stockcode] [nvarchar](13) NULL,
	[description] [nvarchar](40) NULL,
	[LoadDateTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [DWH].[FactInvoice]    Script Date: 01-Oct-25 10:17:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[FactInvoice](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DimProductID] [int] NOT NULL,
	[DimCustomerID] [int] NOT NULL,
	[DimCountryID] [int] NOT NULL,
	[DimDateKey] [int] NOT NULL,
	[IsCancelledFLG] [bit] NULL,
	[IsBadDebtFLG] [bit] NULL,
	[InvoiceNo] [nvarchar](8) NULL,
	[InvoiceTimestamp] [datetime] NULL,
	[StockCode] [nvarchar](13) NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [decimal](10, 2) NULL,
	[LineTotal] [decimal](10, 2) NULL,
	[LoadDateTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [LZ].[Invoices]    Script Date: 01-Oct-25 10:17:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [LZ].[Invoices](
	[InvoiceNo] [nvarchar](max) NULL,
	[StockCode] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Quantity] [int] NULL,
	[InvoiceDate] [datetime] NULL,
	[UnitPrice] [decimal](10, 2) NULL,
	[CustomerID] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [STG].[DimCountry]    Script Date: 01-Oct-25 10:17:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[DimCountry](
	[HashKey] [varbinary](8000) NULL,
	[CountryName] [nvarchar](50) NULL,
	[CountryCode] [varchar](2) NOT NULL,
	[DialingCode] [varchar](4) NULL,
	[Currency] [varchar](3) NOT NULL,
	[TimeZone] [varchar](14) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [STG].[DimCustomer]    Script Date: 01-Oct-25 10:17:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[DimCustomer](
	[HashKey] [varbinary](8000) NULL,
	[CustomerID] [nvarchar](6) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [STG].[DimProduct]    Script Date: 01-Oct-25 10:17:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[DimProduct](
	[HashKey] [varbinary](8000) NULL,
	[stockcode] [nvarchar](13) NULL,
	[description] [nvarchar](40) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [STG].[FactInvoice]    Script Date: 01-Oct-25 10:17:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[FactInvoice](
	[InvoiceNo] [nvarchar](8) NULL,
	[IsCancelledFLG] [bit] NULL,
	[IsBadDebtFLG] [bit] NULL,
	[StockCode] [nvarchar](13) NULL,
	[Description] [nvarchar](40) NULL,
	[InvoiceTimestamp] [datetime] NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [decimal](10, 2) NULL,
	[LineTotal] [decimal](10, 2) NULL,
	[CustomerID] [nvarchar](6) NULL,
	[Country] [nvarchar](22) NULL
) ON [PRIMARY]
GO
ALTER TABLE [DWH].[DimCountry] ADD  DEFAULT (getdate()) FOR [LoadDateTime]
GO
ALTER TABLE [DWH].[DimCustomer] ADD  DEFAULT (getdate()) FOR [LoadDateTime]
GO
ALTER TABLE [DWH].[DimProduct] ADD  DEFAULT (getdate()) FOR [LoadDateTime]
GO
ALTER TABLE [DWH].[FactInvoice] ADD  DEFAULT (getdate()) FOR [LoadDateTime]
GO
ALTER TABLE [DWH].[FactInvoice]  WITH CHECK ADD  CONSTRAINT [FK_FactInvoice_DimCountry] FOREIGN KEY([DimCountryID])
REFERENCES [DWH].[DimCountry] ([ID])
GO
ALTER TABLE [DWH].[FactInvoice] CHECK CONSTRAINT [FK_FactInvoice_DimCountry]
GO
ALTER TABLE [DWH].[FactInvoice]  WITH CHECK ADD  CONSTRAINT [FK_FactInvoice_DimCustomer] FOREIGN KEY([DimCustomerID])
REFERENCES [DWH].[DimCustomer] ([ID])
GO
ALTER TABLE [DWH].[FactInvoice] CHECK CONSTRAINT [FK_FactInvoice_DimCustomer]
GO
ALTER TABLE [DWH].[FactInvoice]  WITH CHECK ADD  CONSTRAINT [FK_FactInvoice_DimDate] FOREIGN KEY([DimDateKey])
REFERENCES [DWH].[DimDate] ([DateKey])
GO
ALTER TABLE [DWH].[FactInvoice] CHECK CONSTRAINT [FK_FactInvoice_DimDate]
GO
ALTER TABLE [DWH].[FactInvoice]  WITH CHECK ADD  CONSTRAINT [FK_FactInvoice_DimProduct] FOREIGN KEY([DimProductID])
REFERENCES [DWH].[DimProduct] ([ID])
GO
ALTER TABLE [DWH].[FactInvoice] CHECK CONSTRAINT [FK_FactInvoice_DimProduct]
GO
/****** Object:  StoredProcedure [DWH].[SP_DimCountry]    Script Date: 01-Oct-25 10:17:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE  PROCEDURE [DWH].[SP_DimCountry]
AS
BEGIN
    SET NOCOUNT ON;


            INSERT INTO dwh.DimCountry (HashKey
                                        ,CountryName
                                        ,CountryCode
                                        ,DialingCode
                                        ,Currency
                                        ,TimeZone)
            SELECT *
            FROM stg.DimCountry s
            WHERE NOT EXISTS (
                SELECT 1
                FROM dwh.DimCountry d
                WHERE d.HashKey = s.HashKey
            );

END;
GO
/****** Object:  StoredProcedure [DWH].[SP_DimDate]    Script Date: 01-Oct-25 10:17:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [DWH].[SP_DimDate]
    @StartDate DATE, 
    @EndDate   DATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Safety check
    IF @StartDate IS NULL OR @EndDate IS NULL
    BEGIN
        RAISERROR('StartDate and EndDate must be provided.', 16, 1);
        RETURN;
    END

    IF @EndDate < @StartDate
    BEGIN
        RAISERROR('EndDate cannot be earlier than StartDate.', 16, 1);
        RETURN;
    END

    -- Optional: clear table before inserting new data
    TRUNCATE TABLE DWH.DimDate;

    ;WITH DateSequence AS (
        SELECT @StartDate AS FullDate
        UNION ALL
        SELECT DATEADD(DAY, 1, FullDate)
        FROM DateSequence
        WHERE FullDate < @EndDate
    )
    INSERT INTO DWH.DimDate (
        DateKey,
        FullDate,
        DayOfMonth,
        DayOfWeek,
        DayName,
        IsWeekend,
        WeekOfYear,
        MonthNumber,
        MonthName,
        QuarterNumber,
        YearNumber,
        FirstDayOfMonth,
        LastDayOfMonth
    )
    SELECT
        CONVERT(INT, CONVERT(CHAR(8), FullDate, 112)) AS DateKey,
        FullDate,
        DAY(FullDate) AS DayOfMonth,
        DATEPART(WEEKDAY, FullDate) AS DayOfWeek,
        DATENAME(WEEKDAY, FullDate) AS DayName,
        CASE WHEN DATENAME(WEEKDAY, FullDate) IN ('Saturday', 'Sunday') THEN 1 ELSE 0 END AS IsWeekend,
        DATEPART(WEEK, FullDate) AS WeekOfYear,
        MONTH(FullDate) AS MonthNumber,
        DATENAME(MONTH, FullDate) AS MonthName,
        DATEPART(QUARTER, FullDate) AS QuarterNumber,
        YEAR(FullDate) AS YearNumber,
        DATEFROMPARTS(YEAR(FullDate), MONTH(FullDate), 1) AS FirstDayOfMonth,
        EOMONTH(FullDate) AS LastDayOfMonth
    FROM DateSequence
    OPTION (MAXRECURSION 0);

END;
GO
/****** Object:  StoredProcedure [DWH].[SP_DimProduct]    Script Date: 01-Oct-25 10:17:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE  PROCEDURE [DWH].[SP_DimProduct]
AS
BEGIN
    SET NOCOUNT ON;


            INSERT INTO dwh.DimProduct (HashKey , stockcode, description)
            SELECT *
            FROM stg.DimProduct s
            WHERE NOT EXISTS (
                SELECT 1
                FROM dwh.DimProduct d
                WHERE d.HashKey = s.HashKey
            );

END;
GO
/****** Object:  StoredProcedure [DWH].[SP_FactInvoices]    Script Date: 01-Oct-25 10:17:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [DWH].[SP_FactInvoices] as
Begin


insert into DWH.FactInvoice (DimProductID
							 ,DimCustomerID
							 ,DimCountryID
							 ,DimDateKey
							 ,IsCancelledFLG
							 ,IsBadDebtFLG
							 ,InvoiceNo
							 ,InvoiceTimestamp
							 ,StockCode
							 ,Quantity
							 ,UnitPrice
							 ,LineTotal)

select	 coalesce(dpr.id, -1) as DimProductID
		,coalesce(dp.id, -1) as DimCustomerID
		,coalesce(dc.id, -1) as DimCountryID
		,coalesce(dd.datekey, -1) as DimDateKey
		,f.IsCancelledFLG
		,f.IsBadDebtFLG
		,f.InvoiceNo
		,f.InvoiceTimestamp
		,f.StockCode
		,f.Quantity
		,f.UnitPrice
		,f.LineTotal

from stg.factinvoice F left join dwh.DimCustomer dp on f.CustomerID = dp.CustomerID 
					   left join dwh.DimProduct dpr on f.stockCode = dpr.StockCode
					   left join dwh.DimCountry dc  on LTRIM(RTRIM(REPLACE(REPLACE(f.Country, CHAR(13), ''), CHAR(10), '') ))   = dc.CountryName
					   left join dwh.DimDate dd     on convert(Date,f.InvoiceTimestamp) = dd.FullDate


end
GO
/****** Object:  StoredProcedure [LZ].[Invoices_Data_Load]    Script Date: 01-Oct-25 10:17:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [LZ].[Invoices_Data_Load]
AS
BEGIN

Truncate table LZ.Invoices;


BULK INSERT LZ.Invoices
FROM 'C:\Users\helpdesk\Desktop\Project Case Study\00 online_retail.csv\online_retail.csv' 
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,              -- skip header row
    FIELDTERMINATOR = ',',     -- CSV delimiter
    ROWTERMINATOR = '0x0a',    -- newline
    TABLOCK
);

END
GO
/****** Object:  StoredProcedure [STG].[SP_DimCountry]    Script Date: 01-Oct-25 10:17:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE  PROCEDURE [STG].[SP_DimCountry]
AS
BEGIN
    SET NOCOUNT ON;

Truncate table STG.DimCountry;

with a as(
	--select distinct ltrim(rtrim(Country)) as CountryName
	--from stg.FactInvoice
	--order by 1

	 SELECT DISTINCT 
           
               LTRIM(RTRIM(
                   REPLACE(REPLACE(Country, CHAR(13), ''), CHAR(10), '') --The Last character was not a space it was a CRLF character so we need to do this
               )
           ) AS CountryName
    FROM stg.FactInvoice
) 


insert into STG.DimCountry

SELECT 
	HASHBYTES('MD5', CountryName) AS HashKey,
    CountryName,

	 -- Country Short Name (ISO Alpha-2 code)
    CASE CountryName
        WHEN 'Australia' THEN 'AU'
        WHEN 'Austria' THEN 'AT'
        WHEN 'Bahrain' THEN 'BH'
        WHEN 'Belgium' THEN 'BE'
        WHEN 'Brazil' THEN 'BR'
        WHEN 'Canada' THEN 'CA'
        WHEN 'Channel Islands' THEN 'JE'
        WHEN 'Cyprus' THEN 'CY'
        WHEN 'Czech Republic' THEN 'CZ'
        WHEN 'Denmark' THEN 'DK'
        WHEN 'EIRE' THEN 'IE'
        WHEN 'European Community' THEN 'EU'
        WHEN 'Finland' THEN 'FI'
        WHEN 'France' THEN 'FR'
        WHEN 'Germany' THEN 'DE'
        WHEN 'Greece' THEN 'GR'
        WHEN 'Hong Kong' THEN 'HK'
        WHEN 'Iceland' THEN 'IS'
        WHEN 'Israel' THEN 'IL'
        WHEN 'Italy' THEN 'IT'
        WHEN 'Japan' THEN 'JP'
        WHEN 'Lebanon' THEN 'LB'
        WHEN 'Lithuania' THEN 'LT'
        WHEN 'Malta' THEN 'MT'
        WHEN 'Netherlands' THEN 'NL'
        WHEN 'Norway' THEN 'NO'
        WHEN 'Poland' THEN 'PL'
        WHEN 'Portugal' THEN 'PT'
        WHEN 'RSA' THEN 'ZA'
        WHEN 'Saudi Arabia' THEN 'SA'
        WHEN 'Singapore' THEN 'SG'
        WHEN 'Spain' THEN 'ES'
        WHEN 'Sweden' THEN 'SE'
        WHEN 'Switzerland' THEN 'CH'
        WHEN 'United Arab Emirates' THEN 'AE'
        WHEN 'United Kingdom' THEN 'GB'
        WHEN 'Unspecified' THEN '-1'
        WHEN 'USA' THEN 'US'
		ELSE '-1'
    END AS CountryCode,

    -- Dialing code
    CASE CountryName
        WHEN 'Australia'          THEN '+61' 
        WHEN 'Austria'            THEN '+43'
        WHEN 'Bahrain'            THEN '+973'
        WHEN 'Belgium'            THEN '+32'
        WHEN 'Brazil'             THEN '+55'
        WHEN 'Canada'             THEN '+1'
        WHEN 'Channel Islands'    THEN '+44'
        WHEN 'Cyprus'             THEN '+357'
        WHEN 'Czech Republic'     THEN '+420'
        WHEN 'Denmark'            THEN '+45'
        WHEN 'EIRE'               THEN '+353'  -- Ireland
        WHEN 'European Community' THEN NULL    -- not a single dialing code
        WHEN 'Finland'            THEN '+358'
        WHEN 'France'             THEN '+33'
        WHEN 'Germany'            THEN '+49'
        WHEN 'Greece'             THEN '+30'
        WHEN 'Hong Kong'          THEN '+852'
        WHEN 'Iceland'            THEN '+354'
        WHEN 'Israel'             THEN '+972'
        WHEN 'Italy'              THEN '+39'
        WHEN 'Japan'              THEN '+81'
        WHEN 'Lebanon'            THEN '+961'
        WHEN 'Lithuania'          THEN '+370'
        WHEN 'Malta'              THEN '+356'
        WHEN 'Netherlands'        THEN '+31'
        WHEN 'Norway'             THEN '+47'
        WHEN 'Poland'             THEN '+48'
        WHEN 'Portugal'           THEN '+351'
        WHEN 'RSA'                THEN '+27'   -- South Africa
        WHEN 'Saudi Arabia'       THEN '+966'
        WHEN 'Singapore'          THEN '+65'
        WHEN 'Spain'              THEN '+34'
        WHEN 'Sweden'             THEN '+46'
        WHEN 'Switzerland'        THEN '+41'
        WHEN 'United Arab Emirates' THEN '+971'
        WHEN 'United Kingdom'     THEN '+44'
        WHEN 'USA'                THEN '+1'
        ELSE '-1'

    END AS DialingCode,
	    
		
		-- Currency
    CASE CountryName
        WHEN 'Australia' THEN 'AUD'
        WHEN 'Austria' THEN 'EUR'
        WHEN 'Bahrain' THEN 'BHD'
        WHEN 'Belgium' THEN 'EUR'
        WHEN 'Brazil' THEN 'BRL'
        WHEN 'Canada' THEN 'CAD'
        WHEN 'Channel Islands' THEN 'GBP'
        WHEN 'Cyprus' THEN 'EUR'
        WHEN 'Czech Republic' THEN 'CZK'
        WHEN 'Denmark' THEN 'DKK'
        WHEN 'EIRE' THEN 'EUR'
        WHEN 'European Community' THEN 'EUR'
        WHEN 'Finland' THEN 'EUR'
        WHEN 'France' THEN 'EUR'
        WHEN 'Germany' THEN 'EUR'
        WHEN 'Greece' THEN 'EUR'
        WHEN 'Hong Kong' THEN 'HKD'
        WHEN 'Iceland' THEN 'ISK'
        WHEN 'Israel' THEN 'ILS'
        WHEN 'Italy' THEN 'EUR'
        WHEN 'Japan' THEN 'JPY'
        WHEN 'Lebanon' THEN 'LBP'
        WHEN 'Lithuania' THEN 'EUR'
        WHEN 'Malta' THEN 'EUR'
        WHEN 'Netherlands' THEN 'EUR'
        WHEN 'Norway' THEN 'NOK'
        WHEN 'Poland' THEN 'PLN'
        WHEN 'Portugal' THEN 'EUR'
        WHEN 'RSA' THEN 'ZAR'
        WHEN 'Saudi Arabia' THEN 'SAR'
        WHEN 'Singapore' THEN 'SGD'
        WHEN 'Spain' THEN 'EUR'
        WHEN 'Sweden' THEN 'SEK'
        WHEN 'Switzerland' THEN 'CHF'
        WHEN 'United Arab Emirates' THEN 'AED'
        WHEN 'United Kingdom' THEN 'GBP'
        WHEN 'Unspecified' THEN '-1'
        WHEN 'USA' THEN 'USD'
		ELSE '-1'
    END AS Currency,
    
	    -- Timezone (generalized)
    CASE CountryName
        WHEN 'Australia'          THEN 'UTC+10'
        WHEN 'Austria'            THEN 'UTC+1'
        WHEN 'Bahrain'            THEN 'UTC+3'
        WHEN 'Belgium'            THEN 'UTC+1'
        WHEN 'Brazil'             THEN 'UTC-3'
        WHEN 'Canada'             THEN 'UTC-5 to UTC-8'
        WHEN 'Channel Islands'    THEN 'UTC+0'
        WHEN 'Cyprus'             THEN 'UTC+2'
        WHEN 'Czech Republic'     THEN 'UTC+1'
        WHEN 'Denmark'            THEN 'UTC+1'
        WHEN 'EIRE'               THEN 'UTC+0'
        WHEN 'European Community' THEN NULL
        WHEN 'Finland'            THEN 'UTC+2'
        WHEN 'France'             THEN 'UTC+1'
        WHEN 'Germany'            THEN 'UTC+1'
        WHEN 'Greece'             THEN 'UTC+2'
        WHEN 'Hong Kong'          THEN 'UTC+8'
        WHEN 'Iceland'            THEN 'UTC+0'
        WHEN 'Israel'             THEN 'UTC+2'
        WHEN 'Italy'              THEN 'UTC+1'
        WHEN 'Japan'              THEN 'UTC+9'
        WHEN 'Lebanon'            THEN 'UTC+2'
        WHEN 'Lithuania'          THEN 'UTC+2'
        WHEN 'Malta'              THEN 'UTC+1'
        WHEN 'Netherlands'        THEN 'UTC+1'
        WHEN 'Norway'             THEN 'UTC+1'
        WHEN 'Poland'             THEN 'UTC+1'
        WHEN 'Portugal'           THEN 'UTC+0'
        WHEN 'RSA'                THEN 'UTC+2'
        WHEN 'Saudi Arabia'       THEN 'UTC+3'
        WHEN 'Singapore'          THEN 'UTC+8'
        WHEN 'Spain'              THEN 'UTC+1'
        WHEN 'Sweden'             THEN 'UTC+1'
        WHEN 'Switzerland'        THEN 'UTC+1'
        WHEN 'United Arab Emirates' THEN 'UTC+4'
        WHEN 'United Kingdom'     THEN 'UTC+0'
        WHEN 'USA'                THEN 'UTC-5 to UTC-8'
        
		ELSE '-1'

    END AS TimeZone
   
FROM a
order by CountryName


END;
GO
/****** Object:  StoredProcedure [STG].[SP_DimCustomer]    Script Date: 01-Oct-25 10:17:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [STG].[SP_DimCustomer]
AS
BEGIN
    SET NOCOUNT ON;

Truncate table STG.DimCustomer;

insert into STG.DimCustomer

select distinct HASHBYTES('MD5', CustomerID) AS HashKey,
CustomerID
from stg.FactInvoice



END;
GO
/****** Object:  StoredProcedure [STG].[SP_DimProduct]    Script Date: 01-Oct-25 10:17:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [STG].[SP_DimProduct]
AS
BEGIN
    SET NOCOUNT ON;

Truncate table STG.DimProduct;


with a as(
	select distinct StockCode, Description --5634
	from stg.FactInvoice
	)

, b as(
			SELECT *, 
			DENSE_RANK() OVER (partition by stockcode    ORDER BY LEN(description) DESC, description asc /*description is added to break tie*/) AS LengthRank
			FROM a
		--order by StockCode 
)

insert into STG.DimProduct
select 
HASHBYTES('MD5', stockcode) AS HashKey,
stockcode, description 
from b 
where LengthRank = 1 



END;
GO
/****** Object:  StoredProcedure [STG].[SP_FactInvoice]    Script Date: 01-Oct-25 10:17:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [STG].[SP_FactInvoice]
AS
BEGIN
    SET NOCOUNT ON;

    


	--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	--Step 1: Make everything consistent 
	drop table if exists ##temp1 
	drop table if exists ##temp2 
	
	select InvoiceNo,
		case when InvoiceNo LIKE 'C%'  then 1 else 0 end IsCancelledFLG,
		case when InvoiceNo LIKE 'A%'  then 1 else 0 end IsBadDebtFLG,
		StockCode,
		isnull(Description,'N/A') as [Description],
		InvoiceDate as InvoiceTimestamp,
		Quantity,
		UnitPrice,
		--Quantity*UnitPrice as LineTotal,
		--case when cast(left(customerid,5) as int) is null then -1 else cast(left(customerid,5) as int) end CustomerID, --Represents missing Value
		isnull( cast(left(customerid,5) as int), -1)  CustomerID, --Represents missing Value
		
		--customerid,
		Country
	into ##temp1
	from lz.Invoices
   where InvoiceDate < getdate() --removing future dated invoices
   and InvoiceNo is not null --Removing records where business key is null
   and StockCode is not null --Removing records where business key is null
   
   --select top 10 *
	--from ##temp1


   --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   --Step2: Fix duplicate business key issue
   -- If there was a single item with differenct quanities, but same unit price as seperate line item then we add those quantities, because that is common barcode scannng error
   --but if the unit price is seperate then we need to remove these records, as they distort our business key
    
   select  
		 InvoiceNo          
		,IsCancelledFLG     
		,IsBadDebtFLG       
		,StockCode		   
		,Description		   
		,InvoiceTimestamp   
		,sum(Quantity   ) as    Quantity     
		,UnitPrice     as      UnitPrice
		,CustomerID         
		,Country   

   into ##temp2
   from ##temp1
   group by 
    InvoiceNo        
   ,IsCancelledFLG   
   ,IsBadDebtFLG     
   ,StockCode		  
   ,Description		
   ,InvoiceTimestamp 
   ,UnitPrice          
   ,CustomerID         
   ,Country  

     --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   --Step3: Remove duplicates

   TRUNCATE TABLE STG.FactInvoice;

    -- Insert cleaned data into staging
    INSERT INTO STG.FactInvoice (
		InvoiceNo          
		,IsCancelledFLG     
		,IsBadDebtFLG       
		,StockCode		   
		,Description		   
		,InvoiceTimestamp   
		,Quantity           
		,UnitPrice          
		,LineTotal          
		,CustomerID         
		,Country            
    )
  select InvoiceNo          
		,IsCancelledFLG     
		,IsBadDebtFLG       
		,StockCode		   
		,Description		   
		,InvoiceTimestamp   
		,Quantity           
		,UnitPrice          
		   ,Quantity   *  UnitPrice   as      LineTotal 
		,CustomerID         
		,Country 
from ##temp2
where InvoiceNo + StockCode not in (
									select InvoiceNo+StockCode
									from ##temp2
									group by InvoiceNo, StockCode
									having count(1) > 1 
)


END;
GO
USE [master]
GO
ALTER DATABASE [Project] SET  READ_WRITE 
GO
