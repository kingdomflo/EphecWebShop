USE [WebShop]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 12/15/2016 05:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Client](
	[CLI_Id] [int] IDENTITY(1,1) NOT NULL,
	[CLI_Nom] [varchar](50) NOT NULL,
	[CLI_Prenom] [varchar](50) NULL,
	[CLI_Civilite] [varchar](50) NOT NULL,
	[CLI_Email] [varchar](50) NOT NULL UNIQUE,
	[CLI_Password] [varchar](50) NOT NULL,
	[CLI_Adresse] [varchar](50) NOT NULL,
	[CLI_CodePostal] [varchar](50) NOT NULL,
	[CLI_Ville] [varchar](50) NOT NULL,
	[CLI_Telephone] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[CLI_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categorie]    Script Date: 12/15/2016 05:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categorie](
	[CAT_Id] [int] IDENTITY(1,1) NOT NULL,
	[CAT_Libelle] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categorie] PRIMARY KEY CLUSTERED 
(
	[CAT_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Commande]    Script Date: 12/15/2016 05:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Commande](
	[COM_Id] [int] IDENTITY(1,1) NOT NULL,
	[COM_CLI_Id] [int] NOT NULL,
	[COM_Date] [datetime] NOT NULL,
	[COM_Statut] [varchar](50) NOT NULL,
	[COM_DateLivraison] [datetime] NOT NULL,
	[COM_Nom] [varchar](50) NOT NULL,
	[COM_Prenom] [varchar](50) NULL,
	[COM_Civilite] [varchar](50) NOT NULL,
	[COM_Adresse] [varchar](50) NOT NULL,
	[COM_CodePostal] [varchar](50) NOT NULL,
	[COM_Ville] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Commande] PRIMARY KEY CLUSTERED 
(
	[COM_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SousCategorie]    Script Date: 12/15/2016 05:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SousCategorie](
	[SCAT_Id] [int] IDENTITY(1,1) NOT NULL,
	[SCAT_CAT_Id] [int] NOT NULL,
	[SCAT_Libelle] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SousCategorie] PRIMARY KEY CLUSTERED 
(
	[SCAT_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Article]    Script Date: 12/15/2016 05:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Article](
	[ART_Id] [int] IDENTITY(1,1) NOT NULL,
	[ART_SCAT_Id] [int] NOT NULL,
	[ART_Libelle] [varchar](50) NOT NULL,
	[ART_Description] [varchar](max) NOT NULL,
	[ART_Prix] [decimal](10, 2) NOT NULL,
	[ART_Stock] [int] NOT NULL,
	[ART_UrlImage] [varchar](max) NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[ART_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetailCommande]    Script Date: 12/15/2016 05:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailCommande](
	[DCOM_Id] [int] IDENTITY(1,1) NOT NULL,
	[DCOM_COM_Id] [int] NOT NULL,
	[DCOM_ART_Id] [int] NOT NULL,
	[DCOM_Quantite] [int] NOT NULL,
	[DCOM_PrixUnitaire] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_DetailCommande] PRIMARY KEY CLUSTERED 
