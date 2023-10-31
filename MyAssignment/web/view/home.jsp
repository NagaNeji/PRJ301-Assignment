<%-- 
    Document   : home
    Created on : Oct 11, 2023, 1:51:48 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        <form method="post" action="MarkReport">
            <button type="submit" name="action" value="markReport">Mark Report</button>
        </form>
        <form method="post" action="GradeTranscript">
        <button type="submit" name="action" value="academicTranscript">Academic Transcript</button>
        </form>

    </body>
</html>
