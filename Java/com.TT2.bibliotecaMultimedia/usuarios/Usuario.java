package usuarios;
import java.io.Serializable;

public class Usuario implements Serializable {
	
	static final long serialVersionUID = 103844514947365244L;
	
    private int id_usr;
    private int id_tipo_usr;
    private String usr;
    private String password;
    private String nombre_usr;
    private String apellido_paterno_usr;
    private String apellido_materno_usr;
    private String email_usr;
    private int estatus_usr;

    public Usuario(){}
      
    public Usuario(	int id_usr,
    				int id_tipo_usr,  
    				String usr, 
    				String password, 
    				String nombre_usr, 
    				String apellido_paterno_usr, 
    				String apellido_materno_usr, 
    				String email_usr,
    				int estatus_usr) {
        
    	this.id_usr = id_usr;
        this.id_tipo_usr = id_tipo_usr;
        this.usr = usr;
    	this.password = password;
        this.nombre_usr = nombre_usr;
        this.apellido_paterno_usr = apellido_paterno_usr;
        this.apellido_materno_usr = apellido_materno_usr;
    	this.email_usr = email_usr;
    	this.estatus_usr = estatus_usr;

    }

	public int getId_usr() {
		return id_usr;
	}


	public void setId_usr(int id_usr) {
		this.id_usr = id_usr;
	}


	public int getId_tipo_usr() {
		return id_tipo_usr;
	}


	public void setId_tipo_usr(int id_tipo_usr) {
		this.id_tipo_usr = id_tipo_usr;
	}


	public String getUsr() {
		return usr;
	}


	public void setUsr(String usr) {
		this.usr = usr;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getNombre_usr() {
		return nombre_usr;
	}


	public void setNombre_usr(String nombre_usr) {
		this.nombre_usr = nombre_usr;
	}


	public String getApellido_paterno_usr() {
		return apellido_paterno_usr;
	}


	public void setApellido_paterno_usr(String apellido_paterno_usr) {
		this.apellido_paterno_usr = apellido_paterno_usr;
	}


	public String getApellido_materno_usr() {
		return apellido_materno_usr;
	}


	public void setApellido_materno_usr(String apellido_materno_usr) {
		this.apellido_materno_usr = apellido_materno_usr;
	}


	public String getEmail_usr() {
		return email_usr;
	}


	public void setEmail_usr(String email_usr) {
		this.email_usr = email_usr;
	}


	public int getEstatus_usr() {
		return estatus_usr;
	}


	public void setEstatus_usr(int estatus_usr) {
		this.estatus_usr = estatus_usr;
	}

}
