/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


        
function validar(){
    
    
    
  if(document.frm.nome.value == "" || document.frm.nome.value == null) {
        
        alert("Por favor, indique o seu nome.");
    
        document.frm.nome.focus();
       
        return false;
    }
   
    if(document.frm.email.value.indexOf("@") == -1 || document.frm.email.value.indexOf(".") == -1 || document.frm.email.value == "" || document.frm.email.value == null) {
        alert("Por favor, indique um e-mail válido.");
        document.frm.email.focus();
        return false;
    }
    
    if(document.frm.cpf.value == "" || document.frm.cpf.value == null) {
        alert("Por favor, indique um cpf.");
        document.frm.cpf.focus();
        return false;
    }
    if(document.frm.tel.value == "" || document.frm.tel.value == null) {
        alert("Por favor, indique um telefone para contato.");
        document.frm.tel.focus();
        return false;
    }
    if(document.frm.rg.value == "" || document.frm.rg.value == null) {
        alert("Por favor, indique um RG.");
        document.frm.rg.focus();
        return false;
    }
    if(document.frm.email.value != document.frm.cemail.value){
        alert("Email de confirmação diferente. Escreva o email correto.");
        document.frm.cemail.focus();
        return false;  
    }
    if(document.frm.formacao.value == "nada"){
        alert("Por favor, selecione uma formação.");
        document.frm.formacao.focus();
        return false;  
        
    }
    if(document.frm.bnato.checked == false){
        
        
    }
    
    
   
}

