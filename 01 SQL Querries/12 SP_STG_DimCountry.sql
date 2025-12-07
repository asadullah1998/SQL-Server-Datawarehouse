

Create  PROCEDURE STG.SP_DimCountry
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
	HASHBYTES('MD5', CountryName) AS ID,
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

