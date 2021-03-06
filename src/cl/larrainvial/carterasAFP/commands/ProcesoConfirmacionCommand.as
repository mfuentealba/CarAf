package cl.larrainvial.carterasAFP.commands
{	
	import cl.larrainvial.carterasAFP.business.CarterasAFPDelegate;
	import cl.larrainvial.carterasAFP.events.ProcesoEvent;
	import cl.larrainvial.carterasAFP.model.ModelLocator;
	import cl.larrainvial.carterasAFP.vo.ProcesoVO;
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.managers.CursorManager;
	import mx.rpc.IResponder;
	
	public class ProcesoConfirmacionCommand implements ICommand, IResponder
	{
		// attributes ============================
	    [Bindable]
		private var model:ModelLocator = ModelLocator.getInstance();
		
		[Bindable]
		private var _Delegate: CarterasAFPDelegate = new CarterasAFPDelegate(this as IResponder);
		
		[Embed(source="assets/images/ok.png")]
		private var okIcon:Class;
		public var evento:ProcesoEvent;
		
		public function execute(event:CairngormEvent) : void
		{	
			evento = ProcesoEvent(event);
			_Delegate.WMProcesarConfirmar(evento.xmlparam);
			
			//result(null)
		}
		
		
		//----------------------------------------------------------------------------
		public function result(data:Object) : void
		{
			//Alert.show(xmlRespuesta + '');
			var xmlRespuesta:XML = XML(data.result);
			Alert.show(xmlRespuesta.Resultado.row[0].@msg + '. Los datos guardados no pueden ser modificados', 'Info');
			evento.callback.call(this,xmlRespuesta.Resultado.row[0].@msg);
			
			/*model.arrProceso = new ArrayCollection();
			for each(var item:* in xmlRespuesta.Resultado.row)
			{				
				var proceso:ProcesoVO = new ProcesoVO();
				proceso.fillAttributes = item;
				model.arrProceso.addItem(proceso);
			}
			evento.callback.call(this, model.arrProceso); 
			*/
		}
				
		//----------------------------------------------------------------------------
		public function fault(info: Object):void
		{
			CursorManager.removeBusyCursor();
			Alert.show("Error con el Servicio, favor comunicarse con el administrador", "ERROR", Alert.OK, null, null);
		}
	}
}




