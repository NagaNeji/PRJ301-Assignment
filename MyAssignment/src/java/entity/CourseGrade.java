/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author PC
 */
public class CourseGrade extends BaseEntity{
    
    private String courseGradeId;
    private Course course;
    private Grade grade;
    private double courseGradeWeight;
    private String courseGradeGroup;

    public CourseGrade() {
    }

    public CourseGrade(String courseGradeId, Course course, Grade grade, double courseGradeWeight, String courseGradeGroup) {
        this.courseGradeId = courseGradeId;
        this.course = course;
        this.grade = grade;
        this.courseGradeWeight = courseGradeWeight;
        this.courseGradeGroup = courseGradeGroup;
    }

    public String getCourseGradeId() {
        return courseGradeId;
    }

    public void setCourseGradeId(String courseGradeId) {
        this.courseGradeId = courseGradeId;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Grade getGrade() {
        return grade;
    }

    public void setGrade(Grade grade) {
        this.grade = grade;
    }

    public double getCourseGradeWeight() {
        return courseGradeWeight;
    }

    public void setCourseGradeWeight(double courseGradeWeight) {
        this.courseGradeWeight = courseGradeWeight;
    }

    public String getCourseGradeGroup() {
        return courseGradeGroup;
    }

    public void setCourseGradeGroup(String courseGradeGroup) {
        this.courseGradeGroup = courseGradeGroup;
    }
    
}
