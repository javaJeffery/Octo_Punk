CREATE TABLE [AH].[CardDuplications]
(
[CardID] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DuplicatedBy] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [AH].[CardDuplications] ADD CONSTRAINT [PK_CardDuplications] PRIMARY KEY CLUSTERED ([CardID], [DuplicatedBy]) ON [PRIMARY]
GO
ALTER TABLE [AH].[CardDuplications] ADD CONSTRAINT [FK_CardDuplication_Card] FOREIGN KEY ([CardID]) REFERENCES [AH].[Card] ([CardID])
GO
ALTER TABLE [AH].[CardDuplications] ADD CONSTRAINT [FK_CardDuplications_Duplicates] FOREIGN KEY ([DuplicatedBy]) REFERENCES [AH].[Card] ([CardID])
GO
