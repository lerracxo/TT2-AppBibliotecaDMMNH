package autores;

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


 @Service("AutorService")
 @RemotingDestination(channels={"my-amf"})
public class AutorSevice implements IAutorService {
	 
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
		public List<Autor> findAll(){
			List<Autor> lista = new ArrayList<Autor>();
			try{
				String sql_txt = "SELECT id_autor, nombre, desc_autor, fecha_nacimiento, id_epoca FROM autor";
				
				List<Map<String, Object>> rows = simpleJdbcTemplate.queryForList(sql_txt);
				
				for (Map<String, Object> row : rows){ 
					lista.add(new Autor(
							((Integer)row.get("id_autor")),
							((String)row.get("nombre")),
							((String)row.get("desc_autor")),
							((Date)row.get("fecha_nacimiento")),
							((Integer)row.get("id_epoca"))
							));
				}
				
				System.out.println("lista Autor: "+lista);
			}catch(Exception e){
				e.printStackTrace();
			}
			
			return lista;
		}
		/*
		 * MŽtodo que realiza el registro de un autor
		 * */
		@RemotingInclude
		public Boolean registra(Autor autor){
			// Realiza la parametrizaci—n del objeto
			 Map<String, Object> parameters = new HashMap<String, Object>();
		        parameters.put("nombre", autor.getNombre());
		        parameters.put("desc_autor",autor.getDesc_autor());
		        parameters.put("fecha_nacimiento",autor.getFecha_nacimiento());
		        parameters.put("id_epoca",autor.getId_epoca());
		    // Realiza la inserci—n en la base de datos.
			Number id_autor = insertAutor.executeAndReturnKey(parameters);
		        
			// Registra el evento en la bitacora
			bitacora.registra_eventoBitacora(new Bitacora(0,"Archivo","Registra el autor: "+autor.getId_autor()));
			return true;
		}
		
		/*
		 *  MŽtodo que realiza la eliminaci—n de un autor
		 * */
		@RemotingInclude
		public Boolean elimina(Autor autor){
			String sql_txt = "DELTE FROM autor WHERE id_autor = ?";
			
			int result = simpleJdbcTemplate.update(sql_txt, new Object[] {autor.getId_autor()});

			// Registra el evento en la bitacora
			bitacora.registra_eventoBitacora(new Bitacora(0,"Archivo","Elimina el autor: "+autor.getId_autor()));
						
			return true;
		}
		
		@RemotingInclude
		public Boolean modifica(Autor autor){
			String sql_txt = "UPDATE autor SET nombre= ?, desc_autor = ?, fecha_nacimiento = ?, id_epoca = ? " +
					" WHERE id_autor = ?";
			
			int result = simpleJdbcTemplate.update(sql_txt, new Object[] {
					autor.getNombre(),
					autor.getDesc_autor(),
					autor.getFecha_nacimiento(),
					autor.getId_epoca(),
					autor.getId_autor()
			});
			
			// Registra el evento en la bitacora
			bitacora.registra_eventoBitacora(new Bitacora(0,"Archivo","Modifica el autor: "+autor.getId_autor()));
						
			return true;
		}
		
}
