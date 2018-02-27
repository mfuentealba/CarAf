package com.larrainvial.confirmarOrdenOYD.command
{	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.larrainvial.confirmarOrdenOYD.business.CMDDelegate;
	import com.larrainvial.confirmarOrdenOYD.events.ImportarEvent;
	import com.larrainvial.confirmarOrdenOYD.model.ModelLocator;
	import com.larrainvial.confirmarOrdenOYD.vo.OrdenFidessaVO;
	
	import mx.controls.Alert;
	import mx.managers.CursorManager;
	import mx.rpc.IResponder;
	
	public class ImportarCommand implements ICommand, IResponder
	{
		// attributes ============================
	    [Bindable]
		private var model:ModelLocator = ModelLocator.getInstance();
		
		[Bindable]
		private var _Delegate: CMDDelegate = new CMDDelegate(this as IResponder);
		
		[Embed(source="assets/images/Warning.png")]
		private var warningIcon:Class;
		
		[Embed(source="assets/images/ok.png")]
		private var okIcon:Class;
		public var evento:ImportarEvent;
		
		public function execute(event:CairngormEvent) : void
		{	
			evento = ImportarEvent(event);
			var oXMLParametro : String = event.data.toString();
			_Delegate.WMImportarOrdenes(oXMLParametro);
		}
		
		
		//----------------------------------------------------------------------------
		public function result(data:Object) : void
		{
			var str:String = XML(data.result).ARCHIVO_PROCESADO[0];
			if(str){
				try{
					
					str = XML(data.result).ARCHIVO_PROCESADO[0].RESUMEN[0].SIN_REGISTROS[0];
					if(str == 'SIN_REGISTROS'){
						Alert.show("Archivo importado con éxito", "Info", Alert.OK, null, null, okIcon);
					} else {
						var resXMLList:XMLList = XML(data.result).ARCHIVO_PROCESADO[0].RESUMEN[0].OrdenesFidessa[0]..OrdenFidessa;
						str = "Archivo importado con éxito\n\n\nSe dejaron en estado NOK las sgtes. ordenes confirmadas:";
						for each(var node :XML in resXMLList){
							var orden:OrdenFidessaVO = new OrdenFidessaVO();
							orden.fillAttributes = node;
							str += '\nOrden ID: ' + orden.ORDFid_IdOrdenFidessa;					
							  
						}
						Alert.show(str, "Info", Alert.OK, null, null, warningIcon);
						evento.callback.call(this);
					}	
				} catch(e:*){
					Alert.show('La importación a fallado', 'Error', Alert.OK, null, null, warningIcon);
				}
				
					
			} else {
				str = String(data.result).split('|')[1];
				if(str){
					Alert.show("El TICKER " + str + " no se encuentra registrado", 'Atención', Alert.OK, null, null, warningIcon);		
				} else {
					str = XML(data.result)..MENSAJE.toString();
					Alert.show(str, 'Atención', Alert.OK, null, null, warningIcon);
				}
				
			}
			
			
		}
				
		//----------------------------------------------------------------------------
		public function fault(info: Object):void
		{
			CursorManager.removeBusyCursor();
			Alert.show("Error con el Servicio, favor comunicarse con el administrador", "ERROR", Alert.OK, null, null, warningIcon);
		}
	}
}




