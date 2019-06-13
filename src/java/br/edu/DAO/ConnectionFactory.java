package br.edu.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConnectionFactory {
    public Connection getConnection() {
        try {
            //drive do mysql
            Class.forName("com.mysql.jdbc.Driver");
            
            //retorna a conexao com o BD
	    //localhost  = ip
	    //port = porta de conexao
	    //base = nome da base de dados
	    //user = usuario e pass = senha cadastrados	
            return DriverManager.getConnection("jdbc:mysql://localhost:port/base", "user", "pass");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConnectionFactory.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    
    }
}