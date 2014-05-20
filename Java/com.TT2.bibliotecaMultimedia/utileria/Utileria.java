package utileria;

public class Utileria {
	
	public String executionContext =
			Utileria.class.getProtectionDomain().getCodeSource().getLocation().getPath();
	
	private String rutaReportes;
	private String rutaQRCodes ;
	//private String dirServer="/Users/omar/Documents/Servidores/apache-tomcat-6.0.35/webapps/ROOT/";
	private String multimedia;
	
	
	/*
	 * Constructor que acomoda las rutas
	 * */
	public Utileria(){
		// Se quita el nombre de la clase
		executionContext = executionContext.substring(0, executionContext.lastIndexOf('/'))+"/";
		// Se pasa de URL a su decode para String
		try{
			executionContext = java.net.URLDecoder.decode(executionContext,"UTF-8");
		}catch(Exception e){
			System.out.println("No se puede exportar la url: "+e.getMessage());
		}
		// Se generan las dem‡s variables
		multimedia = executionContext+"../../../multimedia/";
		rutaReportes =  executionContext+"../../BibiDigit-Files/reportes/";
		//rutaQRCodes = executionContext+"../../BibiDigit-Files/qrCodes/";
		rutaQRCodes = multimedia + "qrCodes/";
	}
	
	/**
	 * @return the executionContext
	 */
	public String getExecutionContext() {
		return executionContext;
	}
	/**
	 * @return the multimedia
	 */
	public String getMultimedia() {
		return multimedia;
	}
	/**
	 * @return the rutaReportes
	 */
	public String getRutaReportes() {
		return rutaReportes;
	}
	/**
	 * @return the rutaQRCodes
	 */
	public String getRutaQRCodes() {
		return rutaQRCodes;
	}

}
