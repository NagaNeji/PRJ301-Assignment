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
            <c:forEach var="nameSemester" items="${requestScope.listSemesterName}">
                <tr>
                    <td>
                        <form  action="MarkReport">
                            <input type="hidden" name="semester" value="${nameSemester}" />
                            <a style="color: inherit;" href="#" onclick="this.parentNode.submit(); return false;">${nameSemester}</a>
                        </form>
                    </td>

                </tr>
            </c:forEach>

        </table>
        <table border="0">
            <tr>
                <th>Course</th>
            </tr>
            <c:forEach var="course" items="${requestScope.listCourseWithNameSemesterClicked}">
                <tr>
                    <td>
                        <form action="MarkReport" >
                            <input type="hidden" name="semester" value="${nameSemesterClicked}" />
                            <input type="hidden" name="course" value="${course.getId().trim()}" />
                            <a style="color: inherit;" href="#" onclick="this.parentNode.submit(); return false;">${course.getName()}
                            </a>
                        </form>
                    </td>

                </tr>
            </c:forEach>
        </table>
        <table border="0" var="grade" items = "${requestScope.grade}">
            <tr>
                <th>Tên Thuộc Tính</th>
                <th>Giá Trị</th>
            </tr>
            <tr>
                <td>PT1</td>
                <td>${grade.getPT1()}</td>
            </tr>
            <tr>
                <td>PT2</td>
                <td>${grade.getPT2()}</td>
            </tr>
            <tr>
                <td>Assignment</td>
                <td>${grade.getAssignment()}</td>
            </tr>
            <tr>
                <td>Lab1</td>
                <td>${grade.getLab1()}</td>
            </tr>
            <tr>
                <td>Lab2</td>
                <td>${grade.getLab2()}</td>
            </tr>
            <tr>
                <td>Lab3</td>
                <td>${grade.getLab3()}</td>
            </tr>
            <tr>
                <td>Lab4</td>
                <td>${grade.getLab4()}</td>
            </tr>
            <tr>
                <td>Lab5</td>
                <td>${grade.getLab5()}</td>
            </tr>
            <tr>
                <td>PE</td>
                <td>${grade.getPE()}</td>
            </tr>
            <tr>
                <td>FE</td>
                <td>${grade.getFE()}</td>
            </tr>
        </table>
    </body>
</html>
