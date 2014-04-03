// ActionScript file

package objetosJava { 
	import mx.controls.Label; 
	import mx.controls.DataGrid; 
	import mx.controls.dataGridClasses.*; 
	import flash.display.Graphics; 
	
	public class CustomBackgroundComp extends Label { 
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void 
		{ 
			super.updateDisplayList(unscaledWidth, unscaledHeight); 
			var g:Graphics = graphics; 
			g.clear(); 
			var grid1:DataGrid = DataGrid(DataGridListData(listData).owner); 
			if (grid1.isItemSelected(data) || grid1.isItemHighlighted(data)) 
				return; 
			if (data[DataGridListData(listData).dataField] == 1) 
			{ 
				g.beginFill(0x87CEEB); 
				g.drawRect(0, 0, unscaledWidth, unscaledHeight); g.endFill(); 
			} 
			if (data[DataGridListData(listData).dataField] == 2) 
			{ 
				g.beginFill(0xDDA0DD); 
				g.drawRect(0, 0, unscaledWidth, unscaledHeight); g.endFill(); 
			} 
			if (data[DataGridListData(listData).dataField] == 3) 
			{ 
				g.beginFill(0xBEBEBE); 
				g.drawRect(0, 0, unscaledWidth, unscaledHeight); g.endFill(); 
			} 
			if (data[DataGridListData(listData).dataField] > 4) 
			{ 
				g.beginFill(0xFFAEB9); 
				g.drawRect(0, 0, unscaledWidth, unscaledHeight); g.endFill(); 
			} 
		} 
	} 
}
