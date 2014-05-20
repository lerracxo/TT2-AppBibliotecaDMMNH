package autores;

import java.sql.Date;

public class Autor {
	
	private int id_autor;
	private String nombre;
	private String desc_autor;
	private Date fecha_nacimiento;
	private int id_epoca;
	
	
	public Autor(int id_autor, String nombre, String desc_autor, Date fecha_nacimiento, int id_epoca){
		this.id_autor = id_autor;
		this.nombre = nombre;
		this.desc_autor = desc_autor;
		this.fecha_nacimiento = fecha_nacimiento;
		this.id_epoca = id_epoca;
	}
	
	public Autor(){}
	
	/**
	 * @return the id_autor
	 */
	public int getId_autor() {
		return id_autor;
	}
	/**
	 * @param id_autor the id_autor to set
	 */
	public void setId_autor(int id_autor) {
		this.id_autor = id_autor;
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
	 * @return the desc_autor
	 */
	public String getDesc_autor() {
		return desc_autor;
	}
	/**
	 * @param desc_autor the desc_autor to set
	 */
	public void setDesc_autor(String desc_autor) {
		this.desc_autor = desc_autor;
	}
	/**
	 * @return the fecha_nacimiento
	 */
	public Date getFecha_nacimiento() {
		return fecha_nacimiento;
	}
	/**
	 * @param fecha_nacimiento the fecha_nacimiento to set
	 */
	public void setFecha_nacimiento(Date fecha_nacimiento) {
		this.fecha_nacimiento = fecha_nacimiento;
	}
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
	
}
