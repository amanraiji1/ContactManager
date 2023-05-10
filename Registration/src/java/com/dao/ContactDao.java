package com.dao;
import com.entities.Contact;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class ContactDao {
    private Connection con;

    public ContactDao(Connection con) {
        this.con = con;
    }
    
    public boolean saveContact(Contact contact){
        boolean f = false;
        
        try {
            String query = "insert into contacts(cName,cPhone,cEmail,userId) values(?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            
            pstmt.setString(1, contact.getcName());
            pstmt.setString(2, contact.getcPhone());
            pstmt.setString(3, contact.getcEmail());
            pstmt.setInt(4, contact.getUserId());
            
            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    public List<Contact> getContactByUserId(int userId){
        List<Contact> list= new ArrayList<>();
        
        try {
            String query = "select * from contacts where userId = ? order by cName";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();
            
            while(rs.next()){
                String cName = rs.getString("cName");
                String cPhone = rs.getString("cPhone");
                String cEmail = rs.getString("cEmail");
                int cUserId = rs.getInt("userId");
                
                Contact c = new Contact(cName, cPhone, cEmail, cUserId);
                list.add(c);
                
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
    public boolean updateContactByPhoneAndName(Contact c,int userId, String oldPhone){
        boolean f = false;
        
        try {
            String query = "update contacts set cName=? , cPhone=?, cEmail=? where userId=? and cPhone=?";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, c.getcName());
            pstmt.setString(2, c.getcPhone());
            pstmt.setString(3, c.getcEmail());
            pstmt.setInt(4, userId);
            pstmt.setString(5, oldPhone);
            pstmt.executeUpdate();
            f=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    public boolean deleteContact(int userId,String phone){
        boolean f = false;
        
        try {
            String query = "delete from contacts where userId=? and cPhone=?";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setInt(1,userId);
            pstmt.setString(2, phone);
            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    public List<Contact> getContactByCName(String contactName,int userId){
        List<Contact> list= new ArrayList<>();
        
        try {
            String query = "select * from contacts where cName like '%"+ contactName +"%' and userId="+ userId +";";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            
            while(rs.next()){
                String cName = rs.getString("cName");
                String cPhone = rs.getString("cPhone");
                String cEmail = rs.getString("cEmail");
                int cUserId = rs.getInt("userId");
                
                Contact c = new Contact(cName, cPhone, cEmail, cUserId);
                list.add(c);
                
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return list;
    }
}
