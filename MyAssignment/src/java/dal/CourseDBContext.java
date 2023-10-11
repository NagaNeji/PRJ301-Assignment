/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Course;
import entity.Enrollment;
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
public class CourseDBContext extends DBContext<Course> {

    @Override
    public ArrayList<Course> list() {
        ArrayList<Course> listOfCourse = new ArrayList<>();
        try {

            String sql = "SELECT [course_id]\n"
                    + "      ,[course_name]\n"
                    + "  FROM [Course]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Course c = new Course();
                c.setId(rs.getString("course_id"));
                c.setName(rs.getString("course_name"));
                listOfCourse.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listOfCourse;
    }

    @Override
    public void insert(Course entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Course entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Course entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Course get(Course c) {
        try {

            String sql = "SELECT [course_id]\n"
                    + "      ,[course_name]\n"
                    + "  FROM [Course]\n"
                    + "WHERE course_id =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, c.getId());
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                c.setId(rs.getString("course_id"));
                c.setName(rs.getString("course_name"));
                return c;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public Course getById(String Id) {
        try {

            String sql = "SELECT [course_id]\n"
                    + "      ,[course_name]\n"
                    + "  FROM [Course]\n"
                    + "WHERE course_id =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, Id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Course c = new Course();
                c.setId(rs.getString("course_id"));
                c.setName(rs.getString("course_name"));
                return c;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Course> getListEnrollmentBySemesterName(String semesterName) {

        CourseDBContext cDB = new CourseDBContext();
        StudentDBContext sDB = new StudentDBContext();
        ArrayList<Course> listOfEnrollment = new ArrayList<>();
        try {

            String sql = "SELECT c.course_id, c.course_name\n"
                    + "FROM Course c\n"
                    + "INNER JOIN Enrollment e ON c.course_id = e.course_id\n"
                    + "WHERE e.enrollment_semester_name = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, semesterName);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Course c = new Course();
                c.setId(rs.getString("course_id"));
                c.setName(rs.getString("course_name"));
                listOfEnrollment.add(c);

            }
            return listOfEnrollment;
        } catch (SQLException ex) {
            Logger.getLogger(EnrollmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
