/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Grade;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class GradeDBContext extends DBContext<Grade> {

    @Override
    public Grade getById(String gradeId) {
        try {
            String sql = "SELECT [grade_id]\n"
                    + "      ,[grade_name]\n"
                    + "  FROM [Grade]\n"
                    + "  WHERE [grade_id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, gradeId);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                Grade g = new Grade();
                g.setGradeId(rs.getString("grade_id"));
                g.setGradeName(rs.getString("grade_name"));
                return g;
            }
        } catch (SQLException ex) {
            Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
