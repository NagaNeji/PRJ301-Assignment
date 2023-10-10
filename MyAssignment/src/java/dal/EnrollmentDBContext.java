/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Enrollment;
import entity.Student;
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
public class EnrollmentDBContext extends DBContext<Enrollment> {

    @Override
    public ArrayList<Enrollment> list() {
        CourseDBContext cDB = new CourseDBContext();
        StudentDBContext sDB = new StudentDBContext();
        ArrayList<Enrollment> listOfEnrollment = new ArrayList<>();
        try {

            String sql = "SELECT [enrollment_id]\n"
                    + "      ,[course_id]\n"
                    + "      ,[student_id]\n"
                    + "      ,[enrollment_semester_name]\n"
                    + "      ,[enrollment_semester_id]\n"
                    + "  FROM [Enrollment]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                try {
                    Enrollment e = new Enrollment();
                    e.setId(rs.getInt("enrollment_id"));
                    e.setCourse(cDB.getById(rs.getString("course_id")));
                    e.setStudent(sDB.getById(rs.getString("student_id")));
                    e.setSemesterName(rs.getString("enrollment_semester_name"));
                    e.setSemesterId(rs.getInt("enrollment_semester_id"));
                    listOfEnrollment.add(e);
                } catch (SQLException ex) {
                    Logger.getLogger(EnrollmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(EnrollmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listOfEnrollment;

    }

    @Override
    public void insert(Enrollment entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Enrollment entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Enrollment entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Enrollment get(Enrollment entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Enrollment getById(String Id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public ArrayList<String> getListSemesterNameByStudent(Student s) {

        ArrayList<String> listSemesterName = new ArrayList<>();
        try {
            String sql = "SELECT DISTINCT enrollment_semester_name FROM Enrollment WHERE student_id = ? ORDER BY enrollment_semester_name";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, s.getId());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                listSemesterName.add(rs.getString("enrollment_semester_name"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(EnrollmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listSemesterName;
    }
}
