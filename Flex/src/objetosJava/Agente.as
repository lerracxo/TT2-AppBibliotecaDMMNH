package objetosJava
{
	[Bindable]
	[RemoteClass(alias="agentes.Agente")]
	public class Agente
	{
		public var id_camp:int;
		public var id_usr:int;
		public var nombre_usr:String;	
		public var nivel_experiencia:int;
	}
}