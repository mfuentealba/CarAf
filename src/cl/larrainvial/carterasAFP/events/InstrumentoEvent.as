package cl.larrainvial.carterasAFP.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.utils.UIDUtil;
	
	
	public class InstrumentoEvent extends CairngormEvent
	{
		public static const EVENT_INSTRUMENTO_LISTAR:String = UIDUtil.createUID();
		public static const EVENT_INSTRUMENTO_GUARDAR:String = UIDUtil.createUID();
		public static const EVENT_INSTRUMENTO_ACTUALIZAR:String = UIDUtil.createUID();
		public var xmlParam:String;
		public var callback:Function;
		public function InstrumentoEvent(opt:String)
		{
			super(opt);		
		}
	}
}
