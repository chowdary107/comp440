/*----------In this file I have re-submitted all the process of creating the tables and insertion of data and the stored procedures for getting the distinct data and transforming the version number. Also I have excuted all these queries in the database.-----------------*/




/*-------------------------------------------------------------------CREATION OF TABLES------------------------------------------------------------------------------*/


-- Products
USE [cs440mw08]
GO

/****** Object:  Table [dbo].[Products]    
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Products](
	[ProductID] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

--Bugs
USE [cs440mw08]
GO

/****** Object:  Table [dbo].[Bugs]    
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Bugs](
	[BugID] [int] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Bugs] PRIMARY KEY CLUSTERED 
(
	[BugID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

--ProductBugs
USE [cs440mw08]
GO

/****** Object:  Table [dbo].[ProductBugs]    
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ProductBugs](
	[ProductID] [int] NOT NULL,
	[BugID] [int] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ProductBugs]  WITH CHECK ADD  CONSTRAINT [FK_ProductBugs_Bugs] FOREIGN KEY([BugID])
REFERENCES [dbo].[Bugs] ([BugID])
GO

ALTER TABLE [dbo].[ProductBugs] CHECK CONSTRAINT [FK_ProductBugs_Bugs]
GO

ALTER TABLE [dbo].[ProductBugs]  WITH CHECK ADD  CONSTRAINT [FK_ProductBugs_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO

ALTER TABLE [dbo].[ProductBugs] CHECK CONSTRAINT [FK_ProductBugs_Products]
GO

--Features
USE [cs440mw08]
GO

/****** Object:  Table [dbo].[Features]
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Features](
	[FeatureID] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Features] PRIMARY KEY CLUSTERED 
(
	[FeatureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

--ProductFeatures
USE [cs440mw08]
GO

/****** Object:  Table [dbo].[ProductFeatures]
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ProductFeatures](
	[ProductID] [int] NOT NULL,
	[FeatureID] [int] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ProductFeatures]  WITH CHECK ADD  CONSTRAINT [FK_ProductFeatures_Features] FOREIGN KEY([FeatureID])
REFERENCES [dbo].[Features] ([FeatureID])
GO

ALTER TABLE [dbo].[ProductFeatures] CHECK CONSTRAINT [FK_ProductFeatures_Features]
GO

ALTER TABLE [dbo].[ProductFeatures]  WITH CHECK ADD  CONSTRAINT [FK_ProductFeatures_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO

ALTER TABLE [dbo].[ProductFeatures] CHECK CONSTRAINT [FK_ProductFeatures_Products]
GO


--Enhancements
USE [cs440mw08]
GO

/****** Object:  Table [dbo].[Enhancements]
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Enhancements](
	[EnhancementID] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[BugID] [int] NOT NULL,
 CONSTRAINT [PK_Enhancements] PRIMARY KEY CLUSTERED 
(
	[EnhancementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Enhancements]  WITH CHECK ADD  CONSTRAINT [FK_Enhancements_Bugs] FOREIGN KEY([BugID])
REFERENCES [dbo].[Bugs] ([BugID])
GO

ALTER TABLE [dbo].[Enhancements] CHECK CONSTRAINT [FK_Enhancements_Bugs]
GO

--Versions
USE [cs440mw08]
GO

/****** Object:  Table [dbo].[Versions]
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Versions](
	[VersionID] [int] NOT NULL,
	[VersionNumber] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[ReleaseDate] [date] NULL,
 CONSTRAINT [PK_Versions] PRIMARY KEY CLUSTERED 
(
	[VersionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

--ProductVersions
USE [cs440mw08]
GO

/****** Object:  Table [dbo].[ProductVersions]
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ProductVersions](
	[ProductID] [int] NOT NULL,
	[VersionID] [int] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ProductVersions]  WITH CHECK ADD  CONSTRAINT [FK_ProductVersions_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO

ALTER TABLE [dbo].[ProductVersions] CHECK CONSTRAINT [FK_ProductVersions_Products]
GO

ALTER TABLE [dbo].[ProductVersions]  WITH CHECK ADD  CONSTRAINT [FK_ProductVersions_Versions] FOREIGN KEY([VersionID])
REFERENCES [dbo].[Versions] ([VersionID])
GO

ALTER TABLE [dbo].[ProductVersions] CHECK CONSTRAINT [FK_ProductVersions_Versions]
GO






/*---------------------------------------------------------INSERTION OF DATA INTO THE TABLES-------------------------------------------------------------------------*/

