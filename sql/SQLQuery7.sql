USE [Cartera_Agregada_AFP]
GO

/****** Object:  StoredProcedure [dbo].[sp_archivo_cartera_agregada_guardar]    Script Date: 02/27/2018 19:26:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_archivo_cartera_agregada_guardar]
	@xmlParam xml	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    INSERT INTO [Cartera_Agregada_AFP].[dbo].[TbArchivo_Cartera_Agregada]
           ([anio]
           ,[periodo]
           ,[nemo]
           ,[institucion]
           ,[fondoA]
           ,[fondoB]
           ,[fondoC]
           ,[fondoD]
           ,[fondoE]
           ,[total]
           ,[porcentaje_total])     
	SELECT x.v.value('@anio', 'VARCHAR(100)')
      ,x.v.value('@periodo', 'VARCHAR(100)')
      ,x.v.value('@nemo', 'VARCHAR(100)')
      ,x.v.value('@institucion', 'VARCHAR(100)')
      ,x.v.value('@fondoA', 'VARCHAR(100)')
      ,x.v.value('@fondoB', 'VARCHAR(100)')
      ,x.v.value('@fondoC', 'VARCHAR(100)')
      ,x.v.value('@fondoD', 'VARCHAR(100)')
      ,x.v.value('@fondoE', 'VARCHAR(100)')
      ,x.v.value('@total', 'VARCHAR(100)')
      ,x.v.value('@porcentaje_total', 'VARCHAR(100)')
    
	FROM  @xmlParam.nodes('/Root/Symbol') x(v)  
  
END

GO


