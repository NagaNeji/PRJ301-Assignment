/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Student;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class StudentDBContext extends DBContext<Student> {

    @Override
    public Student getById(String studentId) {
        MajorDBContext majorDB = new MajorDBContext();
        CampusDBContext campusDB = new CampusDBContext();

        try {
            String sql = "SELECT [student_id]\n"
                    + "      ,[student_name]\n"
                    + "      ,[student_gender]\n"
                    + "      ,[student_dob]\n"
                    + "      ,[student_email]\n"
                    + "      ,[major_id]\n"
                    + "      ,[campus_id]\n"
                    + "  FROM [Student]\n"
                    + "  WHERE [student_id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, studentId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Student s = new Student();
                s.setId(rs.getString("student_id"));
                s.setName(rs.getString("student_name"));
                s.setGender(rs.getBoolean("student_gender"));
                s.setDob(rs.getDate("student_dob"));
                s.setEmail(rs.getString("student_email"));
                s.setMajor(majorDB.getById(rs.getString("major_id")));
                s.setCampus(campusDB.getById(rs.getString("campus_id")));
                return s;
            }

        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
