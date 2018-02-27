package cl.larrainvial.carterasAFP.commands
{
	import cl.larrainvial.carterasAFP.business.CarterasAFPDelegate;
	import cl.larrainvial.carterasAFP.model.ModelLocator;
	import cl.larrainvial.carterasAFP.vo.ManagerVO;
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	
	
	public class ManagerListarCommand implements ICommand, IResponder
	{		
		private var OrdDelegate:CarterasAFPDelegate = new CarterasAFPDelegate(this as IResponder);
		
		//****************************************************************************************************
		[Bindable] private var model:ModelLocator = ModelLocator.getInstance(); 
		public function execute(event:CairngormEvent):void
		{
			OrdDelegate.sp_manager_listar('<WSParam><Parametros><XmlIn><Root><Dato /></Root></XmlIn></Parametros></WSParam>');
		}
		//****************************************************************************************************
		public function result(data:Object):void
		{
			var xmlRespuesta:XML = XML(data.result);
			model.arrManagers = new ArrayCollection();
			for each(var item:* in xmlRespuesta.Resultado.row)
			{				
				var manager:ManagerVO = new ManagerVO();
				manager.fillAttributes = item;
				model.arrManagers.addItem(manager);
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

