package museos;

import java.sql.Date;

public class Museo {
	private int id_museo;
	private String nombre;
	private String desc_museo;
	private String direccion;
	private String email;
	private String telefono;
	
	public Museo(){}
	
	public Museo(int id_museo, String nombre, String desc_museo, String direccion, String email, String telefono){
		this.id_museo = id_museo;
		this.nombre = nombre;
		this.desc_museo = desc_museo;
		this.direccion = direccion;
		this.email = email;
		this.telefono = telefono;
	}

	/**
	 * @return the id_museo
	 */
	public synchronized int getId_museo() {
		return id_museo;
	}

	/**
	 * @param id_museo the id_museo to set
	 */
	public synchronized void setId_museo(int id_museo) {
		this.id_museo = id_museo;
	}

	/**
	 * @return the nombre
	 */
	public synchronized String getNombre() {
		return nombre;
	}

	/**
	 * @param nombre the nombre to set
	 */
	public synchronized void setNombre(String nombre) {
		this.nombre = nombre;
	}

	/**
	 * @return the desc_museo
	 */
	public synchronized String getDesc_museo() {
		return desc_museo;
	}

	/**
	 * @param desc_museo the desc_museo to set
	 */
	public synchronized void setDesc_museo(String desc_museo) {
		this.desc_museo = desc_museo;
	}

	/**
	 * @return the direccion
	 */
	public synchronized String getDireccion() {
		return direccion;
	}

	/**
	 * @param direccion the direccion to set
	 */
	public synchronized void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	/**
	 * @return the email
	 */
	public synchronized String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public synchronized void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the telefono
	 */
	public synchronized String getTelefono() {
		return telefono;
	}

	/**
	 * @param telefono the telefono to set
	 */
	public synchronized void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	
	
	
}
