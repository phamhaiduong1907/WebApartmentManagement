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
import model.Contract;
import model.Customer;
import model.Room;

/**
 *
 * @author Hai Duong
 */
public class RoomDBContext extends DBContext {

    public ArrayList<Room> getRooms() {
        ArrayList<Room> rooms = new ArrayList<>();
        String sql = " select r.rid, r.[type], rp.price, rp.deposit \n"
                + "from Room r inner join Room_Price rp \n"
                + "on r.[type] = rp.[type] ";
        PreparedStatement stm;
        PreparedStatement stm_select_contract;
        PreparedStatement stm_select_customer;
        try {
            connection.setAutoCommit(false);
            stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Room room = new Room();
                room.setRid(rs.getInt("rid"));
                room.setType(rs.getInt("type"));
                room.setPrice(rs.getInt("price"));
                room.setDeposit(rs.getInt("deposit"));
                String sql_select_contract = " select startdate, enddate from [Contract] where rid = ? ";
                stm_select_contract = connection.prepareStatement(sql_select_contract);
                stm_select_contract.setInt(1, rs.getInt("rid"));
                ResultSet rs_Contract = stm_select_contract.executeQuery();
                Contract contract = new Contract();
                if (rs_Contract.next()) {
                    contract.setRoom(room);
                    contract.setStartdate(rs_Contract.getDate("startdate"));
                    contract.setEnddate(rs_Contract.getDate("enddate"));
                    ArrayList<Customer> custs = new ArrayList<>();
                    String sql_select_cust = " select cus.* from [Contract] c inner join \n"
                            + " Customer cus on c.rid = cus.rid where c.rid = ? ";
                    stm_select_customer = connection.prepareStatement(sql_select_cust);
                    stm_select_customer.setInt(1, rs.getInt("rid"));
                    ResultSet rs_Cust = stm_select_customer.executeQuery();
                    while (rs_Cust.next()) {
                        Customer customer = new Customer();
                        customer.setId(rs_Cust.getString("id"));
                        customer.setName(rs_Cust.getString("name"));
                        customer.setDob(rs_Cust.getDate("dob"));
                        customer.setGender(rs_Cust.getBoolean("gender"));
                        customer.setPhone(rs_Cust.getString("phone"));
                        customer.setAddress(rs_Cust.getString("address"));
                        customer.setContract(contract);
                        custs.add(customer);
                    }
                    contract.setCustomers(custs);
                }
                room.setContract(contract);
                rooms.add(room);
            }
            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(RoomDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(RoomDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return rooms;
    }

    public Room getRoomByID(int rid) {
        String sql = " select r.rid, r.[type], rp.price, rp.deposit from Room r \n"
                + "inner join Room_Price rp on r.[type] = rp.[type] where rid = ? ";
        PreparedStatement stm;
        PreparedStatement stm_select_contract;
        PreparedStatement stm_select_customer;
        try {
            connection.setAutoCommit(false);
            stm = connection.prepareStatement(sql);
            stm.setInt(1, rid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Room room = new Room();
                room.setRid(rs.getInt("rid"));
                room.setType(rs.getInt("type"));
                room.setPrice(rs.getInt("price"));
                room.setDeposit(rs.getInt("deposit"));
                String sql_select_contract = " select startdate, enddate from [Contract] where rid = ? ";
                stm_select_contract = connection.prepareStatement(sql_select_contract);
                stm_select_contract.setInt(1, rid);
                ResultSet rs_Contract = stm_select_contract.executeQuery();
                Contract contract = new Contract();
                if (rs_Contract.next()) {
                    contract.setRoom(room);
                    contract.setStartdate(rs_Contract.getDate("startdate"));
                    contract.setEnddate(rs_Contract.getDate("enddate"));
                    ArrayList<Customer> custs = new ArrayList<>();
                    String sql_select_cust = " select cus.* from [Contract] c inner join \n"
                            + " Customer cus on c.rid = cus.rid where c.rid = ? ";
                    stm_select_customer = connection.prepareStatement(sql_select_cust);
                    stm_select_customer.setInt(1, rid);
                    ResultSet rs_Cust = stm_select_customer.executeQuery();
                    while (rs_Cust.next()) {
                        Customer customer = new Customer();
                        customer.setId(rs_Cust.getString("id"));
                        customer.setName(rs_Cust.getString("name"));
                        customer.setDob(rs_Cust.getDate("dob"));
                        customer.setGender(rs_Cust.getBoolean("gender"));
                        customer.setPhone(rs_Cust.getString("phone"));
                        customer.setAddress(rs_Cust.getString("address"));
                        customer.setContract(contract);
                        custs.add(customer);
                    }
                    contract.setCustomers(custs);
                }
                room.setContract(contract);
                return room;
            }
            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(RoomDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(RoomDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

    // get room based on status
    public ArrayList<Room> getRoomByStatus(boolean status) {
        ArrayList<Room> rooms = new ArrayList<>();
        String sql = "";
        if(status){
            sql = " select r.rid, r.[type], rp.price, rp.deposit from Room r \n"
                + "inner join Room_Price rp on r.[type] = rp.[type] where\n"
                + "r.rid in (select rid from Customer group by rid) order by r.[type], r.rid ";
        } else {
            sql = " select r.rid, r.[type], rp.price, rp.deposit from Room r \n"
                + "inner join Room_Price rp on r.[type] = rp.[type] where\n"
                + "r.rid not in (select rid from Customer group by rid) order by r.[type], r.rid ";
        }
        PreparedStatement stm;
        PreparedStatement stm_select_contract;
        PreparedStatement stm_select_customer;
        try {
            connection.setAutoCommit(false);
            stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Room room = new Room();
                room.setRid(rs.getInt("rid"));
                room.setType(rs.getInt("type"));
                room.setPrice(rs.getInt("price"));
                room.setDeposit(rs.getInt("deposit"));
                String sql_select_contract = " select startdate, enddate from [Contract] where rid = ? ";
                stm_select_contract = connection.prepareStatement(sql_select_contract);
                stm_select_contract.setInt(1, rs.getInt("rid"));
                ResultSet rs_Contract = stm_select_contract.executeQuery();
                Contract contract = new Contract();
                if (rs_Contract.next()) {
                    contract.setRoom(room);
                    contract.setStartdate(rs_Contract.getDate("startdate"));
                    contract.setEnddate(rs_Contract.getDate("enddate"));
                    ArrayList<Customer> custs = new ArrayList<>();
                    String sql_select_cust = " select cus.* from [Contract] c inner join \n"
                            + " Customer cus on c.rid = cus.rid where c.rid = ? ";
                    stm_select_customer = connection.prepareStatement(sql_select_cust);
                    stm_select_customer.setInt(1, rs.getInt("rid"));
                    ResultSet rs_Cust = stm_select_customer.executeQuery();
                    while (rs_Cust.next()) {
                        Customer customer = new Customer();
                        customer.setId(rs_Cust.getString("id"));
                        customer.setName(rs_Cust.getString("name"));
                        customer.setDob(rs_Cust.getDate("dob"));
                        customer.setGender(rs_Cust.getBoolean("gender"));
                        customer.setPhone(rs_Cust.getString("phone"));
                        customer.setAddress(rs_Cust.getString("address"));
                        customer.setContract(contract);
                        custs.add(customer);
                    }
                    contract.setCustomers(custs);
                }
                room.setContract(contract);
                rooms.add(room);
            }
            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(RoomDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(RoomDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return rooms;
    }

    // add room
    public void insertRoom(int rid, int type) {
        String sql = " insert into Room values (?,?) ";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, rid);
            stm.setInt(2, type);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if(stm != null){
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(RoomDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if(connection != null){
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(RoomDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    //delete room
    public void deleteRoom(int rid) {
        String sql = " delete Room where rid = ? ";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, rid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if(stm != null){
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(RoomDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if(connection != null){
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(RoomDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    //update room
    public void updateRoom() {

    }
}
