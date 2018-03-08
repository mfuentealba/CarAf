package cl.larrainvial.carterasAFP.events
{
	
	import cl.larrainvial.carterasAFP.controller.Controller;
	
	import com.adobe.cairngorm.control.CairngormEvent;
	
	
	
	public class ProcesoEvent extends CairngormEvent
	{
		public var callback:Function;
		public static const EVENT_PROCESO:String = "Proceso";
		
		public var xmlparam:String;
		
		public function ProcesoEvent()
		{
			super(EVENT_PROCESO);
			
		}
	}
}
