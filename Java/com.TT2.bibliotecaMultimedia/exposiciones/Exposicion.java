package exposiciones;

import java.sql.Date;

public class Exposicion {
	private int id_exposicion;
	private String nombre;
	private String desc_exposicion;
	private int id_museo;
	
	public Exposicion(){}
	
	public Exposicion(int id_exposicion, String nombre, String desc_exposicion, int id_museo){
		this.id_exposicion = id_exposicion;
		this.nombre = nombre;
		this.desc_exposicion = desc_exposicion;
		this.id_museo = id_museo;
	}

	/**
	 * @return the id_exposicion
	 */
	public int getId_exposicion() {
		return id_exposicion;
	}

	/**
	 * @param id_exposicion the id_exposicion to set
	 */
	public void setId_exposicion(int id_exposicion) {
		this.id_exposicion = id_exposicion;
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
	 * @return the desc_exposicion
	 */
	public String getDesc_exposicion() {
		return desc_exposicion;
	}

	/**
	 * @param desc_exposicion the desc_exposicion to set
	 */
	public void setDesc_exposicion(String desc_exposicion) {
		this.desc_exposicion = desc_exposicion;
	}

	/**
	 * @return the id_museo
	 */
	public int getId_museo() {
		return id_museo;
	}

	/**
	 * @param id_museo the id_museo to set
	 */
	public void setId_museo(int id_museo) {
		this.id_museo = id_museo;
	}
	
	
}
