package cl.larrainvial.carterasAFP.events
{
	
	import cl.larrainvial.carterasAFP.controller.Controller;
	
	import com.adobe.cairngorm.control.CairngormEvent;
	
	
	
	public class ImportarEvent extends CairngormEvent
	{
		public var callback:Function;
		public static const EVENT_IMPORTAR:String = "Importar";
		
		public function ImportarEvent(xml: String)
		{
			super(Controller.)
			this.data = xml;
		}
	}
}
