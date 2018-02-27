package cl.larrainvial.carterasAFP.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.utils.UIDUtil;
	
	
	public class ManagerEvent extends CairngormEvent
	{
		public static const EVENT_MANAGER_LISTAR:String = UIDUtil.createUID();
		public static const EVENT_MANAGER_GUARDAR:String = UIDUtil.createUID();
		public static const EVENT_MANAGER_ACTUALIZAR:String = UIDUtil.createUID();
		public var xmlParam:String;
		public var callback:Function;
		public function ManagerEvent(opt:String)
		{
			super(opt);		
		}
	}
}
