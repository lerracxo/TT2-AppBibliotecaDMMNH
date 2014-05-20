package bitacora;

import java.util.Date;


public class Bitacora {

	private int id_bitacora;
	private String accion;
	private String afecta;
	private Date fecha;
	
	public Bitacora(int id_bitacora, String accion, String afecta){
		this.id_bitacora = id_bitacora;
		this.accion = accion;
		this.afecta = afecta;
		this.fecha = new Date();
	}


	/**
	 * @return the id_bitacora
	 */
	public int getId_bitacora() {
		return id_bitacora;
	}

	/**
	 * @param id_bitacora the id_bitacora to set
	 */
	public void setId_bitacora(int id_bitacora) {
		this.id_bitacora = id_bitacora;
	}

	/**
	 * @return the accion
	 */
	public String getAccion() {
		return accion;
	}

	/**
	 * @param accion the accion to set
	 */
	public void setAccion(String accion) {
		this.accion = accion;
	}

	/**
	 * @return the afecta
	 */
	public String getAfecta() {
		return afecta;
	}

	/**
	 * @param afecta the afecta to set
	 */
	public void setAfecta(String afecta) {
		this.afecta = afecta;
	}

	/**
	 * @return the fecha
	 */
	public Date getFecha() {
		return fecha;
	}

	/**
	 * @param fecha the fecha to set
	 */
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	
	
}
