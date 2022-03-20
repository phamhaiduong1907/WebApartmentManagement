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
import model.History;
import model.Room;

/**
 *
 * @author Hai Duong
 */
public class HistoryDBContext extends DBContext {

    public ArrayList<History> getHistories() {
        ArrayList<History> histories = new ArrayList<>();
        try {
            String sql = " SELECT * FROM History ";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                History history = new History();
                history.setId(rs.getInt("id"));
                history.setName(rs.getString("name"));
                history.setReceiveddate(rs.getDate("receiveddate"));
                history.setAmount(rs.getInt("amount"));
                Room room = new Room();
                room.setRid(rs.getInt("rid"));
                history.setRoom(room);
                histories.add(history);
            }
        } catch (SQLException ex) {
            Logger.getLogger(HistoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return histories;
    }

    public void insertHistory(int rid, String name, int amount) {
        try {
            String sql = " insert into History values (?,?, GETDATE() ,?) ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, rid);
            stm.setString(2, name);
            stm.setInt(3, amount);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(HistoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteHistory(int id) {
        try {
            String sql = " delete History where id = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(HistoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<History> getHistoriesInterval(Date from, Date to) {
        try {
            String sql = " select * from History where receiveddate >= ? \n"
                    + "and receiveddate <= ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
        } catch (SQLException ex) {
            Logger.getLogger(HistoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
