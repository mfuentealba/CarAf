package cl.larrainvial.carterasAFP.commands
{
	import cl.larrainvial.carterasAFP.business.CarterasAFPDelegate;
	import cl.larrainvial.carterasAFP.events.ManagerEvent;
	import cl.larrainvial.carterasAFP.model.ModelLocator;
	import cl.larrainvial.carterasAFP.vo.ManagerVO;
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	
	
	public class ManagerGuardarCommand implements ICommand, IResponder
	{		
		private var OrdDelegate:CarterasAFPDelegate = new CarterasAFPDelegate(this as IResponder);
		private var evento:ManagerEvent;
		
		//****************************************************************************************************
		public function execute(event:CairngormEvent):void
		{
			evento = ManagerEvent(event);
			OrdDelegate.sp_manager_guardar(evento.xmlParam);
		}
		//****************************************************************************************************
		public function result(data:Object):void
		{
			var xmlRespuesta:XML = XML(data.result);
			var item:* = xmlRespuesta.Resultado.row[0];
			var model:ModelLocator = ModelLocator.getInstance(); 
			
			var dat:ManagerVO = new ManagerVO();
			try{
				dat.fillAttributes = item;
				model.arrManagers.addItem(dat);
				model.objManagers[dat.id] = dat;
				
				evento.callback.call(this, dat, 'id_manager');
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

