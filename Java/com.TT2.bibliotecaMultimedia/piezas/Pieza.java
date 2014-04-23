package piezas;
import java.io.Serializable;
import java.util.List;

public class Pieza implements Serializable {
	
	static final long serialVersionUID = 103844514947365244L;
	
	private int id_pieza;
	private String desc_pieza;
	private String nombre;
	private String titulo;
	private int id_autor;
	private List<Multimedia> elementosMultimedia;
	
	// MŽtodo constructor vac’o
	public Pieza(){}
	
	// Este es el metodo contructor para la pieza
	Pieza(int id_pieza, String desc_pieza, String nombre, String titulo, int id_autor, List<Multimedia> elementosMultimedia){
		this.id_pieza = id_pieza;
		this.desc_pieza = desc_pieza;
		this.nombre = nombre;
		this.titulo = titulo;
		this.id_autor = id_autor;
		this.elementosMultimedia = elementosMultimedia;
	}
	/**
	 * @return the id_pieza
	 */
	public int getId_pieza() {
		return id_pieza;
	}
	/**
	 * @param id_pieza the id_pieza to set
	 */
	public void setId_pieza(int id_pieza) {
		this.id_pieza = id_pieza;
	}
	/**
	 * @return the desc_pieza
	 */
	public String getDesc_pieza() {
		return desc_pieza;
	}
	/**
	 * @param desc_pieza the desc_pieza to set
	 */
	public void setDesc_pieza(String desc_pieza) {
		this.desc_pieza = desc_pieza;
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
	 * @return the titulo
	 */
	public String getTitulo() {
		return titulo;
	}
	/**
	 * @param titulo the titulo to set
	 */
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
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
	 * @return the elementosMultimedia
	 */
	public List<Multimedia> getElementosMultimedia() {
		return elementosMultimedia;
	}
	/**
	 * @param elementosMultimedia the elementosMultimedia to set
	 */
	public void setElementosMultimedia(List<Multimedia> elementosMultimedia) {
		this.elementosMultimedia = elementosMultimedia;
	}

	

}
