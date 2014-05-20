package museos;
import java.sql.Date;
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

import bitacora.Bitacora;
import bitacora.BitacoraService;


 @Service("MuseoService")
 @RemotingDestination(channels={"my-amf"})
public class MuseoSevice implements IMuseoService {
	 
	    private static DataSource dataSourceDCpro;
	    
	    private SimpleJdbcTemplate simpleJdbcTemplate;
	    
	    private SimpleJdbcInsert  insertEpoca;
	    private BitacoraService bitacora = new BitacoraService();

		public DataSource getDataSource(){
			   return dataSourceDCpro;
		   }
		@Autowired
		public void setDataSource(DataSource dataSourceDCpro){

			this.simpleJdbcTemplate = new SimpleJdbcTemplate(dataSourceDCpro);
	        this.insertEpoca = new SimpleJdbcInsert(dataSourceDCpro).withTableName("cat_epoca").usingGeneratedKeyColumns("id_epoca");
	        
	       }

		/*
		 * MŽtodo que retorna una lista de todos los autores disponibles en el sistema
		 * */
		@RemotingInclude
		public List<Museo> findAll(){
			String sql_txt = "SELECT id_museo, nombre, desc_museo, direccion, email, telefono FROM museo";
			
			List<Museo> lista = new ArrayList<Museo>();
			
			List<Map<String, Object>> rows = simpleJdbcTemplate.queryForList(sql_txt);
			
			for (Map<String, Object> row : rows){ 
				lista.add(new Museo(
						((Integer)row.get("id_museo")),
						((String)row.get("nombre")),
						((String)row.get("desc_museo")),
						((String)row.get("direccion")),
						((String)row.get("email")),
						((String)row.get("telefono"))
						));
			}
			
			System.out.println("lista Museos: "+lista);
			return lista;
		}
		/*
		 * MŽtodo que realiza el registro de un museo
		 * */
		/*// No se realizar‡ registro de otro museo
		@RemotingInclude
		public Boolean registra(Museo epoca){
			// Realiza la parametrizaci—n del objeto
			 Map<String, Object> parameters = new HashMap<String, Object>();
		        parameters.put("nombre", epoca.getNombre());
		        parameters.put("desc_epoca",epoca.getDesc_epoca());
		        parameters.put("anio",epoca.getAnio());
		    // Realiza la inserci—n en la base de datos.
			Number id_autor = insertEpoca.executeAndReturnKey(parameters);
			
			// Registra el evento en la bitacora
			bitacora.registra_eventoBitacora(new Bitacora(0,"Epoca","Registro de epoca: "+epoca.getNombre()));
			    
			return true;
		}
		*/
		
		/*
		 *  MŽtodo que realiza la eliminaci—n de un autor
		 * */
		/*// no se realizara eliminaci—n de museos
		@RemotingInclude
		public Boolean elimina(Museo epoca){
			String sql_txt = "DELTE FROM cat_epoca WHERE id_epoca = ?";
			
			int result = simpleJdbcTemplate.update(sql_txt, new Object[] {epoca.getId_epoca()});
			
			// Registra el evento en la bitacora
			bitacora.registra_eventoBitacora(new Bitacora(0,"Epoca","Eliminaci—n de epoca: "+epoca.getNombre()));
						
			return true;
		}
		*/
		
		/*
		 * Funci—n que realiza la modificaci—n del a informaci—n concerniente al museo
		 * */
		@RemotingInclude
		public Boolean modifica(Museo museo){
			String sql_txt = "UPDATE museo SET nombre= ?, desc_museo = ?, direccion = ?, email = ?, telefono = ? " +
					" WHERE id_museo = ?";
			
			int result = simpleJdbcTemplate.update(sql_txt, new Object[] {
					museo.getNombre(),
					museo.getDesc_museo(),
					museo.getDireccion(),
					museo.getEmail(),
					museo.getTelefono(),
					museo.getId_museo()
			});
			
			// Registra el evento en la bitacora
			bitacora.registra_eventoBitacora(new Bitacora(0,"Museo","Modificaci—n de museo: "+museo.getNombre()));
						
			return true;
		}
		
}