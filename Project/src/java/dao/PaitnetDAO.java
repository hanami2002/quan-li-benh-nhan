/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Paitnet;
import entity.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hanami
 */
public class PaitnetDAO extends DBContextMySQL {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Paitnet> getListPaitnet() {
        String sql = "SELECT * FROM prj_qg.paitnet";
        try {
            List<Paitnet> list = new ArrayList<>();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Paitnet(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getString(5), rs.getString(6), rs.getDate(7)));
            }
            return list;

        } catch (Exception e) {
        }
        return null;
    }

    public Paitnet getPatientById(int patientId) {
        String sql = "SELECT * FROM Paitnet WHERE pid = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, patientId);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Paitnet(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getString(5), rs.getString(6), rs.getDate(7));
            }

        } catch (Exception e) {
        }

        return null; // Hoặc ném một exception nếu không tìm thấy bệnh nhân
    }
    public void addPaitnet(String name,String address,String dob,String contact,String createBy){
        String sql="INSERT INTO paitnet(name,address,dob,contact,createBy) VALUES(?,?,?,?,?);";
        try {
             ps = connection.prepareStatement(sql);
             ps.setString(1, name);
             ps.setString(2, address);
             ps.setString(3, dob);
             ps.setString(4, contact);
             ps.setString(5, createBy);
             ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public void deletePaitnet(int pid){
        String sql="DELETE FROM paitnet WHERE pid=?";
        try {
             ps = connection.prepareStatement(sql);
             ps.setInt(1, pid);
             ps.execute();
        } catch (Exception e) {
        }
    }
    public void updatePaitnet(String name,String address,String dob,String contact,String createBy,int pid){
        String sql="UPDATE paitnet SET `name` = ?,`address` =?,`dob` = ?,`contact` = ?,`createBy` = ? WHERE `pid` = ?;";
        try {
             ps = connection.prepareStatement(sql);
             ps.setString(1, name);
             ps.setString(2, address);
             ps.setString(3, dob);
             ps.setString(4, contact);
             ps.setString(5, createBy);
             ps.setInt(6, pid);
             ps.executeUpdate();
        } catch (Exception e) {
        }
    }

}
 class test{
     public static void main(String[] args) {
         PaitnetDAO pdao = new PaitnetDAO();
         pdao.addPaitnet("a", "Ha ", "2023-05-04", "0123 ", "user1");
         System.out.println(pdao.getListPaitnet());
     }
 }