(
	[DCOM_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Article_SousCategorie]    Script Date: 12/15/2016 05:36:15 ******/
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_SousCategorie] FOREIGN KEY([ART_SCAT_Id])
REFERENCES [dbo].[SousCategorie] ([SCAT_Id])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_SousCategorie]
GO
/****** Object:  ForeignKey [FK_Commande_Client]    Script Date: 12/15/2016 05:36:15 ******/
ALTER TABLE [dbo].[Commande]  WITH CHECK ADD  CONSTRAINT [FK_Commande_Client] FOREIGN KEY([COM_CLI_Id])
REFERENCES [dbo].[Client] ([CLI_Id])
GO
ALTER TABLE [dbo].[Commande] CHECK CONSTRAINT [FK_Commande_Client]
GO
/****** Object:  ForeignKey [FK_DetailCommande_Article]    Script Date: 12/15/2016 05:36:15 ******/
ALTER TABLE [dbo].[DetailCommande]  WITH CHECK ADD  CONSTRAINT [FK_DetailCommande_Article] FOREIGN KEY([DCOM_ART_Id])
REFERENCES [dbo].[Article] ([ART_Id])
GO
ALTER TABLE [dbo].[DetailCommande] CHECK CONSTRAINT [FK_DetailCommande_Article]
GO
/****** Object:  ForeignKey [FK_DetailCommande_Commande]    Script Date: 12/15/2016 05:36:15 ******/
ALTER TABLE [dbo].[DetailCommande]  WITH CHECK ADD  CONSTRAINT [FK_DetailCommande_Commande] FOREIGN KEY([DCOM_COM_Id])
REFERENCES [dbo].[Commande] ([COM_Id])
GO
ALTER TABLE [dbo].[DetailCommande] CHECK CONSTRAINT [FK_DetailCommande_Commande]
GO
/****** Object:  ForeignKey [FK_SousCategorie_Categorie]    Script Date: 12/15/2016 05:36:15 ******/
ALTER TABLE [dbo].[SousCategorie]  WITH CHECK ADD  CONSTRAINT [FK_SousCategorie_Categorie] FOREIGN KEY([SCAT_CAT_Id])
REFERENCES [dbo].[Categorie] ([CAT_Id])
GO
ALTER TABLE [dbo].[SousCategorie] CHECK CONSTRAINT [FK_SousCategorie_Categorie]
GO

