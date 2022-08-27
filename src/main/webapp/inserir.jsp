<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Novo Livro</title>
<link href="style/style.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/5c46874868.js"></script>
</head>
<body>
	<div class="container">
		<form name="frmLivro" action="inserir">		
			<label class="label">Livro</label>
			<input class="input is-primary is-small is-rounded" type="text" name="nome" placeholder="Nome" class="" required maxlength="80">
			<label class="label">Data de Criação</label>
			<input class="input is-primary is-small is-rounded" type="date" name="dataCriacao" placeholder="Data" required>
			<label class="label">Autor</label>
			<input class="input is-primary is-small is-rounded" type="text" name="autor" placeholder="Autor" required maxlength="80">
			<br>
			
			<a href="inserir.jsp">
				<br>
				<button class="button is-primary is-normal" onclick="validarForm()"><i class="fa-solid fa-book"></i>Adicionar</button>
			</a>
			
			<a href="listagem" class="button is-danger is-normal">
				<i class="fa-solid fa-ban"></i>Cancelar
			</a>
		</form>
	</div>

<script type="text/javascript" src="scripts/validador.js"></script>
</body>
</html>