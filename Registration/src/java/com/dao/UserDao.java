package com.dao;
import com.entities.User;
import java.sql.*;

public class UserDao {
    Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    public boolean saveUser(User user){
        boolean f = false;
        
        try {
            String query = "insert into user(name,email,password) values(?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            
            pstmt.executeUpdate();
            f=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    public User getUserByEmailandPassword(String email,String password){
        User user = null;
        
        try {
            String query = "select * from user where email=? and password=?";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            
            pstmt.setString(1,email);
            pstmt.setString(2,password);
            
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return user;
    }
    
    
}
