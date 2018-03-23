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
	
	public class ProcesoCommand implements ICommand, IResponder
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
			_Delegate.WMProcesar(evento.xmlparam);
			
			//result(null)
		}
		
		
		//----------------------------------------------------------------------------
		public function result(data:Object) : void
		{
			//Alert.show(xmlRespuesta + '');
			var xmlRespuesta:XML = XML(data.result);
			//var xmlRespuesta:XML = XML('<WS xmlns:sql="urn:schemas-microsoft-com:xml-sql"><Resultado><row anio="2018" periodo="2018-03" fondoA="22.26009419" fondoB="17.28000000" fondoC=".00000000" fondoD=".00000000" fondoE=".00000000" total="20.94" nro_cuotas="524286.4296444667000" diferencia_precio=".967538759689922" precio_actual="19.9700" precio_anterior="20.6400" nemo="US8938702045/SIN TICKER" /></Resultado><Error Status="0" /></WS>');//
			
			model.arrProceso = new ArrayCollection();
			for each(var item:* in xmlRespuesta.Resultado.row)
			{				
				var proceso:ProcesoVO = new ProcesoVO();
				proceso.fillAttributes = item;
				model.arrProceso.addItem(proceso);
			}
			evento.callback.call(this, model.arrProceso); 
			
		}
				
		//----------------------------------------------------------------------------
		public function fault(info: Object):void
		{
			CursorManager.removeBusyCursor();
			Alert.show("Error con el Servicio, favor comunicarse con el administrador", "ERROR", Alert.OK, null, null);
		}
	}
}




