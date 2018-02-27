USE [CuboAFP]
GO

/****** Object:  Table [dbo].[TbDistribuidor]    Script Date: 02/27/2018 19:31:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TbDistribuidor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [varchar](20) NULL,
	[distribuidor] [varchar](50) NULL,
	[manager] [varchar](50) NULL,
	[mercado] [varchar](20) NULL,
	[estilo] [varchar](15) NULL,
	[capitalizacion] [varchar](70) NULL,
	[gestion] [varchar](15) NULL,
	[region] [varchar](25) NULL,
	[subregion] [varchar](30) NULL,
	[anio] [varchar](4) NULL,
	[periodo] [varchar](7) NULL,
 CONSTRAINT [PK_Distribuidor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


