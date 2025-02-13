CREATE TABLE [Common].[Code]
(
[CodeID] [int] NOT NULL IDENTITY(1, 1),
[Category] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CodeType] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Code] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CodeDescription] [varchar] (512) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[UpdatedBy] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[UpdatedOn] [datetime] NOT NULL,
[RowVer] [timestamp] NOT NULL,
[IsDeleted] [bit] NOT NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		J. Kirkland
-- Create date: 2025-02-11
-- Description:	Delete Trigger for Common.code
-- =============================================
CREATE TRIGGER [Common].[trdCode] 
   ON  [Common].[Code] 
   INSTEAD OF DELETE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	IF EXISTS(SELECT c.CodeID 
	            FROM Common.Code c INNER JOIN Deleted d on c.codeID = d.CodeID
			   WHERE c.IsDeleted = 1)
	BEGIN
		DELETE c
		  FROM Common.code c inner join deleted d on c.codeID = d.CodeID
	END ELSE BEGIN
    -- Insert statements for trigger here
	UPDATE cd
	   SET IsDeleted  = 1
	  FROM Common.Code cd inner join DELETED d on cd.codeID = d.codeID
	END
END
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		J. Kirkland
-- Create date: 2025-02-11
-- Description:	Insert trigger for code
-- =============================================
CREATE TRIGGER [Common].[triCode] 
   ON  [Common].[Code] 
   INSTEAD OF INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	INSERT INTO Common.Code (Category
							,CodeType
							,Code
							,CodeDescription
							,UpdatedBy
							,UpdatedOn
							,IsDeleted)
	SELECT i.Category
		 , i.CodeType
		 , i.Code
		 , i.CodeDescription
		 , ISNULL(i.UpdatedBy, 'Trish')
		 , GETUTCDATE()
		 , 0
	  FROM inserted i
END
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
--====================================================================================================================
-- Procedure Name : truCode
-- Original Author: J.Kirkland
-- Create Date    : 2025-02-12
-- Description    : Update trigger on code table
-- Usage          : N/A
----------------------------------------------------------------------------------------------------------------------
-- Update History
-- Author               Date        Description
----------------------------------------------------------------------------------------------------------------------
-- J.Kirkland           2025-12-02  Initial Revision.
--====================================================================================================================
CREATE TRIGGER [Common].[truCode]
    ON [Common].[Code]
    INSTEAD OF UPDATE
    AS
BEGIN
    UPDATE c
       SET c.Category        = u.Category
         , c.code            = u.Code
         , c.CodeDescription = u.CodeDescription
         , c.CodeType        = u.CodeType
         , c.IsDeleted       = u.IsDeleted
         , c.UpdatedBy       = ISNULL(u.UpdatedBy, 'Ursula')
         , c.UpdatedOn       = GETUTCDATE()
      FROM Common.Code c
               INNER JOIN inserted u ON c.CodeID = u.CodeID

END
GO
ALTER TABLE [Common].[Code] ADD CONSTRAINT [PK__Code__C6DE2C3574482FCC] PRIMARY KEY CLUSTERED ([CodeID]) ON [PRIMARY]
GO
