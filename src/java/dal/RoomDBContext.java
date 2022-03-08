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
import model.Room;

/**
 *
 * @author Hai Duong
 */
public class RoomDBContext extends DBContext {

    public ArrayList<Room> getRooms() {
        ArrayList<Room> rooms = new ArrayList<>();
        String sql = " select r.rid, r.rtype, rp.price from Room r inner join Room_Price rp on r.rtype = rp.rtype ";
        PreparedStatement stm;
        PreparedStatement stm_select_customer;
        try {
            connection.setAutoCommit(false);
            stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Room room = new Room();
                room.setRid(rs.getInt("rid"));
                room.setRtype(rs.getInt("rtype"));
                room.setPrice(rs.getInt("price"));
                String sql_select_customer = "select cus.* from \n"
                        + "[Contract] c inner join Customer cus\n"
                        + "on c.cid = cus.cid where c.rid = ?";
                stm_select_customer = connection.prepareStatement(sql_select_customer);
                stm_select_customer.setInt(1, rs.getInt("rid"));
                ResultSet rsCusts = stm_select_customer.executeQuery();
                ArrayList<Customer> custs = new ArrayList<>();
                while (rsCusts.next()) {
                    Customer customer = new Customer();
                    customer.setCname(rsCusts.getString("cname"));
                    customer.setCid(rsCusts.getString("cid"));
                    customer.setDob(rsCusts.getDate("dob"));
                    customer.setGender(rsCusts.getBoolean("gender"));
                    customer.setPhone(rsCusts.getString("phone"));
                    customer.setAddress(rsCusts.getString("address"));
                    custs.add(customer);
                }
                room.setCustomers(custs);
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
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(RoomDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return rooms;
    }
}
