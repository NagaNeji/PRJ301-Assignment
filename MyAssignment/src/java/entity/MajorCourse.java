/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author PC
 */
public class MajorCourse extends BaseEntity{
    private int majorCourseId;
    private Major major;
    private Course course;
    private int semesterNumber;

    public MajorCourse() {
    }

    public MajorCourse(int majorCourseId, Major major, Course course, int semesterNumber) {
        this.majorCourseId = majorCourseId;
        this.major = major;
        this.course = course;
        this.semesterNumber = semesterNumber;
    }

    public int getMajorCourseId() {
        return majorCourseId;
    }

    public void setMajorCourseId(int majorCourseId) {
        this.majorCourseId = majorCourseId;
    }

    public Major getMajor() {
        return major;
    }

    public void setMajor(Major major) {
        this.major = major;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public int getSemesterNumber() {
        return semesterNumber;
    }

    public void setSemesterNumber(int semesterNumber) {
        this.semesterNumber = semesterNumber;
    }

    
    
}
