package tipoUsuario;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.flex.remoting.RemotingInclude;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.jdbc.core.simple.SimpleJdbcTemplate;
import org.springframework.stereotype.Service;


 @Service("TipoUsuarioService")
 @RemotingDestination(channels={"my-amf"})
public class TipoUsuarioService implements ITipoUsuarioService {
	 
	    private static DataSource dataSourceDCpro;
	    
	    private SimpleJdbcTemplate simpleJdbcTemplate;
	    
	    private SimpleJdbcInsert  insertTipoUsuario;
	    

		public DataSource getDataSource(){
			   return dataSourceDCpro;
		   }
		@Autowired
		public void setDataSource(DataSource dataSourceDCpro){

			this.simpleJdbcTemplate = new SimpleJdbcTemplate(dataSourceDCpro);
	        this.insertTipoUsuario = new SimpleJdbcInsert(dataSourceDCpro).withTableName("C_TIPO_USUARIO").usingGeneratedKeyColumns("ID_TIPO_USR");
	        
	       }

	@RemotingInclude
	public List<TipoUsuario> findAll() {
    	return	simpleJdbcTemplate.query("SELECT * FROM C_TIPO_USUARIO ", new RowMapper<TipoUsuario>() {
	            public TipoUsuario mapRow( ResultSet rs,  int i) throws SQLException {
	                    return new TipoUsuario( rs.getInt(1), rs.getInt(2),rs.getString(3),rs.getString(4));
	                }
	            }        
	    );
		
	}

	@RemotingInclude
	public TipoUsuario findById(int id) {
    	return  simpleJdbcTemplate.queryForObject(
	            "SELECT *  FROM C_TIPO_USUARIO WHERE id_tipo_usr = ?", new RowMapper<TipoUsuario>() {
	            public TipoUsuario mapRow( ResultSet rs,  int i) throws SQLException {
	                    return new TipoUsuario( rs.getInt(1), rs.getInt(2), rs.getString(3),rs.getString(4));
	               
	            }
	            },
	            new Object [] {id}
	            
	    );
		
	}

	@RemotingInclude
	public TipoUsuario create(TipoUsuario tipousuario) {
        Map<String, Object> parameters = new HashMap<String, Object>();
        parameters.put("id_c_sistema", tipousuario.getId_c_sistema());
        parameters.put("nombre_tipo", tipousuario.getNombre_tipo());
        parameters.put("descripcion_tipo", tipousuario.getDescripcion_tipo());
        Number id_tipo_usr = this.insertTipoUsuario.executeAndReturnKey(parameters);
        tipousuario.setId_tipo_usr(id_tipo_usr.intValue());
        return tipousuario;
	}

	@RemotingInclude
	public int update(TipoUsuario tipousuario) {
        int flag = this.simpleJdbcTemplate.update(
                "UPDATE C_TIPO_USUARIO SET ID_C_SISTEMA= ?, NOMBRE_TIPO= ?, DESCRIPCION_TIPO= ? WHERE ID_TIPO_USR = ?", 
                tipousuario.getId_c_sistema(),tipousuario.getNombre_tipo(),tipousuario.getDescripcion_tipo(),tipousuario.getId_tipo_usr());
        return flag;
	}

	@RemotingInclude
	public int remove(TipoUsuario tipousuario) {
        int flag = this.simpleJdbcTemplate.update("DELETE FROM C_TIPO_USUARIO WHERE id_tipo_usr=?", tipousuario.getId_tipo_usr());
        return flag;
	}

}
