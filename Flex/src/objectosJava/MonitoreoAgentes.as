package objectosJava
{
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;

	[Bindable]
	[RemoteClass(alias="monitorearAgentes.MonitorearAgentes")]
	public class MonitoreoAgentes
	{
		public var  id_usr:int;
		public var  nombre_usr:String;
		public var  apellido_usr:String;
		public var  num_camp_usr:int;
		public var  extension:int;
		public var  estatus:int;
		public var  tiempo_estado:int;
		public var	detalle:String;
		public var	campanas:ArrayList;
		
	}
}