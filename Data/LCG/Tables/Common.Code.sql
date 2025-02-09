CREATE TABLE [Common].[Code]
(
[CodeID] [int] NOT NULL IDENTITY(1, 1),
[Category] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CodeType] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Code] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CodeDescription] [varchar] (512) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[UpdatedBy] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[UpdatedOn] [datetime] NOT NULL,
[RowVer] [timestamp] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Common].[Code] ADD CONSTRAINT [PK__Code__C6DE2C3574482FCC] PRIMARY KEY CLUSTERED ([CodeID]) ON [PRIMARY]
GO
