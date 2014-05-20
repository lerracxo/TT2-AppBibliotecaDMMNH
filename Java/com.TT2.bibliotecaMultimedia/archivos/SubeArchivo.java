package archivos;

import piezas.Multimedia;
import utileria.Utileria;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;

import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.flex.remoting.RemotingInclude;
import org.springframework.stereotype.Service;

import bitacora.Bitacora;
import bitacora.BitacoraService;

@Service("SubeArchivoService")
@RemotingDestination(channels = {"my-amf"})
public class SubeArchivo {
	
	//change this to the desired path you wish the files to be uploaded
	// Direcci—n del servidor para la multimedia
	private String FilePath;
	private BitacoraService bitacora = new BitacoraService();
			
	//"/Users/omar/Documents/Servidores/apache-tomcat-6.0.35/webapps/ROOT/multimedia/";
	
	/*
	 * MŽtodo que realiza la escritura del archivo en el servidor de archivos
	 * */
	@RemotingInclude
	public Boolean escribeArchivo(String nombre_archivo, byte[] data) {
		Utileria utileria = new Utileria();
		FilePath = utileria.getMultimedia();
		try{
			System.out.println("Peticion recibida: "+nombre_archivo+" len data: "+data.length);
			
			//create the dir that we will store files
			File dir = new File(FilePath);
			dir.mkdirs();
			
			File file = new File(FilePath +nombre_archivo);
			FileOutputStream output = new FileOutputStream(file);
			output.write(data);
			output.close();
			
			System.out.println("Ruta absoluta del archivo: "+file.getAbsolutePath());
			System.out.println("Ruta de ejecuci—n del archivo: "+System.getProperty("user.dir"));
			System.out.println("Ruta de otro tipo: "+FilePath);
		}
		catch(FileNotFoundException e){
			System.out.println("Error: "+e.getMessage());
			return false;
		}
		catch(IOException e){
			System.out.println("Error: "+e.getMessage());
			return false;
		}

		// Registra el evento en la bitacora
		bitacora.registra_eventoBitacora(new Bitacora(0,"Archivo","Escribe archivo: "+nombre_archivo));
		return true;
	}
	
	public String extensionArchivo(String nombre_archivo){
		
		String extension="";

		int i = nombre_archivo.lastIndexOf('.');
		if (i > 0) {
		    extension = nombre_archivo.substring(i+1);
		}
	
		return "."+extension;
		
	}
	
	@RemotingInclude
	public byte[] bajaArchivo(Multimedia multimedia){
		try{
			File file = new File(FilePath+multimedia.getNombre_archivo());
			FileInputStream input = new FileInputStream(file);
			byte[] archivo = new byte[(int) file.length()];
			input.read(archivo);
			input.close();
			
			bitacora.registra_eventoBitacora(new Bitacora(0,"Archivo","Escribe archivo: "+multimedia.getNombre_archivo()));
			
			return archivo;
		
		}catch(FileNotFoundException e){
			System.out.println("Error: "+e.getMessage());
			return null;
		}
		catch(IOException e){
			System.out.println("Error: "+e.getMessage());
			return null;
		}
	}
	
	
	
}
