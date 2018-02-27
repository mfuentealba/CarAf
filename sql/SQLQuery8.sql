USE [Cartera_Agregada_AFP]
GO

/****** Object:  StoredProcedure [dbo].[sp_archivo_cartera_agregada_listar]    Script Date: 02/27/2018 19:26:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_archivo_cartera_agregada_listar]
	@xmlParam xml	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [anio]
      ,[periodo]
      ,[nemo]
      ,[institucion]
      ,[fondoA]
      ,[fondoB]
      ,[fondoC]
      ,[fondoD]
      ,[fondoE]
      ,[total]
      ,[porcentaje_total]
  FROM [Cartera_Agregada_AFP].[dbo].[TbArchivo_Cartera_Agregada]
  
  
END

GO


