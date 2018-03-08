package cl.larrainvial.carterasAFP.components
{
	import mx.controls.DataGrid;
	import mx.core.ContextualClassFactory;
	import mx.core.IFactory;
	import mx.core.IFlexModuleFactory;
	
	public class MyDataGrid extends DataGrid
	{
		public function MyDataGrid()
		{
			super();
			/*var flexModuleFactory:IFlexModuleFactory =
				getFontContext(fontName, bold, italic);*/
			super.itemRenderer = new ContextualClassFactory(
				RenderProcesos);
		}
	}
}