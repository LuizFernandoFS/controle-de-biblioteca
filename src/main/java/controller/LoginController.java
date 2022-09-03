package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DaoUsuario;
import model.Usuario;

@WebServlet("/login")
public class LoginController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session;
		String nomeUsuario = request.getParameter("usuario");
		String senha = request.getParameter("senha");
		
		DaoUsuario DAO = new DaoUsuario();
		Usuario usuario = DAO.consultar(nomeUsuario, senha);
		
		if (usuario.getNome() != null) { 
			session = request.getSession(true);
			session.setAttribute("session", session);
			session.setAttribute("usuario", usuario.getNome());
			session.setAttribute("tipo", usuario.getTipo());
			response.sendRedirect("listagem");

		} else {
			session = request.getSession(false); 
			request.setAttribute("session", session);
			response.sendRedirect("login.jsp"); 
		} 
		
	}
}
