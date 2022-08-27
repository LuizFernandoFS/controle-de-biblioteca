package controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoLivro;
import model.Autor;
import model.Livro;
import model.LivroStatus;

@WebServlet(urlPatterns = {"/livro", "/listagem", "/inserir", "/excluir"})
public class LivroController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	DaoLivro daoLivro = new DaoLivro();
	Livro livro = new Livro();
	
	public LivroController() {}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();
		System.out.println(action);
		if(action.equals("/listagem")) {
			listarLivros(request, response);
		} else if(action.equals("/inserir")) {
			novoLivro(request, response);
		} else if(action.equals("/excluir")) {
			excluirLivro(request, response);
		}
	}
	
	protected void listarLivros(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Livro> livros = daoLivro.listarLivros();
		request.setAttribute("livros", livros);
		RequestDispatcher rd = request.getRequestDispatcher("listarLivros.jsp");
		rd.forward(request, response);
	}
	
	protected void novoLivro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		livro.setId(null);
		livro.setNome(request.getParameter("nome"));
		Date data = Date.valueOf(request.getParameter("dataCriacao"));
		livro.setDataCriacao(data);
		livro.setAutor(new Autor(null, request.getParameter("autor")));
		livro.setStatus(LivroStatus.DISPONIVEL);
		daoLivro.inserirLivro(livro);
		response.sendRedirect("listagem");
	}

	protected void excluirLivro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		Integer idLivro = Integer.parseInt(id);
		System.out.println(id);
		livro.setId(id);
		daoLivro.excluirLivro(idLivro);
		response.sendRedirect("listagem");
	}
		
}