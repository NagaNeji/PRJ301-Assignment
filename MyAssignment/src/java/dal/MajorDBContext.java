/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Major;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class MajorDBContext extends DBContext<Major> {

    @Override
    public Major getById(String majorId) {

        try {
            String sql = "SELECT [major_id]\n"
                    + "      ,[major_name]\n"
                    + "  FROM [Major]\n"
                    + "  WHERE [major_id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, majorId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Major m = new Major();
                m.setMajorId(rs.getString("grade_id"));
                m.setMajorName(rs.getString("grade_name"));
                return m;
            }
        } catch (SQLException ex) {
            Logger.getLogger(MajorDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }
}
