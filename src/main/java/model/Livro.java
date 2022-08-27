package model;

import java.sql.Date;

public class Livro {
	private String id;
	private String nome;
	private Date dataCriacao;
	private Autor autor;
	private LivroStatus status;
	
	public Livro() {}
	
	public Livro(String id, String nome, Date dataCriacao, Autor autor, LivroStatus status) {
		this.id = id;
		this.nome = nome;
		this.dataCriacao = dataCriacao;
		this.autor = autor;
		this.status = status;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Date getDataCriacao() {
		return dataCriacao;
	}

	public void setDataCriacao(Date dataCriacao) {
		this.dataCriacao = dataCriacao;
	}

	public Autor getAutor() {
		return autor;
	}

	public void setAutor(Autor autor) {
		this.autor = autor;
	}

	public LivroStatus getStatus() {
		return status;
	}

	public void setStatus(LivroStatus status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Livro [id=" + id + ", nome=" + nome + ", dataCriacao=" + dataCriacao + ", autor=" + autor + ", status="
				+ status + "]";
	}
}
