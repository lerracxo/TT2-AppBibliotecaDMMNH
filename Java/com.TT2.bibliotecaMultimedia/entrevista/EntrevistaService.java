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
import org.springframework.dao.DataAccessException;
import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.flex.remoting.RemotingInclude;
import org.springframework.flex.remoting.RemotingExclude;
import org.springframework.jdbc.InvalidResultSetAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.jdbc.core.simple.SimpleJdbcTemplate;
import org.springframework.stereotype.Service;

import bitacora.Bitacora;
import bitacora.BitacoraService;


 @Service("EntrevistaService")
 @RemotingDestination(channels={"my-amf"})
public class EntrevistaService implements IEntrevistaService {
	 
	    private static DataSource dataSourceDCpro;
	    
	    private SimpleJdbcTemplate simpleJdbcTemplate;
	    private BitacoraService bitacora = new BitacoraService();
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
	public boolean registraVisitante(Entrevista entrevista){
		/**/
		String ls_sql = "INSERT INTO seg_registro_visitante (genero,id_rango_edad,id_ocupacion,id_estado_civil, " +
				" id_razon_visita, id_frecuencia_asistencia, id_numero_acompanantes, fecha_visita, hora_visita) " +
				" VALUES (?,?,?,?,?,?,?,curdate(), curtime())";
		 
		System.out.println("Sql: "+ls_sql);
		System.out.print("Entrevista: "+entrevista.getGenero()+" "+
				entrevista.getid_rango_edad()+" "+
				entrevista.getId_ocupacion()+" "+
				entrevista.getid_estado_civil()+" "+
				entrevista.getid_razon_visita()+" "+
				entrevista.getid_frecuencia_asistencia()+" "+
				entrevista.getid_numero_acompanantes());
		
		/*
		String ls_sql = " INSERT INTO seg_registro_visitante VALUES (0,'H', "+
						" (SELECT id_rango_edades FROM cat_rango_edades WHERE desc_rango_edades=?),"+
						" (SELECT id_ocupacion FROM cat_ocupacion WHERE desc_ocupacion = ? ), "+
						" (SELECT id_estado_civil FROM cat_estado_civil WHERE desc_estado_civil = ?),"+
						" (SELECT id_razon_visita FROM cat_razon_visita WHERE desc_razon_visita = ?), "+
						" (SELECT id_frecuencia_asistencia FROM cat_frecuencia_asistencia WHERE desc_frecuencia_asistencia = ?), "+
						" (SELECT id_numero_acompanantes FROM cat_numero_acompanantes WHERE desc_numero_acompanantes = ?), "+
						" curdate(), curtime() "+
						" )";
		*/
	try{
		int flag = this.simpleJdbcTemplate.update(ls_sql, new Object [] {entrevista.getGenero(),
																		entrevista.getid_rango_edad(),
																		entrevista.getId_ocupacion(),
																		entrevista.getid_estado_civil(),
																		entrevista.getid_razon_visita(),
																		entrevista.getid_frecuencia_asistencia(),
																		entrevista.getid_numero_acompanantes()});
		System.out.println("retorno en la bandera: "+flag );
	
		// Registra el evento en la bitacora
		bitacora.registra_eventoBitacora(new Bitacora(0,"Archivo","Registra el visitante: "+entrevista.getId_registroVisitante()));
					
		return true;
	}catch (InvalidResultSetAccessException e) 
	{
	   System.out.println("1 "+e.getMessage());
	} 
	catch (DataAccessException e)
	{
		System.out.println("2 "+e.getMessage());
	}
		
		return false;
	}
	
	// Retorna el una lista de estados civiles
	@RemotingInclude
	public List<String> ObtieneEstadoCivil(){
		String ls_sql = "SELECT id_estado_civil,desc_estado_civil FROM cat_estado_civil";
		
		List <String> lista = new ArrayList<String>();
		
		// Se obtiene el mapeo de una lista
		List<Map<String, Object>> rows =  simpleJdbcTemplate.queryForList(ls_sql);
		
		// Se genera una lista de un array de indice-valor de tipo objeto
    	for (Map<String, Object> row : rows)
    		lista.add((String)row.get("desc_estado_civil"));
    		
    	return lista;
	}
	
	// Retorna una lista de frecuencias de asistencia
	@RemotingInclude
	public List<String> ObtieneFrecuenciaAsistencia(){
		String ls_sql = "SELECT id_frecuencia_asistencia,desc_frecuencia_asistencia FROM cat_frecuencia_asistencia";
		
		List <String> lista = new ArrayList<String>();
		
		// Se obtiene el mapeo de una lista
		List<Map<String, Object>> rows =  simpleJdbcTemplate.queryForList(ls_sql);
		
		// Se genera una lista de un array de indice-valor de tipo objeto
    	for (Map<String, Object> row : rows)
    		lista.add((String)row.get("desc_frecuencia_asistencia"));
    		
    	return lista;
	}
	
	// Retorna una lista de numero de acompanantes
	@RemotingInclude
	public List<String> ObtieneNumeroAcompanantes(){
		String ls_sql = "SELECT id_numero_acompanantes, desc_numero_acompanantes FROM cat_numero_acompanantes";
		
		List <String> lista = new ArrayList<String>();
		
		// Se obtiene el mapeo de una lista
		List<Map<String, Object>> rows =  simpleJdbcTemplate.queryForList(ls_sql);
		
		// Se genera una lista de un array de indice-valor de tipo objeto
    	for (Map<String, Object> row : rows)
    		lista.add((String)row.get("desc_numero_acompanantes"));
    		
    	return lista;
	}

	// Retorna el una lista de ocupaciones
	@RemotingInclude
	public List<String> ObtieneOcupaciones(){
		String ls_sql = "SELECT id_ocupacion,desc_ocupacion FROM cat_ocupacion";
		
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
		String ls_sql = "SELECT id_razon_visita,desc_razon_visita FROM cat_razon_visita";
		
		List <String> lista = new ArrayList<String>();
		
		// Se obtiene el mapeo de una lista
		List<Map<String, Object>> rows =  simpleJdbcTemplate.queryForList(ls_sql);
		
		// Se genera una lista de un array de indice-valor de tipo objeto
    	for (Map<String, Object> row : rows)
    		lista.add((String)row.get("desc_razon_visita"));
    		
    	return lista;
	}
		
	// Retorna el una lista de rangos de edades
	@RemotingInclude
	public List<String> ObtieneRangoEdades(){
		String ls_sql = "SELECT id_rango_edad,desc_rango_edad FROM cat_rango_edad";
		
		List <String> lista = new ArrayList<String>();
		
		// Se obtiene el mapeo de una lista
		List<Map<String, Object>> rows =  simpleJdbcTemplate.queryForList(ls_sql);
		
		// Se genera una lista de un array de indice-valor de tipo objeto
    	for (Map<String, Object> row : rows)
    		lista.add((String)row.get("desc_rango_edad"));
    		
    	return lista;
	}
	

}
