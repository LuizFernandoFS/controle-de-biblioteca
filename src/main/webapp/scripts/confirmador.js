function confirmar(id) {
	let resposta = confirm("Deseja realmente excluir este Livro?");
	if(resposta === true) {
		window.location.href = "excluir?id=" + id;
	} 
} 
