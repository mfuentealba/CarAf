package cl.larrainvial.carterasAFP.components
{
	public class DataGrid2Excel
	{
		/**
		 * Autor de la clase: Francisco Rodríguez Cala
		 * http://www.meetworks.com
		 * http://www.presenciaeninternet.es
		 * paco@meetworks.com
		 *
		 * Los créditos originales vienen a continuación. Lo único que he hecho es modificar ligeramente código 
		 * que he encontrado por ahí; encapsulando la funcionalidad que necesitaba en forma de clase
		 *
		 * Créditos originales:
		 * Simple script to convert a Datagrid to a HTML table and then 
		 * pass it on to an external excel exporter
		 *
		 * @author: S.Radovanovic (With help of Tracy Spratt through the post on
		 *          http://www.cflex.net/showFileDetails.cfm?ObjectID=298&Object=File&ChannelID=1)
		 */    
		
		import mx.controls.Alert;
		import mx.core.UIComponent;
		import mx.core.Container;
		import mx.events.ItemClickEvent;
		import mx.utils.ObjectProxy;
		import flash.errors.*;
		import flash.events.*;
		import flash.external.*;		
		import flash.net.URLLoader;
		import flash.net.URLVariables;
		import flash.net.URLRequest;
		import flash.net.URLRequestMethod;
		import flash.net.navigateToURL;
		import mx.controls.DataGrid;
		
		//Ubicación del script PHP de exportación a Excel
		public static var urlExcelExport:String;
		
		
		/**
		 * Convert the datagrid to a html table
		 * Styling etc. can be done externally
		 * 
		 * @param: dg Datagrid Contains the datagrid that needs to be converted
		 * @returns: String
		 */
		public static function convertDGToHTMLTable(dg:DataGrid, objNumber:Object = null, objConfigFormato:Object = null):String {
			//Set default values
			if(!objConfigFormato){
				objConfigFormato = {};
			}
			var mostrarInvisibles:Boolean = objConfigFormato.mostrarInvisibles == null ? false : objConfigFormato.mostrarInvisibles;
			var mostrarCab:Boolean = objConfigFormato.mostrarCab == null ? true : objConfigFormato.mostrarCab;
			var mostrarLogo:Boolean = objConfigFormato.mostrarLogo == null ? true : objConfigFormato.mostrarLogo;
			
			
			if(!objNumber){
				objNumber = {};
			}
			var font:String = dg.getStyle('fontFamily');
			var size:String = dg.getStyle('fontSize');
			var str:String = '';
			var colors:String = '';
			var style:String = 'style="font-family:'+font+';font-size:'+size+'pt;"';
			var hcolor:Array;
			
			
			//Retrieve the headercolor
			/*if(dg.getStyle("headerColor") != undefined) {
				hcolor = [dg.getStyle("headerColor")];
			} else {
				hcolor = dg.getStyle("headerColors");
			}	*/			
			
			
			
			
			//Set the htmltabel based upon knowlegde from the datagrid
			//str+= '<table width="'+dg.width+'"><thead><tr width="'+dg.width+'" style="background-color:#' +Number((hcolor[0])).toString(16)+'">';
			
			str+= '<table border=\"1\"><thead>';
			if(mostrarLogo){
				str+= '<tr><th><img src="http://www.larrainvial.com/images/logo.gif"/><th></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>'	
			} 
			
			//str+= '<tr style="background-color:#' +Number((hcolor[0])).toString(16)+';' + (objNumber.hasOwnProperty('HeaderTextColor') ? objNumber['HeaderTextColor'] : '') + '">';
			str+= '<tr style="background-color:#FFFFFF;' + (objNumber.hasOwnProperty('HeaderTextColor') ? objNumber['HeaderTextColor'] : '') + '">';
			
			//Set the tableheader data (retrieves information from the datagrid header		
			
			if(mostrarCab){
				for(var i:int = 0;i<dg.columns.length;i++) {
					//colors = dg.getStyle("themeColor");
					
					if(dg.columns[i].visible || mostrarInvisibles)
					{
						if(dg.columns[i].headerText != undefined) {
							str+="<th "+style+">"+dg.columns[i].headerText+"</th>";
						} else {
							str+= "<th "+style+">"+dg.columns[i].dataField+"</th>";
						}
					}
				}	
			}
			
			
			str += "</tr></thead><tbody border=\"1px\">";
			colors = dg.getStyle("alternatingRowColors");
			
			//Loop through the records in the dataprovider and 
			//insert the column information into the table
			for(var j:int =0;j<dg.dataProvider.length;j++) {					
				//str+="<tr width=\""+Math.ceil(dg.width)+"\">";
				str+="<tr>";
				
				for(var k:int=0; k < dg.columns.length; k++) {
					
					if(dg.columns[k].visible || mostrarInvisibles)
					{
						//Do we still have a valid item?						
						if(dg.dataProvider.getItemAt(j) != undefined && dg.dataProvider.getItemAt(j) != null) {
							
							//Check to see if the user specified a labelfunction which we must
							//use instead of the dataField
							if(dg.columns[k].labelFunction != undefined) {
								//str += "<td width=\""+Math.ceil(dg.columns[k].width)+"\" "+style+">"+dg.columns[k].labelFunction(dg.dataProvider.getItemAt(j),dg.columns[k].dataField)+"</td>";
								str += "<td "+style+ (objNumber.hasOwnProperty(dg.columns[k].dataField) ? objNumber[dg.columns[k].dataField] : '') + '>'+(dg.columns[k].labelFunction(dg.dataProvider.getItemAt(j),dg.columns[k]) == null ? '' : dg.columns[k].labelFunction(dg.dataProvider.getItemAt(j),dg.columns[k]))+"</td>";
							} else {
								//Our dataprovider contains the real data
								//We need the column information (dataField)
								//to specify which key to use.
								//str += "<td width=\""+Math.ceil(dg.columns[k].width)+"\" "+style+">"+dg.dataProvider.getItemAt(j)[dg.columns[k].dataField]+"</td>";
								str += "<td "+style+(objNumber.hasOwnProperty(dg.columns[k].dataField) ? objNumber[dg.columns[k].dataField] : '') +'>'+(ignorarBoleano(dg.dataProvider.getItemAt(j)[dg.columns[k].dataField]) == null ? '' : ignorarBoleano(dg.dataProvider.getItemAt(j)[dg.columns[k].dataField]).split('.').join(','))+"</td>";
							}
						}
						
					}
				}
				str += "</tr>";
			}
			str+="</tbody></table>";
			
			trace(str)
			return str;
		}
		
		
		
		/**
		 * Convert the datagrid to a html table
		 * Styling etc. can be done externally
		 * 
		 * @param: dg Datagrid Contains the datagrid that needs to be converted
		 * @returns: String
		 */
		public static function convertDGXMLTreeToHTMLTable(dg:DataGrid):String {
			//Set default values
			var font:String = dg.getStyle('fontFamily');
			var size:String = dg.getStyle('fontSize');
			var str:String = '';
			var colors:String = '';
			var style:String = 'style="font-family:'+font+';font-size:'+size+'pt;"';				
			var hcolor:Array;
			
			//Retrieve the headercolor
			if(dg.getStyle("headerColor") != undefined) {
				hcolor = [dg.getStyle("headerColor")];
			} else {
				hcolor = dg.getStyle("headerColors");
			}				
			
			
			
			
			//Set the htmltabel based upon knowlegde from the datagrid
			//str+= '<table width="'+dg.width+'"><thead><tr width="'+dg.width+'" style="background-color:#' +Number((hcolor[0])).toString(16)+'">';
			
			str+= '<table><thead><tr><th><img src="http://www.larrainvial.com/images/logo.gif"/><th></tr>'
			str+= '<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>'
			str+= '<tr style="background-color:#' +Number((hcolor[0])).toString(16)+'">';
			
			//Set the tableheader data (retrieves information from the datagrid header				
			for(var i:int = 0;i<dg.columns.length;i++) {
				colors = dg.getStyle("themeColor");
				
				if(dg.columns[i].visible)
				{
					if(dg.columns[i].headerText != undefined) {
						str+="<th "+style+"><b>"+dg.columns[i].headerText+"</b></th>";
					} else {
						str+= "<th "+style+"><b>"+dg.columns[i].dataField+"</b></th>";
					}
				}
			}
			str += "</tr></thead><tbody>";
			colors = dg.getStyle("alternatingRowColors");
			
			//Loop through the records in the dataprovider and 
			//insert the column information into the table
			for(var j:int =0;j<dg.dataProvider.length;j++) {					
				//str+="<tr width=\""+Math.ceil(dg.width)+"\">";
				str+="<tr>";
				
				for(var k:int=0; k < dg.columns.length; k++) {
					
					if(dg.columns[k].visible)
					{
						//Do we still have a valid item?						
						if(dg.dataProvider.getItemAt(j) != undefined && dg.dataProvider.getItemAt(j) != null) {
							
							//Check to see if the user specified a labelfunction which we must
							//use instead of the dataField
							if(dg.columns[k].labelFunction != undefined) {
								//str += "<td width=\""+Math.ceil(dg.columns[k].width)+"\" "+style+">"+dg.columns[k].labelFunction(dg.dataProvider.getItemAt(j),dg.columns[k].dataField)+"</td>";
								str += "<td "+style+"><b>"+dg.columns[k].labelFunction(dg.dataProvider.getItemAt(j),dg.columns[k])+"</b></td>";
							} else {
								//Our dataprovider contains the real data
								//We need the column information (dataField)
								//to specify which key to use.
								//str += "<td width=\""+Math.ceil(dg.columns[k].width)+"\" "+style+">"+dg.dataProvider.getItemAt(j)[dg.columns[k].dataField]+"</td>";
								str += "<td "+style+"><b>"+ignorarBoleano(dg.dataProvider.getItemAt(j)[dg.columns[k].dataField])+"</b></td>";
							}
						}
						
					}
				}
				str += "</tr>";
				
				/**************************SECCION PARA VER LOS CAMPOS DENTRO DEL XML DE PARAMETROS************************/
				
				
				var auxXML:XML = new XML()
				
				if(dg.dataProvider.getItemAt(j) != undefined && dg.dataProvider.getItemAt(j) != null) 
				{
					
					auxXML = dg.dataProvider.getItemAt(j);
					for each (var itemTemp:XML in auxXML.children())
					{
						str+="<tr>";
						
						str += "<td "+style+">"+ " " +"</td>";
						str += "<td "+style+">"+ itemTemp.@nroFact +"</td>";
						//str += "<td "+style+">"+ FormaterPatterns.formatEntero(itemTemp.@monto) +"</td>";
						
						
						str += "</tr>";
					}
				}			
				
				
				
				
				
				/*********************************************************************************************************/
			}	
			
			str+="</tbody></table>";
			
			trace(str)
			return str;
		}    
		
		public static function ignorarBoleano(strObject:String):String
		{
			var strTemp:String = strObject;
			
			if(strObject == "true" || strObject == "false")
			{
				strTemp = "";
			}
			
			return strTemp
			
		}
		
		/**
		 * Load a specific datagrid into Excel
		 * This method passes the htmltable string to an backend script which then
		 * offers the excel download to the user.
		 * The reason for not using a copy to clipboard and then javascript to
		 * insert it into Excel is that this mostly will fail because of the user
		 * setup (Webbrowser configuration).
		 * 
		 * @params: dg Datagrid The Datagrid that will be loaded into Excel
		 */
		public function loadDGInExcel(dg:DataGrid, obj:Object = null):void {
			
			var variables:URLVariables = new URLVariables(); 
			variables.htmltable	= DataGrid2Excel.convertDGToHTMLTable(dg, obj);
			variables.nombreExcel = "Documento_Excel";
			variables.tipo = "A";
			var u:URLRequest = new URLRequest(DataGrid2Excel.urlExcelExport);
			u.data = variables; 
			u.method = URLRequestMethod.POST; 
			
			navigateToURL(u,"_top");
		}  
		
		public function loadDGInExcel2(str:String, obj:Object = null):void {
			
			var variables:URLVariables = new URLVariables(); 
			variables.htmltable	= str
			variables.nombreExcel = "Documento_Excel";
			variables.tipo = "A";
			var u:URLRequest = new URLRequest(DataGrid2Excel.urlExcelExport);
			u.data = variables; 
			u.method = URLRequestMethod.POST; 
			
			navigateToURL(u,"_top");
		}  
		
		
		public function loadDGTreeInExcel(dg:DataGrid):void {
			
			var variables:URLVariables = new URLVariables(); 
			variables.htmltable	= DataGrid2Excel.convertDGXMLTreeToHTMLTable(dg);
			variables.nombreExcel = "Documento_Excel";
			variables.tipo = "A";
			var u:URLRequest = new URLRequest(DataGrid2Excel.urlExcelExport);
			u.data = variables; 
			u.method = URLRequestMethod.POST; 
			
			navigateToURL(u,"_top");
		}       
	}
}