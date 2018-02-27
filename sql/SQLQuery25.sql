USE [CuboAFP]
GO

/****** Object:  Table [dbo].[TbCartera_Agregada]    Script Date: 02/27/2018 19:31:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TbCartera_Agregada](
	[anio] [varchar](4) NULL,
	[periodo] [varchar](7) NULL,
	[id_instrumento] [int] NOT NULL,
	[id_distribuidor] [int] NOT NULL,
	[id_manager] [int] NOT NULL,
	[id_region] [int] NOT NULL,
	[id_subregion] [int] NOT NULL,
	[dif_fondo_A] [decimal](18, 4) NOT NULL,
	[dif_fondo_B] [decimal](18, 4) NOT NULL,
	[dif_fondo_C] [decimal](18, 4) NOT NULL,
	[dif_fondo_D] [decimal](18, 4) NOT NULL,
	[dif_fondo_E] [decimal](18, 4) NOT NULL,
	[Total_posicion] [decimal](18, 4) NOT NULL,
	[precio_actual] [decimal](18, 4) NOT NULL,
	[precio_anterior] [decimal](18, 4) NOT NULL,
	[nro_cuotas] [decimal](18, 4) NOT NULL,
	[diferencias] [decimal](18, 4) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


