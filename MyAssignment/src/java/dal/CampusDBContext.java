/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Campus;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class CampusDBContext extends DBContext<Campus> {

    @Override
    public Campus getById(String campusId) {
        try {
            String sql = "SELECT [campus_id]\n"
                    + "      ,[campus_name]\n"
                    + "  FROM [Campus]\n"
                    + "  WHERE [campus_id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, campusId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Campus c = new Campus();
                c.setCampusId(rs.getString("campus_id"));
                c.setCampusName(rs.getString("campus_name"));
                return c;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CampusDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Campus> getList() {
        ArrayList<Campus> list = new ArrayList<>();
        try {
            String sql = "SELECT [campus_id]\n"
                    + "      ,[campus_name]\n"
                    + "  FROM [Campus]\n";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Campus c = new Campus();
                c.setCampusId(rs.getString("campus_id"));
                c.setCampusName(rs.getString("campus_name"));
                list.add(c);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(CampusDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

}
