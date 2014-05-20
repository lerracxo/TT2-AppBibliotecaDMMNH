package salas;

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


 @Service("SalaService")
 @RemotingDestination(channels={"my-amf"})
public class SalaService implements ISalaService {
	 
	    private static DataSource dataSourceDCpro;
	    private SimpleJdbcTemplate simpleJdbcTemplate;
	    private SimpleJdbcInsert insertSala;
	    
	    private BitacoraService bitacora = new BitacoraService();
	    

		public DataSource getDataSource(){
			   return dataSourceDCpro;
		   }
		@Autowired
		public void setDataSource(DataSource dataSourceDCpro){

			this.simpleJdbcTemplate = new SimpleJdbcTemplate(dataSourceDCpro);
	        this.insertSala = new SimpleJdbcInsert(dataSourceDCpro).withTableName("sala").usingGeneratedKeyColumns("id_sala");
	        
	       }

		/*
		 * MŽtodo que retorna una lista de todos los autores disponibles en el sistema
		 * */
		@RemotingInclude
		public List<Sala> findAll(){
			String sql_txt = "SELECT id_sala, nombre, desc_sala, fecha, id_exposicion FROM sala";
			
			List<Sala> lista = new ArrayList<Sala>();
			
			List<Map<String, Object>> rows = simpleJdbcTemplate.queryForList(sql_txt);
			
			for (Map<String, Object> row : rows){ 
				lista.add(new Sala(
						((Integer)row.get("id_sala")),
						((String)row.get("nombre")),
						((String)row.get("desc_sala")),
						((Integer)row.get("id_exposicion"))
						));
			}
			
			System.out.println("lista sala: "+lista);
			return lista;
		}
		/*
		 * MŽtodo que realiza el registro de un autor
		 * */
		@RemotingInclude
		public Boolean registra(Sala sala){
			/*
			// Realiza la parametrizaci—n del objeto
			 Map<String, Object> parameters = new HashMap<String, Object>();
		        parameters.put("nombre", sala.getNombre());
		        parameters.put("desc_sala",sala.getDesc_sala());
		        parameters.put("id_",sala.getId_exposicion());
		        parameters.put("id_epoca",sala.getId_epoca());
		    // Realiza la inserci—n en la base de datos.
			Number id_autor = insertAutor.executeAndReturnKey(parameters);
		        
			// Registra el evento en la bitacora
			bitacora.registra_eventoBitacora(new Bitacora(0,"Archivo","Registra el autor: "+autor.getId_autor()));
			*/
			String sql_txt = "INSERT INTO sala (nombre,desc_sala,fecha,id_exposicion) VALUES " +
					" (?,?,NOW(),?) ";
			int resutl = simpleJdbcTemplate.update(sql_txt, new Object[] {
				sala.getNombre(),
				sala.getDesc_sala(),
				sala.getId_exposicion()
			});
			System.out.println("pide registrar: "+sala.toString());
			bitacora.registra_eventoBitacora(new Bitacora(0,"Sala","Registra la sala: "+sala.getNombre()));

			return true;
		}
		
		/*
		 *  MŽtodo que realiza la eliminaci—n de un autor
		 * */
		@RemotingInclude
		public Boolean elimina(Sala sala){
			String sql_txt = "DELETE FROM sala WHERE id_sala = ?";
			
			int result = simpleJdbcTemplate.update(sql_txt, new Object[] {sala.getId_sala()});

			// Registra el evento en la bitacora
			bitacora.registra_eventoBitacora(new Bitacora(0,"Sala","Elimina la sala: "+sala.getNombre()));
			return true;
		}
		
		@RemotingInclude
		public Boolean modifica(Sala sala){
			String sql_txt = "UPDATE sala SET nombre= ?, desc_sala = ?, id_exposicion= ? " +
					" WHERE id_sala = ?";
			
			int result = simpleJdbcTemplate.update(sql_txt, new Object[] {
					sala.getNombre(),
					sala.getDesc_sala(),
					sala.getId_exposicion(),
					sala.getId_sala()
			});
			
			// Registra el evento en la bitacora
			bitacora.registra_eventoBitacora(new Bitacora(0,"Sala","Modifica la sala: "+sala.getNombre()));
						
			return true;
		}
		
}
