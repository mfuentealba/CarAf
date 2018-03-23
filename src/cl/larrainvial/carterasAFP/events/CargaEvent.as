package cl.larrainvial.carterasAFP.events
{
	
	import cl.larrainvial.carterasAFP.controller.Controller;
	
	import com.adobe.cairngorm.control.CairngormEvent;
	
	
	
	public class CargaEvent extends CairngormEvent
	{
		public var callback:Function;
		public var xmlParam:String;
		public static const EVENT_CARGA:String = "Carga";
		
		public function CargaEvent()
		{
			super(EVENT_CARGA);
			
		}
	}
}
