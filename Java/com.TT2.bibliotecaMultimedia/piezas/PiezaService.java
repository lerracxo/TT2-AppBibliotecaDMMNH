package piezas;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.text.SimpleDateFormat;


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

import bitacora.Bitacora;
import bitacora.BitacoraService;

import qrcode.QRCode;


 @Service("PiezaService")
 @RemotingDestination(channels={"my-amf"})
 
public class PiezaService implements IPiezaService {
	 
	    private static DataSource dataSourceDCpro;
	    private SimpleJdbcTemplate simpleJdbcTemplate;
	    private SimpleJdbcInsert insert_Multimedia;
	    private SimpleJdbcInsert insert_Pieza;
	    private BitacoraService bitacora = new BitacoraService();
	    
	public DataSource getDataSource(){
		   return dataSourceDCpro;
	   }
	@Autowired
	public void setDataSource(DataSource dataSourceDCpro){
		this.simpleJdbcTemplate = new SimpleJdbcTemplate(dataSourceDCpro);	
		this.insert_Multimedia = new SimpleJdbcInsert(dataSourceDCpro).withTableName("multimedia").usingGeneratedKeyColumns("id_multimedia"); 
		this.insert_Pieza = new SimpleJdbcInsert(dataSourceDCpro).withTableName("pieza").usingGeneratedKeyColumns("id_pieza");
	}
	
	/*
	 * Método que obtiene una pieza a través de su id
	 * */
	@RemotingInclude
	public Pieza piezaPorId(int id_pieza){
		
		System.out.println("Recibe petición para: "+id_pieza);
		String sql_txt = "SELECT id_pieza, desc_pieza, nombre, titulo, id_autor FROM pieza " +
				" WHERE id_pieza = ?";
		Pieza pieza = null;
		System.out.println("Se pide el id: "+id_pieza);
		try{
			/*
			pieza = simpleJdbcTemplate.queryForObject(sql_txt,Pieza.class , new Object[] {id_pieza});
			pieza.setElementosMultimedia(multimediaPorPieza(pieza.getId_pieza()));
			*/
			List<Map<String, Object>> rows =  simpleJdbcTemplate.queryForList(sql_txt, new Object[] {id_pieza});

			// Se genera una lista de un array de indice-valor de tipo objeto
	    	for (Map<String, Object> row : rows){
	    		System.out.println("Se pide multimedia");
	    		pieza = (new Pieza(
	    				(Integer)row.get("id_pieza"),
	    				((String)row.get("desc_pieza") ),
	    				((String)row.get("nombre") ),
	    				((String)row.get("titulo") ),
	    				((Integer)row.get("id_autor") ), 
	    				multimediaPorPieza((Integer)row.get("id_pieza"))));
	    	}
		}
		catch(Exception e){
			System.out.println(e.getMessage());
		}
		
		if (pieza == null )
			System.out.println("La pieza es nula");
		System.out.println(pieza);
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
    		System.out.println("Se pide multimedia");
    		lista.add(new Pieza(
    				(Integer)row.get("id_pieza"),
    				((String)row.get("desc_pieza") ),
    				((String)row.get("nombre") ),
    				((String)row.get("titulo") ),
    				((Integer)row.get("id_autor") ), 
    				multimediaPorPieza((Integer)row.get("id_pieza"))));
    	}
    	
