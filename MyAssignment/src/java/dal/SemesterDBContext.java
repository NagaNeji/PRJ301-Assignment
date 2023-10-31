/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Semester;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class SemesterDBContext extends DBContext<Semester> {

    @Override
    public Semester getById(String semesterId) {
        try {
            String sql = "SELECT [semester_id]\n"
                    + "      ,[semester_name]\n"
                    + "  FROM [Semester]\n"
                    + "  WHERE [semester_id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, semesterId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Semester s = new Semester();
                s.setSemesterId(rs.getInt("semester_id"));
                s.setSemesterName(rs.getString("semester_name"));
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(SemesterDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
}
