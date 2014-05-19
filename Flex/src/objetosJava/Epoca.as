package objetosJava
{
	[Bindable]
	[RemoteClass(alias="epocas.Epoca")]
	
	public class Epoca
	{
		public var id_epoca:int;
		public var nombre:String;
		public var desc_epoca:String;
		public var anio:String;
		
		public function Epoca(){}
	}
}