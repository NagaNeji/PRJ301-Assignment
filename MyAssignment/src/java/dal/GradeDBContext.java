/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Course;
import entity.Grade;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class GradeDBContext extends DBContext<Grade> {

    @Override
    public ArrayList<Grade> list() {
        ArrayList<Grade> listOfGrade = new ArrayList<>();
        try {

            String sql = "SELECT [grade_id]\n"
                    + "      ,[enrollment_id]\n"
                    + "      ,[grade_PT1]\n"
                    + "      ,[grade_PT2]\n"
                    + "      ,[grade_asignment]\n"
                    + "      ,[grade_lab1]\n"
                    + "      ,[grade_lab2]\n"
                    + "      ,[grade_lab3]\n"
                    + "      ,[grade_lab4]\n"
                    + "      ,[grade_lab5]\n"
                    + "      ,[grade_PE]\n"
                    + "      ,[grade_FE]\n"
                    + "  FROM [Grade]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Grade g = new Grade();
                g.setGid(rs.getInt("grade_id"));
                g.setEid(rs.getInt("enrollment_id"));
                g.setPT1(getNullableDouble(rs, "grade_PT1"));
                g.setPT2(getNullableDouble(rs, "grade_PT2"));
                g.setAssignment(getNullableDouble(rs, "grade_asignment"));
                g.setLab1(getNullableDouble(rs, "grade_lab1"));
                g.setLab2(getNullableDouble(rs, "grade_lab2"));
                g.setLab3(getNullableDouble(rs, "grade_lab3"));
                g.setLab4(getNullableDouble(rs, "grade_lab4"));
                g.setLab5(getNullableDouble(rs, "grade_lab5"));
                g.setPE(getNullableDouble(rs, "grade_PE"));
                g.setFE(getNullableDouble(rs, "grade_FE"));
                listOfGrade.add(g);

            }

        } catch (SQLException ex) {
            Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public void insert(Grade entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Grade entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Grade entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Grade get(Grade entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Grade getById(String Id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Grade getGradeBySemesterNameAndCourseID(String semesterName, String courseId) {
        try {
            Grade g = new Grade();
            String sql = "SELECT g.grade_id, g.enrollment_id, g.grade_PT1, g.grade_PT2, g.grade_asignment, g.grade_lab1, g.grade_lab2, g.grade_lab3, g.grade_lab4, g.grade_lab5, g.grade_PE, g.grade_FE\n"
                    + "FROM Grade g\n"
                    + "INNER JOIN Enrollment e ON g.enrollment_id = e.enrollment_id\n"
                    + "WHERE e.enrollment_semester_name = ? AND e.course_id = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, semesterName);
            stm.setString(2, courseId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                g.setGid(rs.getInt("grade_id"));
                g.setEid(rs.getInt("enrollment_id"));
                g.setPT1(getNullableDouble(rs, "grade_PT1"));
                g.setPT2(getNullableDouble(rs, "grade_PT2"));
                g.setAssignment(getNullableDouble(rs, "grade_asignment"));
                g.setLab1(getNullableDouble(rs, "grade_lab1"));
                g.setLab2(getNullableDouble(rs, "grade_lab2"));
                g.setLab3(getNullableDouble(rs, "grade_lab3"));
                g.setLab4(getNullableDouble(rs, "grade_lab4"));
                g.setLab5(getNullableDouble(rs, "grade_lab5"));
                g.setPE(getNullableDouble(rs, "grade_PE"));
                g.setFE(getNullableDouble(rs, "grade_FE"));
            }
            return g;
        } catch (SQLException ex) {
            Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    private Double getNullableDouble(ResultSet rs, String columnLabel) throws SQLException {
        double value = rs.getDouble(columnLabel);
        return rs.wasNull() ? null : value;
    }

}
