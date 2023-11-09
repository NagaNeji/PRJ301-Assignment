/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Course;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class CourseDBContext extends DBContext<Course> {

    @Override
    public Course getById(String Id) {
        try {
            String sql = "SELECT [course_id]\n"
                    + "      ,[course_name]\n"
                    + "  FROM [Course]\n"
                    + "WHERE [course_id] =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, Id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Course c = new Course();
                c.setCourseId(rs.getString("course_id"));
                c.setCourseName(rs.getString("course_name"));
                return c;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
