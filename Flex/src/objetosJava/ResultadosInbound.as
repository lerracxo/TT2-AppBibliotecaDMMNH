package objetosJava
{
	[Bindable]
	[RemoteClass(alias="catalogoResultadosInbound.ResultadosInbound")]
	public class ResultadosInbound
	{
		public var  id_res_in:int;
		public var  id_c_camp:int;
		public var  resultado:String;
		public var  descripcion:String;
		public var  password:String;
		public var  estatus:int;
	}
}