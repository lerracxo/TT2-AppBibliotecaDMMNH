package salas;

import java.util.Date;

public class Sala {
	
	private int id_sala;
	private String nombre;
	private String desc_sala;
	private Date fecha;
	private int id_exposicion;
	
	
	public Sala(){}
	
	public Sala(int id_sala, String nombre, String desc_sala, int id_exposicion){
		this.id_sala = id_sala;
		this.nombre = nombre;
		this.desc_sala = desc_sala;
		this.fecha = new Date();
		this.id_exposicion = id_exposicion;
	}

	/**
	 * @return the id_sala
	 */
	public synchronized int getId_sala() {
		return id_sala;
	}

	/**
	 * @param id_sala the id_sala to set
	 */
	public synchronized void setId_sala(int id_sala) {
		this.id_sala = id_sala;
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
	 * @return the desc_sala
	 */
	public synchronized String getDesc_sala() {
		return desc_sala;
	}

	/**
	 * @param desc_sala the desc_sala to set
	 */
	public synchronized void setDesc_sala(String desc_sala) {
		this.desc_sala = desc_sala;
	}

	/**
	 * @return the fecha
	 */
	public synchronized Date getFecha() {
		return fecha;
	}

	/**
	 * @param fecha the fecha to set
	 */
	public synchronized void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	/**
	 * @return the id_exposicion
	 */
	public synchronized int getId_exposicion() {
		return id_exposicion;
	}

	/**
	 * @param id_exposicion the id_exposicion to set
	 */
	public synchronized void setId_exposicion(int id_exposicion) {
		this.id_exposicion = id_exposicion;
	}
	
	
	
}
