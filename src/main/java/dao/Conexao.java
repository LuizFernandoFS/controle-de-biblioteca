package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {

	public static Connection novaConexao() {
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://127.0.0.1:3306/dbBiblioteca?useTimezone=true&serverTimezone=UTC";
		String user = "root";
		String password = "54168275";
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
}
