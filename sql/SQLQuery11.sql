USE [Cartera_Agregada_AFP]
GO

/****** Object:  StoredProcedure [dbo].[sp_distribuidor_listar]    Script Date: 02/27/2018 19:26:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_distribuidor_listar]
	@xmlParam xml	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  [tipo]
      ,[distribuidor]
      ,[manager]
      ,[mercado]
      ,[estilo]
      ,[capitalizacion]
      ,[gestion]
      ,[region]
      ,[subregion]
      ,[anio]
      ,[periodo]
  FROM [Cartera_Agregada_AFP].[dbo].[TbDistribuidor]
  
  
END

GO


