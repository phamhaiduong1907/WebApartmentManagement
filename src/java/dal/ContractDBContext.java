/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Hai Duong
 */
public class ContractDBContext extends DBContext{
    public void insertContract(int rid, Date startdate, Date enddate){
        String sql = " insert into Contract values (?,?,?) ";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, rid);
            stm.setDate(2, startdate);
            stm.setDate(3, enddate);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ContractDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if(stm != null){
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ContractDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if(connection != null){
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ContractDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
    
    public void updateContract(int rid, Date startdate, Date enddate){
        String sql = " update Contract set startdate = ? , enddate = ? where rid = ? ";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setDate(1, startdate);
            stm.setDate(2, enddate);
            stm.setInt(3, rid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ContractDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if(stm != null){
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ContractDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if(connection != null){
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ContractDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
    
    public void deleteContract(int rid){
        String sql = " delete Contract where rid = ? ";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, rid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ContractDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if(stm != null){
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ContractDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if(connection != null){
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ContractDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
}
