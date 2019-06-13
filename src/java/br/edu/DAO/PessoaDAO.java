/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.DAO;

import br.edu.modelo.Pessoa;
import java.sql.*;
import java.util.*;

public class PessoaDAO {

    Connection connection;

    public PessoaDAO() {
        this.connection = new ConnectionFactory().getConnection();
    }
    
    // metodo para inserir os dados no BD
    public void adiciona(Pessoa contato) {
        String sql = "insert	into	contatos	"
                + "(nome,email,cpf,rg,tel,dataNascimento,formacao)"
                + "	values	(?,?,?,?,?,?,?)";
        try {	//	prepared	statement	para	inserção
            PreparedStatement stmt = connection.prepareStatement(sql);
            //	seta	os	valores	
            stmt.setString(1, contato.getNome());
            stmt.setString(2, contato.getEmail());
            stmt.setString(3, contato.getCpf());
            stmt.setString(4, contato.getRg());
            stmt.setString(5, contato.getTelefone());
            stmt.setDate(6, new java.sql.Date(contato.getDataNascimento().getTime()));
            stmt.setString(7, contato.getFormacao());
            //	executa	
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    // metodo para alterar os dados no BD
    public void altera(Pessoa contato) {
        String sql = "update	contatos	set	nome=?,	email=?,"
                + "cpf=?,   rg=?,   tel=?,  dataNascimento=?,  formacao=?  where	id=?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, contato.getNome());
            stmt.setString(2, contato.getEmail());
            stmt.setString(3, contato.getCpf());
            stmt.setString(4, contato.getRg());
            stmt.setString(5, contato.getTelefone());
            stmt.setDate(6, new java.sql.Date(contato.getDataNascimento().getTime()));
            stmt.setString(7, contato.getFormacao());
            stmt.setLong(8, contato.getId());
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    // metodo para deletar os dados no BD
    public void remove(Long id) {
        try {
            PreparedStatement stmt = connection.prepareStatement("delete	from	contatos	where	id=?");
            stmt.setLong(1, id);
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // metodo que retorna uma lista de pessoas cadastradas no BD
    public List<Pessoa> getLista() {
        try {
            List<Pessoa> contatos = new ArrayList<>();
            PreparedStatement stmt = this.connection.
                    prepareStatement("select * from contatos order by nome");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

              
                    // criando o objeto Contato
                    Pessoa contato = new Pessoa();
                    contato.setId(rs.getLong("id"));
                    contato.setNome(rs.getString("nome"));
                    contato.setEmail(rs.getString("email"));
                    contato.setCpf(rs.getString("cpf"));
                    contato.setFormacao(rs.getString("formacao"));
                    contato.setRg(rs.getString("rg"));
                    contato.setTelefone(rs.getString("tel"));

                    // montando a data através do Calendar
                    Calendar data = Calendar.getInstance();
                    data.setTime(rs.getDate("dataNascimento"));
                    contato.setDataNascimento(data.getTime());

                    // adicionando o objeto à lista
                    contatos.add(contato);
                
            }
            rs.close();
            stmt.close();
            return contatos;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // metodo que verifica se um cpf ja esta registrado no BD
    public Pessoa isRegistro(String cpf) throws SQLException {

        try {
            Pessoa contato = new Pessoa();
            PreparedStatement stmt = this.connection.
                    prepareStatement("select * from contatos where cpf = ?");
            stmt.setString(1, cpf);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                contato.setId(rs.getLong("id"));
                contato.setNome(rs.getString("nome"));
                contato.setEmail(rs.getString("email"));
                contato.setCpf(rs.getString("cpf"));
                contato.setFormacao(rs.getString("formacao"));
                contato.setRg(rs.getString("rg"));
                contato.setTelefone(rs.getString("tel"));

                // montando a data através do Calendar
                Calendar data = Calendar.getInstance();
                data.setTime(rs.getDate("dataNascimento"));
                contato.setDataNascimento(data.getTime());

            }
            rs.close();
            stmt.close();
            return contato;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