    	System.out.println("Resultado de las piezas: "+lista);
     	return lista;
	}
	
	/*
	 * Método que retorna una lista de los tipos de multimedia encontrados en el sistema
	 * */
	@RemotingInclude
	public List<TipoMultimedia> findAll_tiposMultiemdia(){
		String sql_txt = "SELECT id_tipo_multimedia, desc_tipo_multimedia, extension FROM cat_tipo_multimedia ";
		
		List<TipoMultimedia> lista = new ArrayList<TipoMultimedia>();
		
		List<Map<String,Object>> rows = simpleJdbcTemplate.queryForList(sql_txt);
		
		for(Map<String,Object> row: rows){
			lista.add(new TipoMultimedia(
					((Integer) row.get("id_tipo_multimedia")),
					((String) row.get("desc_tipo_multimedia")),
					((String) row.get("extension"))
					));
		}
		
		System.out.println("Lista de tipos multimedia: "+lista);
		return lista;
	}
	
	/*
	 * Método que retorna una lista de elementos multimedia a partir del id de una pieza
	 * */
	@RemotingInclude
	public List<Multimedia> multimediaPorPieza(int id_pieza){
		String sql_txt = "SELECT m.id_multimedia, m.id_tipo_multimedia, m.desc_multimedia,  " +
				" m.nombre, m.nombre_archivo, m.nombre_original " +
				" FROM multimedia m, pieza_multimedia pz " +
				" WHERE pz.id_multimedia = m.id_multimedia " +
				" AND   pz.id_pieza = ? ORDER BY m.id_multimedia";
		
		System.out.println("Consulta multimedia con: "+sql_txt+" y "+id_pieza);
		List <Multimedia> lista = new ArrayList<Multimedia>();
		
		List<Map<String, Object>> rows =  simpleJdbcTemplate.queryForList(sql_txt, new Object [] {id_pieza});

		for (Map<String, Object> row : rows){			
			int id_multimedia = ((Integer)row.get("id_multimedia"));
			int id_tipo_multimedia = ((Integer) row.get("id_tipo_multimedia"));
			String desc_multimedia = ((String)row.get("desc_multimedia"));
			String nombre = ((String) row.get("nombre"));
			String nombre_archivo = ((String) row.get("nombre_archivo"));
			String nombre_original = ((String) row.get("nombre_original"));
			
			Multimedia obj = new Multimedia(
					id_multimedia,
					id_tipo_multimedia,
					desc_multimedia,
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
	 * Este Método registra una pieza, así como los elementos multimedia asociados a ella
	 * */
	@RemotingInclude
	public boolean registroPieza(Pieza pieza){
		//String sql_txt = "INSERT INTO pieza (desc_pieza, nombre, titulo, id_autor) " +
		//		"VALUES (?,?,?,?)";
		
		System.out.println("Recibe el llamado con: "+pieza.getDesc_pieza());
		// Se realiza la parametrización de la pieza
		Map<String, Object> parameters = new HashMap<String, Object>();
		 parameters.put("desc_pieza",pieza.getDesc_pieza());
		 parameters.put("nombre", pieza.getNombre());
		 parameters.put("titulo", pieza.getTitulo());
		 parameters.put("id_autor",pieza.getId_autor());
		
		 System.out.println("Hace la parametrización");
		 int result = insert_Pieza.executeAndReturnKey(parameters).intValue();
		
		//Manda a escribir la pieza en el directorio especificado por la parametrización
		 QRCode qrcode = new QRCode();
		qrcode.generaCodigoQR(result);
		System.out.println("Resultado del registro de una pieza: "+result);
		
		// Registra el evento en la bitacora
		bitacora.registra_eventoBitacora(new Bitacora(0,"Piezas","Registro de pieza: "+pieza.getNombre()));
					
		return true;
	}
	
	/*
	 * Este método realiza la actualización de una pieza de acuerdo a su id
	 * */
	@RemotingInclude
	public boolean actualizaPieza(Pieza pieza){
		String sql_txt = "UPDATE pieza SET desc_pieza = ?, nombre=?, titulo=?, id_autor= ? WHERE id_pieza = ? ";
		int result = simpleJdbcTemplate.update(sql_txt, 
				new Object[] {pieza.getDesc_pieza(),
							  pieza.getNombre(),
							  pieza.getTitulo(),
							  pieza.getId_autor(),
							  pieza.getId_pieza()});
		// Registra el evento en la bitacora
		bitacora.registra_eventoBitacora(new Bitacora(0,"Piezas","Modificación de pieza: "+pieza.getNombre()));
					
		return true;
	}
	
	/*
	 * Método que realiza la eliminación de una pieza a través de su id
	 * */
	@RemotingInclude
	public boolean eliminaPieza(Pieza pieza){
		String sql_txt = "DELETE FROM pieza WHERE id_pieza = ?";
		System.out.println("A ejecutar: "+sql_txt);
		int result = simpleJdbcTemplate.update(sql_txt,
				new Object[]{pieza.getId_pieza()});
		// Registra el evento en la bitacora
		bitacora.registra_eventoBitacora(new Bitacora(0,"Piezas","Eliminación de pieza: "+pieza.getNombre()));
					
		return true;
	}
	
	/*
	 * Método que registra uno elemento multimedia
	 * */
	@RemotingInclude
	public boolean registraMultimedia(Multimedia multimedia, int id_pieza){
		
		System.out.println("Recibido: ");
		System.out.println(multimedia.getId_multimedia());
		System.out.println(multimedia.getId_tipo_multimedia());
		System.out.println(multimedia.getDesc_multimedia());
		System.out.println(multimedia.getNombre());
		System.out.println(multimedia.getNombre_archivo());
		System.out.println(multimedia.getNombre_original());
		
		 Map<String, Object> parameters = new HashMap<String, Object>();
		 parameters.put("id_tipo_multimedia",multimedia.getId_tipo_multimedia());
		 parameters.put("desc_multimedia", multimedia.getDesc_multimedia());
		 parameters.put("nombre", multimedia.getNombre());
		 parameters.put("nombre_archivo", multimedia.getNombre_archivo());
		 parameters.put("nombre_original", multimedia.getNombre_original());
		 
		multimedia.setId_multimedia(insert_Multimedia.executeAndReturnKey(parameters).intValue());

		
		// registra la relación entre la pieza y la multimedia
		String sql_txt = "INSERT INTO pieza_multimedia VALUES (?,?)";
		int result = simpleJdbcTemplate.update(sql_txt, new Object [] {id_pieza,
															multimedia.getId_multimedia()});
		
		// Registra el evento en la bitacora
		bitacora.registra_eventoBitacora(new Bitacora(0,"Piezas","Regristro de multimedia: "+multimedia.getNombre()));
		return true;
	}
	
	/*
	 * Método que realiza una modificación sobre un elemento multimedia
	 * */
	@RemotingInclude
	public boolean modificaMultimedia(Multimedia multimedia){
		
		System.out.println("Se recibió la petición");
		
		
		System.out.println("Se realiza la modificación");
		String sql_txt = "UPDATE multimedia SET  id_tipo_multimedia = ? ,desc_multimedia = ?, nombre = ?, nombre_archivo = ?, nombre_original = ? " +
				" WHERE id_multimedia = ? ";
		int result = simpleJdbcTemplate.update(sql_txt, new Object [] {multimedia.getId_tipo_multimedia(),
																		multimedia.getDesc_multimedia(),
																		multimedia.getNombre(),
																		multimedia.getNombre_archivo(),
																		multimedia.getNombre_original(),
																		multimedia.getId_multimedia()});
		// Registra el evento en la bitacora
		bitacora.registra_eventoBitacora(new Bitacora(0,"Piezas","Modificación de multimedia: "+multimedia.getNombre()));
				
		return true;
	}
	
	/*
	 * Método que realiza la eliminación de una pieza a nivel de base de datos
	 * */
	@RemotingInclude
	public boolean eliminaMultimedia(Multimedia multimedia){
		// Elimina el elemento multimedia 
		String sql_txt = "DELETE FROM multimedia WHERE id_multimedia = ?";
		int result = simpleJdbcTemplate.update(sql_txt, new Object [] {multimedia.getId_multimedia()});

		// Elimina la relación entre la pieza y el elemento multimedia
		sql_txt = "DELETE FROM pieza_multimedia WHERE id_multimedia = ? ";
		result = simpleJdbcTemplate.update(sql_txt,new Object[]{multimedia.getId_multimedia()});
		
		// Registra el evento en la bitacora
		bitacora.registra_eventoBitacora(new Bitacora(0,"Piezas","Eliminación de multimedia: "+multimedia.getNombre()));
				
		return true;
	}
	
	/*
	 * Método que retorna el nombre de un archivo basado este, en la fecha del servidor para que sea 
	 * irrepetible
	 * 
	 * */
	@RemotingInclude
	public String obtieneNombreArchivoFechaservidor(String nombre_original){
		archivos.SubeArchivo subeArchivo = new archivos.SubeArchivo ();			
		
		return (new SimpleDateFormat("dd-MM-yyyy-HH-mm-ss-SSS").format(new java.util.Date())+
				subeArchivo.extensionArchivo(nombre_original));
		
	}
	
	
}
