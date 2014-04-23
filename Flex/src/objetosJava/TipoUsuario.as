package objetosJava
{
	[Bindable]
	[RemoteClass(alias="tipoUsuario.TipoUsuario")]
	public class TipoUsuario
	{
		public var  id_tipo_usr:int;
		public var  nombre_tipo:String;
		public var  descripcion_tipo:String;
		
		public function toString():String{
			return id_tipo_usr+" "+nombre_tipo+" "+descripcion_tipo;
		}
	}
}