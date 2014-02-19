// ActionScript file
package objectosJava
{
	[Bindable]
	[RemoteClass(alias="alarmas.Alarmas_Internas")]
	public class Alarmas_Internas
	{
		public var id_alarma_interna:int;
		public var id_camp_in:int;
		public var id_camp_out:int;
		public var min_agentes:int;
		public var lim_tmp_llamada:int;
		public var tmp_max_pausa:int;
		public var camb_est_agente:int;		
	}	
}