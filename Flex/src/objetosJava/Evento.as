// ActionScript file
package objetosJava
{
	[Bindable]
	[RemoteClass(alias="evento.Evento")]
	public class Evento
	{
		public var id_evento:int;
		public var id_caller:int;
		public var id_tipo_marc:int;
		public var id_tipo_evento:int;
		public var id_progreso_evento:int;
		public var id_usr:int;
		public var fech_atencion:String;
		public var hora_atencion:String;
		public var fecha_inicio_llamada:String;
		public var hora_inicio_llamada:String;
		public var fech_fin_llamada:String;
		public var hora_fin_llamada:String;
		public var fech_post_llamada:String;
		public var hora_post_llamada:String;
		public var puerto:int;
		public var num_telefono:String;
		public var id_camp:int;
		public var fecha_trans:String;
		public var hora_trans:String;
		public var folio_evento:int;
	}
}