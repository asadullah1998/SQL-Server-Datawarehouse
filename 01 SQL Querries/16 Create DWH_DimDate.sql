--select min(InvoiceDate), max(InvoiceDate)
--from lz.Invoices

CREATE TABLE DWH.DimDate (
    DateKey INT NOT NULL PRIMARY KEY,  -- YYYYMMDD format
    FullDate DATE NOT NULL,
    DayOfMonth TINYINT NOT NULL,
    DayOfWeek TINYINT NOT NULL,        -- 1=Monday, 7=Sunday (ISO standard)
    DayName NVARCHAR(20) NOT NULL,
    IsWeekend BIT NOT NULL,
    WeekOfYear TINYINT NOT NULL,
    MonthNumber TINYINT NOT NULL,
    MonthName NVARCHAR(20) NOT NULL,
    QuarterNumber TINYINT NOT NULL,
    YearNumber SMALLINT NOT NULL,
    FirstDayOfMonth DATE NOT NULL,
    LastDayOfMonth DATE NOT NULL
);
