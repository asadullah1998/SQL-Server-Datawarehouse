

CREATE OR ALTER PROCEDURE DWH.SP_DimDate
    @StartDate DATE, 
    @EndDate   DATE
AS
BEGIN
   

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
