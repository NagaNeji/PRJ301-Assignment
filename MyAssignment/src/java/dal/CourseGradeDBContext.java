/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.CourseGrade;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class CourseGradeDBContext extends DBContext<CourseGrade> {

    @Override
    public CourseGrade getById(String courseGradeId) {
        CourseDBContext courseDB = new CourseDBContext();
        GradeDBContext gradeDB = new GradeDBContext();
        try {
            String sql = "SELECT [course_grade_id]\n"
                    + "      ,[course_id]\n"
                    + "      ,[grade_id]\n"
                    + "      ,[course_grade_weight]\n"
                    + "      ,[course_grade_group]\n"
                    + "  FROM [Course_Grade]\n"
                    + "  WHERE [course_grade_id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1,courseGradeId);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                CourseGrade cg = new CourseGrade();
                cg.setCourseGradeId(rs.getString("course_grade_id"));
                cg.setCourse(courseDB.getById(rs.getString("course_id")));
                cg.setGrade(gradeDB.getById(rs.getString("grade_id")));
                cg.setCourseGradeWeight(rs.getDouble("course_grade_weight"));
                cg.setCourseGradeGroup(rs.getString("course_grade_group"));
                return cg;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseGradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
