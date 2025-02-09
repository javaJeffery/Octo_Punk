CREATE TABLE [Common].[Game]
(
[GameID] [int] NOT NULL IDENTITY(1, 1),
[GameName] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[GamesPlayed] [int] NOT NULL,
[CampaignsPlayed] [int] NOT NULL,
[Wins] [int] NOT NULL,
[Losses] [int] NOT NULL,
[UpdatedBy] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[UpdatedOn] [datetime] NOT NULL,
[RowVer] [timestamp] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Common].[Game] ADD CONSTRAINT [PK__Game__2AB897DD6536E65F] PRIMARY KEY CLUSTERED ([GameID]) ON [PRIMARY]
GO
