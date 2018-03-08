package cl.larrainvial.carterasAFP.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.utils.UIDUtil;
	
	
	public class ReporteEvent extends CairngormEvent
	{
		public static const EVENT_REPORTE_PRECIO_LISTAR:String = UIDUtil.createUID();
		public static const EVENT_REPORTE_CARTERA_LISTAR:String = UIDUtil.createUID();
		//public static const EVENT_EXCEL:String = UIDUtil.createUID();
		public var xmlParam:String;
		public var callback:Function;
		public function ReporteEvent(opt:String)
		{
			super(opt);		
		}
	}
}
