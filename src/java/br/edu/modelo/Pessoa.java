package br.edu.modelo;
import java.util.Calendar;
import java.util.Date;
public class Pessoa {
     private Long   id;
     private String nome;
     private String email;
     private String cpf;
     private Date  dataNascimento;
     private String rg;
     private String telefone;
     private String formacao;

  // métodos get e set para id, nome, email, telefone e dataNascimento

  public Long getId() {
        return id;
  }

  public String getRg() {
        return rg;
  }

  public String getFormacao() {
        return formacao;
  }

  public void setId(Long id) {
        this.id = id;
  }
  public String getNome() {
    return this.nome;
  }
  public void setNome(String novo) {
    this.nome = novo;
  }

  public String getEmail() {
    return this.email;
  }
  public void setEmail(String novo) {
    this.email = novo;
  }

  public String getCpf() {
    return this.cpf;
  }
  public void setCpf(String novo) {
    this.cpf = novo;
  }

  public String getTelefone() {
    return this.telefone;
  }
  public void setTelefone(String novo) {
    this.telefone = novo;
  }

  public void setRg(String rg) {
        this.rg = rg;
  }

  public void setFormacao(String formacao) {
        this.formacao = formacao;
  }

  public Date getDataNascimento() {
    return this.dataNascimento;
  }
  public void setDataNascimento(Date dataNascimento) {
    this.dataNascimento = dataNascimento;
  }
}