/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author ADMIN
 */
public class GradeReportRow {
    private MajorCourse majorCourse;
    private Enrollment enrollment;
    private Double grade;
    private String status;

    public GradeReportRow() {
    }

    public GradeReportRow(MajorCourse majorCourse, Enrollment enrollment, Double grade, String status) {
        this.majorCourse = majorCourse;
        this.enrollment = enrollment;
        this.grade = grade;
        this.status = status;
    }

    public MajorCourse getMajorCourse() {
        return majorCourse;
    }

    public void setMajorCourse(MajorCourse majorCourse) {
        this.majorCourse = majorCourse;
    }

    public Enrollment getEnrollment() {
        return enrollment;
    }

    public void setEnrollment(Enrollment enrollment) {
        this.enrollment = enrollment;
    }

    public Double getGrade() {
        return grade;
    }

    public void setGrade(Double grade) {
        this.grade = grade;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    
}
