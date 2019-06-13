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
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/ifnmg", "ifnmg", "1234ifnmg");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConnectionFactory.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    
    }
}