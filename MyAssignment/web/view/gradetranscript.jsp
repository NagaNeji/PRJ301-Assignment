<%-- 
    Document   : gradetranscript
    Created on : Oct 30, 2023, 8:52:35 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <form method="POST" action="home">
            <button>Home</button>
        </form>
        <table>
            <thead>
                <tr>
                    <th>NO</th>
                    <th>TERM</th>
                    <th>SEMESTER</th>
                    <th>SUBJECT CODE</th>
                    <th>SUBJECT NAME</th>
                    <th>CREDIT</th>
                    <th>GRADE</th>
                    <th>STATUS</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="gradeReportRow" items="${listGradeReportRow}">
                    <tr>
                        <th></th>
                        <th>${gradeReportRow.getMajorCourse().getSemesterNumber()}</th>
                        <th>${gradeReportRow.getEnrollment().getSemester().getSemesterName()}</th>
                        <th>${gradeReportRow.getMajorCourse().getCourse().getCourseId()}</th>
                        <th>${gradeReportRow.getMajorCourse().getCourse().getCourseName()}</th>
                        <th>${gradeReportRow.getMajorCourse().getCredit()}</th>
                        <th>${gradeReportRow.getGrade()}</th>
                        <th data-status="${gradeReportRow.getStatus()}">${gradeReportRow.getStatus()}</th>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <c:forEach var="abc" items="${test}">
            <div>${abc.getCourse().getCourseId()}</div>
        </c:forEach>
    </body>
</html>
