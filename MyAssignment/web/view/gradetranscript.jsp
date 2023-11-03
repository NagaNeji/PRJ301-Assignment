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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="<%=request.getContextPath()%>/css/gradetranscript.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <nav class="navbar navbar-expand-lg navbar-dark">
            <nav class="navbar navbar-expand-lg navbar-dark">
                <div class="container">
                    <div class="collapse navbar-collapse">
                        <h1>FPT University Academic Portal</h1>
                    </div>
                </div>
            </nav>
            <div class="collapse navbar-collapse" id="navbarNav">
                <table class="navbar-nav ml-auto">
                    <tbody>
                        <tr>
                            <td colspan="5">
                                <strong>FAP mobile app (myFAP) is ready at</strong>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href="https://apps.apple.com/app/id1527723314">
                                    <img style="width: 120px; height: 40px" src="https://fap.fpt.edu.vn/images/app-store.png" alt="appstore"/>
                                </a>
                            </td>
                            <td>
                                <a href="https://play.google.com/store/apps/details?id=com.fuct" class="">
                                    <img style="width: 120px; height: 43px" src="https://fap.fpt.edu.vn/images/play-store.png" alt=""/>
                                </a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </nav>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <form name="jspForm" method="post" action="./transcript.jsp" id="jspForm">                        
                        <div class="content-container">
                            <div class="divControl">
                                <a href="<%=request.getContextPath()%>/home">Home</a>
                                &nbsp;|&nbsp;<b>Grade Transcript</b>
                            </div>
                            <div class="divUser">
                                <table>
                                    <tr>
                                        <td>
                                            <p>
                                                <a>
                                                    <strong style="color: #fff">${sessionScope.account.getDisplayName()}</strong>
                                                </a>
                                                &nbsp;|&nbsp;<a href="<%=request.getContextPath()%>/logout">
                                                    <strong>Logout</strong>
                                                </a>
                                                &nbsp;|&nbsp;<b>CAMPUS: FPTU-${student.getCampus().getCampusName()}</b>
                                            </p>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <br>
                        <tr style="border-bottom: 0 none">
                            <td>
                                <div>
                                    <h2>
                                        Grade report for transcript
                                        <span id="ctl00_mainContent_lblRollNumber">
                                            <span class="label label-studentRoll">${student.getId()}</span>
                                            - <span class="label label-studentMajor">${student.getMajor().getMajorId()}</span>
                                        </span>
                                    </h2>
                                </div>
                                <br>
                            </td>
                        <div id="Grid">
                            <Table class="table table-hover">
                                <thead class="thead-inverse">
                                    <tr>
                                        <th style="width:10px; border-right: 1px solid #fff">No</th>
                                        <th style="width:15px; border-right: 1px solid #fff">Term</th>
                                        <th style="width:80px; border-right: 1px solid #fff">Semester</th>
                                        <th style="width:60px; border-right: 1px solid #fff">Subject Code</th>
                                        <th style="border-right: 1px solid #fff;">Subject Name</th>
                                        <th style="width:10px; border-right: 1px solid #fff">Credit</th>
                                        <th style="width:20px; border-right: 1px solid #fff">Average Mark</th>
                                        <th style="width:120px">Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="index" value="1"/>
                                    <c:forEach var="gradeReportRow" items="${listGradeReportRow}">
                                        <tr>
                                            <td>${index}</td>
                                            <td>${gradeReportRow.getMajorCourse().getSemesterNumber()}</td>
                                            <td>${gradeReportRow.getEnrollment().getSemester().getSemesterName()}</td>
                                            <td>${gradeReportRow.getMajorCourse().getCourse().getCourseId()}</td>
                                            <td>${gradeReportRow.getMajorCourse().getCourse().getCourseName()}</td>
                                            <td>${gradeReportRow.getMajorCourse().getCredit()}</td>
                                            <td>
                                                <c:if test="${ not empty gradeReportRow.getGrade()}">
                                                    <span class="label label-primary">
                                                        ${gradeReportRow.getGrade()}
                                                    </span>
                                                </c:if>
                                            </td>
                                            <td>
                                                <span data-status="${gradeReportRow.getStatus()}">
                                                    ${gradeReportRow.getStatus()}
                                                </span>
                                            </td>
                                            <c:set var="index" value="${index+1}"/>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </Table>
                            <tr>
                                <td valign="top" align="left">
                                    <div id="ctl00_mainContent_divDNTN"></div>
                                </td>
                            </tr>


                            <table>
                                <tr>
                                    <td valign="top">
                                        <div>
                                            <table width="100%" border="0">
                                                <tr>
                                                    <td>
                                                        <b>Mọi góp ý, thắc mắc xin liên hệ:</b>
                                                        <span>Phòng dịch vụ sinh viên</span>: Email:
                                                        <a href="mailto:dichvusinhvien@fe.edu.vn">dichvusinhvien@fe.edu.vn</a>.
                                                        Điện thoại: (024)7308.13.13
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <p style="text-align: center">
                                                            © Powered by <a href="http://fpt.edu.vn" target="_blank">FPT University</a>
                                                            &nbsp;|&nbsp;<a href="http://cms.fpt.edu.vn/" target="_blank">CMS</a>
                                                            &nbsp;|&nbsp;<a href="http://library.fpt.edu.vn" target="_blank">library</a>
                                                            &nbsp;|&nbsp;<a href="http://library.books24x7.com" target="_blank">books24x7</a>
                                                        </p>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