--Products
USE [cs440mw08]

INSERT [dbo].[Products] ([ProductID], [Name]) VALUES (1, N'WhatsApp')

INSERT [dbo].[Products] ([ProductID], [Name]) VALUES (2, N'Facebook')

INSERT [dbo].[Products] ([ProductID], [Name]) VALUES (3, N'Instagram')

INSERT [dbo].[Products] ([ProductID], [Name]) VALUES (4, N'Twitter')


--Bugs
USE [cs440mw08]

INSERT [dbo].[Bugs] ([BugID], [Title], [Description]) VALUES (1, N'Profile Pic', N'Profile Pic is not Loading')

INSERT [dbo].[Bugs] ([BugID], [Title], [Description]) VALUES (2, N'Videos', N'Videos are not loading')

INSERT [dbo].[Bugs] ([BugID], [Title], [Description]) VALUES (3, N'NewsFeed', N'NewsFeed is not up to Date')

INSERT [dbo].[Bugs] ([BugID], [Title], [Description]) VALUES (4, N'Notifications', N'Notifications in not recieving for end user')

INSERT [dbo].[Bugs] ([BugID], [Title], [Description]) VALUES (5, N'Chats', N'Messages are not secured')

INSERT [dbo].[Bugs] ([BugID], [Title], [Description]) VALUES (6, N'ActiveStatus', N'Active Status is not visible')


--productBugs
USE [cs440mw08]
INSERT [dbo].[ProductBugs] ([ProductID], [BugID]) VALUES (1, 1)

INSERT [dbo].[ProductBugs] ([ProductID], [BugID]) VALUES (1, 5)

INSERT [dbo].[ProductBugs] ([ProductID], [BugID]) VALUES (2, 1)

INSERT [dbo].[ProductBugs] ([ProductID], [BugID]) VALUES (2, 4)

INSERT [dbo].[ProductBugs] ([ProductID], [BugID]) VALUES (3, 2)

INSERT [dbo].[ProductBugs] ([ProductID], [BugID]) VALUES (2, 3)

INSERT [dbo].[ProductBugs] ([ProductID], [BugID]) VALUES (4, 6)

--Enhancements
USE [cs440mw08]
INSERT [dbo].[Enhancements] ([EnhancementID], [Description], [BugID]) VALUES (1, N'Profile Method is Update                                                                                                                              ', 1)

INSERT [dbo].[Enhancements] ([EnhancementID], [Description], [BugID]) VALUES (2, N'MultiMedia function is updated                                                                                                                        ', 2)

INSERT [dbo].[Enhancements] ([EnhancementID], [Description], [BugID]) VALUES (3, N'NewsFeed Method is modified                                                                                                                           ', 3)

INSERT [dbo].[Enhancements] ([EnhancementID], [Description], [BugID]) VALUES (4, N'Notifications Linq Query is updated in the module                                                                                                     ', 4)

INSERT [dbo].[Enhancements] ([EnhancementID], [Description], [BugID]) VALUES (5, N'Chats Structure is updated                                                                                                                            ', 5)

INSERT [dbo].[Enhancements] ([EnhancementID], [Description], [BugID]) VALUES (6, N'Active Status Control Statements are updates                                                                                                          ', 6)

--Versions
USE [cs440mw08]
INSERT [dbo].[Versions] ([VersionID], [VersionNumber], [Name], [ReleaseDate]) VALUES (1, N'1.1.1', N'Version 1', CAST(N'2021-02-02' AS Date))

