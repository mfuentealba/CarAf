package cl.larrainvial.carterasAFP.commands
{
	import cl.larrainvial.carterasAFP.business.CarterasAFPDelegate;
	import cl.larrainvial.carterasAFP.events.ManagerEvent;
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	
	
	public class ManagerActualizarCommand implements ICommand, IResponder
	{		
		private var OrdDelegate:CarterasAFPDelegate = new CarterasAFPDelegate(this as IResponder);
		private var evento:ManagerEvent;
		
		//****************************************************************************************************
		public function execute(event:CairngormEvent):void
		{
			evento = ManagerEvent(event);
			OrdDelegate.sp_manager_actualizar(evento.xmlParam);
		}
		//****************************************************************************************************
		public function result(data:Object):void
		{
			var xmlRespuesta:XML = XML(data.result);
			Alert.show(xmlRespuesta.Resultado.row[0].@msg, 'Info');
			evento.callback.call(this, xmlRespuesta);
		}
		//****************************************************************************************************
		public function fault(info:Object):void
		{
			Alert.show("Los Servicios no se encuentran Disponibles en éste momento.", "Server Error");
		}
		//****************************************************************************************************
		/*		public function ListaListaTodosLosInstrumentosCommand()
		{
		
		}*/
		
	}
}

