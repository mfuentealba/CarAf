package cl.larrainvial.carterasAFP.commands
{	
	import cl.larrainvial.carterasAFP.business.CarterasAFPDelegate;
	import cl.larrainvial.carterasAFP.events.ImportarEvent;
	import cl.larrainvial.carterasAFP.model.ModelLocator;
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.controls.Alert;
	import mx.managers.CursorManager;
	import mx.rpc.IResponder;
	
	public class ImportarCommand implements ICommand, IResponder
	{
		// attributes ============================
	    [Bindable]
		private var model:ModelLocator = ModelLocator.getInstance();
		
		[Bindable]
		private var _Delegate: CarterasAFPDelegate = new CarterasAFPDelegate(this as IResponder);
		
		[Embed(source="assets/images/ok.png")]
		private var okIcon:Class;
		public var evento:ImportarEvent;
		
		public function execute(event:CairngormEvent) : void
		{	
			evento = ImportarEvent(event);
			var oXMLParametro : String = event.data.toString();
			_Delegate.WMImportarOrdenes(oXMLParametro);
		}
		
		
		//----------------------------------------------------------------------------
		public function result(data:Object) : void
		{
			var xmlRespuesta:XML = XML(data.result);
			Alert.show(xmlRespuesta.Resultado.row[0].@msg, 'Info');
			evento.callback.call(this, data.result);
			
			
		}
				
		//----------------------------------------------------------------------------
		public function fault(info: Object):void
		{
			CursorManager.removeBusyCursor();
			Alert.show("Error con el Servicio, favor comunicarse con el administrador", "ERROR", Alert.OK, null, null);
		}
	}
}




