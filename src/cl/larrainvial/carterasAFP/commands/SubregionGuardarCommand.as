package cl.larrainvial.carterasAFP.commands
{
	import cl.larrainvial.carterasAFP.business.CarterasAFPDelegate;
	import cl.larrainvial.carterasAFP.events.SubregionEvent;
	import cl.larrainvial.carterasAFP.model.ModelLocator;
	import cl.larrainvial.carterasAFP.vo.SubregionVO;
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	
	
	public class SubregionGuardarCommand implements ICommand, IResponder
	{		
		private var OrdDelegate:CarterasAFPDelegate = new CarterasAFPDelegate(this as IResponder);
		private var evento:SubregionEvent;
		
		//****************************************************************************************************
		public function execute(event:CairngormEvent):void
		{
			evento = SubregionEvent(event);
			OrdDelegate.sp_subregion_guardar(evento.xmlParam);
		}
		//****************************************************************************************************
		public function result(data:Object):void
		{
			var xmlRespuesta:XML = XML(data.result);
			var item:* = xmlRespuesta.Resultado.row[0];
			var model:ModelLocator = ModelLocator.getInstance(); 
			
			var dat:SubregionVO = new SubregionVO();
			try{
				dat.fillAttributes = item;
				model.arrSubregiones.addItem(dat);
				model.objSubregiones[dat.id] = dat;
				
				evento.callback.call(this, dat, 'id_subregion');
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

