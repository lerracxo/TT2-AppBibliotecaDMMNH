package entrevista;
import java.io.Serializable;

public class Entrevista implements Serializable {
	
	static final long serialVersionUID = 103844514947365244L;
	
    private int id_registroVisitante;
    private char	genero;
    private int 	edad;
    private	int 	id_ocupacion;
    private String	estadoCivil;
    private int		id_razonVisita;
    private	int		frecuencia;
    private	int 	numero_acompanantes;
 
    
    public Entrevista(){}
      
    public Entrevista(	    
    		int id_registroVisitante,
		    char	genero,
		    int 	edad,
		    int 	id_ocupacion,
		    String	estadoCivil,
		    int		id_razonVisita,
		    int		frecuencia,
		    int 	numero_acompanantes
		    ) {
        
		this.id_registroVisitante = id_registroVisitante;
		this.genero = genero;
		this.edad = edad;
		this.id_ocupacion = id_ocupacion;
		this.estadoCivil = estadoCivil;
		this.id_razonVisita = id_razonVisita;
		this.frecuencia = frecuencia;
		this.numero_acompanantes = numero_acompanantes;

    }

	/**
	 * @return the id_registroVisitante
	 */
	public int getId_registroVisitante() {
		return id_registroVisitante;
	}

	/**
	 * @param id_registroVisitante the id_registroVisitante to set
	 */
	public void setId_registroVisitante(int id_registroVisitante) {
		this.id_registroVisitante = id_registroVisitante;
	}

	/**
	 * @return the genero
	 */
	public char getGenero() {
		return genero;
	}

	/**
	 * @param genero the genero to set
	 */
	public void setGenero(char genero) {
		this.genero = genero;
	}

	/**
	 * @return the edad
	 */
	public int getEdad() {
		return edad;
	}

	/**
	 * @param edad the edad to set
	 */
	public void setEdad(int edad) {
		this.edad = edad;
	}

	/**
	 * @return the id_ocupacion
	 */
	public int getId_ocupacion() {
		return id_ocupacion;
	}

	/**
	 * @param id_ocupacion the id_ocupacion to set
	 */
	public void setId_ocupacion(int id_ocupacion) {
		this.id_ocupacion = id_ocupacion;
	}

	/**
	 * @return the estadoCivil
	 */
	public String getEstadoCivil() {
		return estadoCivil;
	}

	/**
	 * @param estadoCivil the estadoCivil to set
	 */
	public void setEstadoCivil(String estadoCivil) {
		this.estadoCivil = estadoCivil;
	}

	/**
	 * @return the id_razonVisita
	 */
	public int getId_razonVisita() {
		return id_razonVisita;
	}

	/**
	 * @param id_razonVisita the id_razonVisita to set
	 */
	public void setId_razonVisita(int id_razonVisita) {
		this.id_razonVisita = id_razonVisita;
	}

	/**
	 * @return the frecuencia
	 */
	public int getFrecuencia() {
		return frecuencia;
	}

	/**
	 * @param frecuencia the frecuencia to set
	 */
	public void setFrecuencia(int frecuencia) {
		this.frecuencia = frecuencia;
	}

	/**
	 * @return the numero_acompanantes
	 */
	public int getNumero_acompanantes() {
		return numero_acompanantes;
	}

	/**
	 * @param numero_acompanantes the numero_acompanantes to set
	 */
	public void setNumero_acompanantes(int numero_acompanantes) {
		this.numero_acompanantes = numero_acompanantes;
	}

	
}
