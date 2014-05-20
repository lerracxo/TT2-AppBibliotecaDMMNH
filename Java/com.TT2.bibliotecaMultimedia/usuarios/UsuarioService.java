package usuarios;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import usuarios.Usuario;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.flex.remoting.RemotingInclude;
import org.springframework.flex.remoting.RemotingExclude;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.jdbc.core.simple.SimpleJdbcTemplate;
import org.springframework.stereotype.Service;


 @Service("UsuarioService")
 @RemotingDestination(channels={"my-amf"})
public class UsuarioService implements IUsuarioService {
	 
	    private static DataSource dataSourceDCpro;
	    
	    private SimpleJdbcTemplate simpleJdbcTemplate;
	    
	    private SimpleJdbcInsert  insertUsuario;
	    

		public DataSource getDataSource(){
			   return dataSourceDCpro;
		   }
		@Autowired
		public void setDataSource(DataSource dataSourceDCpro){

			this.simpleJdbcTemplate = new SimpleJdbcTemplate(dataSourceDCpro);
	        this.insertUsuario = new SimpleJdbcInsert(dataSourceDCpro).withTableName("USUARIO").usingGeneratedKeyColumns("ID_USR");
	        
	       }

	@RemotingInclude
	public List<Usuario> findAll() {
    	return	simpleJdbcTemplate.query("SELECT ID_USR, ID_TIPO_USR, PASSWORD, NOMBRE_USR, APELLIDO_PATERNO_USR, APELLIDO_MATERNO_USR, EMAIL_USR, ESTATUS_USR  " +
    			"FROM USUARIO WHERE estatus_usr = 1", new RowMapper<Usuario>() {
	            public Usuario mapRow( ResultSet rs,  int i) throws SQLException {
	                    return new Usuario( rs.getInt("id_usr"), 
	                    					rs.getInt("id_tipo_usr"),  
	                    					rs.getString("password"), 
	                    					rs.getString("nombre_usr"),
	                    					rs.getString("apellido_paterno_usr"),
	                    					rs.getString("apellido_materno_usr"),
	                    					rs.getString("email_usr"),
	                    					rs.getInt("estatus_usr"));
	                }
	            }        
	    );	
	}
	
	/*
	@RemotingInclude
	public List<Usuario> Find_UsuariosSupervisor(int id_usr) {
    	return	simpleJdbcTemplate.query("SELECT DISTINCT (usuario.ID_USR), ID_TIPO_USR, ID_POSICION, USR, PASSWORD, NOMBRE_USR, " +
    			"APELLIDO_PATERNO_USR, APELLIDO_MATERNO_USR, EMAIL_USR, CALLBLENDING," +
    			"EXTENSION, RECEPCION_FUERA_CC, GRABACION_DEMANDA, EXTENSION_FUERA_CC, ESTATUS_USR " +
    			"FROM USUARIO inner join campana_agente " +
    			"on usuario.id_usr = campana_agente.id_usr " +
    			"inner join campana on campana.id_camp = campana_agente.id_camp " +
    			"WHERE campana.id_usr = ? and ELIMINADO IS NULL " +
    			"order by id_usr", new RowMapper<Usuario>() {
	            public Usuario mapRow( ResultSet rs,  int i) throws SQLException {
	                    return new Usuario( rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9), rs.getInt(10),rs.getInt(11),rs.getInt(12),rs.getInt(13),rs.getInt(14),rs.getInt(15));
	                }
	            },new Object [] {id_usr});               
	}
	 */
	@RemotingInclude
	public Usuario findById(int id) {
    	return  simpleJdbcTemplate.queryForObject(
	            "SELECT ID_USR, ID_TIPO_USR, PASSWORD, NOMBRE_USR, APELLIDO_PATERNO_USR, APELLIDO_MATERNO_USR, EMAIL_USR, ESTATUS_USR"+
	            " FROM USUARIO WHERE id_usr = ? and estatus_usr = 1", new RowMapper<Usuario>() {
	            public Usuario mapRow( ResultSet rs,  int i) throws SQLException {
	                    return new Usuario(rs.getInt("id_usr"), 
            					rs.getInt("id_tipo_usr"), 
            					rs.getString("password"), 
            					rs.getString("nombre_usr"),
            					rs.getString("apellido_paterno_usr"),
            					rs.getString("apellido_materno_usr"),
            					rs.getString("email_usr"),
            					rs.getInt("estatus_usr"));
	               
	            }
	            },
	            new Object [] {id}            
	    );	
	}
	
