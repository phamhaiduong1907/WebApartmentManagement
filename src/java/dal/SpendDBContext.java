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
}
