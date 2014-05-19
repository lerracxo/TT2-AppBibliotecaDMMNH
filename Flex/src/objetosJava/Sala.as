package objetosJava
{
	
	[Bindable]
	[RemoteClass(alias="salas.Sala")]
	
	public class Sala
	{
		public var id_sala:int;
		public var nombre:String = "Nombre fijo";
		public var desc_sala:String;
		public var fecha:Date;
		public var id_exposicion:int;
		
		public function Sala()
		{
		}
		
		public function toString():String{
			return id_sala+" "+nombre+" "+desc_sala+" "+fecha+" "+id_exposicion;
		}
	}
}