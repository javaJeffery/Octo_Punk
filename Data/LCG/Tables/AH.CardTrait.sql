CREATE TABLE [AH].[CardTrait]
(
[CardID] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TraitCode] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [AH].[CardTrait] ADD CONSTRAINT [CardTrait_pk] PRIMARY KEY CLUSTERED ([CardID], [TraitCode]) ON [PRIMARY]
GO
ALTER TABLE [AH].[CardTrait] ADD CONSTRAINT [FK_CardTrait_Card] FOREIGN KEY ([CardID]) REFERENCES [AH].[Card] ([CardID])
GO
ALTER TABLE [AH].[CardTrait] ADD CONSTRAINT [FK_CardTrait_TraitCode] FOREIGN KEY ([TraitCode]) REFERENCES [Common].[Code] ([CodeID])
GO
EXEC sp_addextendedproperty N'MS_Description', 'Bridge Table for Card Traits', 'SCHEMA', N'AH', 'TABLE', N'CardTrait', NULL, NULL
GO
