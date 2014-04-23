package objetosJava
{
	[Bindable]
	[RemoteClass(alias="usuarios.Usuario")]
	public class Usuario
	{
		public var  id_usr:int;
		public var  id_tipo_usr:int;
		public var  password:String;
		public var  nombre_usr:String;
		public var  apellido_paterno_usr:String;
		public var  apellido_materno_usr:String;
		public var  email_usr:String;
		public var  estatus_usr:int;
		
		public function toString():String{
			return id_usr+" "+id_tipo_usr+" "+password+" "+nombre_usr+" "+apellido_paterno_usr+" "+apellido_materno_usr+" "+email_usr+" "+estatus_usr
		}
	}
}