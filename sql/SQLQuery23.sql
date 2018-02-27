USE [Cartera_Agregada_AFP]
GO

/****** Object:  StoredProcedure [dbo].[sp_subregion_listar]    Script Date: 02/27/2018 19:27:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_subregion_listar]
	@XmlIn xml	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [id]
      ,[nombre]
      ,[region]
      ,[mercado]
  FROM [Cartera_Agregada_AFP].[dbo].[TbSubRegion]
  
  
END

GO


