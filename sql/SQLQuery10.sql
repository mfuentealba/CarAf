USE [Cartera_Agregada_AFP]
GO

/****** Object:  StoredProcedure [dbo].[sp_distribuidor_guardar]    Script Date: 02/27/2018 19:26:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_distribuidor_guardar]
	@xmlParam xml	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    INSERT INTO [Cartera_Agregada_AFP].[dbo].[TbDistribuidor]
           ([tipo]
           ,[distribuidor]
           ,[manager]
           ,[mercado]
           ,[estilo]
           ,[capitalizacion]
           ,[gestion]
           ,[region]
           ,[subregion]
           ,[anio]
           ,[periodo])    
	SELECT x.v.value('@tipo', 'VARCHAR(100)')
      , x.v.value('@distribuidor', 'VARCHAR(100)')
      , x.v.value('@manager', 'VARCHAR(100)')
      , x.v.value('@mercado', 'VARCHAR(100)')
      , x.v.value('@estilo', 'VARCHAR(100)')
      , x.v.value('@capitalizacion', 'VARCHAR(100)')
      , x.v.value('@gestion', 'VARCHAR(100)')
      , x.v.value('@region', 'VARCHAR(100)')
      , x.v.value('@subregion', 'VARCHAR(100)')
      , x.v.value('@anio', 'VARCHAR(100)')
      , x.v.value('@periodo', 'VARCHAR(100)')
	FROM  @xmlParam.nodes('/Root/Symbol') x(v)  
  
END

GO


