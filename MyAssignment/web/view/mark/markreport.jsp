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
            <c:forEach var="semester" items="${listSemesterName}">
                <tr>
                    <td>
                        <form  method="POST">
                            <input type="hidden" name="semester" value="${semester}" />
                            <a style="color: inherit;" href="MarkReport?semester=${semester}" onclick="this.parentNode.submit(); return false;">${semester}</a>
                        </form>
                    </td>

                </tr>
            </c:forEach>

        </table>
        <table border="0">
            <tr>
                <th>Course</th>
            </tr>
            <c:forEach var="course" items="${listCourseWithNameSemesterClicked}">
                <tr>
                    <td>
                        <form method="POST">
                            <input type="hidden" name="course" value="${course}" />
                            <a style="color: inherit;" href="MarkReport?semester=${semester}?course=${course}" onclick="this.parentNode.submit(); return false;">${course.getName()}
                            </a>
                        </form>
                    </td>

                </tr>
            </c:forEach>
        </table>
        <h1>${string}</h1>
    </body>
</html>
