package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.Autor;
import model.Livro;
import model.LivroStatus;

public class DaoLivro {

	private String driver = "com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://127.0.0.1:3306/dbBiblioteca?useTimezone=true&serverTimezone=UTC";
	private String user = "root";
	private String password = "54168275";

	private Connection conectar() {
		Connection con = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			return con;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	// Listar os livros cadastrados -> READ
	public ArrayList<Livro> listarLivros() {
		ArrayList<Livro> livros = new ArrayList<>();
		String SQL = "SELECT tl.id, tl.nome, tl.dataCriacao, tl.status, ta.id, ta.nome as nomeAutor"
				+ " FROM tbLivro AS tl " + " INNER JOIN tbAutor AS ta ON tl.autor = ta.id";

		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(SQL);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				// Definindo o status conforme as descrições do ENUM
				LivroStatus status;
				if (rs.getString("status").equals("DISPONIVEL")) {
					status = LivroStatus.DISPONIVEL;
				} else if (rs.getString("status").equals("INDISPONIVEL")) {
					status = LivroStatus.INDISPONIVEL;
				} else {
					status = LivroStatus.EMPRESTADO;
				}

				// Populando o objeto Livro
				String idLivro = rs.getString("id");
				String nomeLivro = rs.getString("nome");
				Date dataCriacao = rs.getDate("dataCriacao");
				LivroStatus statusLivro = status;

				// Populando o objeto Autor
				String idAutor = rs.getString("id");
				String nomeAutor = rs.getString("nomeAutor");

				// Atribuindo valores com base nos construtores
				Autor autor = new Autor(idAutor, nomeAutor);
				Livro livro = new Livro(idLivro, nomeLivro, dataCriacao, autor, statusLivro);
				livros.add(livro);
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return livros;
	}

	//Inserir um livro no banco -> CREATE
	public boolean inserirLivro(Livro livro) {
		boolean resultado = false;
		try {
			Connection con = conectar();
			String sqlAutor = String.format("INSERT INTO tbAutor VALUES (null,'%s');", livro.getAutor().getNome());
			PreparedStatement pst = con.prepareStatement(sqlAutor, Statement.RETURN_GENERATED_KEYS);
			pst.executeUpdate();
			ResultSet rs = pst.getGeneratedKeys();

			int idAutor = 0;

			if (rs.next()) {
				idAutor = rs.getInt(1);
				String sqlLivro = String.format(
						"INSERT INTO tbLivro VALUES(null, '%s', '%s', %d, '%s')", 
						livro.getNome(), livro.getDataCriacao(), idAutor, livro.getStatus());
				PreparedStatement pstLivro = con.prepareStatement(sqlLivro, Statement.RETURN_GENERATED_KEYS);
				pstLivro.executeUpdate();
			}

			resultado = true;
		} catch (SQLException e) {
			System.out.println(e);
		}
		return resultado;
	}

	// Consultar Livro Cadastrado -> READ
	public Livro consultarLivro(int cod) {
		Livro livro = new Livro(); 
		try {
			Connection con = conectar();
			String SQL = String.format(
					"SELECT tl.id, tl.nome, tl.dataCriacao, tl.status, ta.id, ta.nome as nomeAutor FROM tbLivro AS tl " +
					"INNER JOIN tbAutor AS ta ON tl.autor = ta.id WHERE tl.id = %s", cod
			);
			PreparedStatement pst = con.prepareStatement(SQL);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				Autor autor = new Autor();
				LivroStatus status;
				livro.setId(rs.getString("id"));
				livro.setNome(rs.getString("nome"));
				livro.setDataCriacao(rs.getDate("dataCriacao"));
				if (rs.getString("status").equals("DISPONIVEL")) {
	            	status = LivroStatus.DISPONIVEL;
	            }else if (rs.getString("status").equals("INDISPONIVEL")) {
	            	status = LivroStatus.INDISPONIVEL;
	            }else {
	            	status = LivroStatus.EMPRESTADO;
	            }
				livro.setStatus(status);
				autor.setId(rs.getString("id"));
				autor.setNome(rs.getString("nomeAutor"));
				livro.setAutor(autor);
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return livro;
	}
	
	// Alterar Livro Cadastrado -> UPDATE
	public int alterarLivro(int idLivro, String status) {
		int quantidade = 0;
		try {
			Connection con = conectar();
			String SQL = String.format("UPDATE tbLivro SET status = '%s' WHERE id = %d;", status, idLivro);
			PreparedStatement pst = con.prepareStatement(SQL);
			pst.executeUpdate(SQL);
			quantidade = pst.getUpdateCount();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return quantidade;
	}

	// Excluir Livro Cadastrado -> DELETE
	public int excluirLivro(int cod) {
		int quantidade = 0;
		try {
			Connection con = conectar();
			String SQL = String.format("DELETE FROM tbLivro WHERE id = %d;", cod);
			PreparedStatement pst = con.prepareStatement(SQL);
			pst.executeUpdate();
			quantidade = pst.getUpdateCount();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return quantidade;
	}
	
}