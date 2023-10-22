<%-- 
    Document   : markreport
    Created on : Oct 11, 2023, 12:19:51 AM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Mark Report</title>
    </head>
    <body>

        <table border="0">
            <tr>
                <th>Semester</th>   
            </tr>
            <c:forEach var="semester" items="${listSemester}">
                <tr>
                    <td>
                        <form  action="MarkReport">
                            <input type="hidden" name="semester" value="${semester.getSemesterName()}" />
                            <a style="color: inherit;" href="#" onclick="this.parentNode.submit(); return false;">${semester.getSemesterName()}</a>
                        </form>
                    </td>

                </tr>
            </c:forEach>

        </table>
        <table border="0">
            <tr>
                <th>Course</th>
            </tr>
            <c:forEach var="enrollment" items="${listEnrollmentWithNameSemesterClicked}">
                <tr>
                    <td>
                        <form action="MarkReport" >
                            <input type="hidden" name="semester" value="${nameSemesterClicked}" />
                            <input type="hidden" name="course" value="${enrollment.getEnrollmentId()}" />
                            <a style="color: inherit;" href="#" onclick="this.parentNode.submit(); return false;">${enrollment.getCourse().getCourseName()}(${enrollment.getCourse().getCourseId()})</a>
                        </form>
                    </td>

                </tr>
            </c:forEach>
        </table>
        <table summary="Report" border="1">
            <thead>
                <tr>
                    <th>Grade category</th>
                    <th>Grade item</th>
                    <th>Weight</th>
                    <th>Value</th>
                    <th>Comment</th>
                </tr>
            </thead>
            <tbody>

                <c:set var="currentCourseGradeGroup" value="" />
                <c:forEach var="score" items="${listScoreByEnrollmentId}">
                    <tr>
                        <c:choose>
                            <c:when test="${empty currentCourseGradeGroup}">
                                <c:set var="currentCourseGradeGroup" value="${score.getCourseGrade().getCourseGradeGroup()}" />
                                <td>${score.getCourseGrade().getCourseGradeGroup()}</td>
                            </c:when>
                            <c:otherwise>
                                <c:choose>
                                    <c:when test="${not empty currentCourseGradeGroup && currentCourseGradeGroup != score.getCourseGrade().getCourseGradeGroup()}">
                                        <td>${score.getCourseGrade().getCourseGradeGroup()}</td>
                                        <c:set var="currentCourseGradeGroup" value="${score.getCourseGrade().getCourseGradeGroup()}" />
                                    </c:when>
                                    <c:otherwise>
                                        <td></td>
                                    </c:otherwise>
                                </c:choose>
                            </c:otherwise>
                        </c:choose>
                        <td>${score.getCourseGrade().getGrade().getGradeName()}</td>
                        <td>${score.getCourseGrade().getCourseGradeWeight()*100}%</td>
                        <td>${score.getScore()}</td>
                        <td></td>
                    </tr>
                    <c:set var="currentCourseGradeGroup" value="${score.getCourseGrade().getCourseGradeGroup()}" />
                </c:forEach>
                <!--                <tr>
                                    <td rowspan="2">Final exam</td>
                                    <td>Final exam</td>
                                    <td>10.0 %</td>
                                    <td></td>
                                    <td></td>
                                </tr>-->

            </tbody>
            <tfoot>
                <!--                <tr>
                                    <td rowspan="2">Course total</td>
                                    <td>Average</td>
                                    <td colspan="3">7.9</td>
                                </tr>
                                <tr>
                                    <td>Status</td>
                                    <td colspan="3"><font color="Green">Passed</font></td>
                                </tr>-->
            </tfoot>
        </table>   
    </body>
</html>
