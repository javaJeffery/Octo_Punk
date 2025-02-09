SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		J. Kirkland
-- Create date: 2025-02-08
-- Description:	Insert or Update a single row in 
--				the code table
-- =============================================
CREATE PROCEDURE [Common].[upuiCode] 
	-- Add the parameters for the stored procedure here
	 @ii_CodeID int = null
	,@ivc_Category varchar(128) = null
	,@ivc_CodeType varchar(64) 
	,@ivc_Code varchar(32)
	,@ivc_CodeDescription varchar(512)
	,@ivc_UpdatedBy varchar(128)
	
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @lvc_UpdatedBy varchar(128) = isnull(@ivc_UpdatedBy, 'Earl')
	DECLARE @lvc_UpdatedOn datetime = GETUTCDATE()

	IF isnull(@ii_CodeID, 0) = 0
	BEGIN
		INSERT INTO [Common].[code]
				   ([Category]
				   ,[CodeType]
				   ,[Code]
				   ,[CodeDescription]
				   ,[UpdatedBy]
				   ,[UpdatedOn])
		VALUES (@ivc_Category
		       ,@ivc_CodeType
			   ,@ivc_code
			   ,@ivc_CodeDescription
			   ,@lvc_UpdatedBy
			   ,@lvc_UpdatedOn)
	END ELSE BEGIN
		UPDATE [Common].[code]
		   SET [Category] = @ivc_Category
			  ,[CodeType] = @ivc_CodeType
			  ,[Code] = @ivc_code
			  ,[CodeDescription] = @ivc_CodeDescription
			  ,[UpdatedBy] = @lvc_UpdatedBy
			  ,[UpdatedOn] = @lvc_UpdatedOn
		 WHERE codeID = @ii_CodeID
	END

	SELECT SCOPE_IDENTITY()

END
GO
