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
             <td><a style="color: inherit;" href="SelectSemester?name=${semester.toString()}">${semester.toString()}</a></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