INSERT [dbo].[Versions] ([VersionID], [VersionNumber], [Name], [ReleaseDate]) VALUES (2, N'1.1.2', N'Version 2', CAST(N'2021-03-02' AS Date))

INSERT [dbo].[Versions] ([VersionID], [VersionNumber], [Name], [ReleaseDate]) VALUES (3, N'2.1.1', N'Version 3', CAST(N'2021-04-02' AS Date))

INSERT [dbo].[Versions] ([VersionID], [VersionNumber], [Name], [ReleaseDate]) VALUES (4, N'3.1.1', N'Version 4', CAST(N'2021-05-02' AS Date))

INSERT [dbo].[Versions] ([VersionID], [VersionNumber], [Name], [ReleaseDate]) VALUES (5, N'4.1.1', N'Version 5', CAST(N'2021-02-18' AS Date))

--productVersions
USE [cs440mw08]
INSERT [dbo].[ProductVersions] ([ProductID], [VersionID]) VALUES (1, 1)

INSERT [dbo].[ProductVersions] ([ProductID], [VersionID]) VALUES (1, 2)

INSERT [dbo].[ProductVersions] ([ProductID], [VersionID]) VALUES (2, 3)

INSERT [dbo].[ProductVersions] ([ProductID], [VersionID]) VALUES (3, 1)

INSERT [dbo].[ProductVersions] ([ProductID], [VersionID]) VALUES (3, 4)

INSERT [dbo].[ProductVersions] ([ProductID], [VersionID]) VALUES (4, 5)

--Features
USE [cs440mw08]
INSERT [dbo].[Features] ([FeatureID], [Description]) VALUES (1, N'Graphics')

INSERT [dbo].[Features] ([FeatureID], [Description]) VALUES (2, N'Readability')

INSERT [dbo].[Features] ([FeatureID], [Description]) VALUES (3, N'Feedback')

INSERT [dbo].[Features] ([FeatureID], [Description]) VALUES (4, N'Security')

INSERT [dbo].[Features] ([FeatureID], [Description]) VALUES (5, N'QR Code')

--ProductFeatures
USE [cs440mw08]
INSERT [dbo].[ProductFeatures] ([ProductID], [FeatureID]) VALUES (1, 1)

INSERT [dbo].[ProductFeatures] ([ProductID], [FeatureID]) VALUES (1, 2)

INSERT [dbo].[ProductFeatures] ([ProductID], [FeatureID]) VALUES (1, 3)

INSERT [dbo].[ProductFeatures] ([ProductID], [FeatureID]) VALUES (2, 4)

INSERT [dbo].[ProductFeatures] ([ProductID], [FeatureID]) VALUES (2, 1)

INSERT [dbo].[ProductFeatures] ([ProductID], [FeatureID]) VALUES (3, 5)

INSERT [dbo].[ProductFeatures] ([ProductID], [FeatureID]) VALUES (3, 2)

INSERT [dbo].[ProductFeatures] ([ProductID], [FeatureID]) VALUES (4, 3)


/*------------------------------------------------------------STORED PROCEDURES--------------------------------------------------------------------------------------*/

ALTER PROCEDURE [dbo].[rptCounts] 
AS

SELECT p.Name,count(DISTINCT pb.BugID) AS Bugs,count(DISTINCT pf.FeatureID) AS Features
FROM Products p
JOIN ProductBugs pb ON p.ProductID=pb.ProductID
JOIN ProductFeatures pf ON pf.ProductID=p.ProductID
GROUP BY p.ProductID,p.Name





ALTER PROCEDURE [dbo].[updVersionToDec] 
AS
BEGIN
UPDATE Versions SET VersionNumber=CONCAT(VersionNumber,'0')
END



/*-------------------------------------------------------------------END OF PROJECT----------------------------------------------------------------------------------*/