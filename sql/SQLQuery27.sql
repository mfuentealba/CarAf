USE [CuboAFP]
GO

/****** Object:  Table [dbo].[TbInstrumentos]    Script Date: 02/27/2018 19:31:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TbInstrumentos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[isin] [varchar](20) NULL,
	[ticker] [varchar](20) NULL,
	[tipo] [varchar](20) NULL,
	[distribuidor] [varchar](50) NULL,
	[manager] [varchar](50) NULL,
	[mercado] [varchar](20) NULL,
	[estilo] [varchar](15) NULL,
	[capitalizacion] [varchar](70) NULL,
	[gestion] [varchar](15) NULL,
	[region] [varchar](25) NULL,
	[precio] [varchar](25) NULL,
	[subregion] [varchar](30) NULL,
	[anio] [varchar](4) NULL,
	[periodo] [varchar](7) NULL,
 CONSTRAINT [PK_Instrumentos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


