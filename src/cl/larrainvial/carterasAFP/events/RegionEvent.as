package cl.larrainvial.carterasAFP.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.utils.UIDUtil;
	
	
	public class RegionEvent extends CairngormEvent
	{
		public static const EVENT_REGION_LISTAR:String = UIDUtil.createUID();
		public static const EVENT_REGION_GUARDAR:String = UIDUtil.createUID();
		public static const EVENT_REGION_ACTUALIZAR:String = UIDUtil.createUID();
		public var xmlParam:String;
		public var callback:Function;
		public function RegionEvent(opt:String)
		{
			super(opt);		
		}
	}
}
