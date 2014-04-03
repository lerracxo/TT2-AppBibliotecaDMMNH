package objetosJava
{
	[Bindable]
	[RemoteClass(alias="calendario.Calendario")]
	public class Calendario
	{
		public var id_calendario:int;
		public var id_camp:int;
		public var year:String;
		public var id_dia_especial:int;
		public var fecha_dia:Date;
		public var descripcion:String;
	}
}