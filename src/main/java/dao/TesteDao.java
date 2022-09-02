package dao;

import java.util.ArrayList;
import model.Usuario;

public class TesteDao {

	public static void main(String[] args) {
		DaoUsuario DAO = new DaoUsuario();
		Usuario usuario = DAO.consultarLivro("3");
		System.out.println(usuario.toString());
		
		/*Usuario usuario = new Usuario(null, "Jorjão", "jorjão@email.com", "jorjao", "usuario");
		DAO.inserirUsuario(usuario);
		ArrayList<Usuario> usuarios = DAO.listarUsuarios();
		for(Usuario u : usuarios) {
			System.out.println(u.toString());
		}*/
	}
}
