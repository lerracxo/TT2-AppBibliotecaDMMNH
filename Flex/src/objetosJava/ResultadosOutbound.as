package objetosJava
{
	
	[Bindable]
	[RemoteClass(alias="resultadosOutbound.ResultadosOutbound")]
	public class ResultadosOutbound
	{
		public var id_res_out:int;
		public var id_c_camp:int;
		public var resultado:String;
		public var descripcion:String;
		public var estatus:int;
	}
}