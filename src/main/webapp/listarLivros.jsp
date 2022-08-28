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
	<div class="content is-medium">
		<h1>Biblioteca <i class="fa-solid fa-book-open"></i></h1>
		<a href="inserir.jsp">
			<button class="button is-normal is-primary"><i class="fa-solid fa-book"></i>Novo Livro</button>
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
					<td><%=livro.getStatus()%></td>
					<td>
						<a href="select?id=<%=livro.getId()%>">
							<button class="button is-small is-info"><i class="fa-solid fa-pen-to-square"></i>Editar</button>
						</a> 
						<a href="javascript: confirmar(<%=livro.getId()%>)">
							<button class="button is-small is-danger"><i class="fa-solid fa-trash"></i>Excluir</button>
						</a>
					</td>
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