	@RemotingInclude
	public  List<Usuario> FindUsuariobyName(String nombre, String apellido_paterno, String apellido_materno) {
    	return  simpleJdbcTemplate.query(
	            "SELECT ID_USR, ID_TIPO_USR, PASSWORD, NOMBRE_USR, APELLIDO_PATERNO_USR, APELLIDO_MATERNO_USR, EMAIL_USR, ESTATUS_USR"+
	            " FROM usuario where nombre_usr = ? and apellido_paterno_usr = ? and apellido_materno_usr = ? and estatus_usr = 1", new RowMapper<Usuario>() {
	            public Usuario mapRow( ResultSet rs,  int i) throws SQLException {
	                    return new Usuario( rs.getInt("id_usr"), 
			            					rs.getInt("id_tipo_usr"), 
			            					rs.getString("password"), 
			            					rs.getString("nombre_usr"),
			            					rs.getString("apellido_paterno_usr"),
			            					rs.getString("apellido_materno_usr"),
			            					rs.getString("email_usr"),
			            					rs.getInt("estatus_usr")
				                    		);
				               
	            }
	            },
	            new Object [] {nombre,apellido_paterno,apellido_materno}            
	    );	
	}
	@RemotingInclude
	public List<Usuario> FindAllbyName(String nombre, String apellido_paterno, String apellido_materno) {
		nombre = nombre + "%";
		apellido_paterno = apellido_paterno + "%";
		apellido_materno = apellido_materno + "%";
    	return  simpleJdbcTemplate.query(
	            "SELECT ID_USR, ID_TIPO_USR, PASSWORD, NOMBRE_USR, APELLIDO_PATERNO_USR, APELLIDO_MATERNO_USR, EMAIL_USR, ESTATUS_USR " +
	            " FROM usuario where nombre_usr like ? and apellido_paterno_usr like ? " +
	            "and apellido_materno_usr like ? and estatus_usr = 1", new RowMapper<Usuario>() {
	            public Usuario mapRow( ResultSet rs,  int i) throws SQLException {
	                    return new Usuario(rs.getInt("id_usr"), 
			            					rs.getInt("id_tipo_usr"), 
			            					rs.getString("password"), 
			            					rs.getString("nombre_usr"),
			            					rs.getString("apellido_paterno_usr"),
			            					rs.getString("apellido_materno_usr"),
			            					rs.getString("email_usr"),
			            					rs.getInt("estatus_usr")
	                    		);
	               
	            }
	            },new Object [] {nombre,apellido_paterno,apellido_materno});        	
	}
	
	/*
	@RemotingInclude
	public List<String> obtieneTiposUsuario(){
		String s_sql = "SELECT ID_TIPO_USR, NOMBRE_TIPO FROM C_TIPO_USUARIO";
		
		List<String> r_lista = new ArrayList<String>();
		
		List<Map<String, Object>> rows = simpleJdbcTemplate.queryForList(s_sql);
		
		for (Map<String, Object> row : rows)
			r_lista.add((String)row.get("NOMBRE_TIPO"));
		System.out.println("Lista: "+r_lista);
		return r_lista;
	}

	*/
	@RemotingInclude
	public Usuario create(Usuario usuario) {
        Map<String, Object> parameters = new HashMap<String, Object>();
        parameters.put("id_tipo_usr", usuario.getId_tipo_usr());
        parameters.put("password",usuario.getPassword());
        parameters.put("nombre_usr",usuario.getNombre_usr());
        parameters.put("apellido_paterno_usr",usuario.getApellido_paterno_usr());
        parameters.put("apellido_materno_usr",usuario.getApellido_materno_usr());
        parameters.put("email_usr",usuario.getEmail_usr());
        parameters.put("estatus_usr", usuario.getEstatus_usr());
        
        //Pendiente saber que hacen esas instrucciones
        Number id_usr = this.insertUsuario.executeAndReturnKey(parameters);
        //usuario.setId_usr(id_usr.intValue());
        //usuario.setPassword(usuario.getEmail_usr());
        //update(usuario);
        //actualizaContrasenaNuevoUsuario(usuario);
        
        return usuario;
	}

	@RemotingInclude
	public int update(Usuario usuario) {
        int flag = this.simpleJdbcTemplate.update(
                "UPDATE USUARIO SET ID_TIPO_USR= ?, NOMBRE_USR= ?, APELLIDO_PATERNO_USR= ?, APELLIDO_MATERNO_USR= ?, EMAIL_USR= ?, ESTATUS_USR= ? WHERE ID_USR = ?", 
                usuario.getId_tipo_usr(), usuario.getNombre_usr(), usuario.getApellido_paterno_usr(),usuario.getApellido_materno_usr(),
                usuario.getEmail_usr(),usuario.getEstatus_usr(),usuario.getId_usr());
        return flag;
	}

	@RemotingInclude
	public int remove(Usuario usuario) {
        int flag = this.simpleJdbcTemplate.update("UPDATE USUARIO SET estatus_usr = 0 WHERE id_usr=?", usuario.getId_usr());
        return flag;
	}
	
	@RemotingInclude
	public int actualizaContrasenaUsuario(Usuario usuario) {
		System.out.println("Password Nuevo Usuario: "+usuario.getPassword()+" "+usuario.getId_usr());
		int flag = this.simpleJdbcTemplate.update("UPDATE USUARIO SET PASSWORD = ? WHERE id_usr=?",usuario.getPassword() ,usuario.getId_usr());
        return flag;
	}
	
	 
	/*
	@RemotingInclude
	public int actualizaContrasenaUsuario(int id_usuario, String contrasena, String contrasena_old) {
        
		int contrasenaValida = 0;
		int flag = 0;
	
		System.out.println("Password Nuevo Usuario: "+contrasena_old+" "+id_usuario+" "+ contrasena);
		
		if(contrasena_old == null){
		  flag = this.simpleJdbcTemplate.update("UPDATE USUARIO SET PASSWORD = ? WHERE id_usr=?",contrasena ,id_usuario);
		  System.out.println("Nuevo usuario flag: "+flag);
		}
		else
		{
			contrasenaValida = simpleJdbcTemplate.queryForInt("SELECT count(*) from usuario where id_usr = ? and password = ?",  new Object [] {id_usuario,contrasena_old}); 
			 if(contrasenaValida == 0){
				 flag = 0;
				 System.out.println("Cambio contraseña, contraseña vieja invalida: "+flag);
		  }else{
			     flag = this.simpleJdbcTemplate.update("UPDATE USUARIO SET PASSWORD = ? WHERE id_usr=?",contrasena ,id_usuario);
			     flag = 2;
			     System.out.println("Cambio contraseña correcto!: "+flag);
		  }
		}	
			
		return flag;
	}
	 */

}
