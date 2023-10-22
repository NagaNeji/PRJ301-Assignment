/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author PC
 */
public class Score extends BaseEntity {

    private int scoreId;
    private Enrollment enrollment;
    private CourseGrade courseGrade;
    private Double score;

    public Score() {
    }

    public Score(int scoreId, Enrollment enrollment, CourseGrade courseGrade, Double score) {
        this.scoreId = scoreId;
        this.enrollment = enrollment;
        this.courseGrade = courseGrade;
        this.score = score;
    }

    public int getScoreId() {
        return scoreId;
    }

    public void setScoreId(int scoreId) {
        this.scoreId = scoreId;
    }

    public Enrollment getEnrollment() {
        return enrollment;
    }

    public void setEnrollment(Enrollment enrollment) {
        this.enrollment = enrollment;
    }

    public CourseGrade getCourseGrade() {
        return courseGrade;
    }

    public void setCourseGrade(CourseGrade courseGrade) {
        this.courseGrade = courseGrade;
    }

    public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }

}
