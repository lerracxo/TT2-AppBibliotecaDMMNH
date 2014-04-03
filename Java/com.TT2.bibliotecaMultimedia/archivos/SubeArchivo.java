package archivos;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.flex.remoting.RemotingInclude;
import org.springframework.stereotype.Service;

@Service("SubeArchivoService")
@RemotingDestination(channels = {"my-amf"})
public class SubeArchivo {
	
	//change this to the desired path you wish the files to be uploaded
	private String FilePath = "/Users/omar/Dropbox/ESCOM/TT/Desarrollo Personal/archivosSubidos/";
	
	@RemotingInclude
	public Boolean doUpload(String fileName, byte[] data) {
		try{
			FilePath = "";
			//create the dir that we will store files
			File dir = new File(FilePath);
			dir.mkdirs();
			
			File file = new File(FilePath + fileName);
			FileOutputStream output = new FileOutputStream(file);
			output.write(data);
			output.close();
		}
		catch(FileNotFoundException e){
			return false;
		}
		catch(IOException e){
			return false;
		}
	
		return true;
	}
}
