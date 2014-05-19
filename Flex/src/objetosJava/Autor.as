package objetosJava
{
	[Bindable]
	[RemoteClass(alias="autores.Autor")]
	
	public class Autor
	{
		
		public var id_autor:int;
		public var nombre:String;
		public var desc_autor:String;
		public var fecha_nacimiento:Date;
		public var id_epoca:int;
		
		public function Autor(){}
	}
}