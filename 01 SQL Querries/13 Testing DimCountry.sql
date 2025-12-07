
exec STG.SP_DimCountry

select *
from stg.dimcountry

with a as(
	select distinct cast(Country as varchar) as CountryName 
	from stg.FactInvoice
	--order by 1
) 
SELECT 
    CountryName,

	 -- Country Short Name (ISO Alpha-2 code)
    CASE when CountryName = 'Australia' THEN 'AU'
       else '0'
   end

FROM a
order by CountryName


--END;
--GO


SELECT DATABASEPROPERTYEX('Project', 'Collation') AS DatabaseCollation;

SELECT 
    TABLE_NAME, 
    COLUMN_NAME, 
    DATA_TYPE, 
    COLLATION_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'Country'; SQL_Latin1_General_CP1_CI_AS


WITH a AS (
    SELECT DISTINCT LTRIM(RTRIM(CAST(Country AS NVARCHAR(100)))) AS CountryName
    FROM stg.FactInvoice
)
SELECT 
    CountryName,
    CASE 
        WHEN UPPER(CountryName) = 'Australia ' THEN 'AU'
        ELSE '0'
    END AS CountryCode
FROM a
ORDER BY CountryName;


SELECT DISTINCT LTRIM(RTRIM(CAST(Country AS NVARCHAR(100)))) AS CountryName
FROM stg.FactInvoice
order by 1 desc -- 'USA ' 'United Kingdom '


SELECT DISTINCT LTRIM(RTRIM(CAST(Country AS NVARCHAR(100)))) AS CountryName
FROM lz.Invoices 
order by 1 desc --'USA ' , 'United Kingdom '

SELECT 
    Country,
    LEN(Country) AS ActualLength,
    DATALENGTH(Country) AS DataBytes,
    ASCII(RIGHT(Country, 1)) AS LastCharCode
FROM stg.FactInvoice
WHERE Country LIKE 'United Kingdom%';

WITH a AS (
    SELECT DISTINCT 
           UPPER(
               LTRIM(RTRIM(
                   REPLACE(REPLACE(Country, CHAR(13), ''), CHAR(10), '')
               ))
           ) AS CountryName
    FROM stg.FactInvoice
)
SELECT 
    CountryName,
    CASE 
        WHEN CountryName = 'USA' THEN 'US'
        WHEN CountryName = 'UNITED KINGDOM' THEN 'GB'
        ELSE '0'
    END AS CountryCode
FROM a
ORDER BY CountryName;

