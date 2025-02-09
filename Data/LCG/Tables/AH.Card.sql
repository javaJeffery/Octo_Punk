CREATE TABLE [AH].[Card]
(
[CardID] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PackCode] [int] NOT NULL,
[TypeCode] [int] NOT NULL,
[FactionCode] [int] NOT NULL,
[Position] [int] NOT NULL,
[Exceptional] [bit] NOT NULL,
[Myriad] [bit] NOT NULL,
[CardName] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[RealName] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SubName] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CardText] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[RealText] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[RV] [timestamp] NOT NULL,
[DeckLimit] [int] NOT NULL,
[Flavor] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BackFlavor] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Url] [nvarchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ImageSrc] [nvarchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BackImageSrc] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Illustrator] [int] NULL,
[IsUnique] [bit] NULL,
[IsPermanent] [bit] NOT NULL,
[IsDoubleSided] [bit] NOT NULL,
[BackText] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [AH].[Card] ADD CONSTRAINT [Card_pk] PRIMARY KEY CLUSTERED ([CardID]) ON [PRIMARY]
GO
ALTER TABLE [AH].[Card] ADD CONSTRAINT [FK_CardFaction_Code] FOREIGN KEY ([FactionCode]) REFERENCES [Common].[Code] ([CodeID])
GO
ALTER TABLE [AH].[Card] ADD CONSTRAINT [FK_CardPack_Code] FOREIGN KEY ([PackCode]) REFERENCES [Common].[Code] ([CodeID])
GO
ALTER TABLE [AH].[Card] ADD CONSTRAINT [FK_CardType_Code] FOREIGN KEY ([TypeCode]) REFERENCES [Common].[Code] ([CodeID])
GO
EXEC sp_addextendedproperty N'MS_Description', 'CardId from ArkhamDB', 'SCHEMA', N'AH', 'TABLE', N'Card', 'COLUMN', N'CardID'
GO
EXEC sp_addextendedproperty N'MS_Description', 'Faction FK to code table', 'SCHEMA', N'AH', 'TABLE', N'Card', 'COLUMN', N'FactionCode'
GO
EXEC sp_addextendedproperty N'MS_Description', 'Flavor Text', 'SCHEMA', N'AH', 'TABLE', N'Card', 'COLUMN', N'Flavor'
GO
EXEC sp_addextendedproperty N'MS_Description', 'Artist who Illustrated the card', 'SCHEMA', N'AH', 'TABLE', N'Card', 'COLUMN', N'Illustrator'
GO
EXEC sp_addextendedproperty N'MS_Description', 'Foriegn key o the code table', 'SCHEMA', N'AH', 'TABLE', N'Card', 'COLUMN', N'PackCode'
GO
EXEC sp_addextendedproperty N'MS_Description', 'Card Type FK to Code Table', 'SCHEMA', N'AH', 'TABLE', N'Card', 'COLUMN', N'TypeCode'
GO
