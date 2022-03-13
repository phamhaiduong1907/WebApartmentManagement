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
public class CustomerDBContext extends DBContext{
    public void insertCustomer(String id, String name, Date dob, boolean gender, String phone, String address, int rid){
        String sql = " insert into Customer values (?,?,?,?,?,?,?) ";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            stm.setString(2, name);
            stm.setDate(3, dob);
            stm.setBoolean(4, gender);
            stm.setString(5, phone);
            stm.setString(6, address);
            stm.setInt(7, rid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if(stm != null){
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if(connection != null){
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
    
    public void deleteCustomer(String id){
        String sql = " delete Customer where id = ? ";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if(stm != null){
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if(connection != null){
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
}