USE [WebShop]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([CLI_Id], [CLI_Nom], [CLI_Prenom], [CLI_Civilite], [CLI_Email], [CLI_Password], [CLI_Adresse], [CLI_CodePostal], [CLI_Ville], [CLI_Telephone]) VALUES (4, N'Wiske', N'Marie', N'Madame', N'marie@wiske.be', N'ejeDUBdH6I+D7k0JrBgq6A==', N'rue de la rue', N'1140', N'Bruxelles', N'0490')
INSERT [dbo].[Client] ([CLI_Id], [CLI_Nom], [CLI_Prenom], [CLI_Civilite], [CLI_Email], [CLI_Password], [CLI_Adresse], [CLI_CodePostal], [CLI_Ville], [CLI_Telephone]) VALUES (5, N'Pascal', N'Jean', N'Monsieur', N'jean@pascal.be', N'ejeDUBdH6I+D7k0JrBgq6A==', N'Rue de l''avenue', N'1030', N'Bruxelles', N'04978')
INSERT [dbo].[Client] ([CLI_Id], [CLI_Nom], [CLI_Prenom], [CLI_Civilite], [CLI_Email], [CLI_Password], [CLI_Adresse], [CLI_CodePostal], [CLI_Ville], [CLI_Telephone]) VALUES (6, N'Lambin', N'Paul', N'Monsieur', N'paul@lambin.be', N'ejeDUBdH6I+D7k0JrBgq6A==', N'Rue de l''école', N'1000', N'Londres', N'0490')
INSERT [dbo].[Client] ([CLI_Id], [CLI_Nom], [CLI_Prenom], [CLI_Civilite], [CLI_Email], [CLI_Password], [CLI_Adresse], [CLI_CodePostal], [CLI_Ville], [CLI_Telephone]) VALUES (7, N'Vandenvelde', N'Nath', N'Madame', N'vandenvelde@nath.be', N'ejeDUBdH6I+D7k0JrBgq6A==', N'Rue du boulevard', N'1000', N'Bruxelles', N'0490')
INSERT [dbo].[Client] ([CLI_Id], [CLI_Nom], [CLI_Prenom], [CLI_Civilite], [CLI_Email], [CLI_Password], [CLI_Adresse], [CLI_CodePostal], [CLI_Ville], [CLI_Telephone]) VALUES (8, N'Menfrois', N'Gérard', N'Monsieur', N'menfrois@gerard.be', N'ejeDUBdH6I+D7k0JrBgq6A==', N'Rue de la glace', N'1140', N'Evere', N'0490')
INSERT [dbo].[Client] ([CLI_Id], [CLI_Nom], [CLI_Prenom], [CLI_Civilite], [CLI_Email], [CLI_Password], [CLI_Adresse], [CLI_CodePostal], [CLI_Ville], [CLI_Telephone]) VALUES (9, N'Depel', N'Joé', N'Madame', N'depel@joe.be', N'ejeDUBdH6I+D7k0JrBgq6A==', N'Rue du rateau', N'1000', N'Copenhague', N'0490')
INSERT [dbo].[Client] ([CLI_Id], [CLI_Nom], [CLI_Prenom], [CLI_Civilite], [CLI_Email], [CLI_Password], [CLI_Adresse], [CLI_CodePostal], [CLI_Ville], [CLI_Telephone]) VALUES (10, N'Dufoin', N'Leon', N'Monsieur', N'leon@dufoin.be', N'ejeDUBdH6I+D7k0JrBgq6A==', N'rue de la paille', N'1790', N'Namur', N'09872')
INSERT [dbo].[Client] ([CLI_Id], [CLI_Nom], [CLI_Prenom], [CLI_Civilite], [CLI_Email], [CLI_Password], [CLI_Adresse], [CLI_CodePostal], [CLI_Ville], [CLI_Telephone]) VALUES (11, N'Vanwersch', N'Thib', N'Monsieur', N'thib@vanwersch', N'ejeDUBdH6I+D7k0JrBgq6A==', N'rue de France', N'7899', N'Paris', N'48856')
INSERT [dbo].[Client] ([CLI_Id], [CLI_Nom], [CLI_Prenom], [CLI_Civilite], [CLI_Email], [CLI_Password], [CLI_Adresse], [CLI_CodePostal], [CLI_Ville], [CLI_Telephone]) VALUES (12, N'Depel', N'Bruno', N'Monsieur', N'depel@bruno.be', N'ejeDUBdH6I+D7k0JrBgq6A==', N'Rue de Jean Blaise', N'3567', N'Barcelone', N'7654')
INSERT [dbo].[Client] ([CLI_Id], [CLI_Nom], [CLI_Prenom], [CLI_Civilite], [CLI_Email], [CLI_Password], [CLI_Adresse], [CLI_CodePostal], [CLI_Ville], [CLI_Telephone]) VALUES (13, N'Françoise', N'Requin', N'Madame', N'requin@fran.be', N'ejeDUBdH6I+D7k0JrBgq6A==', N'Rue de la mer', N'6763', N'Oslo', N'4568')
INSERT [dbo].[Client] ([CLI_Id], [CLI_Nom], [CLI_Prenom], [CLI_Civilite], [CLI_Email], [CLI_Password], [CLI_Adresse], [CLI_CodePostal], [CLI_Ville], [CLI_Telephone]) VALUES (14, N'Scholtens', N'Martje', N'Madame', N'hollande@train.nl', N'ejeDUBdH6I+D7k0JrBgq6A==', N'Rue de la gare', N'4290', N'Harlem', N'24578')
INSERT [dbo].[Client] ([CLI_Id], [CLI_Nom], [CLI_Prenom], [CLI_Civilite], [CLI_Email], [CLI_Password], [CLI_Adresse], [CLI_CodePostal], [CLI_Ville], [CLI_Telephone]) VALUES (15, N'Berneman', N'Bruce', N'Monsieur', N'bruce@bernerman.fr', N'ejeDUBdH6I+D7k0JrBgq6A==', N'Rue de e-penser', N'54627', N'Paris', N'547845')
INSERT [dbo].[Client] ([CLI_Id], [CLI_Nom], [CLI_Prenom], [CLI_Civilite], [CLI_Email], [CLI_Password], [CLI_Adresse], [CLI_CodePostal], [CLI_Ville], [CLI_Telephone]) VALUES (16, N'Meeren', N'Willy', N'Monsieur', N'willy@meeren.be', N'ejeDUBdH6I+D7k0JrBgq6A==', N'Rue d''Evere', N'1140', N'Evere', N'09836')
SET IDENTITY_INSERT [dbo].[Client] OFF
SET IDENTITY_INSERT [dbo].[Commande] ON 

