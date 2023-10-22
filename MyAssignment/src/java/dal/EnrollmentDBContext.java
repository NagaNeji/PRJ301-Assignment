/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Enrollment;
import entity.Semester;
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
    public Enrollment getById(String enrollmentId) {
        StudentDBContext studentDB = new StudentDBContext();
        SemesterDBContext semesterDB = new SemesterDBContext();
        CourseDBContext courseDB = new CourseDBContext();
        GroupDBContext groupDB = new GroupDBContext();
        try {
            String sql = "SELECT [enrollment_id]\n"
                    + "      ,[student_id]\n"
                    + "      ,[semester_id]\n"
                    + "      ,[course_id]\n"
                    + "      ,[enrollment_start_date]\n"
                    + "      ,[enrollment_end_date]\n"
                    + "      ,[group_id]\n"
                    + "  FROM [Enrollment]\n"
                    + "  WHERE [enrollment_id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, enrollmentId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Enrollment e = new Enrollment();
                e.setEnrollmentId(rs.getString("enrollment_id"));
                e.setStudent(studentDB.getById(rs.getString("student_id")));
                e.setSemester(semesterDB.getById(rs.getString("semester_id")));
                e.setCourse(courseDB.getById(rs.getString("course_id")));
                e.setEnrollmentStartDate(rs.getDate("enrollment_start_date"));
                e.setEnrollmentEndDate(rs.getDate("enrollment_end_date"));
                e.setGroup(groupDB.getById(rs.getString("group_id")));
                return e;
            }
        } catch (SQLException ex) {
            Logger.getLogger(MajorDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public ArrayList<Semester> getListSemesterByStudentId(String studentId) {
        SemesterDBContext semesterDB = new SemesterDBContext();
        ArrayList<Semester> listSemester = new ArrayList<>();
        try {
            String sql = "SELECT DISTINCT [student_id], [semester_id]\n"
                    + "FROM [Enrollment]\n"
                    + "WHERE [student_id] = ?\n"
                    + "ORDER BY [semester_id];";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, studentId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                listSemester.add(semesterDB.getById(rs.getString("semester_id")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(EnrollmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listSemester;
    }

    public ArrayList<Enrollment> getListEnrollmentBySemesterName(String semesterName) {
        EnrollmentDBContext enrollmentDB = new EnrollmentDBContext();
        SemesterDBContext semesterDB = new SemesterDBContext();
        ArrayList<Enrollment> listEnrollment = new ArrayList<>();
        try {
            String sql = "SELECT s.semester_name, e.enrollment_id\n"
                    + "FROM [Enrollment] e\n"
                    + "INNER JOIN [Semester] s ON s.semester_id = e.semester_id\n"
                    + "WHERE [semester_name] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, semesterName);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Enrollment e = new Enrollment();
                e = enrollmentDB.getById(rs.getString("enrollment_id"));
                listEnrollment.add(e);
            }
            return listEnrollment;
        } catch (SQLException ex) {
            Logger.getLogger(EnrollmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listEnrollment;
    }

}
