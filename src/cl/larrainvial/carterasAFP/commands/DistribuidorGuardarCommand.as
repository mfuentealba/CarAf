package cl.larrainvial.carterasAFP.commands
{
	import cl.larrainvial.carterasAFP.business.CarterasAFPDelegate;
	import cl.larrainvial.carterasAFP.events.DistribuidorEvent;
	import cl.larrainvial.carterasAFP.model.ModelLocator;
	import cl.larrainvial.carterasAFP.vo.DistribuidorVO;
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	
	
	public class DistribuidorGuardarCommand implements ICommand, IResponder
	{		
		private var OrdDelegate:CarterasAFPDelegate = new CarterasAFPDelegate(this as IResponder);
		private var evento:DistribuidorEvent;
		
		//****************************************************************************************************
		public function execute(event:CairngormEvent):void
		{
			evento = DistribuidorEvent(event);
			OrdDelegate.sp_distribuidor_guardar(evento.xmlParam);
		}
		//****************************************************************************************************
		public function result(data:Object):void
		{
			var xmlRespuesta:XML = XML(data.result);
			var item:* = xmlRespuesta.Resultado.row[0];
			var model:ModelLocator = ModelLocator.getInstance(); 
			
			var dat:DistribuidorVO = new DistribuidorVO();
			try{
				dat.fillAttributes = item;
				model.arrDistribuidores.addItem(dat);
				model.objDistribuidores[dat.id] = dat;
				
				evento.callback.call(this, dat, 'id_distribuidor');
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

