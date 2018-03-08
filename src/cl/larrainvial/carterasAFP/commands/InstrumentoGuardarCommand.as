package cl.larrainvial.carterasAFP.commands
{
	import cl.larrainvial.carterasAFP.business.CarterasAFPDelegate;
	import cl.larrainvial.carterasAFP.events.InstrumentoEvent;
	import cl.larrainvial.carterasAFP.model.ModelLocator;
	import cl.larrainvial.carterasAFP.vo.InstrumentoVO;
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	
	
	public class InstrumentoGuardarCommand implements ICommand, IResponder
	{		
		private var OrdDelegate:CarterasAFPDelegate = new CarterasAFPDelegate(this as IResponder);
		private var evento:InstrumentoEvent;
		
		//****************************************************************************************************
		public function execute(event:CairngormEvent):void
		{
			evento = InstrumentoEvent(event);
			OrdDelegate.sp_instrumento_guardar(evento.xmlParam);
		}
		//****************************************************************************************************
		public function result(data:Object):void
		{
			var xmlRespuesta:XML = XML(data.result);
			var item:* = xmlRespuesta.Resultado.row[0];
			var model:ModelLocator = ModelLocator.getInstance(); 
			
			var instrumento:InstrumentoVO = new InstrumentoVO();
			try{
				instrumento.fillAttributes = item;
				model.arrInstrumentos.addItem(instrumento);
				model.objInstrumentos[instrumento.id] = instrumento;
					
				evento.callback.call(this, instrumento, 'id_instrumento');
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

