USE [Project]
GO

/****** Object:  StoredProcedure [STG].[SP_DimCustomer]    Script Date: 01-Oct-25 2:46:53 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE  PROCEDURE DWH.[SP_DimCustomer]
AS
BEGIN
    SET NOCOUNT ON;


            INSERT INTO dwh.DimCustomer (HashKey
                                        ,CustomerID)
            SELECT *
            FROM stg.DimCustomer s
            WHERE NOT EXISTS (
                SELECT 1
                FROM dwh.DimCustomer d
                WHERE d.HashKey = s.HashKey
            );

END;
GO


