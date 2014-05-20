package reportes;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import usuarios.Usuario;
import utileria.Utileria;
// imports de Spring
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
import net.sf.jasperreports.engine.JRException;
// imports para los reportes
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.view.JasperViewer;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;
import net.sf.jasperreports.engine.export.ooxml.JRXlsxExporter;



 @Service("ReporteService")
 @RemotingDestination(channels={"my-amf"})
public class ReporteService implements IReporteService {
	 
	    private DataSource dataSourceDCpro;
	    private SimpleJdbcTemplate simpleJdbcTemplate;
	    
	    // Se usa para obtener las direcciones correspondientes
	    private Utileria utileria = new Utileria();
	    private String directorioReportes = utileria.getRutaReportes();
	    private BitacoraService bitacora = new BitacoraService();

		public DataSource getDataSource(){
			   return dataSourceDCpro;
		   }
		@Autowired
		public void setDataSource(DataSource dataSourceDCpro){

			this.simpleJdbcTemplate = new SimpleJdbcTemplate(dataSourceDCpro);
			this.dataSourceDCpro = dataSourceDCpro;
	        //this.insertUsuario = new SimpleJdbcInsert(dataSourceDCpro).withTableName("USUARIO").usingGeneratedKeyColumns("ID_USR");
	        
	       }

	/*
	 * MŽtodo que realiza el reporte especificado
	 * */
	@RemotingInclude
	public Reporte reporteVisitantes(Reporte reporte){
	    System.out.println("Los parametros recibidos: "+reporte.getNombre_jasper());
	    
	    // Se forma el reporte
	    try {
	    	// Llena al objeto reporte con los bytes para ser regresados a la aplicaci—n
	    	JasperPrint print = JasperFillManager.fillReport(directorioReportes+reporte.getNombre_jasper(),null,dataSourceDCpro.getConnection());
	    	reporte.setReporte(JasperExportManager.exportReportToPdf(print));
	    	reporte.setNombre_archivo("Prueba1.pdf");
	    	
	    	// Registra el evento en la bitacora
	    	bitacora.registra_eventoBitacora(new Bitacora(0,"Reporte","Generaci—n de reporte: "+reporte.getNombre_archivo()));
	    				
	    }catch(JRException e){
	    	e.printStackTrace();
	    }
	    catch(SQLException e){
	    	e.printStackTrace();
	    }
	    catch(Exception e){
	    	e.printStackTrace();
	    }
	    		
	    System.out.println("Reporte generado exitosamente :D");
		return reporte;
	}
	

}
