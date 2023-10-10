/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

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
public class StudentDBContext extends DBContext<Student> {

    @Override
    public ArrayList<Student> list() {
        ArrayList<Student> listOfStudents = new ArrayList<>();
        try {

            String sql = "SELECT [student_id]\n"
                    + "      ,[student_name]\n"
                    + "      ,[student_gender]\n"
                    + "      ,[student_dob]\n"
                    + "      ,[student_email]\n"
                    + "  FROM [Student]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                s.setId(rs.getString("student_id"));
                s.setName(rs.getString("student_name"));
                s.setGender(rs.getBoolean("student_gender"));
                s.setDob(rs.getDate("student_dob"));
                s.setEmail(rs.getString("student_email"));
                listOfStudents.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listOfStudents;
    }

    @Override
    public void insert(Student entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Student entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Student entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Student get(Student s) {
        try {
            String sql = "SELECT [student_id]\n"
                    + "      ,[student_name]\n"
                    + "      ,[student_gender]\n"
                    + "      ,[student_dob]\n"
                    + "      ,[student_email]\n"
                    + "  FROM [Student]"
                    + "  WHERE [student_id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, s.getId());
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                s.setId(rs.getString("student_id"));
                s.setName(rs.getString("student_name"));
                s.setGender(rs.getBoolean("student_gender"));
                s.setDob(rs.getDate("student_dob"));
                s.setEmail(rs.getString("student_email"));
                return s;
            }

        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public Student getById(String Id) {

        try {
            String sql = "SELECT [student_id]\n"
                    + "      ,[student_name]\n"
                    + "      ,[student_gender]\n"
                    + "      ,[student_dob]\n"
                    + "      ,[student_email]\n"
                    + "  FROM [Student]"
                    + "  WHERE [student_id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, Id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Student s = new Student();
                s.setId(rs.getString("student_id"));
                s.setName(rs.getString("student_name"));
                s.setGender(rs.getBoolean("student_gender"));
                s.setDob(rs.getDate("student_dob"));
                s.setEmail(rs.getString("student_email"));
                return s;
            }

        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
