package objetosJava
{
	
	[Bindable]
	[RemoteClass(alias="exposiciones.Exposicion")]
	
	public class Exposicion
	{
		
		public var id_exposicion:int;
		public var nombre:String;
		public var desc_exposicion:String;
		public var id_museo:int;
		
		public function Exposicion()
		{
		}
	}
}