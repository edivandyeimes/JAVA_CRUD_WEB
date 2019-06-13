

<%@page import="br.edu.DAO.PessoaDAO"%>
<%@page import="br.edu.modelo.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
    //se o parametro passado por editar nao for nulo o processo de edicao e iniciado
    if (request.getParameter("editar") != null) {
        //recebe o cpf passado por GET que vai servir como chave de identificacao
        String cpf = request.getParameter("editar");
        
        //cria o obj do tipo PessoaDAO para poder saber se existe alguem com o cpf passado
        PessoaDAO dao = new PessoaDAO();
        //a busca retorna a pessoa dona do cpf
        Pessoa pessoa = dao.isRegistro(cpf);
        
        //altera o formato da data de nascimento
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        String dataFormatada = formato.format(pessoa.getDataNascimento());
        
        //muda o ID de Long para String
        String id = String.valueOf(pessoa.getId());
        
        //passa os dados por sessao para o formulario de alteracao
        session.setAttribute("id", id);
        session.setAttribute("nome", pessoa.getNome());
        session.setAttribute("cpf", pessoa.getCpf());
        session.setAttribute("formacao", pessoa.getFormacao());
        session.setAttribute("email", pessoa.getEmail());
        session.setAttribute("rg", pessoa.getRg());
        session.setAttribute("tel", pessoa.getTelefone());
        session.setAttribute("dataNascimento", dataFormatada);

        response.sendRedirect("../View/altera.jsp");
      
        
    }
    //se o parametro passado por delatar nao for nulo o processo de exclusao e iniciado
    else if (request.getParameter("deletar") != null) {
        
        //o valor do 
        Long id = Long.parseLong(request.getParameter("deletar"));
        PessoaDAO dao = new PessoaDAO();
        dao.remove(id);

        session.setAttribute("mensagem", "Registro foi removido!");
        session.setAttribute("msg", "info");
        response.sendRedirect("../View/lista.jsp");
    }

%>