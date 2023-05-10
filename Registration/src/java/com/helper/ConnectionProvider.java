package com.helper;

import java.sql.*;

public class ConnectionProvider {
    private static Connection con;

    public static Connection getConnection(){
        
        
        try {
            if(con == null){
                Class.forName("com.mysql.cj.jdbc.Driver");
                
                String url = "jdbc:mysql://localhost:3306/registration";
                String user = "root";
                String password = "amanrai@123";
                con = DriverManager.getConnection(url, user, password);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return con;
    }
}
