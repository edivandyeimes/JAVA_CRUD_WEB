
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <script type="text/javascript" src="js/javascript_pg.js"></script>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script  type='text/javascript' src='js/bootstrap.min.js'></script>
        <style>

            #frm{
                padding-right: 60px;
                padding-left: 60px;
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
                <a class="navbar-brand">FORMULÁRIO</a>
                <a class="btn btn-dark" href="lista.jsp">Lista</a>
            </nav>  
            <div class="row justify-content-center">
                <form id="frm" name="frm" action="../Controller/inserePessoa.jsp" method="POST" onSubmit="return validar();">
                    <br><h3>Insira os dados:</h3>
                    <div class="form-group">
                        <label>Nome</label>
                        <input type="text" size="40" name="nome" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Email</label> 
                        <input type="text" size="40" name="email" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Confirmar Email</label> 
                        <input type="text" size="40" name="cemail" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Telefone</label> 
                        <input type="text" size="40" name="tel" class="form-control">
                    </div> 
                    <div class="form-group">
                        <label>RG (somente números)</label>
                        <input  type="text" size="40" name="rg" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>CPF (somente números)</label>
                        <input  type="text" size="40" name="cpf" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Data de Nascimento</label>
                        <input  type="date" size="40" name="dataNascimento" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Formação</label>
                        <br><select name="formacao" class="form-control">
                            <option value="nada">-------</option> 
                            <option value="em">Ensino Médio</option> 
                            <option value="tec">Técnico</option> 
                            <option value="sup">Superior</option> 
                        </select>
                    </div>  
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="bnato" name="bnato">
                        <label class="form-check-label" for="bnato-check">Afirmo que sou Brasileiro</label>
                    </div>
                    <div class="justify-content-center">
                        <p>
                            <br>
                            <button class="btn btn-success" type="submit" onclick="return validar()">Salvar</button>
                            <button class="btn btn-success" type="reset">Limpar dados</button>
                        </p>
                    </div>     
                </form>         
            </div>
        </div>
    </body>
    <% session.invalidate(); %>
</html>