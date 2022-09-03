<%@page import="model.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Livro"%>
<%@ page import="model.Autor"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.Date"%>
<%
ArrayList<Livro> livros = (ArrayList<Livro>) request.getAttribute("livros");
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Biblioteca</title>
<link href="style/style.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/5c46874868.js"></script>
</head>
<body>
	
	    <% String usuario = (String) request.getSession().getAttribute("usuario");
		if(usuario != null) { %>
			<p class="level"><strong> Bem vindo! <%= usuario %> </strong>
			<a class = "level" href="logout.jsp">
				<button class="button is-small is-danger is-rounded"><i class="fa-solid fa-right-from-bracket"></i>Sair</button>
			</a>
			</p>
		<%} else { 
			response.sendRedirect("login.jsp");	
		}%>
		
	<div class="content is-medium">
		<h1>
			Biblioteca <i class="fa-solid fa-book-open"></i>
		</h1>

		<a href="inserir.jsp">
			<button class="button is-normal is-primary">
				<i class="fa-solid fa-book"></i>Novo Livro
			</button>
		</a> 
		
		<% if(usuario.equals("admin")) { %>
				<a href="inserir-usuario.jsp">
					<button class="button is-normal is-primary">
						<i class="fa-solid fa-user"></i>Novo Usuário
					</button>
				</a>
			<%}%>
		
		<a href="relatorio" target="blank">
			<button class="button is-normal is-primary">
				<i class="fa-solid fa-file-pdf"></i>Relatório PDF
			</button>
		</a> 

	</div>

	<div class="content has-text-centered is-capitalized">
		<table class="table is-bordered is-narrow is-hoverable" id="tabela">
			<thead>
				<tr>
					<th>Id</th>
					<th>Nome</th>
					<th>Data De Criação</th>
					<th>Autor</th>
					<th>Status</th>
					<th>Opções</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Livro livro : livros) {
				%>
				<tr class="is-center">
					<td><%=livro.getId()%></td>
					<td><%=livro.getNome()%></td>
					<td><%=livro.getDataCriacao()%></td>
					<td><%=livro.getAutor().getNome()%></td>
					<td id="status"><%=livro.getStatus()%></td>
					<td><a href="select?id=<%=livro.getId()%>">
							<button class="button is-small is-info">
								<i class="fa-solid fa-pen-to-square"></i>Alterar Status
							</button>
					</a> <a href="javascript: confirmar(<%=livro.getId()%>)">
							<button class="button is-small is-danger">
								<i class="fa-solid fa-trash"></i>Excluir
							</button>
					</a></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		<script type="text/javascript" src="scripts/confirmador.js"></script>
	</div>
</body>
</html>