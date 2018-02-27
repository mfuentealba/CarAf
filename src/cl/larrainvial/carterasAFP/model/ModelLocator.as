package cl.larrainvial.carterasAFP.model
{
	
	import cl.larrainvial.carterasAFP.business.Services;
	
	import com.adobe.cairngorm.model.ModelLocator;
	
	import flash.utils.Timer;
	
	import mx.collections.ArrayCollection;
	import mx.containers.TitleWindow;
	import mx.events.DragEvent;

	[Bindable]
	public class ModelLocator
	{
		private static var modelLocator : cl.larrainvial.carterasAFP.model.ModelLocator;
		public var cntrBl:int;
		public var servicesCollection:Object = new ArrayCollection();
		public var servicio:Services;
		public var arrSubregiones:ArrayCollection;
		public var arrRegiones:ArrayCollection;
		public var arrManagers:ArrayCollection;
		public var arrInstrumentos:ArrayCollection;
		public var arrDistribuidores:ArrayCollection;
		public var arrPeriodos:ArrayCollection;
		public var arrTipoCartera:ArrayCollection;
		public var arrPais:ArrayCollection;
		public var rutaUpload:String;
		public var Loggeado:String;
		public var arrServiciosExternos:ArrayCollection;

		public static function getInstance():cl.larrainvial.carterasAFP.model.ModelLocator
		{
			if ( modelLocator == null )
				modelLocator = new cl.larrainvial.carterasAFP.model.ModelLocator();
			return modelLocator;
		}
		//-----------------------------------------------------------
		public function ModelLocator():void
		{
			if ( cl.larrainvial.carterasAFP.model.ModelLocator.modelLocator != null )
				throw new Error( 'Only one ModelLocator instance should be instantiated' );
		}
		
	}
	
}


