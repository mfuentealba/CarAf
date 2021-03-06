USE [Cartera_Agregada_AFP]
GO

/****** Object:  Table [dbo].[TbSubRegion]    Script Date: 02/27/2018 19:26:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TbSubRegion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NULL,
	[region] [varchar](50) NULL,
	[mercado] [varchar](20) NULL,
 CONSTRAINT [PK_SubRegion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


