package cl.larrainvial.carterasAFP.commands
{
	import cl.larrainvial.carterasAFP.business.CarterasAFPDelegate;
	import cl.larrainvial.carterasAFP.events.RegionEvent;
	import cl.larrainvial.carterasAFP.model.ModelLocator;
	import cl.larrainvial.carterasAFP.vo.RegionVO;
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	
	
	public class RegionGuardarCommand implements ICommand, IResponder
	{		
		private var OrdDelegate:CarterasAFPDelegate = new CarterasAFPDelegate(this as IResponder);
		private var evento:RegionEvent;
		
		//****************************************************************************************************
		public function execute(event:CairngormEvent):void
		{
			evento = RegionEvent(event);
			OrdDelegate.sp_region_guardar(evento.xmlParam);
		}
		//****************************************************************************************************
		public function result(data:Object):void
		{
			var xmlRespuesta:XML = XML(data.result);
			var item:* = xmlRespuesta.Resultado.row[0];
			var model:ModelLocator = ModelLocator.getInstance(); 
			
			var dat:RegionVO = new RegionVO();
			try{
				dat.fillAttributes = item;
				model.arrRegiones.addItem(dat);
				model.objRegiones[dat.id] = dat;
				
				evento.callback.call(this, dat, 'id_region');
			} catch (e:*){
				Alert.show(xmlRespuesta.Resultado.row[0].@msg, 'Info');
			}
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

