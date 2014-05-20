package qrcode;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Hashtable;
 
import javassist.bytecode.ByteArray;

import javax.imageio.ImageIO;

import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.flex.remoting.RemotingInclude;
import org.springframework.stereotype.Service;

import utileria.Utileria;

import bitacora.*;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;


@Service("QRCodeService")
@RemotingDestination(channels={"my-amf"})
public class QRCode {

	private Utileria utileria = new Utileria();
	private String directorioQR = utileria.getRutaQRCodes();
	private String fileType = "png";
	private BitacoraService bitacora = new BitacoraService ();
	
	@RemotingInclude
	public void generaCodigoQR(int id_pieza) {
	    int size = 500;
	    //String fileType = "png";
	    
	    String myCodeText = id_pieza+"";
	    String filePath = directorioQR+myCodeText+"."+fileType;
	    
	    File myFile = new File(filePath);
	    try {
	    	//System.out.println("Entra al try");
	    	
	        Hashtable<EncodeHintType, ErrorCorrectionLevel> hintMap = new Hashtable<EncodeHintType, ErrorCorrectionLevel>();
	        hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);
	        QRCodeWriter qrCodeWriter = new QRCodeWriter();
	        BitMatrix byteMatrix = qrCodeWriter.encode(myCodeText,BarcodeFormat.QR_CODE, size, size, hintMap);
	        int CrunchifyWidth = byteMatrix.getWidth();
	        BufferedImage image = new BufferedImage(CrunchifyWidth, CrunchifyWidth,
	                BufferedImage.TYPE_INT_RGB);
	        image.createGraphics();
	        
	        //System.out.println("Casi exporta la imagen");
	            
	            Graphics2D graphics = (Graphics2D) image.getGraphics();
	            graphics.setColor(Color.WHITE);
	            graphics.fillRect(0, 0, CrunchifyWidth, CrunchifyWidth);
	            graphics.setColor(Color.BLACK);
	 
	            for (int i = 0; i < CrunchifyWidth; i++) {
	                for (int j = 0; j < CrunchifyWidth; j++) {
	                    if (byteMatrix.get(i, j)) {
	                        graphics.fillRect(i, j, 1, 1);
	                    }
	                }
	            }
	           
	            /*
	        // Conjunto de c—digo que genera el arreglo de bytes de una imagen
	        ByteArrayOutputStream baos = new ByteArrayOutputStream();
	        ImageIO.write(image, fileType, baos);
	        baos.flush();
	        byte[] imageInByte = baos.toByteArray();
	        System.out.println("Se exporta la imagen con tama–o "+imageInByte.length);
	        return imageInByte;
	        */
	        
	        //Escribe la imagen en el disco.
	        ImageIO.write(image, fileType, myFile);
	        
	        // Registra el evento en la bitacora
			bitacora.registra_eventoBitacora(new Bitacora(0,"C—digo QR","Generaci—n de c—digo: "+myCodeText+"."+fileType));
			
			
	    } catch (WriterException e) {
	        e.printStackTrace();
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    System.out.println("\n\nYou have successfully created QR Code.");
	    
	    return;
	}     
	
	@RemotingInclude
	public byte[] bajaQRCode(int id_pieza){
		System.out.println("Se recibe petici—n de bajada :D");
		try{
			File file = new File(directorioQR+id_pieza+"."+fileType);
			FileInputStream input = new FileInputStream(file);
			byte[] archivo = new byte[(int) file.length()];
			input.read(archivo);
			input.close();
		
			System.out.println("Se concreta con un archivo de :"+archivo.length+" bytes.");
			// Registra el evento en la bitacora
			bitacora.registra_eventoBitacora(new Bitacora(0,"C—digo QR","Descarga de c—digo: "+id_pieza+"."+fileType));
			
			return archivo;
		
		}catch(FileNotFoundException e){
			System.out.println("Error: "+e.getMessage());
		}
		catch(IOException e){
			System.out.println("Error: "+e.getMessage());
		}
		
		System.out.println("Ocurre un error");
		return null;
	}

}
