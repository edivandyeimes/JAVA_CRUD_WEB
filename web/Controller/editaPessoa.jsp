<%@page import="br.edu.DAO.PessoaDAO"%>
<%@page import="br.edu.DAO.ValidaCPF"%>
<%@page import="br.edu.modelo.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">             
        <title>JSP Edita</title>
    </head>
    <body>        
        <%  Long id = Long.parseLong(request.getParameter("id"));
            String nome = request.getParameter("nome");
            String cpf = request.getParameter("cpf");
            String email = request.getParameter("email");
            String dataEmTexto = request.getParameter("dataNascimento");
            String ccampo = request.getParameter("bnato");
            
            String mensagem = "Alteração não realizada!";
            String formacao = request.getParameter("formacao");
            String rg = request.getParameter("rg");
            String telefone = request.getParameter("tel");
            Calendar dataNascimento = null;
            String msg = "danger";

            //	fazendo	a	conversão	da	data
            Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dataEmTexto);

            dataNascimento = Calendar.getInstance();
            dataNascimento.setTime(date);

            PessoaDAO dao = new PessoaDAO();
            Pessoa pessoa = new Pessoa();
            pessoa = dao.isRegistro(cpf);
            
            // verifica se o cpf é valido
            // se ja existe o cpf cadastrado no BD para outro cadastro de ID diferente
            

            if (!ValidaCPF.isCPF(cpf)) {

                mensagem = mensagem + " CPF inválido.";

            }
            else if(pessoa.getId()!= id && pessoa.getCpf()==cpf){
                
                mensagem = mensagem + " CPF informado está cadastrado para outro usuário.";
             
            }else {

                //	monta	um	objeto	pessoa
                pessoa.setId(id);
                pessoa.setNome(nome);
                pessoa.setCpf(cpf);
                pessoa.setEmail(email);
                pessoa.setFormacao(formacao);
                pessoa.setRg(rg);
                pessoa.setTelefone(telefone);
                pessoa.setDataNascimento(dataNascimento.getTime());

                //	salva	o	pessoa	
                
                dao.altera(pessoa);

                mensagem = "Alteração realizada com sucesso!";
                msg = "info";

            }
                
                
                session.setAttribute("mensagem", mensagem);
                session.setAttribute("msg", msg);
                response.sendRedirect("../View/lista.jsp");

        %>
    </body>
</html>
