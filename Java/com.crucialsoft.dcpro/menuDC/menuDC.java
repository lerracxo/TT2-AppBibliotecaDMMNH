package menuDC;

import java.io.Serializable;

public class menuDC implements Serializable {
	
   
	    static final long serialVersionUID = 103844514947365244L;
	    
	    private int Idmenu;
	    private String descripcion;
	    private int nivel;
	    private int idpadre;

	    public menuDC()
	    {
	    }
	    
	    public menuDC(int Idmenu, String descripcion, int nivel, int idpadre) {
	        this.Idmenu = Idmenu;
	        this.descripcion = descripcion;
	        this.nivel = nivel;
	        this.idpadre = idpadre;
	    }
	    

	    public int getIdmenu()
	    {
	        return Idmenu;
	    }

	    public void setIdmenu(int Idmenu)
	    {
	        this.Idmenu = Idmenu;
	    }

	    public String getDescripcion()
	    {
	        return descripcion;
	    }

	    public void setDescripcion(String descripcion)
	    {
	        this.descripcion = descripcion;
	    }

	    public int getNivel()
	    {
	        return nivel;
	    }

	    public void setNivel(int nivel)
	    {
	        this.nivel = nivel;
	    }

	    public int getIdpadre()
	    {
	        return idpadre;
	    }

	    public void setIdpadre(int idpadre)
	    {
	        this.idpadre = idpadre;
	    }
	

}
