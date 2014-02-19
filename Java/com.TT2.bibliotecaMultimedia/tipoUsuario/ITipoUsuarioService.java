package tipoUsuario;
import java.util.List;

public interface ITipoUsuarioService
{
    public List<TipoUsuario> findAll();
    
    public TipoUsuario findById(int id);

    public TipoUsuario create(TipoUsuario item);

    public int update(TipoUsuario item);

    public int remove(TipoUsuario item);
    
}
