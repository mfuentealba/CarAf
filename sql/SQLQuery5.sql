USE [Cartera_Agregada_AFP]
GO

/****** Object:  Table [dbo].[TbRegion]    Script Date: 02/27/2018 19:26:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TbRegion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](25) NULL,
	[subregion] [varchar](30) NULL,
	[mercado] [varchar](25) NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