INSERT [dbo].[Commande] ([COM_Id], [COM_CLI_Id], [COM_Date], [COM_Statut], [COM_DateLivraison], [COM_Nom], [COM_Prenom], [COM_Civilite], [COM_Adresse], [COM_CodePostal], [COM_Ville]) VALUES (1, 4, CAST(N'2017-08-16 10:19:10.473' AS DateTime), N'Livraison terminée', CAST(N'2017-08-24 00:00:00.000' AS DateTime), N'Wiske', N'Marie', N'Madame', N'rue de la rue', N'1140', N'Bruxelles')
INSERT [dbo].[Commande] ([COM_Id], [COM_CLI_Id], [COM_Date], [COM_Statut], [COM_DateLivraison], [COM_Nom], [COM_Prenom], [COM_Civilite], [COM_Adresse], [COM_CodePostal], [COM_Ville]) VALUES (2, 4, CAST(N'2017-08-16 10:48:19.460' AS DateTime), N'En attente', CAST(N'2017-08-24 00:00:00.000' AS DateTime), N'Wiske', N'Marie', N'Madame', N'rue de la ruelulu', N'1140', N'Bruxelles')
INSERT [dbo].[Commande] ([COM_Id], [COM_CLI_Id], [COM_Date], [COM_Statut], [COM_DateLivraison], [COM_Nom], [COM_Prenom], [COM_Civilite], [COM_Adresse], [COM_CodePostal], [COM_Ville]) VALUES (3, 9, CAST(N'2017-08-18 15:31:12.337' AS DateTime), N'Livraison en cours', CAST(N'2017-08-30 00:00:00.000' AS DateTime), N'Depel', N'Joé', N'Madame', N'Rue du rateau', N'1000', N'Copenhague')
INSERT [dbo].[Commande] ([COM_Id], [COM_CLI_Id], [COM_Date], [COM_Statut], [COM_DateLivraison], [COM_Nom], [COM_Prenom], [COM_Civilite], [COM_Adresse], [COM_CodePostal], [COM_Ville]) VALUES (4, 9, CAST(N'2017-08-20 13:32:44.967' AS DateTime), N'En attente', CAST(N'2017-08-31 00:00:00.000' AS DateTime), N'Depel', N'Joé', N'Madame', N'Rue du rateau', N'1000', N'Copenhague')
INSERT [dbo].[Commande] ([COM_Id], [COM_CLI_Id], [COM_Date], [COM_Statut], [COM_DateLivraison], [COM_Nom], [COM_Prenom], [COM_Civilite], [COM_Adresse], [COM_CodePostal], [COM_Ville]) VALUES (5, 9, CAST(N'2017-08-20 13:42:14.297' AS DateTime), N'En attente', CAST(N'2017-09-14 00:00:00.000' AS DateTime), N'Depel', N'Joé', N'Monsieur', N'Rue du rateau', N'1000', N'Copenhague')
SET IDENTITY_INSERT [dbo].[Commande] OFF
SET IDENTITY_INSERT [dbo].[Categorie] ON 

INSERT [dbo].[Categorie] ([CAT_Id], [CAT_Libelle]) VALUES (1, N'Livres')
INSERT [dbo].[Categorie] ([CAT_Id], [CAT_Libelle]) VALUES (2, N'Jeux vidéos')
INSERT [dbo].[Categorie] ([CAT_Id], [CAT_Libelle]) VALUES (3, N'CD')
SET IDENTITY_INSERT [dbo].[Categorie] OFF
SET IDENTITY_INSERT [dbo].[SousCategorie] ON 

