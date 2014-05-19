package objetosJava
{
	import flash.utils.ByteArray;
	
	[Bindable]
	[RemoteClass(alias="reportes.Reporte")]
	public class Reporte
	{
		public var id_reporte:int;
		public var nombre_jasper:String;
		public var nombre_archivo:String;
		public var reporte:ByteArray;
	}
}