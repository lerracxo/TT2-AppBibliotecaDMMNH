package reportes;
import java.io.Serializable;

public class Reporte implements Serializable {
	
	static final long serialVersionUID = 103844514947365244L;
	
	private int id_reporte;
	private String nombre_jasper;
    private String nombre_archivo;
    private byte[] reporte;
    
    
    /**
	 * @return the id_reporte
	 */
	public int getId_reporte() {
		return id_reporte;
	}

	/**
	 * @param id_reporte the id_reporte to set
	 */
	public void setId_reporte(int id_reporte) {
		this.id_reporte = id_reporte;
	}


    public Reporte(){}

	
	/**
	 * @return the nombre_jasper
	 */
	public String getNombre_jasper() {
		return nombre_jasper;
	}

	/**
	 * @param nombre_jasper the nombre_jasper to set
	 */
	public void setNombre_jasper(String nombre_jasper) {
		this.nombre_jasper = nombre_jasper;
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
	 * @return the reporte
	 */
	public byte[] getReporte() {
		return reporte;
	}

	/**
	 * @param reporte the reporte to set
	 */
	public void setReporte(byte[] reporte) {
		this.reporte = reporte;
	}


   
}
