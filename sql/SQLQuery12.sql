USE [Cartera_Agregada_AFP]
GO

/****** Object:  StoredProcedure [dbo].[sp_instrumento_actualizar]    Script Date: 02/27/2018 19:26:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_instrumento_actualizar]
	@xmlParam xml	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    DECLARE @isin varchar(50)
    DECLARE @ticker varchar(50)
    DECLARE @id int
    SELECT @isin = x.v.value('@isin', 'VARCHAR(100)'), @ticker = x.v.value('@ticker', 'VARCHAR(100)'), @id = x.v.value('@id', 'VARCHAR(100)')
			  FROM  @xmlParam.nodes('/Root/Dato') x(v)  
    
    IF not exists (SELECT 1 FROM [Cartera_Agregada_AFP].[dbo].[TbInstrumentos] WHERE (isin = @isin OR ticker = @ticker) AND id <> @id)
    BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
			   UPDATE  z
			   SET [isin] = x.v.value('@isin', 'VARCHAR(100)')
				  ,[ticker] = x.v.value('@ticker', 'VARCHAR(100)')
				  ,[tipo] = x.v.value('@tipo', 'VARCHAR(100)')
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
			      
				  FROM  [Cartera_Agregada_AFP].[dbo].[TbInstrumentos] z INNER JOIN @xmlParam.nodes('/Root/Dato') x(v) ON z.id = x.v.value('@id', 'VARCHAR(100)')
				COMMIT TRAN
				select 'El registro ha sido Actualizado' msg
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


