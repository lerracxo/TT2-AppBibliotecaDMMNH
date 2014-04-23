package entrevista;
import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;

public class Entrevista implements Serializable {
	
	static final long serialVersionUID = 103844514947365244L;
	
    private int 	id_registroVisitante;
    private char	genero;
    private int 	id_rango_edad;
    private	int 	id_ocupacion;
    private int		id_estado_civil;
    private int		id_razon_visita;
    private	int		id_frecuencia_asistencia;
    private	int 	id_numero_acompanantes;
    private Date	fecha_visita;
    private Time	hora_visita;
 
    
    public Entrevista(){}
      
    public Entrevista(	    
    		int     id_registroVisitante,
		    char	genero,
		    int 	id_rango_edad,
		    int 	id_ocupacion,
		    int		id_estado_civil,
		    int		id_razon_visita,
		    int		id_frecuencia_asistencia,
		    int 	id_numero_acompanantes
		    ) {
        
		this.id_registroVisitante = id_registroVisitante;
		this.genero = genero;
		this.id_rango_edad = id_rango_edad;
		this.id_ocupacion = id_ocupacion;
		this.id_estado_civil = id_estado_civil;
		this.id_razon_visita = id_razon_visita;
		this.id_frecuencia_asistencia = id_frecuencia_asistencia;
		this.id_numero_acompanantes = id_numero_acompanantes;

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
	 * @return the id_rango_edad
	 */
	public int getid_rango_edad() {
		return id_rango_edad;
	}

	/**
	 * @param id_rango_edad the id_rango_edad to set
	 */
	public void setid_rango_edad(int id_rango_edad) {
		this.id_rango_edad = id_rango_edad;
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
	 * @return the id_estado_civil
	 */
	public int getid_estado_civil() {
		return id_estado_civil;
	}

	/**
	 * @param id_estado_civil the id_estado_civil to set
	 */
	public void setid_estado_civil(int id_estado_civil) {
		this.id_estado_civil = id_estado_civil;
	}

	/**
	 * @return the id_razon_visita
	 */
	public int getid_razon_visita() {
		return id_razon_visita;
	}

	/**
	 * @param id_razon_visita the id_razon_visita to set
	 */
	public void setid_razon_visita(int id_razon_visita) {
		this.id_razon_visita = id_razon_visita;
	}

	/**
	 * @return the id_frecuencia_asistencia
	 */
	public int getid_frecuencia_asistencia() {
		return id_frecuencia_asistencia;
	}

	/**
	 * @param id_frecuencia_asistencia the id_frecuencia_asistencia to set
	 */
	public void setid_frecuencia_asistencia(int id_frecuencia_asistencia) {
		this.id_frecuencia_asistencia = id_frecuencia_asistencia;
	}

	/**
	 * @return the id_numero_acompanantes
	 */
	public Date getfecha_visita() {
		return this.fecha_visita;
	}

	/**
	 * @param id_numero_acompanantes the id_numero_acompanantes to set
	 */
	public void setfecha_visita(Date fecha_visita) {
		this.fecha_visita = fecha_visita;
	}
	
	/**
	 * @return the id_numero_acompanantes
	 */
	public Time gethora_visita() {
		return hora_visita;
	}

	/**
	 * @param id_numero_acompanantes the id_numero_acompanantes to set
	 */
	public void sethora_visita(Time hora_visita) {
		this.hora_visita = hora_visita;
	}
	
	/**
	 * @return the id_numero_acompanantes
	 */
	public int getid_numero_acompanantes() {
		return id_numero_acompanantes;
	}

	/**
	 * @param id_numero_acompanantes the id_numero_acompanantes to set
	 */
	public void setid_numero_acompanantes(int id_numero_acompanantes) {
		this.id_numero_acompanantes = id_numero_acompanantes;
	}
	

 
	
	
	
	
}
