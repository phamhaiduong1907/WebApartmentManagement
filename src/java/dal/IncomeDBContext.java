/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Rent;
import model.Room;
import model.Service;

/**
 *
 * @author Hai Duong
 */
public class IncomeDBContext extends DBContext{
    public ArrayList<Rent> getRents(){
        ArrayList<Rent> rents = new ArrayList<>();
        try {
            String sql_rent = " SELECT * FROM Rent ";
            PreparedStatement stm_rent = connection.prepareStatement(sql_rent);
            ResultSet rs = stm_rent.executeQuery();
            while (rs.next()) {                
                Rent rent = new Rent();
                rent.setId(rs.getInt("id"));
                rent.setName(rs.getString("name"));
                rent.setNote(rs.getString("note"));
                rent.setAmount(rs.getInt("amount"));
                Room room = new Room();
                room.setRid(rs.getInt("rid"));
                rent.setRoom(room);
                rents.add(rent);
            }
        } catch (SQLException ex) {
            Logger.getLogger(IncomeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rents;
    }
    
    public void insertRent(int rid, String name, int amount, String note){
        try {
            String sql = " insert into Rent values(?,?,?,?) ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, rid);
            stm.setString(2, name);
            stm.setInt(3, amount);
            stm.setString(4, note);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(IncomeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void deleteRent(int id){
        try {
            String sql = " delete Rent where id = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(IncomeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ArrayList<Service> getServices() {
        ArrayList<Service> services = new ArrayList<>();
        try {
            String sql = " SELECT * FROM [Service] ";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                Service service = new Service();
                service.setId(rs.getInt("id"));
                service.setName(rs.getString("name"));
                service.setServiceprice(rs.getInt("serviceprice"));
                service.setElecno(rs.getInt("elecno"));
                service.setElecunit(rs.getInt("elecunit"));
                service.setAmount(service.getElecno()*service.getElecunit()+service.getServiceprice());
                service.setNote(rs.getString("note"));
                Room room = new Room();
                room.setRid(rs.getInt("rid"));
                service.setRoom(room);
                services.add(service);
            }
        } catch (SQLException ex) {
            Logger.getLogger(IncomeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return services;
    }
    
    public void addService(int rid, String name, int serviceprice, int elecno, int elecunit, String note){
        try {
            String sql = " insert into [Service] values (?,?,?,?,?,?) ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, rid);
            stm.setString(2, name);
            stm.setInt(3, serviceprice);
            stm.setInt(4, elecno);
            stm.setInt(5, elecunit);
            stm.setString(6, note);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(IncomeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void deleteService(int id){
        try {
            String sql = " delete Service where id = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(IncomeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void noteService(int id, String note){
        try {
            String sql = " update Service set note = ? where id = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(2, id);
            stm.setString(1, note);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(IncomeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
