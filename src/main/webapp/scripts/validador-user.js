function validarForm() {
	let nome = frmUser.nome.value	
	let email = frmUser.email.value
	let senha = frmUser.senha.value
	if(nome === "") {
		alert("Preencha O Campo Nome!")
		frmUser.nome.focus()
		return false
	} else if(email === "") {
		alert("Preencha O Campo E-mail!")
		frmUser.email.focus()
		return false
	} else if(senha === "") {
		alert("Preencha O Campo Senha!")
		frmUser.senha.focus()
		return false
	} else {
		document.forms["frmUser"].submit()
	}
 }

