package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Usuario;

public class DaoUsuario {
	// Listar os usuarios cadastrados -> READ
	public ArrayList<Usuario> listarUsuarios() {
		ArrayList<Usuario> usuarios = new ArrayList<>();
		String SQL = "SELECT * FROM tbUsuario";
		try {
			Connection conexao = Conexao.novaConexao();
			PreparedStatement pst = conexao.prepareStatement(SQL);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				// Populando o objeto Usuario
				String idUsuario = rs.getString("id");
				String nomeUsuario = rs.getString("nome");
				String email = rs.getString("email");
				String senha = rs.getString("senha");
				String tipo = rs.getString("tipo");

				// Atribuindo valores com base nos construtores
				Usuario usuario = new Usuario(idUsuario, nomeUsuario, email, senha, tipo);
				usuarios.add(usuario);
			}
			conexao.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return usuarios;
	}

	// Inserir um usuario no banco -> CREATE
	public boolean inserirUsuario(Usuario usuario) {
		boolean resultado = false;
		try {
			Connection conexao = Conexao.novaConexao();
			String SQL = "INSERT INTO tbUsuario(nome, email, senha, tipo) VALUES(?, ?, ?, ?)";
			PreparedStatement pst = conexao.prepareStatement(SQL);
			pst.setString(1, usuario.getNome());
			pst.setString(2, usuario.getEmail());
			pst.setString(3, usuario.getSenha());
			pst.setString(4, usuario.getTipo());
			pst.executeUpdate();
			resultado = true;
			conexao.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
		return resultado;
	}

	// Consultar Usuario Cadastrado -> READ
	public Usuario consultarLivro(String cod) {
		Usuario usuario = new Usuario();
		String SQL = "SELECT * FROM tbUsuario WHERE id = ?";
		try {
			Connection conexao = Conexao.novaConexao();
			PreparedStatement pst = conexao.prepareStatement(SQL);
			pst.setString(1, cod);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				// Setar as váriaveis do objeto contato
				usuario.setId(rs.getString("id"));
				usuario.setNome(rs.getString("nome"));
				usuario.setEmail(rs.getString("email"));
				usuario.setSenha(rs.getString("senha"));
				usuario.setTipo(rs.getString("tipo"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return usuario;
	}

	/*
	 * Alterar Livro Cadastrado -> UPDATE public int alterarLivro(int idLivro,
	 * String status) { int quantidade = 0; try { Connection conexao =
	 * Conexao.novaConexao(); String SQL =
	 * String.format("UPDATE tbLivro SET status = '%s' WHERE id = %d;", status,
	 * idLivro); PreparedStatement pst = conexao.prepareStatement(SQL);
	 * pst.executeUpdate(SQL); quantidade = pst.getUpdateCount(); conexao.close(); }
	 * catch (Exception e) { System.out.println(e); } return quantidade; }
	 * 
	 * // Excluir Livro Cadastrado -> DELETE public int excluirLivro(int cod) { int
	 * quantidade = 0; try { Connection conexao = Conexao.novaConexao(); String SQL
	 * = String.format("DELETE FROM tbLivro WHERE id = %d;", cod); PreparedStatement
	 * pst = conexao.prepareStatement(SQL); pst.executeUpdate(); quantidade =
	 * pst.getUpdateCount(); conexao.close(); } catch (Exception e) {
	 * System.out.println(e); } return quantidade; }
	 */
}
