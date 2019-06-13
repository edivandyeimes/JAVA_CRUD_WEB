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
        <title>JSP Insere</title>
    </head>
    <body>        
        <%    
            // recebe os valores passados pelo formulario
            String nome = request.getParameter("nome");
            String cpf = request.getParameter("cpf");
            String email = request.getParameter("email");
            String dataEmTexto = request.getParameter("dataNascimento");
            String ccampo = request.getParameter("bnato");
            Boolean resposta = null;
            String mensagem = "Cadastro não realizado!";
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
            
            // verifica se o cpf é valido
            // se ja existe o cpf cadastrado no BD
            //ou se e brasileiro nato
            if (!ValidaCPF.isCPF(cpf)) {

                mensagem = mensagem + " CPF inválido.";

            }
            else if(dao.isRegistro(cpf)!=null){
                
                mensagem = mensagem + " CPF informado já existe no banco.";
             
            }
            else if (ccampo == null) {

                mensagem = mensagem +" É necessario ser brasileiro para se cadastrar.";

            }
            // caso os dados estejam em conformidade com as regras a cima
            // o cadastro e realizado
            else {

                //	monta	um	objeto	contato
                Pessoa pessoa = new Pessoa();
                pessoa.setNome(nome);
                pessoa.setCpf(cpf);
                pessoa.setEmail(email);
                pessoa.setFormacao(formacao);
                pessoa.setRg(rg);
                pessoa.setTelefone(telefone);
                pessoa.setDataNascimento(dataNascimento.getTime());

                //	salva	o	contato	
                
                dao.adiciona(pessoa);

                mensagem = "Cadastro realizado com sucesso!";
                msg = "info";

            }
                session.setAttribute("mensagem", mensagem);
                session.setAttribute("msg", msg);
                response.sendRedirect("../View/index.jsp");

        %>
    </body>
</html>
