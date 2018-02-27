package cl.larrainvial.carterasAFP.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.utils.UIDUtil;
	
	
	public class SubregionEvent extends CairngormEvent
	{
		public static const EVENT_SUBREGION_LISTAR:String = UIDUtil.createUID();
		public static const EVENT_SUBREGION_GUARDAR:String = UIDUtil.createUID();
		public static const EVENT_SUBREGION_ACTUALIZAR:String = UIDUtil.createUID();
		public var xmlParam:String;
		public var callback:Function;
		public function SubregionEvent(opt:String)
		{
			super(opt);		
		}
	}
}
