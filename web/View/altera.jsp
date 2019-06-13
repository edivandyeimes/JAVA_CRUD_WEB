<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
    <head>

        <script type="text/javascript" src="js/javascript_pg.js"></script>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script  type='text/javascript' src='js/bootstrap.min.js'></script>
        <style>

            #frm{
                padding: 60px;
                background: white;

            }

        </style>
        <title>
            Formulário
        </title>
    </head>
    <body>   
        <div class="main alert-success">

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
                <a class="navbar-brand">ALTERAR</a>
                <a class="btn btn-dark" href="lista.jsp">Cancelar</a>
            </nav>  
            <div class="row justify-content-center">
                <form id="frm" name="frm" action="../Controller/editaPessoa.jsp" method="POST" onSubmit="return validar();">
                    <h2>Dados Pessoais</h2>
                    <input type="hidden" name="id" value="<%=(String) session.getAttribute("id")%>">
                    <div class="form-group">
                        <br>
                        <label>Nome</label>
                        <input type="text" size="40" name="nome" class="form-control" value="<%=(String) session.getAttribute("nome")%>">
                    </div>
                    <div class="form-group">
                        <label>Email</label> 
                        <input type="text" size="40" name="email" class="form-control" value="<%=(String) session.getAttribute("email")%>">
                    </div>
                    <div class="form-group">
                        <label>Confirmar Email</label> 
                        <input type="text" size="40" name="cemail" class="form-control" value="<%=(String) session.getAttribute("email")%>">
                    </div>
                    <div class="form-group">
                        <label>Telefone</label> 
                        <input type="text" size="40" name="tel" class="form-control" value="<%=(String) session.getAttribute("tel")%>">
                    </div> 
                    <div class="form-group">
                        <label>RG (somente números)</label>
                        <input  type="text" size="40" name="rg" class="form-control" value="<%=(String) session.getAttribute("rg")%>">
                    </div>
                    <div class="form-group">
                        <label>CPF (somente números)</label>
                        <input  type="text" size="40" name="cpf" class="form-control" value="<%=(String) session.getAttribute("cpf")%>">
                    </div>
                    <div class="form-group">
                        <label>Data de Nascimento</label>
                        <input  type="date" size="40" name="dataNascimento" class="form-control" value="<%=(String) session.getAttribute("dataNascimento")%>">
                    </div>
                    <div class="form-group">
                        <label>Formação</label>

                        <br><select name="formacao" class="form-control">
                            <%
                                String formacao = (String) session.getAttribute("formacao");
                                if (formacao.equals("em")) {
                            %>

                            <option value="em" SELECTED>Ensino Médio</option> 
                            <option value="tec">Técnico</option>
                            <option value="sup">Superior</option>

                            <% } else if (formacao.equals("tec")) { %>

                            <option value="em">Ensino Médio</option> 
                            <option value="tec" SELECTED>Técnico</option>
                            <option value="sup">Superior</option>

                            <% } else if (formacao.equals("sup")) { %>

                            <option value="em">Ensino Médio</option> 
                            <option value="tec">Técnico</option>
                            <option value="sup" SELECTED>Superior</option>
                            <% } %>
                        </select>
                    </div>  
                    <div class="justify-content-center">
                        <p>
                            <br>
                            <button class="btn btn-success" type="submit" onclick="return validar()">Editar</button>
                            <button class="btn btn-success" type="reset">Limpar dados</button>
                        </p>
                    </div>     
                </form>         
            </div>
        </div>
    </body>
    <% session.invalidate();%>
</html>