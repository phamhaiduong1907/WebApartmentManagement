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
import model.Customer;
import model.Vehicle;

/**
 *
 * @author Hai Duong
 */
public class VehicleDBContext extends DBContext {

    public ArrayList<Vehicle> getVehicles() {
        ArrayList<Vehicle> vehicles = new ArrayList<>();
        try {
            String sql = " select v.vid, v.vtype, v.vnumber, c.*\n"
                    + "from Vehicle v inner join Customer c\n"
                    + "on v.id = c.id  ";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Vehicle vehicle = new Vehicle();
                vehicle.setVid(rs.getInt("vid"));
                vehicle.setVnumber(rs.getString("vnumber"));
                vehicle.setVtype(rs.getString("vtype"));
                Customer customer = new Customer();
                customer.setId(rs.getString("id"));
                customer.setName(rs.getString("name"));
                vehicle.setCustomer(customer);
                vehicles.add(vehicle);
            }
        } catch (SQLException ex) {
            Logger.getLogger(VehicleDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vehicles;
    }

    public ArrayList<Vehicle> getVehiclesByOwner(String name) {
        ArrayList<Vehicle> vehicles = new ArrayList<>();
        try {
            String sql = " select v.vid, v.vtype, v.vnumber, c.*\n"
                    + "from Vehicle v inner join Customer c\n"
                    + "on v.id = c.id ";
            if (!name.equals("")) {
                sql += "where c.name like ? ";
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            if (!name.equals("")) {
                stm.setString(1, "%" + name + "%");
            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Vehicle vehicle = new Vehicle();
                vehicle.setVid(rs.getInt("vid"));
                vehicle.setVnumber(rs.getString("vnumber"));
                vehicle.setVtype(rs.getString("vtype"));
                Customer customer = new Customer();
                customer.setId(rs.getString("id"));
                customer.setName(rs.getString("name"));
                vehicle.setCustomer(customer);
                vehicles.add(vehicle);
            }
        } catch (SQLException ex) {
            Logger.getLogger(VehicleDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vehicles;
    }

    public Vehicle getVehicleByVid(int vid) {
        try {
            String sql = " select v.*, c.name from Vehicle v inner join \n"
                    + "Customer c on v.id = c.id where v.vid = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, vid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Vehicle vehicle = new Vehicle();
                vehicle.setVid(rs.getInt("vid"));
                vehicle.setVnumber(rs.getString("vnumber"));
                vehicle.setVtype(rs.getString("vtype"));
                Customer customer = new Customer();
                customer.setId(rs.getString("id"));
                customer.setName(rs.getString("name"));
                vehicle.setCustomer(customer);
                return vehicle;
            }
        } catch (SQLException ex) {
            Logger.getLogger(VehicleDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    // add vehicle
    public void insertVehicle(int vid, String id, String vtype, String vnumber) {
        String sql = " insert into Vehicle values (?,?,?,?)";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, vid);
            stm.setString(2, id);
            stm.setString(3, vtype);
            if (vnumber.length() == 0 || vnumber == null) {
                stm.setString(4, null);
            } else {
                stm.setString(4, vnumber);
            }
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(VehicleDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(VehicleDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(VehicleDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    // update vehicle
    public void updateVehicle(int vid, String id, String vtype, String vnumber, int default_vid) {
        String sql = " update Vehicle set vid = ?, id = ?, vtype = ?, vnumber = ? where vid = ? ";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, vid);
            stm.setString(2, id);
            stm.setString(3, vtype);
            stm.setString(4, vnumber);
            stm.setInt(5, default_vid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(VehicleDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(VehicleDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(VehicleDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    //delete vehicle
    public void deleteVehicle(int id) {
        String sql = " delete Vehicle where vid = ? ";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(VehicleDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(VehicleDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(VehicleDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
}
