SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		J. Kirkland
-- Create date: 2025-02-08
-- Description:	Inserts a row in the game table.
-- =============================================
CREATE PROCEDURE [Common].[upuiGame] 
	-- Add the parameters for the stored procedure here
	 @ii_GameID int 
	,@ivc_GameName varchar(128)
	,@ii_GamesPlayed int
	,@ii_CampaignsPlayed int
	,@ii_Wins int
	,@ii_losses int
	,@ivc_UpdatedBy varchar(128)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	BEGIN TRAN

	BEGIN TRY
		IF ISNULL(@ii_GameID, -1) = -1
		BEGIN

			INSERT INTO [Common].[Game]
					   ([GameName]
					   ,[GamesPlayed]
					   ,[CampaignsPlayed]
					   ,[Wins]
					   ,[Losses]
					   ,[UpdatedBy]
					   ,[UpdatedOn]
			)
			VALUES(@ivc_GameName
			      ,@ii_GamesPlayed
				  ,@ii_CampaignsPlayed
				  ,@ii_Wins
				  ,@ii_Losses
				  ,ISNULL(@ivc_UpdatedBy, 'Earl')
				  ,GETUTCDATE()
			)


		END
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
