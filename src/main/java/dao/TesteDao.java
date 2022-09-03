package dao;

import model.Usuario;

public class TesteDao {

	public static void main(String[] args) {
		DaoUsuario DAO = new DaoUsuario();
		Usuario usuario = DAO.consultar("admin", "admin");
		System.out.println(usuario.toString());
	}
}
