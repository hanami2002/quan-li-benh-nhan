/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Hanami
 */
public class UserDAO extends DBContextMySQL {
    
    PreparedStatement ps = null;
    ResultSet rs = null;
    public User getUserByUserName(String username){
        String sql="select*from user where username=?";
        try {
            ps= connection.prepareStatement(sql);
            ps.setString(1, username);
            rs=ps.executeQuery();
            while(rs.next()){
                return new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getDate(4));
            }
            
        } catch (Exception e) {
        }
        return null;
    }
}
class te{
    public static void main(String[] args) {
        UserDAO udao= new UserDAO();
        System.out.println(udao.getUserByUserName("user1"));
    }
}
