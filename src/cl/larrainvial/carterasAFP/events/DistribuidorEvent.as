package cl.larrainvial.carterasAFP.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.utils.UIDUtil;
	
	
	public class DistribuidorEvent extends CairngormEvent
	{
		public static const EVENT_DISTRIBUIDOR_LISTAR:String = UIDUtil.createUID();
		public static const EVENT_DISTRIBUIDOR_GUARDAR:String = UIDUtil.createUID();
		public static const EVENT_DISTRIBUIDOR_ACTUALIZAR:String = UIDUtil.createUID();
		public var xmlParam:String;
		public var callback:Function;
		public function DistribuidorEvent(opt:String)
		{
			super(opt);		
		}
	}
}
