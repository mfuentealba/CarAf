package cl.larrainvial.carterasAFP.business
{
	
	
	
	
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	[Bindable]
	public class CarterasAFPDelegate
	{
		
		private var responder : IResponder;
		private var service : Object;
		
		private var resultHandler:Function;
		
		//*****************************************************************************************************
		public function CarterasAFPDelegate( responder : IResponder )
		{
			this.service = ServiceLocator.getInstance().getWebService("WSCarterasAFP");
			this.responder = responder;
		}
		//*****************************************************************************************************
		public function sp_subregion_listar(xmlParam:String):void
		{
			try
			{		
				//service.wsdl = 'http://localhost:5789/WSCarterasAFP/Service.asmx?wsdl';
				//service.uri = 'http://localhost:5789/WSCarterasAFP/Service.asmx';
				var token : AsyncToken;				
				token = service.sp_subregion_listar(xmlParam);	
				token.addResponder(responder);
			}
			catch (err:Error)
			{
				Alert.show(err.getStackTrace());
				
			}
		}			
		//*****************************************************************************************************
		
		public function sp_subregion_guardar(xmlParam:String):void
		{
			try
			{		
				var token : AsyncToken;				
				token = service.sp_subregion_guardar(xmlParam);	
				token.addResponder(responder);
			}
			catch (err:Error)
			{
				Alert.show(err.getStackTrace());
				
			}
		}			
		//*****************************************************************************************************
		public function sp_subregion_actualizar(xmlParam:String):void
		{
			try
			{		
				var token : AsyncToken;				
				token = service.sp_subregion_actualizar(xmlParam);	
				token.addResponder(responder);
			}
			catch (err:Error)
			{
				Alert.show(err.getStackTrace());
				
			}
		}			
		
		//*****************************************************************************************************
		public function sp_region_listar(xmlParam:String):void
		{
			try
			{		
				//service.wsdl = 'http://localhost:5789/WSCarterasAFP/Service.asmx?wsdl';
				//service.uri = 'http://localhost:5789/WSCarterasAFP/Service.asmx';
				var token : AsyncToken;				
				token = service.sp_region_listar(xmlParam);	
				token.addResponder(responder);
			}
			catch (err:Error)
			{
				Alert.show(err.getStackTrace());
				
			}
		}			
		//*****************************************************************************************************
		
		public function sp_region_guardar(xmlParam:String):void
		{
			try
			{		
				var token : AsyncToken;				
				token = service.sp_region_guardar(xmlParam);	
				token.addResponder(responder);
			}
			catch (err:Error)
			{
				Alert.show(err.getStackTrace());
				
			}
		}			
		//*****************************************************************************************************
		public function sp_region_actualizar(xmlParam:String):void
		{
			try
			{		
				var token : AsyncToken;				
				token = service.sp_region_actualizar(xmlParam);	
				token.addResponder(responder);
			}
			catch (err:Error)
			{
				Alert.show(err.getStackTrace());
				
			}
		}		
		
		//*****************************************************************************************************
		public function sp_manager_listar(xmlParam:String):void
		{
			try
			{		
				//service.wsdl = 'http://localhost:5789/WSCarterasAFP/Service.asmx?wsdl';
				//service.uri = 'http://localhost:5789/WSCarterasAFP/Service.asmx';
				var token : AsyncToken;				
				token = service.sp_manager_listar(xmlParam);	
				token.addResponder(responder);
			}
			catch (err:Error)
			{
				Alert.show(err.getStackTrace());
				
			}
		}			
		//*****************************************************************************************************
		
		public function sp_manager_guardar(xmlParam:String):void
		{
			try
			{		
				var token : AsyncToken;				
				token = service.sp_manager_guardar(xmlParam);	
				token.addResponder(responder);
			}
			catch (err:Error)
			{
				Alert.show(err.getStackTrace());
				
			}
		}			
		//*****************************************************************************************************
		public function sp_manager_actualizar(xmlParam:String):void
		{
			try
			{		
				var token : AsyncToken;				
				token = service.sp_manager_actualizar(xmlParam);	
				token.addResponder(responder);
			}
			catch (err:Error)
			{
				Alert.show(err.getStackTrace());
				
			}
		}		
		
		//*****************************************************************************************************
		public function sp_instrumento_listar(xmlParam:String):void
		{
			try
			{		
				//service.wsdl = 'http://localhost:5789/WSCarterasAFP/Service.asmx?wsdl';
				//service.uri = 'http://localhost:5789/WSCarterasAFP/Service.asmx';
				var token : AsyncToken;				
				token = service.sp_instrumento_listar(xmlParam);	
				token.addResponder(responder);
			}
			catch (err:Error)
			{
				Alert.show(err.getStackTrace());
				
			}
		}			
		//*****************************************************************************************************
		
		public function sp_instrumento_guardar(xmlParam:String):void
		{
			try
			{		
				var token : AsyncToken;				
				token = service.sp_instrumento_guardar(xmlParam);	
				token.addResponder(responder);
			}
			catch (err:Error)
			{
				Alert.show(err.getStackTrace());
				
			}
		}			
		//*****************************************************************************************************
		public function sp_instrumento_actualizar(xmlParam:String):void
		{
			try
			{		
				var token : AsyncToken;				
				token = service.sp_instrumento_actualizar(xmlParam);	
				token.addResponder(responder);
			}
			catch (err:Error)
			{
				Alert.show(err.getStackTrace());
				
			}
		}		
		
		//*****************************************************************************************************
		public function sp_distribuidor_listar(xmlParam:String):void
		{
			try
			{		
				//service.wsdl = 'http://localhost:5789/WSCarterasAFP/Service.asmx?wsdl';
				//service.uri = 'http://localhost:5789/WSCarterasAFP/Service.asmx';
				var token : AsyncToken;				
				token = service.sp_distribuidor_listar(xmlParam);	
				token.addResponder(responder);
			}
			catch (err:Error)
			{
				Alert.show(err.getStackTrace());
				
			}
		}			
		//*****************************************************************************************************
		
		public function sp_distribuidor_guardar(xmlParam:String):void
		{
			try
			{		
				var token : AsyncToken;				
				token = service.sp_distribuidor_actualizar(xmlParam);	
				token.addResponder(responder);
			}
			catch (err:Error)
			{
				Alert.show(err.getStackTrace());
				
			}
		}			
		//*****************************************************************************************************
		public function sp_distribuidor_actualizar(xmlParam:String):void
		{
			try
			{		
				var token : AsyncToken;				
				token = service.sp_distribuidor_actualizar(xmlParam);	
				token.addResponder(responder);
			}
			catch (err:Error)
			{
				Alert.show(err.getStackTrace());
				
			}
		}	
		
		//*****************************************************************************************************
		public function WMImportarOrdenes(xmlParam:String):void
		{
			try
			{		
				var token : AsyncToken;				
				token = service.Importacion(xmlParam);	
				token.addResponder(responder);
			}
			catch (err:Error)
			{
				Alert.show(err.getStackTrace());
				
			}
		}	
		
	}
}