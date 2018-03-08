package cl.larrainvial.carterasAFP.events
{
	
	import cl.larrainvial.carterasAFP.controller.Controller;
	
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.utils.UIDUtil;
	
	
	
	public class ProcesoEvent extends CairngormEvent
	{
		public var callback:Function;
		public static const EVENT_PROCESO:String = UIDUtil.createUID();
		public static const EVENT_GUARDAR_PROCESO:String = UIDUtil.createUID();
		
		public var xmlparam:String;
		
		public function ProcesoEvent(op:String)
		{
			super(op);
			
		}
	}
}
