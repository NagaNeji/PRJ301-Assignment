/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.MajorCourse;
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
public class MajorCourseDBContext extends DBContext<MajorCourse> {

    @Override
    public MajorCourse getById(String majorCourseId) {
        MajorDBContext majorDB = new MajorDBContext();
        CourseDBContext courseDB = new CourseDBContext();
        try {
            String sql = "SELECT [major_course_id]\n"
                    + "      ,[major_id]\n"
                    + "      ,[course_id]\n"
                    + "      ,[semester_number]\n"
                    + "  FROM [Major_Course]\n"
                    + "  WHERE [major_course_id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, majorCourseId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                MajorCourse mc = new MajorCourse();
                mc.setMajorCourseId(rs.getInt("major_course_id"));
                mc.setMajor(majorDB.getById(rs.getString("major_id")));
                mc.setCourse(courseDB.getById(rs.getString("course_id")));
                mc.setSemesterNumber(rs.getInt("semester_number"));
                return mc;
            }
        } catch (SQLException ex) {
            Logger.getLogger(MajorCourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<MajorCourse> getListMajorCourseByMajorId(String MajorId) {
        ArrayList<MajorCourse> listMajorCourse = new ArrayList<>();
        try {
            String sql = "SELECT [major_course_id]\n"
                    + "  FROM [Major_Course]\n"
                    + "  WHERE [major_id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, MajorId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                MajorCourse mc = getById(rs.getString("major_course_id"));
                listMajorCourse.add(mc);
            }
            return listMajorCourse;
        } catch (SQLException ex) {
            Logger.getLogger(MajorCourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
