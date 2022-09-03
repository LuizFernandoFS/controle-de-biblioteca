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

import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import dao.DaoLivro;
import dao.DaoUsuario;
import model.Autor;
import model.Livro;
import model.LivroStatus;
import model.Usuario;

@WebServlet(urlPatterns = {"", "/listagem", "/inserir", "/inserir-usuario","/excluir", "/select", "/editar", "/relatorio"})
public class LivroController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	DaoLivro daoLivro = new DaoLivro();
	Livro livro = new Livro();
	
	public LivroController() {}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();
		System.out.println(action);
		if(action.equals("/listagem") || action.equals("")) {
			listarLivros(request, response);
		} else if(action.equals("/inserir")) {
			novoLivro(request, response);
		} else if(action.equals("/select")) {
			listarLivro(request, response);
		} else if(action.equals("/editar")) {
			editarLivro(request, response);
		} else if(action.equals("/excluir")) {
			excluirLivro(request, response);
		} else if(action.equals("/inserir-usuario")) {
			novoUsuario(request, response);
		} else if(action.equals("/relatorio")) {
			gerarRelatorioPdf(request, response);
		}
	}
	
	protected void listarLivros(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Livro> livros = daoLivro.listarLivros();
		String usuario = (String) request.getSession().getAttribute("usuario");
		if(usuario == null) {
			response.sendRedirect("login.jsp");
		} else {
			request.setAttribute("livros", livros);
			RequestDispatcher rd = request.getRequestDispatcher("listarLivros.jsp");
			rd.forward(request, response);
		}
		
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
		livro.setId(id);
		daoLivro.excluirLivro(idLivro);
		response.sendRedirect("listagem");
	}
	
	protected void listarLivro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		livro.setId(id);
		livro = daoLivro.consultarLivro(Integer.parseInt(id));
		 
		//Setar os atributos do form no objeto
		request.setAttribute("id", livro.getId());
		request.setAttribute("nome", livro.getNome());
		request.setAttribute("dataCriacao", livro.getDataCriacao());
		request.setAttribute("nomeAutor", livro.getAutor().getNome());
		request.setAttribute("status", livro.getStatus());
		// Encaminhar ao documento editar.jsp
		RequestDispatcher rd = request.getRequestDispatcher("editar.jsp");
		rd.forward(request, response);
	}

	protected void editarLivro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String status = request.getParameter("status");
		daoLivro.alterarLivro(Integer.parseInt(id), status);
		response.sendRedirect("listagem");
	}
	
	protected void novoUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		String tipo = "usuario";
		Usuario usuario = new Usuario("null", nome, email, senha, tipo);
		DaoUsuario DAO = new DaoUsuario();
		DAO.inserirUsuario(usuario);
		response.sendRedirect("listagem");
	}
	
	protected void gerarRelatorioPdf(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Document documento = new Document();
		DaoLivro DAO = new DaoLivro();
		try {
			//Tipo de conteúdo
			response.setContentType("application/pdf");
			//Nome do documento
			response.addHeader("Content-Disposition", "inline; filename=" + "livros.pdf");
			//Criar o documento
			PdfWriter.getInstance(documento, response.getOutputStream());
			//Abrir o documento -> conteúdo
			documento.open();
			documento.add(new Paragraph("Livros Cadastrados:"));
			documento.add(new Paragraph(" "));
			PdfPTable tabela = new PdfPTable(3);
			PdfPCell col1 = new PdfPCell(new Paragraph("Nome"));
			PdfPCell col2 = new PdfPCell(new Paragraph("Autor"));
			PdfPCell col3 = new PdfPCell(new Paragraph("Status"));
			tabela.addCell(col1);
			tabela.addCell(col2);
			tabela.addCell(col3);
			ArrayList<Livro> lista = DAO.listarLivros();
			for(Livro livro : lista) {
				tabela.addCell(livro.getNome());
				tabela.addCell(livro.getAutor().getNome());
				tabela.addCell(livro.getStatus().toString());
			}
			documento.add(tabela);
			documento.close();
		} catch (Exception e) {
			System.out.println(e);
			documento.close();
		}
	}
	
}