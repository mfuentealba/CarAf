package cl.larrainvial.carterasAFP.vo
{
	import cl.larrainvial.carterasAFP.model.ModelLocator;
	

	[Bindable]
	public class ProcesoVO extends ObjectFiller
	{
		
		public var id:int
		public var anio:String;
		public var periodo:String;
		private var _id_instrumento:String;
		public var instrumento:InstrumentoVO;
		private var _id_distribuidor:String;
		public var distribuidor:DistribuidorVO;
		private var _id_manager:String;
		public var manager:ManagerVO;
		private var _id_region:String;
		public var region:RegionVO
		private var _id_subregion:String;
		public var subregion:SubregionVO
		public var fondoA:String;
		public var fondoB:String;
		public var fondoC:String;
		public var fondoD:String;
		public var fondoE:String;
		public var total:String;
		public var precio_actual:String;
		public var precio_anterior:String;
		public var nro_cuotas:String;
		public var diferencia_precio:String;
		public var nemo:String;

		public function get id_subregion():String
		{
			return _id_subregion;
		}

		public function set id_subregion(value:String):void
		{
			var model:ModelLocator = ModelLocator.getInstance(); 
			_id_subregion = value;
			subregion = model.objSubregiones[value];
		}

		public function get id_region():String
		{
			return _id_region;
		}

		public function set id_region(value:String):void
		{
			var model:ModelLocator = ModelLocator.getInstance();
			_id_region = value;
			region = model.objRegiones[value];
		}

		public function get id_manager():String
		{
			return _id_manager;
		}

		public function set id_manager(value:String):void
		{
			var model:ModelLocator = ModelLocator.getInstance();
			_id_manager = value;
			manager = model.objManagers[value];
		}

		public function get id_distribuidor():String
		{
			return _id_distribuidor;
		}

		public function set id_distribuidor(value:String):void
		{
			var model:ModelLocator = ModelLocator.getInstance();
			_id_distribuidor = value;
			distribuidor = model.objDistribuidores[value];
		}

		public function get id_instrumento():String
		{
			return _id_instrumento;
		}

		public function set id_instrumento(value:String):void
		{
			var model:ModelLocator = ModelLocator.getInstance();
			_id_instrumento = value;
			instrumento = model.objInstrumentos[value];
		}

	}
}