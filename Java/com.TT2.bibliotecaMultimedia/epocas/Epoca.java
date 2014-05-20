package epocas;

import java.sql.Date;

public class Epoca {
	
	private int id_epoca;
	private String nombre;
	private String desc_epoca;
	private String anio;
	
	public Epoca(int id_epoca, String nombre, String desc_epoca, String anio){
		this.id_epoca = id_epoca;
		this.nombre = nombre;
		this.desc_epoca = desc_epoca;
		this.anio = anio;
	}
	
	public Epoca(){}

	/**
	 * @return the id_epoca
	 */
	public int getId_epoca() {
		return id_epoca;
	}

	/**
	 * @param id_epoca the id_epoca to set
	 */
	public void setId_epoca(int id_epoca) {
		this.id_epoca = id_epoca;
	}

	
	/**
	 * @return the nombre
	 */
	public String getNombre() {
		return nombre;
	}

	/**
	 * @param nombre the nombre to set
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	/**
	 * @return the desc_epoca
	 */
	public String getDesc_epoca() {
		return desc_epoca;
	}

	/**
	 * @param desc_epoca the desc_epoca to set
	 */
	public void setDesc_epoca(String desc_epoca) {
		this.desc_epoca = desc_epoca;
	}

	/**
	 * @return the anio
	 */
	public String getAnio() {
		return anio;
	}

	/**
	 * @param fecha the anio to set
	 */
	public void setAnio(String anio) {
		this.anio = anio;
	}
	
	
}
