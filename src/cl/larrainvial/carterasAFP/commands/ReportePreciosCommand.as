package cl.larrainvial.carterasAFP.commands
{	
	import cl.larrainvial.carterasAFP.business.CarterasAFPDelegate;
	import cl.larrainvial.carterasAFP.events.ReporteEvent;
	import cl.larrainvial.carterasAFP.model.ModelLocator;
	import cl.larrainvial.carterasAFP.vo.ProcesoVO;
	import cl.larrainvial.carterasAFP.vo.ReportePrecioVO;
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.managers.CursorManager;
	import mx.rpc.IResponder;
	
	public class ReportePreciosCommand implements ICommand, IResponder
	{
		// attributes ============================
	    [Bindable]
		private var model:ModelLocator = ModelLocator.getInstance();
		
		[Bindable]
		private var _Delegate: CarterasAFPDelegate = new CarterasAFPDelegate(this as IResponder);
		
		[Embed(source="assets/images/ok.png")]
		private var okIcon:Class;
		public var evento:ReporteEvent
		
		public function execute(event:CairngormEvent) : void
		{	
			evento = ReporteEvent(event);
			_Delegate.sp_diferencia_precios(evento.xmlParam);
		}
		
		
		//----------------------------------------------------------------------------
		public function result(data:Object) : void
		{
			var xmlRespuesta:XML = XML(data.result);
			model.arrReportePrecio = new ArrayCollection();
			for each(var item:* in xmlRespuesta.Resultado.row)
			{				
				var instrumento:ReportePrecioVO = new ReportePrecioVO();
				instrumento.fillAttributes = item;
				model.arrReportePrecio.addItem(instrumento);
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




