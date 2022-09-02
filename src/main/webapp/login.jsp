<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Acesso a Biblioteca</title>
<link href="style/style.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/5c46874868.js"></script>
</head>
<body>

	<div class="content is-normal">
		<h1 class="level-item">Acesso a Biblioteca</h1>
	</div>

	<div class="level-item">
		<form class="form" action="login.jsp" method="post">
			<label>Usuário <i class="fa-solid fa-user"></i>
				<input class="input is-primary is-small" type="text" name="usuario" ><br>
			</label>
			<label>Senha <i class="fa-solid fa-key"></i>
				<input class="input is-primary is-small" type="password" name="senha"><br>
			</label>
			<br>
			<button class="button is-normal is-primary" type="submit" value="logar">
				<i class="fa-solid fa-right-to-bracket"></i>
				Login
			</button>
		</form>
	</div>

	<%
	String usuario = request.getParameter("usuario");
	String senha = request.getParameter("usuario");

	if (usuario != null && senha != null && !usuario.isEmpty() && !senha.isEmpty()) {
		session.setAttribute("usuario", usuario);
		response.sendRedirect("/biblioteca");
	}
	%>
</body>
</html>