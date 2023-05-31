/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Hanami
 */
public class DBContextMySQL {
    protected Connection connection;

    public Connection getConnection() {
        return connection;
    }

    public DBContextMySQL()  {
        try {
            //NOTE: CHANGE VALUES OF user,pass,url TO FIT YOUR SYSTEM ENVIRONMENT
            //DO NOT CHANGE THE STRUCTURE OF THE CONSTRUCTOR
            String user = "root";
            String pass = "123456";
            String url = "jdbc:mysql://localhost:3306/prj_qg";
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBContextMySQL.class.getName()).log(Level.SEVERE, null, ex);
        }         
    }
}
