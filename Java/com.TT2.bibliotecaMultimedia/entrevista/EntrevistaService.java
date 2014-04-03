package entrevista;
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


 @Service("EntrevistaService")
 @RemotingDestination(channels={"my-amf"})
public class EntrevistaService implements IEntrevistaService {
	 
	    private static DataSource dataSourceDCpro;
	    
	    private SimpleJdbcTemplate simpleJdbcTemplate;
	    
	    //private SimpleJdbcInsert  insertUsuario;
	    

	public DataSource getDataSource(){
		   return dataSourceDCpro;
	   }
	@Autowired
	public void setDataSource(DataSource dataSourceDCpro){

		this.simpleJdbcTemplate = new SimpleJdbcTemplate(dataSourceDCpro);
        //this.insertUsuario = new SimpleJdbcInsert(dataSourceDCpro).withTableName("USUARIO").usingGeneratedKeyColumns("ID_USR");
        
       }
	
	@RemotingInclude
	public int registraVisitante(Entrevista entrevista){
		String ls_sql = "INSERT INTO seg_registroVisitante "+
						" (genero, edad, id_ocupacion, estado_civil, id_razonVisita, frecuencia,num_acompanantes, fecha_visita, hora_visita) "+
						" VALUES (?,?,?,?,?,?,?,curdate(), curtime())";
		
		int flag = this.simpleJdbcTemplate.update(ls_sql,entrevista.getGenero(),entrevista.getEdad(),entrevista.getId_ocupacion(),entrevista.getEstadoCivil()
				,entrevista.getId_razonVisita(),entrevista.getFrecuencia(),entrevista.getNumero_acompanantes());
		
		return flag;
	}

	// Retorna el una lista de ocupaciones
	@RemotingInclude
	public List<String> ObtieneOcupaciones(){
		String ls_sql = "SELECT id_ocupacion,desc_ocupacion FROM cat_ocupaciones";
		
		List <String> lista = new ArrayList<String>();
		
		// Se obtiene el mapeo de una lista
		List<Map<String, Object>> rows =  simpleJdbcTemplate.queryForList(ls_sql);
		
		// Se genera una lista de un array de indice-valor de tipo objeto
    	for (Map<String, Object> row : rows)
    		lista.add((String)row.get("desc_ocupacion"));
    		
    	return lista;
	}
	
	// Retorna el una lista de razones de visita
		@RemotingInclude
		public List<String> ObtieneRazonesVisita(){
			String ls_sql = "SELECT desc_razon FROM cat_razonVisita";
			
			List <String> lista = new ArrayList<String>();
			
			// Se obtiene el mapeo de una lista
			List<Map<String, Object>> rows =  simpleJdbcTemplate.queryForList(ls_sql);
			
			// Se genera una lista de un array de indice-valor de tipo objeto
	    	for (Map<String, Object> row : rows)
	    		lista.add((String)row.get("desc_razon"));
	    		
	    	return lista;
		}
	

}
