package logIn;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import javax.sql.DataSource;

//import agentes.AgenteService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.flex.remoting.RemotingExclude;
import org.springframework.flex.remoting.RemotingInclude;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import bitacora.Bitacora;
import bitacora.BitacoraService;

@SuppressWarnings("unused")
@Service("loginService")
@RemotingDestination(channels = { "my-amf" })

public class AccesoSistema {

	//private AgenteService ag;
	private static DataSource dataSourceDCpro;
	private SimpleJdbcTemplate simpleJdbcTemplate;
	private BitacoraService bitacora = new BitacoraService();
	
	//@Autowired
	//private void setAgenteService(AgenteService ag){ this.ag = ag;}
	
	public DataSource getDataSource() {
		return dataSourceDCpro;
	}

	@Autowired
	public void setDataSource(DataSource dataSourceDCpro) {

		this.simpleJdbcTemplate = new SimpleJdbcTemplate(dataSourceDCpro);

	}

	
	@RemotingInclude
	public int validaUsuario(String email, String contrasena, String blaze_clientid) {
		//System.out.println("Peticion recibida :D");
		//System.out.println("Usuario: "+usuario);
		//System.out.println("Contrasena: "+contrasena);
		
		int id_usuario = 0;
		int bloqueo = 0;
		int primeravez = 0;
		int id_usr = 0;
		
		// Registra el evento en la bitacora
		bitacora.registra_eventoBitacora(new Bitacora(0,"Login","Valida usuario: "+email));
		
		String sql = "SELECT IF(MAX(id_usr) IS NULL, 0, id_usr) fROM usuario WHERE email_usr = ? AND password = ?"+
						" AND estatus_usr = 1";
		
		id_usr = simpleJdbcTemplate
				.queryForInt(
						sql,
						new Object[] { email, contrasena });
		
		System.out.println("Consulta: "+sql+" email: "+email+" contra "+contrasena);
		/* Codigo inecesario
		//System.out.println("Hola que onda");
		if (id_usr == 0) {
			logeoCorrecto = 0;
			//validaLoginsIncorrectos(id_usuario, bloqueo);
		} else {
			logeoCorrecto = id_usr;
			System.out.println("Sesion valida");
			//ag.Update_AgenteEstatus(id_usuario,blaze_clientid);
		}
		 */
			
		
		System.out.println("Retorna: "+id_usr);
		return id_usr;

	}
	
	@RemotingInclude
	public int obtenIdUsuario(String usuario) {

		int id_usuario = 0;
		int existe_usuario = 0;

		existe_usuario = simpleJdbcTemplate.queryForInt(
				"SELECT count(id_usr) from usuario where usr = ? and eliminado is null",
				new Object[] { usuario });
		if (existe_usuario != 0) {
			id_usuario = simpleJdbcTemplate.queryForInt(
					"SELECT id_usr from usuario where usr = ? LIMIT 1 ",
					new Object[] { usuario });
		}
		
		System.out.println("Se retorna: "+id_usuario);
		return id_usuario;
	}
	 
	/*
	@RemotingExclude
	public void validaLoginsIncorrectos(int id_usuario, int intentos) {

		if (intentos == 0) {
			simpleJdbcTemplate.update(
					"INSERT INTO bloqueo_login VALUES (0,?,1)",
					new Object[] { id_usuario });
		} else {
			intentos += 1;
			simpleJdbcTemplate.update(
					"UPDATE bloqueo_login SET intentos = ? where id_usr = ?",
					new Object[] { intentos, id_usuario });
		}

	}
	 
	@RemotingInclude
	public int validaBloqueoUsuario(int id_usuario) {

		int bloqueado = 0;
		int existe_registro = 0; 
		existe_registro = simpleJdbcTemplate.queryForInt(
				"SELECT count(intentos) from bloqueo_login where id_usr = ? ",
				new Object[] { id_usuario });
		if (existe_registro != 0) {
			bloqueado = simpleJdbcTemplate.queryForInt(
					"SELECT intentos from bloqueo_login where id_usr = ? ",
					new Object[] { id_usuario });
		}
		return bloqueado;
	}
	*/
	/*
	// Metodo invocado periodicamente cada 600000ms = 10 min para limpiar los intentos de inicio
	// de sesion incorrectos
	@RemotingExclude
	@Scheduled(fixedRate=600000)
	public void borraIntentos() {

		simpleJdbcTemplate
				.update("DELETE FROM bloqueo_login WHERE intentos < 5 ");
		Date date = new Date();
		System.out.println("Borrado de intentos " + date);
	}
	 */
	/*
	@RemotingExclude
	public int validaPrimeraVezUsuario(int id_usuario) {

		int primeravez = 0;
		int existe_registro = 0;

		primeravez = simpleJdbcTemplate
				.queryForInt(
						"SELECT count(password) from usuario where id_usr = ? and SHA1(usr) = password",
						new Object[] { id_usuario });
		if (primeravez == 1) {
			primeravez = 10;
		}
		// fSystem.out.println("primeravez: "+primeravez);
		return primeravez;
	}
	
	@RemotingInclude
	public int Desbloquea_Usuario(int id_usuario) {
	    int flag = this.simpleJdbcTemplate.update("DELETE FROM bloqueo_login WHERE id_usr=?", id_usuario);
        return flag;
 
	}
	 */
}
