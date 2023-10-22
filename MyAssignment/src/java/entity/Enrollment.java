/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Date;

/**
 *
 * @author PC
 */
public class Enrollment extends BaseEntity {

    private String enrollmentId;
    private Student student;
    private Semester semester;
    private Course course;
    private Date enrollmentStartDate;
    private Date enrollmentEndDate;
    private Group group;

    public Enrollment() {
    }

    public Enrollment(String enrollmentId, Student student, Semester semester, Course course, Date enrollmentStartDate, Date enrollmentEndDate, Group group) {
        this.enrollmentId = enrollmentId;
        this.student = student;
        this.semester = semester;
        this.course = course;
        this.enrollmentStartDate = enrollmentStartDate;
        this.enrollmentEndDate = enrollmentEndDate;
        this.group = group;
    }

    public String getEnrollmentId() {
        return enrollmentId;
    }

    public void setEnrollmentId(String enrollmentId) {
        this.enrollmentId = enrollmentId;
    }


    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Semester getSemester() {
        return semester;
    }

    public void setSemester(Semester semester) {
        this.semester = semester;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Date getEnrollmentStartDate() {
        return enrollmentStartDate;
    }

    public void setEnrollmentStartDate(Date enrollmentStartDate) {
        this.enrollmentStartDate = enrollmentStartDate;
    }

    public Date getEnrollmentEndDate() {
        return enrollmentEndDate;
    }

    public void setEnrollmentEndDate(Date enrollmentEndDate) {
        this.enrollmentEndDate = enrollmentEndDate;
    }

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }

}