INSERT [dbo].[SousCategorie] ([SCAT_Id], [SCAT_CAT_Id], [SCAT_Libelle]) VALUES (1, 1, N'Manga')
INSERT [dbo].[SousCategorie] ([SCAT_Id], [SCAT_CAT_Id], [SCAT_Libelle]) VALUES (2, 1, N'BD')
INSERT [dbo].[SousCategorie] ([SCAT_Id], [SCAT_CAT_Id], [SCAT_Libelle]) VALUES (3, 1, N'Comic')
INSERT [dbo].[SousCategorie] ([SCAT_Id], [SCAT_CAT_Id], [SCAT_Libelle]) VALUES (4, 3, N'Metal')
INSERT [dbo].[SousCategorie] ([SCAT_Id], [SCAT_CAT_Id], [SCAT_Libelle]) VALUES (5, 3, N'Classique')
INSERT [dbo].[SousCategorie] ([SCAT_Id], [SCAT_CAT_Id], [SCAT_Libelle]) VALUES (6, 2, N'MMO')
INSERT [dbo].[SousCategorie] ([SCAT_Id], [SCAT_CAT_Id], [SCAT_Libelle]) VALUES (7, 2, N'Strategie')
SET IDENTITY_INSERT [dbo].[SousCategorie] OFF
SET IDENTITY_INSERT [dbo].[Article] ON 

INSERT [dbo].[Article] ([ART_Id], [ART_SCAT_Id], [ART_Libelle], [ART_Description], [ART_Prix], [ART_Stock], [ART_UrlImage]) VALUES (1, 1, N'One Pieces', N'Les aventures de Luffy le pirate', CAST(7.75 AS Decimal(10, 2)), 18, N'/Images/onepiece-wallpaper-20160724205402-560x380.jpg')
INSERT [dbo].[Article] ([ART_Id], [ART_SCAT_Id], [ART_Libelle], [ART_Description], [ART_Prix], [ART_Stock], [ART_UrlImage]) VALUES (2, 1, N'Full Metal Alchimist', N'Grand manga mélant humour et action', CAST(7.00 AS Decimal(10, 2)), 21, NULL)
INSERT [dbo].[Article] ([ART_Id], [ART_SCAT_Id], [ART_Libelle], [ART_Description], [ART_Prix], [ART_Stock], [ART_UrlImage]) VALUES (3, 2, N'Spirou', N'La suite du petit spirou en moins drole', CAST(7.00 AS Decimal(10, 2)), 6, N'/Images/SpirouAttitude.png')
INSERT [dbo].[Article] ([ART_Id], [ART_SCAT_Id], [ART_Libelle], [ART_Description], [ART_Prix], [ART_Stock], [ART_UrlImage]) VALUES (4, 4, N'Sabaton - Carolux Rex', N'Sabaton CD en suédois', CAST(14.50 AS Decimal(10, 2)), 9, N'/Images/Sabaton_Carolus_Rex.jpg')
INSERT [dbo].[Article] ([ART_Id], [ART_SCAT_Id], [ART_Libelle], [ART_Description], [ART_Prix], [ART_Stock], [ART_UrlImage]) VALUES (5, 4, N'Sabaton - Last Battle', N'Sabaton CD', CAST(16.50 AS Decimal(10, 2)), 94, NULL)
INSERT [dbo].[Article] ([ART_Id], [ART_SCAT_Id], [ART_Libelle], [ART_Description], [ART_Prix], [ART_Stock], [ART_UrlImage]) VALUES (6, 3, N'Superman', N'Un super héros', CAST(15.00 AS Decimal(10, 2)), 87, NULL)
INSERT [dbo].[Article] ([ART_Id], [ART_SCAT_Id], [ART_Libelle], [ART_Description], [ART_Prix], [ART_Stock], [ART_UrlImage]) VALUES (7, 3, N'Batman the knight', N'Chauve souris badass', CAST(15.00 AS Decimal(10, 2)), 42, N'/Images/Batman-BenAffleck.jpg')
INSERT [dbo].[Article] ([ART_Id], [ART_SCAT_Id], [ART_Libelle], [ART_Description], [ART_Prix], [ART_Stock], [ART_UrlImage]) VALUES (10, 3, N'Green Lantern', N'Un héro vert, mais pas Hulk', CAST(15.00 AS Decimal(10, 2)), 62, N'/Images/Green_Lantern_Rebirth_6.jpg')
INSERT [dbo].[Article] ([ART_Id], [ART_SCAT_Id], [ART_Libelle], [ART_Description], [ART_Prix], [ART_Stock], [ART_UrlImage]) VALUES (11, 1, N'Naruto', N'Un ninja', CAST(15.00 AS Decimal(10, 2)), 18, N'/Images/newsletter-naruto3.png')
SET IDENTITY_INSERT [dbo].[Article] OFF
SET IDENTITY_INSERT [dbo].[DetailCommande] ON 

