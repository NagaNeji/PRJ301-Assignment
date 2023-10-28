/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Score;
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
public class ScoreDBContext extends DBContext<Score> {

    @Override
    public Score getById(String scoreId) {
        EnrollmentDBContext enrollmentDB = new EnrollmentDBContext();
        CourseGradeDBContext courseGradeDB = new CourseGradeDBContext();
        try {
            String sql = "SELECT [score_id]\n"
                    + "      ,[enrollment_id]\n"
                    + "      ,[course_grade_id]\n"
                    + "      ,[score]\n"
                    + "  FROM [Score]\n"
                    + "  WHERE [score_id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, scoreId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Score s = new Score();
                s.setScoreId(rs.getInt("score_id"));
                s.setEnrollment(enrollmentDB.getById(rs.getString("enrollment_id")));
                s.setCourseGrade(courseGradeDB.getById(rs.getString("course_grade_id")));
                s.setScore(getNullableDouble(rs, "score"));
                return s;
            }

        } catch (SQLException ex) {
            Logger.getLogger(MajorCourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    private Double getNullableDouble(ResultSet rs, String columnLabel) throws SQLException {
        double value = rs.getDouble(columnLabel);
        return rs.wasNull() ? null : value;
    }

    public ArrayList<Score> getListScoreByEnrollmentId(String enrollmentId) {
        ScoreDBContext scoreDB = new ScoreDBContext();
        ArrayList<Score> listScore = new ArrayList<>();
        try {
            String sql = "SELECT [score_id]\n"
                    + "  FROM [Score]\n"
                    + "  WHERE [enrollment_id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, enrollmentId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Score s = new Score();
                s = scoreDB.getById(rs.getString("score_id"));
                listScore.add(s);
            }
            return listScore;
        } catch (SQLException ex) {
            Logger.getLogger(MajorCourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public double getAverage(ArrayList<Score> listScore) {
        double average = 0;
        boolean checkFER = false;
        for (Score score : listScore) {
            if (!"Total".equals(score.getCourseGrade().getGrade().getGradeName())
                    && !"Final Exam Resit".equals(score.getCourseGrade().getCourseGradeGroup())) {
                if (score.getScore() == null) {
                    return 0;
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

    public String getStatus(ArrayList<Score> listScore) {
        for (Score score : listScore) {
            if ("Total".equals(score.getCourseGrade().getGrade().getGradeName())
                    && !"Final Exam Resit".equals(score.getCourseGrade().getCourseGradeGroup())
                    && score.getScore() == null) {
                return "STUDYING";
            }
        }
        for (Score score : listScore) {
            if ("Total".equals(score.getCourseGrade().getGrade().getGradeName())
                    && !"Final Exam".equals(score.getCourseGrade().getCourseGradeGroup())
                    && !"Final Exam Resit".equals(score.getCourseGrade().getCourseGradeGroup())
                    && (score.getScore() == 0)) {
                return "NOT PASSED";
            }
        }
        for (Score score : listScore) {
            if ("Total".equals(score.getCourseGrade().getGrade().getGradeName())
                    && "Final Exam".equals(score.getCourseGrade().getCourseGradeGroup())
                    && getFER(listScore) == null && score.getScore() < 4) {
                return "NOT PASSED";
            }
        }
        for (Score score : listScore) {
            if ("Total".equals(score.getCourseGrade().getGrade().getGradeName())
                    && "Final Exam Resit".equals(score.getCourseGrade().getCourseGradeGroup())
                    && (score.getScore() != null)) {
                if (score.getScore() < 4) {
                    return "NOT PASSED";
                }
            }
        }
        if (getAverage(listScore) < 5) {
            return "NOT PASSED";
        } else {
            return "PASSED";
        }

    }

    public Double getFER(ArrayList<Score> listScore) {
        for (Score score : listScore) {
            if ("Final Exam Resit".equals(score.getCourseGrade().getGrade().getGradeName())) {
                return score.getScore();
            }
        }
        return null;
    }

}
