USE [Cartera_Agregada_AFP]
GO

/****** Object:  StoredProcedure [dbo].[sp_instrumento_guardar]    Script Date: 02/27/2018 19:26:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_instrumento_guardar]
	@xmlParam xml	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @isin varchar(50)
    DECLARE @ticker varchar(50)
    SELECT @isin = x.v.value('@isin', 'VARCHAR(100)'), @ticker = x.v.value('@ticker', 'VARCHAR(100)')
			  FROM  @xmlParam.nodes('/Root/Dato') x(v)  
    
    IF not exists (SELECT 1 FROM [Cartera_Agregada_AFP].[dbo].[TbInstrumentos] WHERE isin = @isin OR ticker = @ticker)
    BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				INSERT INTO [Cartera_Agregada_AFP].[dbo].[TbInstrumentos]
					   ([isin]
					   ,[ticker]
					   ,[tipo]
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
				
				  SELECT x.v.value('@isin', 'VARCHAR(100)')
				  ,x.v.value('@ticker', 'VARCHAR(100)')
				  ,x.v.value('@tipo', 'VARCHAR(100)')
				  ,x.v.value('@distribuidor', 'VARCHAR(100)')
				  ,x.v.value('@manager', 'VARCHAR(100)')
				  ,x.v.value('@mercado', 'VARCHAR(100)')
				  ,x.v.value('@estilo', 'VARCHAR(100)')
				  ,x.v.value('@capitalizacion', 'VARCHAR(100)')
				  ,x.v.value('@gestion', 'VARCHAR(100)')
				  ,x.v.value('@region', 'VARCHAR(100)')
				  ,x.v.value('@subregion', 'VARCHAR(100)')
				  ,x.v.value('@anio', 'VARCHAR(100)')
				  ,x.v.value('@periodo', 'VARCHAR(100)')
				FROM  @xmlParam.nodes('/Root/Dato') x(v)  
				COMMIT TRAN
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
		IF not exists (SELECT 1 FROM [Cartera_Agregada_AFP].[dbo].[TbInstrumentos] WHERE isin = @isin)
		BEGIN
			select 'El ISIN ' + @isin + ' ha sido guardado anteriormente' msg
		END
		ELSE
		BEGIN
			select 'El TICKER ' + @ticker + ' ha sido guardado anteriormente' msg
		END
    END
  
END

GO


