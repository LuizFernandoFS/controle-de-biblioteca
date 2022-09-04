<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Novo Usuário</title>
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

	<div class="container">
		<form name="frmUser" action="inserir-usuario">		
			<label class="label">Nome</label>
			<input class="input is-primary is-small is-rounded" type="text" name="nome" placeholder="Nome" class="" required maxlength="80">
			<label class="label">E-mail</label>
			<input class="input is-primary is-small is-rounded" type="email" name="email" placeholder="E-mail" required>
			<label class="label">Senha</label>
			<input class="input is-primary is-small is-rounded" type="password" name="senha" placeholder="Senha" required maxlength="80">
			<br>
			
			<a href="inserir-user.jsp">
				<br>
				<button class="button is-primary is-normal" onclick="validarForm()"><i class="fa-solid fa-user"></i>Adicionar</button>
			</a>
			
			<a href="listagem" class="button is-danger is-normal">
				<i class="fa-solid fa-ban"></i>Cancelar
			</a>
		</form>
	</div>

<script type="text/javascript" src="scripts/validador-user.js"></script>
</body>
</html>