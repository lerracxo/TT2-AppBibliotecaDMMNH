package piezas;

public class Multimedia {

	private int id_multimedia;
	private int id_tipo_multimedia;
	private String desc_multimedia;
	private String nombre;
	private String nombre_archivo;
	private String nombre_original;
	
	public Multimedia(){}
	
	public Multimedia(int id_multimedia, int id_tipo_multimedia,String desc_multimedia, String nombre, String nombre_archivo, String nombre_original){
		this.id_multimedia = id_multimedia;
		this.id_tipo_multimedia = id_tipo_multimedia;
		this.desc_multimedia = desc_multimedia;
		this.nombre = nombre;
		this.nombre_archivo = nombre_archivo;
		this.nombre_original = nombre_original;	
	}
	
	/**
	 * @return the id_multimedia
	 */
	public int getId_multimedia() {
		return id_multimedia;
	}
	/**
	 * @param id_multimedia the id_multimedia to set
	 */
	public void setId_multimedia(int id_multimedia) {
		this.id_multimedia = id_multimedia;
	}
	/**
	 * @return the desc_multimedia
	 */
	public String getDesc_multimedia() {
		return desc_multimedia;
	}

	/**
	 * @param desc_multimedia the desc_multimedia to set
	 */
	public void setDesc_multimedia(String desc_multimedia) {
		this.desc_multimedia = desc_multimedia;
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
	 * @return the id_tipo_multimedia
	 */
	public int getId_tipo_multimedia() {
		return id_tipo_multimedia;
	}
	/**
	 * @param id_tipo_multimedia the id_tipo_multimedia to set
	 */
	public void setId_tipo_multimedia(int id_tipo_multimedia) {
		this.id_tipo_multimedia = id_tipo_multimedia;
	}
	/**
	 * @return the nombre_archivo
	 */
	public String getNombre_archivo() {
		return nombre_archivo;
	}
	/**
	 * @param nombre_archivo the nombre_archivo to set
	 */
	public void setNombre_archivo(String nombre_archivo) {
		this.nombre_archivo = nombre_archivo;
	}
	/**
	 * @return the nombre_original
	 */
	public String getNombre_original() {
		return nombre_original;
	}
	/**
	 * @param nombre_original the nombre_original to set
	 */
	public void setNombre_original(String nombre_original) {
		this.nombre_original = nombre_original;
	}

	
}
