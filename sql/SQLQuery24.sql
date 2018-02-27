USE [CuboAFP]
GO

/****** Object:  Table [dbo].[TbArchivo_Cartera_Agregada]    Script Date: 02/27/2018 19:31:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TbArchivo_Cartera_Agregada](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[anio] [varchar](4) NULL,
	[periodo] [varchar](7) NULL,
	[nemo] [varchar](15) NULL,
	[institucion] [varchar](100) NULL,
	[TipoFOndo] [varchar](1) NULL,
	[total] [decimal](8, 2) NULL,
	[porcentaje_total] [decimal](8, 2) NULL,
 CONSTRAINT [PK_Orden] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


