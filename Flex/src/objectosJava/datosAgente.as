package objectosJava
{
	[Bindable]
	[RemoteClass(alias="datosagente.datosAgente")]
	public class datosAgente
	{
		public var  id_usr:int ;
		public var  id_posicion:int ;
		public var  nombre_usr:String ;
		public var  apellido_paterno_usr:String ;
		public var  apellido_materno_usr:String  ;
		public var  extension:int ;
		public var  id_estado:int  ;
		public var  nombre_edo:String ;
		public var  color:String ;
	}
}