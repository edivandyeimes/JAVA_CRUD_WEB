<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,
         br.edu.DAO.*,
         br.edu.modelo.*" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script  type='text/javascript' src='js/bootstrap.min.js'></script>
        <title>
            Registros
        </title>
    </head>    
    <body>

        <div class="main">

            <%
                String mensagem = (String) session.getAttribute("mensagem");
                String msg = (String) session.getAttribute("msg");
                if (mensagem != null) {

            %>
            <div class="alert alert-<%=msg%>">
                <%=mensagem%>
            </div>
            <%
                }
            %>
            <%

            %>
            <nav class="navbar navbar-dark bg-success justify-content-between">
                <a class="navbar-brand">LISTA DE REGISTROS</a>
                <a class="btn btn-dark" href="index.jsp">Novo</a>
            </nav>   
            <div class="row justify-content-around">
                <div class="container-fluid">
                    <table class="table">
                        <thead class="alert-success">
                            <tr>
                                <th>Nome</th>
                                <th>Email</th>
                                <th>CPF</th>
                                <th>RG</th>
                                <th>Telefone</th>
                                <th>Data de Nascimento</th>
                                <th>Formação</th>
                                <th>Ação</th>
                            </tr> 
                        </thead>
                        <% 
                           
                            PessoaDAO dao = new PessoaDAO();
                            List<Pessoa> pessoas = dao.getLista();

                            for (Pessoa pessoa : pessoas) {
                        %>
                        <tr>
                            <td><%=pessoa.getNome()%></td> 
                            <td><%=pessoa.getEmail()%></td>
                            <td><%=pessoa.getCpf()%></td>
                            <td><%=pessoa.getRg()%></td>
                            <td><%=pessoa.getTelefone()%></td>
                            <% SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
                                String dataFormatada = formato.format(pessoa.getDataNascimento());
                                String formacao = pessoa.getFormacao();
                                if (formacao.equals("em")) {
                                    formacao = "Ensino Médio";
                                } else if (formacao.equals("tec")) {
                                    formacao = "Técnico";
                                } else if (formacao.equals("sup")) {
                                    formacao = "Superior";
                                }
                            %>

                            <td><%=dataFormatada%></td>
                            <td><%=formacao%></td>
                            <td>
                                <a  href="../Controller/acoesPessoa.jsp?editar=<%=pessoa.getCpf()%>"
                                    class='btn btn-info'>Alterar</a>
                                <a href="../Controller/acoesPessoa.jsp?deletar=<%=pessoa.getId()%>"
                                   class='btn btn-danger'>Deletar</a>   
                            </td>

                        </tr>
                        <%
                            }
                        %>
                    </table>
                </div>
            </div>
    </body>
    <% session.invalidate();%>
</html>