USE [Cartera_Agregada_AFP]
GO

/****** Object:  StoredProcedure [dbo].[sp_distribuidor_actualizar]    Script Date: 02/27/2018 19:26:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_distribuidor_actualizar]
	@xmlParam xml	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    	
UPDATE  z
   SET [tipo] = x.v.value('@tipo', 'VARCHAR(100)')
      ,[distribuidor] = x.v.value('@distribuidor', 'VARCHAR(100)')
      ,[manager] = x.v.value('@manager', 'VARCHAR(100)')
      ,[mercado] = x.v.value('@mercado', 'VARCHAR(100)')
      ,[estilo] = x.v.value('@estilo', 'VARCHAR(100)')
      ,[capitalizacion] = x.v.value('@capitalizacion', 'VARCHAR(100)')
      ,[gestion] = x.v.value('@gestion', 'VARCHAR(100)')
      ,[region] = x.v.value('@region', 'VARCHAR(100)')
      ,[subregion] = x.v.value('@subregion', 'VARCHAR(100)')
      ,[anio] = x.v.value('@anio', 'VARCHAR(100)')
      ,[periodo] = x.v.value('@periodo', 'VARCHAR(100)')      
      
      FROM  [Cartera_Agregada_AFP].[dbo].[TbDistribuidor] z INNER JOIN @xmlParam.nodes('/Root/Dato') x(v) ON z.id = x.v.value('@id', 'VARCHAR(100)')
  
END

GO


