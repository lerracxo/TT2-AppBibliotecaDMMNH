package piezas;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;

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
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.jdbc.core.simple.SimpleJdbcTemplate;
import org.springframework.stereotype.Service;


 @Service("PiezaService")
 @RemotingDestination(channels={"my-amf"})
 
public class PiezaService implements IPiezaService {
	 
	    private static DataSource dataSourceDCpro;
	    private SimpleJdbcTemplate simpleJdbcTemplate;
	    private SimpleJdbcInsert  insertUsuario;
	    
	public DataSource getDataSource(){
		   return dataSourceDCpro;
	   }
	@Autowired
	public void setDataSource(DataSource dataSourceDCpro){
		this.simpleJdbcTemplate = new SimpleJdbcTemplate(dataSourceDCpro);	        
    }
	
	/*
	 * Método que obtiene una pieza a través de su id
	 * */
	@RemotingInclude
	public Pieza piezaPorId(int id_pieza){
		
		String sql_txt = "SELECT id_pieza, desc_pieza, nombre, titulo, id_autor FROM pieza " +
				" WHERE id_pieza = ?";
		
		Pieza pieza = simpleJdbcTemplate.queryForObject(sql_txt,Pieza.class , new Object[] {id_pieza});
		
		// Obtiene los elementos multimedia para la pieza obtenida
		pieza.setElementosMultimedia(multimediaPorPieza(pieza.getId_pieza()));
		
		return pieza;
	}
	
	/* 
	 * Método que retorna una lista de todas las piezas disponibles en el sitema
	 * */
	@RemotingInclude
	public List<Pieza> findAll_piezas() {
		
		String sql_txt = "SELECT id_pieza, desc_pieza, nombre, titulo, id_autor FROM pieza";
		
		List <Pieza> lista = new ArrayList<Pieza>();
		List<Map<String, Object>> rows =  simpleJdbcTemplate.queryForList(sql_txt);

		// Se genera una lista de un array de indice-valor de tipo objeto
    	for (Map<String, Object> row : rows){

    		lista.add(new Pieza(
    				(Integer)row.get("id_pieza"),
    				((String)row.get("desc_pieza") ),
    				((String)row.get("nombre") ),
    				((String)row.get("titulo") ),
    				((Integer)row.get("id_autor") ), 
    				multimediaPorPieza((Integer)row.get("id_pieza"))));
    	}
     	return lista;
	}
	
	/*
	 * Método que retorna una lista de elementos multimedia a partir del id de una pieza
	 * */
	@RemotingInclude
	public List<Multimedia> multimediaPorPieza(int id_pieza){
		String sql_txt = "SELECT m.id_multimedia, m.id_tipo_multimedia,  " +
				" m.nombre, m.nombre_archivo, m.nombre_original " +
				" FROM multimedia m, pieza_multimedia pz " +
				" WHERE pz.id_multimedia = m.id_multimedia " +
				" AND   pz.id_pieza = ?";
		
		List <Multimedia> lista = new ArrayList<Multimedia>();
		
		List<Map<String, Object>> rows =  simpleJdbcTemplate.queryForList(sql_txt, new Object [] {id_pieza});

		for (Map<String, Object> row : rows){			
			int id_multimedia = ((Integer)row.get("id_multimedia"));
			int id_tipo_multimedia = ((Integer) row.get("id_tipo_multimedia"));
			String nombre = ((String) row.get("nombre"));
			String nombre_archivo = ((String) row.get("nombre_archivo"));
			String nombre_original = ((String) row.get("nombre_original"));
			
			Multimedia obj = new Multimedia(
					id_multimedia,
					id_tipo_multimedia,
					nombre,
					nombre_archivo,
					nombre_original
				);
			lista.add(obj);

		}
		System.out.println("Resultado de la multimedia: "+lista);
		return lista;
	}
	
	/*
	 * Método que retorna una lista de todos los autores disponibles en el sistema
	 * */
	@RemotingInclude
	public List<Autor> findAll_autores(){
		String sql_txt = "SELECT id_autor, nombre, desc_autor, fecha_nacimiento, id_epoca FROM autor";
		
		List<Autor> lista = new ArrayList<Autor>();
		
		
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
		return lista;
	}
	
	
	/*
	 * Este Método registra una pieza, así como los elementos multimedia asociados a ella
	 * */
	@RemotingInclude
	public boolean registroPieza(Pieza pieza){
		String sql_txt = "INSERT INTO pieza (desc_pieza, nombre, titulo, id_autor) " +
				"VALUES (?,?,?,?)";
		// Se realiza la inserción de una nueva pieza.
		int result = simpleJdbcTemplate.update(sql_txt, new Object[] {pieza.getDesc_pieza(), pieza.getNombre(), pieza.getTitulo(), pieza.getId_autor()});
		
		for (int i = 0; i<pieza.getElementosMultimedia().size(); i++){
			registraMultimedia(pieza.getElementosMultimedia().get(i));
		}
		
		System.out.println("Resultado del registro de una pieza: "+result);
		
		return true;
	}
	
	/*
	 * Este método realiza la actualización de una pieza de acuerdo a su id
	 * */
	public boolean actualizaPieza(Pieza pieza){
		String sql_txt = "UPDATE pieza (des_)";
		return true;
	}
	
	
	/*
	 * Método que registra uno elemento multimedia
	 * */
	@RemotingInclude
	public boolean registraMultimedia(Multimedia multimedia){
			String sql_txt = "INSERT INTO multimedia (id_tipo_multimedia, nombre, nombre_archivo, nombre_original) "+
					"VALUES (?,?,?,?)";
			// Inserta el registro de un nuevo elemento multimedia
			int result = simpleJdbcTemplate.update(sql_txt, new Object [] {multimedia.getId_tipo_multimedia(), 
																			multimedia.getNombre(),
																			multimedia.getNombre_archivo(),
																			multimedia.getNombre_original()});
		return true;
	}
	
}
