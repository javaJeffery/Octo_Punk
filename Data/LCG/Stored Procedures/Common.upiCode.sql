SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		J. Kirkland
-- Create date: 2025-02-08
-- Description:	Insert multiple rows into the code table
-- =============================================
CREATE PROCEDURE [Common].[upiCode] 
	-- Add the parameters for the stored procedure here
	@itt_Code Common.uttCode READONLY
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRAN

	 BEGIN TRY
    -- Insert statements for procedure here
		INSERT INTO [Common].[code]
			   ([Category]
			   ,[CodeType]
			   ,[Code]
			   ,[CodeDescription]
			   ,[UpdatedBy]
			   ,[UpdatedOn])
		SELECT a.Category
			 , a.CodeType
			 , a.Code
			 , a.CodeDescription
			 , ISNULL(a.UpdatedBy, 'Earl')
			 , GETUTCDATE()
		  FROM @itt_Code a

		COMMIT TRAN
	 END TRY
	 BEGIN CATCH
		SELECT
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_STATE() AS ErrorState,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_LINE() AS ErrorLine,
			ERROR_MESSAGE() AS ErrorMessage;

			ROLLBACK TRAN
	 END CATCH
	
END
GO
