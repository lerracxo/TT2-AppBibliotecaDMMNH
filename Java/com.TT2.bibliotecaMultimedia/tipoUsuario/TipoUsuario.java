package tipoUsuario;

public class TipoUsuario   {
	

    private int id_tipo_usr;
    private int id_c_sistema;
    private String nombre_tipo;
    private String descripcion_tipo;


    public TipoUsuario(){}
      
    public TipoUsuario(int id_tipo_usr,int id_c_sistema,  String nombre_tipo, 
    	String descripcion_tipo) {
        
    	this.id_tipo_usr = id_tipo_usr;
        this.id_c_sistema = id_c_sistema;
        this.nombre_tipo = nombre_tipo;
        this.descripcion_tipo = descripcion_tipo;

    }

	public int getId_tipo_usr() {
		return id_tipo_usr;
	}

	public void setId_tipo_usr(int id_tipo_usr) {
		this.id_tipo_usr = id_tipo_usr;
	}

	public int getId_c_sistema() {
		return id_c_sistema;
	}

	public void setId_c_sistema(int id_c_sistema) {
		this.id_c_sistema = id_c_sistema;
	}

	public String getNombre_tipo() {
		return nombre_tipo;
	}

	public void setNombre_tipo(String nombre_tipo) {
		this.nombre_tipo = nombre_tipo;
	}

	public String getDescripcion_tipo() {
		return descripcion_tipo;
	}

	public void setDescripcion_tipo(String descripcion_tipo) {
		this.descripcion_tipo = descripcion_tipo;
	}

}