package cl.larrainvial.carterasAFP.controller
{
	import cl.larrainvial.carterasAFP.commands.DistribuidorActualizarCommand;
	import cl.larrainvial.carterasAFP.commands.DistribuidorGuardarCommand;
	import cl.larrainvial.carterasAFP.commands.DistribuidorListarCommand;
	import cl.larrainvial.carterasAFP.commands.InstrumentoActualizarCommand;
	import cl.larrainvial.carterasAFP.commands.InstrumentoGuardarCommand;
	import cl.larrainvial.carterasAFP.commands.InstrumentoListarCommand;
	import cl.larrainvial.carterasAFP.commands.ManagerActualizarCommand;
	import cl.larrainvial.carterasAFP.commands.ManagerGuardarCommand;
	import cl.larrainvial.carterasAFP.commands.ManagerListarCommand;
	import cl.larrainvial.carterasAFP.commands.RegionActualizarCommand;
	import cl.larrainvial.carterasAFP.commands.RegionGuardarCommand;
	import cl.larrainvial.carterasAFP.commands.RegionListarCommand;
	import cl.larrainvial.carterasAFP.commands.SubregionActualizarCommand;
	import cl.larrainvial.carterasAFP.commands.SubregionGuardarCommand;
	import cl.larrainvial.carterasAFP.commands.SubregionListarCommand;
	import cl.larrainvial.carterasAFP.events.DistribuidorEvent;
	import cl.larrainvial.carterasAFP.events.InstrumentoEvent;
	import cl.larrainvial.carterasAFP.events.ManagerEvent;
	import cl.larrainvial.carterasAFP.events.RegionEvent;
	import cl.larrainvial.carterasAFP.events.SubregionEvent;
	
	import com.adobe.cairngorm.control.FrontController;
	
	import mx.utils.UIDUtil;

    

	public class Controller extends FrontController
    {	
		//WS Events
		 
		

        public function Controller()
        {		
			//WS Events
			addCommand(SubregionEvent.EVENT_SUBREGION_LISTAR, SubregionListarCommand);
			addCommand(SubregionEvent.EVENT_SUBREGION_GUARDAR, SubregionGuardarCommand);
			addCommand(SubregionEvent.EVENT_SUBREGION_ACTUALIZAR, SubregionActualizarCommand);
			addCommand(RegionEvent.EVENT_REGION_LISTAR, RegionListarCommand);
			addCommand(RegionEvent.EVENT_REGION_GUARDAR, RegionGuardarCommand);
			addCommand(RegionEvent.EVENT_REGION_ACTUALIZAR, RegionActualizarCommand);
			addCommand(ManagerEvent.EVENT_MANAGER_LISTAR, ManagerListarCommand);
			addCommand(ManagerEvent.EVENT_MANAGER_GUARDAR, ManagerGuardarCommand);
			addCommand(ManagerEvent.EVENT_MANAGER_ACTUALIZAR, ManagerActualizarCommand);
			addCommand(InstrumentoEvent.EVENT_INSTRUMENTO_LISTAR, InstrumentoListarCommand);
			addCommand(InstrumentoEvent.EVENT_INSTRUMENTO_GUARDAR, InstrumentoGuardarCommand);
			addCommand(InstrumentoEvent.EVENT_INSTRUMENTO_ACTUALIZAR, InstrumentoActualizarCommand);
			addCommand(DistribuidorEvent.EVENT_DISTRIBUIDOR_LISTAR, DistribuidorListarCommand);
			addCommand(DistribuidorEvent.EVENT_DISTRIBUIDOR_GUARDAR, DistribuidorGuardarCommand);
			addCommand(DistribuidorEvent.EVENT_DISTRIBUIDOR_ACTUALIZAR, DistribuidorActualizarCommand);
			
       	}
    }
}


