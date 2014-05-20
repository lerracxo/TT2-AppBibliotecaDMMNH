package exposiciones;

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


 @Service("ExposicionService")
 @RemotingDestination(channels={"my-amf"})
public class ExposicionService implements IExposicionService {
	 
	    private static DataSource dataSourceDCpro;
	    
	    private SimpleJdbcTemplate simpleJdbcTemplate;
	    
	    private SimpleJdbcInsert  insertAutor;
	    
	    private BitacoraService bitacora = new BitacoraService();
	    

		public DataSource getDataSource(){
			   return dataSourceDCpro;
		   }
		
		@Autowired
		public void setDataSource(DataSource dataSourceDCpro){

			this.simpleJdbcTemplate = new SimpleJdbcTemplate(dataSourceDCpro);
	        this.insertAutor = new SimpleJdbcInsert(dataSourceDCpro).withTableName("autor").usingGeneratedKeyColumns("id_autor");
	        
	       }

		/*
		 * MŽtodo que retorna una lista de todos los autores disponibles en el sistema
		 * */
		@RemotingInclude
		public List<Exposicion> findAll(){
			String sql_txt = "SELECT id_exposicion, nombre, desc_exposicion, id_museo FROM exposicion";
			
			List<Exposicion> lista = new ArrayList<Exposicion>();
			
			List<Map<String, Object>> rows = simpleJdbcTemplate.queryForList(sql_txt);
			
			for (Map<String, Object> row : rows){ 
				lista.add(new Exposicion(
						((Integer)row.get("id_exposicion")),
						((String)row.get("nombre")),
						((String)row.get("desc_exposicion")),
						((Integer)row.get("id_museo"))
						));
			}
			
			System.out.println("lista exposicion: "+lista);
			return lista;
		}
		/*
		 * MŽtodo que realiza el registro de una exposicion
		 * */
		@RemotingInclude
		public Boolean registra(Exposicion exposicion){
			/*
			// Realiza la parametrizaci—n del objeto
			 Map<String, Object> parameters = new HashMap<String, Object>();
		        parameters.put("nombre", autor.getNombre());
		        parameters.put("desc_autor",autor.getDesc_autor());
		        parameters.put("fecha_nacimiento",autor.getFecha_nacimiento());
		        parameters.put("id_epoca",autor.getId_epoca());
		    // Realiza la inserci—n en la base de datos.
			Number id_autor = insertAutor.executeAndReturnKey(parameters);
			*/
			// Registra el evento en la bitacora
			
			String sql_txt = "INSERT INTO exposicion (nombre,desc_exposicion,id_museo)";
			bitacora.registra_eventoBitacora(new Bitacora(0,"Exposici—n","Registra exposicion: "+exposicion.getNombre()));
			return true;
		}
		
		/*
		 *  MŽtodo que realiza la eliminaci—n de una exposicion
		 * */
		@RemotingInclude
		public Boolean elimina(Exposicion exposicion){
			String sql_txt = "DELTE FROM exposicion WHERE id_exposicion = ?";
			
			int result = simpleJdbcTemplate.update(sql_txt, new Object[] {exposicion.getId_exposicion()});

			// Registra el evento en la bitacora
			bitacora.registra_eventoBitacora(new Bitacora(0,"Exposici—n","Elimina la exposicion: "+exposicion.getNombre()));
						
			return true;
		}
		
		@RemotingInclude
		public Boolean modifica(Exposicion exposicion){
			String sql_txt = "UPDATE exposicion SET nombre= ?, desc_exposicion = ?, id_museo = ? " +
					" WHERE id_exposicion = ?";
			
			int result = simpleJdbcTemplate.update(sql_txt, new Object[] {
					exposicion.getNombre(),
					exposicion.getDesc_exposicion(),
					exposicion.getId_museo(),
					exposicion.getId_exposicion()
			});
			
			// Registra el evento en la bitacora
			bitacora.registra_eventoBitacora(new Bitacora(0,"Exposici—n","Modifica de exposici—n: "+exposicion.getNombre()));
						
			return true;
		}
		
}
