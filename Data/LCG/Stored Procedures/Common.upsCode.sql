SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
--====================================================================================================================
-- Procedure Name : upsCode
-- Original Author: Jeffery Kirkland
-- Create Date    : 2025-02-11
-- Description    : Retrieve values from code table
-- Usage          : Declare @codeID INT = n
--                  Exec Common.upsCode (@codeID)
----------------------------------------------------------------------------------------------------------------------
-- Update History
-- Author               Date       Description
----------------------------------------------------------------------------------------------------------------------
-- J. Kirkland          2025-02-11 Initial Revision
--====================================================================================================================
CREATE   PROCEDURE [Common].[upsCode]
    (
        @CodeID INT = NULL
    )
AS
BEGIN
    SELECT c.CodeID
         , c.Category
         , c.CodeType
         , c.Code
         , c.CodeDescription
         , c.UpdatedBy
         , c.UpdatedOn
         , c.RowVer
         , c.IsDeleted
      FROM Code c
     WHERE CodeID = ISNULL(@CodeID, CodeID);
END
GO
