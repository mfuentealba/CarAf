package cl.larrainvial.carterasAFP.commands
{	
	import cl.larrainvial.carterasAFP.business.CarterasAFPDelegate;
	import cl.larrainvial.carterasAFP.events.ReporteEvent;
	import cl.larrainvial.carterasAFP.model.ModelLocator;
	import cl.larrainvial.carterasAFP.views.ReporteComparacionCarteras;
	import cl.larrainvial.carterasAFP.vo.ProcesoVO;
	import cl.larrainvial.carterasAFP.vo.ReporteCarteraVO;
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.managers.CursorManager;
	import mx.rpc.IResponder;
	
	public class ReporteCarteraCommand implements ICommand, IResponder
	{
		// attributes ============================
	    [Bindable]
		private var model:ModelLocator = ModelLocator.getInstance();
		
		[Bindable]
		private var _Delegate: CarterasAFPDelegate = new CarterasAFPDelegate(this as IResponder);
		
		[Embed(source="assets/images/ok.png")]
		private var okIcon:Class;
		public var evento:ReporteEvent;
		
		public function execute(event:CairngormEvent) : void
		{	
			evento = ReporteEvent(event);
			_Delegate.sp_diferencia_cartera('<WSParam><Parametros><XmlIn><Root><Dato /></Root></XmlIn></Parametros></WSParam>');
			
		}
		
		
		//----------------------------------------------------------------------------
		public function result(data:Object) : void
		{
			var xmlRespuesta:XML = XML(data.result);
			model.arrReporteCartera = new ArrayCollection();
			for each(var item:* in xmlRespuesta.Resultado.row)
			{				
				var instrumento:ReporteCarteraVO = new ReporteCarteraVO();
				instrumento.fillAttributes = item;
				model.arrReporteCartera.addItem(instrumento);
				//model.objInstrumentos[instrumento.id] = instrumento; 
			}
			
		}
				
		//----------------------------------------------------------------------------
		public function fault(info: Object):void
		{
			CursorManager.removeBusyCursor();
			Alert.show("Error con el Servicio, favor comunicarse con el administrador", "ERROR", Alert.OK, null, null);
		}
	}
}




