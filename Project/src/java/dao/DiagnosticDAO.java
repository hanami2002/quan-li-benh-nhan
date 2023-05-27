/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Diagnostic;
import entity.Paitnet;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hanami
 */
public class DiagnosticDAO extends DBContextMySQL {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Diagnostic> getListDiagnostic() {
        String sql = "SELECT * FROM prj_qg.diagnostic;";
        try {
            List<Diagnostic> list = new ArrayList<>();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Diagnostic(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getBoolean(6), rs.getString(7), rs.getDate(8)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public Diagnostic getDiagnosticByPid(int pid) {
        String sql = "SELECT * FROM prj_qg.diagnostic where pid=?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, pid);
            rs = ps.executeQuery();
            while(rs.next()){
                return new Diagnostic(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getBoolean(6), rs.getString(7), rs.getDate(8));
            }
        } catch (Exception e) {
        }
        return null;
    }
    public void addDiagnostic(int pid,String symptom,String diagnosis,String medicines,boolean ward_required,String createBy ){
        String sql="INSERT INTO `prj_qg`.`diagnostic` (`pid`,`symptom`,`diagnosis`,`medicines`,`ward_required`,`createBy`) VALUES(?,?,?,?,?);";
        try {
            ps=connection.prepareStatement(sql);
            ps.setInt(1, pid);
            ps.setString(2, symptom);
            ps.setString(3, diagnosis);
            ps.setString(4, medicines);
            ps.setBoolean(5, ward_required);
            ps.setString(6, createBy);
            ps.executeUpdate();            
        } catch (Exception e) {
        }
    }
    public void deleteDiagnostic(int did){
        String sql="DELETE FROM `prj_qg`.`diagnostic` WHERE did=?;";
         try {
            ps=connection.prepareStatement(sql);
            ps.setInt(1, did);            
            ps.executeUpdate();            
        } catch (Exception e) {
        }
    }
}
