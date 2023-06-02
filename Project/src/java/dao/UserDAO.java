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
    // lấy ra user theo username
    public User getUserByUserName(String username){
        String sql="select*from user where username=?";
        try {
            //tạo kết nối
            ps= connection.prepareStatement(sql);
            //gán username vào ? đầu tiên
            ps.setString(1, username);
            //thực thi câu lệnh
            rs=ps.executeQuery();
            //lấy ra kết quả
            while(rs.next()){
                return new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getDate(4),rs.getInt(5));
            }
            
        } catch (Exception e) {
        }
        return null;
    }
    public void addUserPaitnet(String username,String display){
        String sql="INSERT INTO `prj_qg`.`user`(`username`,`password`,`displayname`,`role`)VALUES(?,'123456',?,0);";
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

