<%@page import="model.LivroStatus"%>
<%@page import="model.Livro"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
Livro livro = new Livro();
LivroStatus status;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Biblioteca</title>
<link href="style/style.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/5c46874868.js"></script>
</head>
<body>
	<div class="container">
			<form name="frmLivro" action="editar">
			<label class="label">Código</label>
			<input class="input is-primary is-small is-rounded" type="text" name="id" readonly value="<%out.print(request.getAttribute("id"));%>">
			<label class="label">Nome</label>
			<input class="input is-primary is-small is-rounded" type="text" name="nome" readonly value="<%out.print(request.getAttribute("nome"));%>">	
			<label class="label">Data de Criação</label>
			<input class="input is-primary is-small is-rounded" type="date" name="dataCriacao" readonly value="<%out.print(request.getAttribute("dataCriacao"));%>">
			<label class="label">Autor</label>
			<input class="input is-primary is-small is-rounded" type="text" name="nomeAutor" readonly value="<%out.print(request.getAttribute("nomeAutor"));%>">
			<label class="label">Status</label>
			<div class="select is-primary is-rounded is-small">
			<select name="status">
				<%if(request.getAttribute("status").equals(LivroStatus.DISPONIVEL)) {%> 
				<option value="DISPONIVEL" selected>Disponível</option>
				<option value="EMPRESTADO" >Emprestado</option>
				<option value="INDISPONIVEL">Indisponível</option>
				<%} else if(request.getAttribute("status").equals(LivroStatus.EMPRESTADO)) {%> 
				<option value="DISPONIVEL">Disponível</option>
				<option value="EMPRESTADO" selected>Emprestado</option>
				<option value="INDISPONIVEL">Indisponível</option>
				<%} else { %> 
				<option value="DISPONIVEL" >Disponível</option>
				<option value="EMPRESTADO" >Emprestado</option>
				<option value="INDISPONIVEL" selected>Indisponível</option>
				<%}%>
			</select>
			</div>
		
			<br>
			<a href="editar">
				<br>
				<button class="button is-primary is-normal"><i class="fa-solid fa-book"></i>Salvar</button>
			</a>
			
			<a href="listagem" class="button is-danger is-normal">
				<i class="fa-solid fa-ban"></i>Cancelar
			</a>
		</form>
	</div>
	<script type="text/javascript" src="scripts/validador.js"></script>
</body>
</html>