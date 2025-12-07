USE [Project]
GO

/****** Object:  StoredProcedure [STG].[SP_DimCountry]    Script Date: 01-Oct-25 2:46:53 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE  PROCEDURE DWH.[SP_DimCountry]
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


