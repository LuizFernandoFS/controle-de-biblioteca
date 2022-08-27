function validarForm() {
	let nome = frmLivro.nome.value	
	let dataCriacao = frmLivro.dataCriacao.value
	let autor = frmLivro.autor.value
	if(nome === "") {
		alert("Preencha O Campo Nome!")
		frmLivro.nome.focus()
		return false
	} else if(dataCriacao === "") {
		alert("Preencha O Campo Data!")
		frmLivro.dataCriacao.focus()
		return false
	} else if(autor === "") {
		alert("Preencha O Campo Autor!")
		frmLivro.autor.focus()
		return false
	}else {
		document.forms["frmLivro"].submit()
	}
 }
