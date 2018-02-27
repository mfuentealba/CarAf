USE [Cartera_Agregada_AFP]
GO

/****** Object:  StoredProcedure [dbo].[sp_manager_guardar]    Script Date: 02/27/2018 19:27:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_manager_guardar]
	@xmlParam xml	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @val varchar(50)
    SELECT @val = x.v.value('@nombre', 'VARCHAR(100)')
			  FROM  @xmlParam.nodes('/Root/Dato') x(v)  
    
    IF not exists (SELECT 1 FROM [Cartera_Agregada_AFP].[dbo].[TbRegion] WHERE nombre = @val)
    BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;

    
				INSERT INTO [Cartera_Agregada_AFP].[dbo].[TbManager]
					   ([nombre]
					   ,[distribuidor]
					   ,[anio]
					   ,[periodo])       
				  SELECT x.v.value('@nombre', 'VARCHAR(100)')
				  ,x.v.value('@distribuidor', 'VARCHAR(100)')
				  ,x.v.value('@anio', 'VARCHAR(100)')
				  ,x.v.value('@periodo', 'VARCHAR(100)')
				FROM  @xmlParam.nodes('/Root/Dato') x(v) 
				COMMIT TRANSACTION;
				select 'Ingreso Exitoso' msg
		END TRY
		BEGIN CATCH
			SELECT
				ERROR_NUMBER() as ErrorNumber,
				ERROR_MESSAGE() as ErrorMessage;
			ROLLBACK TRANSACTION;    
			select 'Error al intentar grabar en base de datos' msg
		END CATCH;
    END
    ELSE
    BEGIN
		select 'El registro ' + @val + ' ha sido guardado anteriormente' msg
    END 
  
END

GO


