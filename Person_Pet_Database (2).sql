/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5081)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
DROP DATABASE IF EXISTS [Person_Pet]
GO
CREATE DATABASE [Person_Pet]
GO
USE [Person_Pet]
GO
/****** Object:  StoredProcedure [dbo].[AddPet]    Script Date: 2019-06-03 12:56:19 PM ******/
DROP PROCEDURE [dbo].[AddPet]
GO
ALTER TABLE [dbo].[Pet] DROP CONSTRAINT [FK_Pet_Pet_Type]
GO
ALTER TABLE [dbo].[Pet] DROP CONSTRAINT [FK_Pet_Person]
GO
/****** Object:  Table [dbo].[Pet_Type]    Script Date: 2019-06-03 12:56:19 PM ******/
DROP TABLE [dbo].[Pet_Type]
GO
/****** Object:  Table [dbo].[Pet]    Script Date: 2019-06-03 12:56:19 PM ******/
DROP TABLE [dbo].[Pet]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 2019-06-03 12:56:19 PM ******/
DROP TABLE [dbo].[Person]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 2019-06-03 12:56:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[person_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[person_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pet]    Script Date: 2019-06-03 12:56:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pet](
	[pet_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[pet_type_id] [int] NOT NULL,
	[person_id] [int] NULL,
 CONSTRAINT [PK_Pet] PRIMARY KEY CLUSTERED 
(
	[pet_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pet_Type]    Script Date: 2019-06-03 12:56:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pet_Type](
	[pet_type_id] [int] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Pet_Type] PRIMARY KEY CLUSTERED 
(
	[pet_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([person_id], [first_name], [last_name]) VALUES (1, N'Katie', N'Sylvia')
INSERT [dbo].[Person] ([person_id], [first_name], [last_name]) VALUES (2, N'Penny', N'Superbark')
INSERT [dbo].[Person] ([person_id], [first_name], [last_name]) VALUES (3, N'Fix-it', N'Felix')
INSERT [dbo].[Person] ([person_id], [first_name], [last_name]) VALUES (4, N'Gru', N'Despicable')
SET IDENTITY_INSERT [dbo].[Person] OFF
SET IDENTITY_INSERT [dbo].[Pet] ON 

INSERT [dbo].[Pet] ([pet_id], [name], [pet_type_id], [person_id]) VALUES (1, N'Max', 1, 1)
INSERT [dbo].[Pet] ([pet_id], [name], [pet_type_id], [person_id]) VALUES (2, N'Duke', 1, 1)
INSERT [dbo].[Pet] ([pet_id], [name], [pet_type_id], [person_id]) VALUES (3, N'Bolt', 1, 2)
INSERT [dbo].[Pet] ([pet_id], [name], [pet_type_id], [person_id]) VALUES (4, N'Mittens', 2, 2)
INSERT [dbo].[Pet] ([pet_id], [name], [pet_type_id], [person_id]) VALUES (5, N'Rhino', 3, 2)
INSERT [dbo].[Pet] ([pet_id], [name], [pet_type_id], [person_id]) VALUES (6, N'Kyle', 1, 4)
INSERT [dbo].[Pet] ([pet_id], [name], [pet_type_id], [person_id]) VALUES (7, N'Scruffy', 1, NULL)
SET IDENTITY_INSERT [dbo].[Pet] OFF
SET IDENTITY_INSERT [dbo].[Pet_Type] ON 

INSERT [dbo].[Pet_Type] ([pet_type_id], [type]) VALUES (1, N'dog')
INSERT [dbo].[Pet_Type] ([pet_type_id], [type]) VALUES (2, N'cat')
INSERT [dbo].[Pet_Type] ([pet_type_id], [type]) VALUES (3, N'hamster')
SET IDENTITY_INSERT [dbo].[Pet_Type] OFF
ALTER TABLE [dbo].[Pet]  WITH CHECK ADD  CONSTRAINT [FK_Pet_Person] FOREIGN KEY([person_id])
REFERENCES [dbo].[Person] ([person_id])
GO
ALTER TABLE [dbo].[Pet] CHECK CONSTRAINT [FK_Pet_Person]
GO
ALTER TABLE [dbo].[Pet]  WITH CHECK ADD  CONSTRAINT [FK_Pet_Pet_Type] FOREIGN KEY([pet_type_id])
REFERENCES [dbo].[Pet_Type] ([pet_type_id])
GO
ALTER TABLE [dbo].[Pet] CHECK CONSTRAINT [FK_Pet_Pet_Type]
GO
/****** Object:  StoredProcedure [dbo].[AddPet]    Script Date: 2019-06-03 12:56:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[AddPet] 
	-- Add the parameters for the stored procedure here
	@person_first_name nvarchar(50),
	@person_last_name nvarchar(50),
	@pet_name nvarchar(50),
	@pet_type nvarchar(50)
	-- <@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
	-- <@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @person_id INT; 
	DECLARE @pet_id INT; 
	DECLARE @pet_type_id INT; 

	SELECT @person_id = person_id
	FROM person
	WHERE first_name = @person_first_name
	AND last_name = @person_last_name;

	IF @@ROWCOUNT = 0 
		BEGIN
			INSERT INTO person (first_name, last_name) values (@person_first_name, @person_last_name);
			SELECT @person_id = @@IDENTITY;
		END



	SELECT @pet_id = pet_id
	FROM pet
	WHERE name = @pet_name
	AND person_id = @person_id;

	IF @@ROWCOUNT = 1 -- pet already exists!
		THROW 50001, 'Pet already exists' ,2


	SELECT @pet_type_id = pet_type_id
	FROM pet_type
	WHERE type = @pet_type;

	IF @@ROWCOUNT = 0 
		BEGIN
			INSERT INTO pet_type (type) values (@pet_type);
			SELECT @pet_type_id = @@IDENTITY;
		END



	INSERT INTO pet (name, pet_type_id, person_id) values (@pet_name, @pet_type_id, @person_id);
	SELECT @pet_id = @@IDENTITY;


	SELECT @person_id AS PersonID;
	SELECT @pet_type_id AS PetTypeID;
	SELECT @pet_type_id AS PetID;


	SET NOCOUNT OFF;

END
GO
