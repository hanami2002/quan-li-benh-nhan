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
                return new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getDate(4),rs.getInt(5));
            }
            
        } catch (Exception e) {
        }
        return null;
    }
    public void addUserPaitnet(String username,String display){
        String sql="INSERT INTO `prj_qg`.`user`(`username`,`password`,`displayname`,`role`)VALUES(?,'123456',?,1);";
        try {
            ps=connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, display);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public void add(String username,String pass,String display){
        String sql="INSERT INTO `prj_qg`.`user`(`username`,`password`,`displayname`,role)VALUES(?,?,?,1);";
        try {
            ps=connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, pass);
            ps.setString(3, display);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        
    }
    public  void updatePass(String pass,String username) {
        String sql="UPDATE `prj_qg`.`user` SET`password` =? WHERE `username` = ?;";       
       try {
            ps=connection.prepareStatement(sql);
            ps.setString(1, pass);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
class te{
    public static void main(String[] args) {
        UserDAO udao= new UserDAO();
        System.out.println(udao.getUserByUserName("user1"));
    }
}
