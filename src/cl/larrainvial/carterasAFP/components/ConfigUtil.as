package cl.larrainvial.carterasAFP.components
{
	import cl.larrainvial.carterasAFP.model.ModelLocator;
	import cl.larrainvial.carterasAFP.vo.ConfigVO;
	import cl.larrainvial.comun.componentes.AlertaCustom;
	
	import mx.controls.Alert;
	import mx.utils.StringUtil;
	import mx.validators.Validator;
	
	

	public class ConfigUtil
	{
		public static var model:ModelLocator=ModelLocator.getInstance();
		public static function CDATA(nm:String, info:String):XML
		{
			return <{nm}>{new XML("<![CDATA[" + info + "]]>")}</{nm}>;
		}
		
		public static function fnDateCL(date:String):String{
			var arrDate:Array = date.split('-');
			arrDate = arrDate.reverse();
			date = arrDate.join('/');
			return date;
		}
		
		public static function fnDateDB(date:String):String{
			var arrDate:Array = date.split('/');
			arrDate = arrDate.reverse();
			date = arrDate.join('-');
			return date;
		}
		
		public static function sinFormato(numero : String) : Number
		{
			var resultado : Number;
			
			
			
			
			resultado = Number(numero);
			if(isNaN(resultado)){
				var str:String = String(numero.split('.').join(''));	
				str = String(str.split(',').join('.'));
				resultado =  Number(str);	
			}
			
			return resultado;
		}	
		
		
		public static function fnFormatoNombres(str : String) : String
		{
			var resultado:String = StringUtil.trim(str);
			var arr:Array = resultado.split(/ +/);
			resultado = arr.join(' ');
			resultado = resultado.charAt(0).toUpperCase() + resultado.substr(1);
			return resultado;
		}	
		
		public static function fnvalidaFormatoPeriodo(str : String) : String
		{	
			var resultado:String = '';
			var reg:RegExp = /^20\d{2}-(0|1)[0-9]$/;
			
			var val:* = str.search(reg);
			
			if(val < 0){
				Alert.show("Se debe ingresar el periodo en formato aaaa-mm", "Atención");
				return '';
			}
			
			return str;
			
			/*
			var arr:Array = str.split('-');
			if(arr.length == 1){
				Alert.show("Se debe ingresar el periodo en formato aaaa-mm", "Atención");
			} else if()
			resultado = arr.join(' ');
			resultado = resultado.charAt(0).toUpperCase() + resultado.substr(1);
			return resultado;*/
			
		}	
		
		public static function fnvalidaAnio(str : String) : String
		{	
			var resultado:String = '';
			var reg:RegExp = /^20\d{2}$/;
			
			var val:* = str.search(reg);
			
			if(val < 0){
				Alert.show("Se debe ingresar el periodo en formato aaaa", "Atención");
				return '';
			}
			
			return str;
			
			/*
			var arr:Array = str.split('-');
			if(arr.length == 1){
			Alert.show("Se debe ingresar el periodo en formato aaaa-mm", "Atención");
			} else if()
			resultado = arr.join(' ');
			resultado = resultado.charAt(0).toUpperCase() + resultado.substr(1);
			return resultado;*/
			
		}	
		
		
		public static function buscarRuta(id:String, tipoRuta:String="wsdl"):String
		{
			var model:ModelLocator = ModelLocator.getInstance();
			var alerta:AlertaCustom;
			var ruta:String=new String();
			try
			{
				if (model.servicesCollection && model.servicesCollection.length > 0)
				{
					if (tipoRuta == "wsdl" || tipoRuta == "uri")
					{
						for each (var nodeRuta:* in model.servicesCollection)
						{
							if (nodeRuta.id == id)
							{
								ruta=nodeRuta[tipoRuta];
								break;
							}
						}
					}
					else
					{
						alerta=new AlertaCustom();
						alerta.show("El Tipo de ruta no es válido, debe solicitar un 'wsdl' o una 'uri'", "Atención", AlertaCustom.INFO);
					}
				}
				else
				{
					alerta=new AlertaCustom();
					alerta.show("No hay rutas especificadas en la configuración", "Atención", AlertaCustom.INFO);
				}
			}
			catch (e:Error)
			{
				alerta=new AlertaCustom();
				alerta.show("Ha ocurrido un error buscando una ruta en la configuración", "Client Error", AlertaCustom.FATAL, e.getStackTrace());
			}
			finally
			{
				return ruta;
			}
		}
	}
}