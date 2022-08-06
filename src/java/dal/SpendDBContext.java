/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Spend;

/**
 *
 * @author Hai Duong
 */
public class SpendDBContext extends DBContext{
    public ArrayList<Spend> getSpends(){
        ArrayList<Spend> spends = new ArrayList<>();
        try {
            String sql = " select * from Spend ";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                Spend spend = new Spend();
                spend.setId(rs.getInt("id"));
                spend.setName(rs.getString("name"));
                spend.setAmount(rs.getInt("amount"));
                spend.setSpenddate(rs.getDate("spenddate"));
                spend.setNote(rs.getString("note"));
                spends.add(spend);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SpendDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return spends;
    }
    
    public ArrayList<Spend> getSpendsInterval(Date from, Date to){
        ArrayList<Spend> spends = new ArrayList<>();
        try {
            String sql = " select * from Spend where spenddate >= ? and spenddate <= ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDate(1, from);
            stm.setDate(2, to);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                Spend spend = new Spend();
                spend.setId(rs.getInt("id"));
                spend.setName(rs.getString("name"));
                spend.setAmount(rs.getInt("amount"));
                spend.setSpenddate(rs.getDate("spenddate"));
                spend.setNote(rs.getString("note"));
                spends.add(spend);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SpendDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return spends;
    }
    
    public void insertSpend(String name, int amount, String note){
        try {
            String sql = " insert into Spend values (?, GETDATE(), ?, ?) ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            stm.setInt(2, amount);
            stm.setString(3, note);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SpendDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void noteSpend(String note, int id){
        try {
            String sql = " update Spend set note = ? where id = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, note);
            stm.setInt(2, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SpendDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void deleteSpend(int id){
        try {
            String sql = " delete Spend where id = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SpendDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
