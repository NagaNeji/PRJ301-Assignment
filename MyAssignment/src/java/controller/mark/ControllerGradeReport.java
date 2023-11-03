/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.mark;

import dal.EnrollmentDBContext;
import dal.MajorCourseDBContext;
import dal.ScoreDBContext;
import dal.StudentDBContext;
import entity.Enrollment;
import entity.GradeReportRow;
import entity.MajorCourse;
import entity.Score;
import entity.Student;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class ControllerGradeReport {

    public ArrayList<GradeReportRow> getListGradeTranscriptRowByStudentId(String studentId) {
        ArrayList<GradeReportRow> listGradeTranscript = new ArrayList<>();

        StudentDBContext studentDB = new StudentDBContext();
        EnrollmentDBContext enrollmentDB = new EnrollmentDBContext();
        MajorCourseDBContext majorCourseDB = new MajorCourseDBContext();
        ScoreDBContext scoreDB = new ScoreDBContext();

        Student s = studentDB.getById(studentId);

        ArrayList<MajorCourse> listMajorCourse = majorCourseDB.getListMajorCourseByMajorId(s.getMajor().getMajorId());
        for (MajorCourse mc : listMajorCourse) {
            GradeReportRow gradeReportRow = new GradeReportRow();

            gradeReportRow.setMajorCourse(mc);

            Enrollment e = new Enrollment();
            try {
                Enrollment lastestEnrollment;
                lastestEnrollment = enrollmentDB.getLastestEnrollmentByCourse(mc.getCourse().getCourseId());
                if (lastestEnrollment != null) {
                    e = enrollmentDB.getById(lastestEnrollment.getEnrollmentId());
                }
                gradeReportRow.setEnrollment(e);
            } catch (NullPointerException ex) {
            }
            

            ArrayList<Score> listScore = scoreDB.getListScoreByEnrollmentId(e.getEnrollmentId());
            if (gradeReportRow.getEnrollment().getEnrollmentId() == null) {
                gradeReportRow.setGrade(null);
            } else {
                gradeReportRow.setGrade(getAverage(listScore));
            }
            
            

            if (gradeReportRow.getEnrollment().getEnrollmentId() == null) {
                gradeReportRow.setStatus("NOT STARTED");
                
                gradeReportRow.getMajorCourse().setCredit(null);
            } else {
                gradeReportRow.setStatus(scoreDB.getStatus(listScore));
            }
            listGradeTranscript.add(gradeReportRow);
            
        }
        return listGradeTranscript;
    }

    private Double getAverage(ArrayList<Score> listScore) {
        Double average = 0.0;
        boolean checkFER = false;
        for (Score score : listScore) {
            if (!"Total".equals(score.getCourseGrade().getGrade().getGradeName())
                    && !"Final Exam Resit".equals(score.getCourseGrade().getCourseGradeGroup())) {
                if (score.getScore() == null) {
                    return null;
                } else if (!"Final Exam".equals(score.getCourseGrade().getCourseGradeGroup())) {
                    average = average + score.getScore() * score.getCourseGrade().getCourseGradeWeight();
                }
            }
            if (!"Total".equals(score.getCourseGrade().getGrade().getGradeName())
                    && "Final Exam Resit".equals(score.getCourseGrade().getCourseGradeGroup())
                    && score.getScore() != null) {
                checkFER = true;
            }
        }
        for (Score score : listScore) {
            if (checkFER) {
                if (!"Total".equals(score.getCourseGrade().getGrade().getGradeName())
                        && "Final Exam Resit".equals(score.getCourseGrade().getCourseGradeGroup())) {
                    average = average + score.getScore() * score.getCourseGrade().getCourseGradeWeight();
                }
            } else if (!checkFER) {
                if (!"Total".equals(score.getCourseGrade().getGrade().getGradeName())
                        && "Final Exam".equals(score.getCourseGrade().getCourseGradeGroup())) {
                    average = average + score.getScore() * score.getCourseGrade().getCourseGradeWeight();
                }
            }
        }
        return average;
    }

}
