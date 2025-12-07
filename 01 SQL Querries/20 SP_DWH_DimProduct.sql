USE [Project]
GO

/****** Object:  StoredProcedure [STG].[SP_DimProduct]    Script Date: 01-Oct-25 2:46:53 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE  PROCEDURE DWH.[SP_DimProduct]
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


