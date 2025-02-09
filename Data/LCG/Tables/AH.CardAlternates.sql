CREATE TABLE [AH].[CardAlternates]
(
[CardID] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AlternatedBy] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [AH].[CardAlternates] ADD CONSTRAINT [PK_CardAlternates] PRIMARY KEY CLUSTERED ([CardID], [AlternatedBy]) ON [PRIMARY]
GO
ALTER TABLE [AH].[CardAlternates] ADD CONSTRAINT [FK_CardAlternate_Card] FOREIGN KEY ([CardID]) REFERENCES [AH].[Card] ([CardID])
GO
ALTER TABLE [AH].[CardAlternates] ADD CONSTRAINT [FK_CardAlternates_Alternate] FOREIGN KEY ([AlternatedBy]) REFERENCES [AH].[Card] ([CardID])
GO
