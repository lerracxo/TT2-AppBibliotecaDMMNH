package piezas;

public class TipoMultimedia {

	private int id_tipo_multimedia;
	private String desc_tipo_multimedia;
	private String extension;
	
	
	public TipoMultimedia(){}
	
	public TipoMultimedia(int id_tipo_multimedia,String desc_tipo_multimedia,String extension){
		this.id_tipo_multimedia = id_tipo_multimedia;
		this.desc_tipo_multimedia = desc_tipo_multimedia;
		this.extension = extension;
	}
	
	/**
	 * @return the id_tipo_multimedia
	 */
	public int getId_tipo_multimedia() {
		return id_tipo_multimedia;
	}
	/**
	 * @param id_tipo_multimedia the id_tipo_multimedia to set
	 */
	public void setId_tipo_multimedia(int id_tipo_multimedia) {
		this.id_tipo_multimedia = id_tipo_multimedia;
	}
	/**
	 * @return the desc_tipo_multimedia
	 */
	public String getDesc_tipo_multimedia() {
		return desc_tipo_multimedia;
	}
	/**
	 * @param desc_tipo_multimedia the desc_tipo_multimedia to set
	 */
	public void setDesc_tipo_multimedia(String desc_tipo_multimedia) {
		this.desc_tipo_multimedia = desc_tipo_multimedia;
	}
	/**
	 * @return the extension
	 */
	public String getExtension() {
		return extension;
	}
	/**
	 * @param extension the extension to set
	 */
	public void setExtension(String extension) {
		this.extension = extension;
	}
	
	
}