INSERT [dbo].[DetailCommande] ([DCOM_Id], [DCOM_COM_Id], [DCOM_ART_Id], [DCOM_Quantite], [DCOM_PrixUnitaire]) VALUES (1, 1, 1, 2, CAST(7.55 AS Decimal(10, 2)))
INSERT [dbo].[DetailCommande] ([DCOM_Id], [DCOM_COM_Id], [DCOM_ART_Id], [DCOM_Quantite], [DCOM_PrixUnitaire]) VALUES (2, 1, 2, 1, CAST(7.00 AS Decimal(10, 2)))
INSERT [dbo].[DetailCommande] ([DCOM_Id], [DCOM_COM_Id], [DCOM_ART_Id], [DCOM_Quantite], [DCOM_PrixUnitaire]) VALUES (3, 2, 5, 3, CAST(16.50 AS Decimal(10, 2)))
INSERT [dbo].[DetailCommande] ([DCOM_Id], [DCOM_COM_Id], [DCOM_ART_Id], [DCOM_Quantite], [DCOM_PrixUnitaire]) VALUES (4, 2, 3, 2, CAST(7.00 AS Decimal(10, 2)))
INSERT [dbo].[DetailCommande] ([DCOM_Id], [DCOM_COM_Id], [DCOM_ART_Id], [DCOM_Quantite], [DCOM_PrixUnitaire]) VALUES (5, 3, 2, 5, CAST(7.00 AS Decimal(10, 2)))
INSERT [dbo].[DetailCommande] ([DCOM_Id], [DCOM_COM_Id], [DCOM_ART_Id], [DCOM_Quantite], [DCOM_PrixUnitaire]) VALUES (6, 3, 3, 2, CAST(7.00 AS Decimal(10, 2)))
INSERT [dbo].[DetailCommande] ([DCOM_Id], [DCOM_COM_Id], [DCOM_ART_Id], [DCOM_Quantite], [DCOM_PrixUnitaire]) VALUES (7, 4, 2, 3, CAST(7.00 AS Decimal(10, 2)))
INSERT [dbo].[DetailCommande] ([DCOM_Id], [DCOM_COM_Id], [DCOM_ART_Id], [DCOM_Quantite], [DCOM_PrixUnitaire]) VALUES (8, 4, 6, 1, CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[DetailCommande] ([DCOM_Id], [DCOM_COM_Id], [DCOM_ART_Id], [DCOM_Quantite], [DCOM_PrixUnitaire]) VALUES (9, 5, 2, 2, CAST(7.00 AS Decimal(10, 2)))
INSERT [dbo].[DetailCommande] ([DCOM_Id], [DCOM_COM_Id], [DCOM_ART_Id], [DCOM_Quantite], [DCOM_PrixUnitaire]) VALUES (10, 5, 3, 1, CAST(7.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[DetailCommande] OFF
