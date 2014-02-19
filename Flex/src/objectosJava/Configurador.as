// ActionScript file
package  objectosJava
{
	[Bindable]
	[RemoteClass(alias="configurador.Configurador")]
	public class Configurador
	{
		public var id_configurador:int;
		public var ip_bd:String;
		public var usuario_bd:String;
		public var password_bd:String;
		public var ip_envox:String;
		public var crm:int;
		public var terminacion_llamada:int;
		public var marcacion_salida:int;
		public var prioridad_ag_calle:int;	
		public var desborde:int;
	}
	
}