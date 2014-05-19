package objetosJava
{
	import mx.collections.ArrayCollection;
	
	[Bindable]
	[RemoteClass(alias="piezas.Pieza")]
	

	public class Pieza
	{
		public var id_pieza:int;
		public var desc_pieza:String;
		public var nombre:String;
		public var titulo:String;
		public var id_autor:int;
		public var elementosMultimedia:ArrayCollection;
		
		public function toString():String{
			return id_pieza+" "+desc_pieza+" "+nombre+" "+titulo+" "+id_autor+" "+elementosMultimedia;
		}
	}
	
	
}