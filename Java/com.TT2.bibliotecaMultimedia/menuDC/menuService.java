package menuDC;

import menuDC.menuDC;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.flex.remoting.RemotingInclude;
import org.springframework.flex.remoting.RemotingExclude;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.jdbc.core.simple.SimpleJdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Service;
import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

	@SuppressWarnings("unused")
	@Service("menuService")
	@RemotingDestination(channels={"my-amf"})
	public class menuService implements ImenuDC
	{
	    private static DataSource dataSourceDCpro;
	    private SimpleJdbcTemplate simpleJdbcTemplate;
	    
		public DataSource getDataSource(){
			   return dataSourceDCpro;
		   }
		 @Autowired
		public void setDataSource(DataSource dataSourceDCpro){
			this.simpleJdbcTemplate = new SimpleJdbcTemplate(dataSourceDCpro);
	       }
		
	    @RemotingInclude
	    public List<menuDC> findAll()
	    {
	    	return	simpleJdbcTemplate.query(
    	            "SELECT Idmenu,descripcion,nivel,idpadre  FROM menus order by nivel", new RowMapper<menuDC>() {
    	            public menuDC mapRow( ResultSet rs,  int i) throws SQLException {
    	                    return new menuDC( rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4) );
	        	                }
	        	            }        
	        	    );
       }

	    @RemotingInclude
	    public menuDC findById(int id)
	    {
	    	return  simpleJdbcTemplate.queryForObject(
	    	            "SELECT Idmenu,descripcion,nivel,idpadre  FROM menus WHERE Idmenu = ?", new RowMapper<menuDC>() {
	    	            public menuDC mapRow( ResultSet rs,  int i) throws SQLException {
	    	                    return new menuDC( rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4) );
	    	               
	    	            }
	    	            },
	    	            new Object [] {id}
	    	            
	    	    ); 
	    }
	    
	    @RemotingInclude
	    public List<String> creaMenu(int idTpoUsr)
	    {
	    	idTpoUsr = 1;
	    	System.out.println("tipo_usr: "+idTpoUsr);
	    	return simpleJdbcTemplate.query(
    	           // "SELECT creaMenuDB("+idTpoUsr+");", new RowMapper<String>() {
	    			"SELECT creaMenuDB();", new RowMapper<String>() {
    	            public String mapRow( ResultSet rs,  int i) throws SQLException {
    	                    return new String(rs.getString(1) );
	        	                }
	        	            }        
	        	    );
	    }
}
