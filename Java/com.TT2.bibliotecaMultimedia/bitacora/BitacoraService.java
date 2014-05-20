package bitacora;

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


 @Service("BitacoraService")
 @RemotingDestination(channels={"my-amf"})
/*
 * Esta clase no requiere ser llamada como servicio remoto
 * */
public class BitacoraService implements IBitacoraService  {
	 
	    private static DataSource dataSourceDCpro;
	    
	    private SimpleJdbcTemplate simpleJdbcTemplate;
	    
	    private SimpleJdbcInsert  insertBitacora;
	    

		public DataSource getDataSource(){
			   return dataSourceDCpro;
		   }
		
		@Autowired
		public void setDataSource(DataSource dataSourceDCpro){
			this.dataSourceDCpro = dataSourceDCpro;
			this.simpleJdbcTemplate = new SimpleJdbcTemplate(dataSourceDCpro);
	        this.insertBitacora = new SimpleJdbcInsert(dataSourceDCpro).withTableName("bitacora").usingGeneratedKeyColumns("id_bitacora");
	        
	       }
		
		public SimpleJdbcInsert obtieneInsert(){
			return insertBitacora;
		}

		/*
		 * Método que retorna una lista de todos los autores disponibles en el sistema
		 *
		@RemotingInclude
		public List<Epoca> findAll_epocas(){
			String sql_txt = "SELECT id_epoca, nombre, desc_epoca, fecha FROM autor";
			
			List<Epoca> lista = new ArrayList<Epoca>();
			
			List<Map<String, Object>> rows = simpleJdbcTemplate.queryForList(sql_txt);
			
			for (Map<String, Object> row : rows){ 
				lista.add(new Epoca(
						((Integer)row.get("id_epoca")),
						((String)row.get("nombre")),
						((String)row.get("desc_epoca")),
						((Date)row.get("fecha"))
						));
			}
			
			System.out.println("lista Autor: "+lista);
			return lista;
		}
		 */
		/*
		 * Método que realiza el registro de un evento en la bitacora
		 * */
		public Boolean registra_eventoBitacora(Bitacora bitacora){
			try{
				System.out.println(bitacora.getAccion());
				System.out.println(bitacora.getAfecta());
				System.out.println(bitacora.getId_bitacora());
				System.out.println(bitacora.getFecha());
				// Realiza la parametrización del objeto
				 Map<String, Object> parameters = new HashMap<String, Object>();
			        parameters.put("accion", bitacora.getAccion());
			        parameters.put("afecta",bitacora.getAfecta());
			        parameters.put("fecha","NOW()");
			        
			    // Realiza la inserción en la base de datos.
				//Number id_bitacora = insertBitacora.executeAndReturnKey(parameters);
				if (dataSourceDCpro == null){
					System.out.println("La referencia es nula");
				}else{
					setDataSource(dataSourceDCpro);
				}
				
				if (simpleJdbcTemplate == null){
					System.out.println("simpleJdbcTemplate es nulo");
				}
				if (insertBitacora == null){
					System.out.println("insertBitacora es nulo");
				} 
			        
			        
				String sql_txt = "INSERT INTO bitacora (accion, afecta, fecha ) VALUES ( ?,?,NOW())";
				
				// Realiza la insserción por otro método
				int result = simpleJdbcTemplate.update(sql_txt,new Object []{
						bitacora.getAccion(),
						bitacora.getAfecta()
						});
			} 
			catch(Exception e ){
				//System.out.println(e.getStackTrace());
				e.printStackTrace();
			}
			return true;
		}
		
		/*
		 *  Método que realiza la eliminación de un autor
		 * 
		@RemotingInclude
		public Boolean elimina_epoca(Epoca epoca){
			String sql_txt = "DELTE FROM cat_epoca WHERE id_epoca = ?";
			
			int result = simpleJdbcTemplate.update(sql_txt, new Object[] {epoca.getId_epoca()});
			
			return true;
		}
		*/
		/*
		@RemotingInclude
		public Boolean modifica_epoca(Epoca epoca){
			String sql_txt = "UPDATE cat_epoca SET nombre= ?, desc_epoca = ?, fecha = ? " +
					" WHERE id_epoca = ?";
			
			int result = simpleJdbcTemplate.update(sql_txt, new Object[] {
					epoca.getNombre(),
					epoca.getDesc_epoca(),
					epoca.getFecha(),
					epoca.getId_epoca()
			});
			
			return true;
		}
		*/
}