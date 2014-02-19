package usuarios;
import java.util.List;
import usuarios.Usuario;

public interface IUsuarioService
{
    public List<Usuario> findAll();
    
    public Usuario findById(int id);

    public Usuario create(Usuario item);

    public int update(Usuario item);

    public int remove(Usuario item);
    
}
