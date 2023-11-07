<%-- 
    Document   : markreport
    Created on : Oct 11, 2023, 12:19:51 AM
    Author     : PC
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Mark Report</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="<%=request.getContextPath()%>/css/markreport.css" rel="stylesheet" type="text/css"/>
        
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
            <table>
                <tbody>
                    <tr style="border-bottom: 0 none">
                        <td>
                            <div>
                                <h2 style="margin-bottom: 2.5rem">Grade report for <span id="ctl00_mainContent_lblRollNumber">${student.getName()}</span></h2>
                                <table>
                                    <tbody>
                                        <tr>
                                            <td valign="top" >
                                                <h3 style="text-align: center;">Select a term, course ...</h3>
                                                <table>
                                                    <thead style="text-transform: uppercase; background-color: #6b90da">
                                                        <tr>
                                                            <th>Term</th>
                                                            <th>Course</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td valign="top"style="padding-right: 10px;">
                                                                <div id="ctl00_mainContent_divTerm">
                                                                    <table>
                                                                        <tbody>

                                                                            <c:forEach var="semester" items="${listSemester}">

                                                                                <tr>
                                                                                    <td>
                                                                                        <c:choose>
                                                                                            <c:when test="${semester.getSemesterName() eq nameSemesterClicked}">
                                                                                                <span>
                                                                                                    <strong>
                                                                                                        ${semester.getSemesterName()}
                                                                                                    </strong>
                                                                                                </span>
                                                                                            </c:when>
                                                                                            <c:otherwise>
                                                                                                <form  action="MarkReport">
                                                                                                    <input type="hidden" name="semester" value="${semester.getSemesterName()}" />
                                                                                                    <a style="color: blue;" href="#" onclick="this.parentNode.submit(); return false;">${semester.getSemesterName()}</a>
                                                                                                </form>
                                                                                            </c:otherwise>
                                                                                        </c:choose>

                                                                                    </td>

                                                                                </tr>
                                                                            </c:forEach>

                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </td>
                                                            <td valign="top" style="padding-right: 10px;">
                                                                <div id="ctl00_mainContent_divCourse">
                                                                    <table>
                                                                        <tbody>

                                                                            <c:forEach var="enrollment" items="${listEnrollmentWithNameSemesterClicked}">


                                                                                <tr>
                                                                                    <td>
                                                                                        <c:choose>
                                                                                            <c:when test="${enrollment.getEnrollmentId() eq idEnrollmentClicked}">
                                                                                                <span>
                                                                                                    <strong>
                                                                                                        ${enrollment.getCourse().getCourseName()}(${enrollment.getCourse().getCourseId()})(${enrollment.getGroup().getGroupName()},from ${enrollment.getEnrollmentStartDate()} to ${enrollment.getEnrollmentEndDate()})
                                                                                                    </strong>
                                                                                                </span>
                                                                                            </c:when>
                                                                                            <c:otherwise>
                                                                                                <form action="MarkReport" >
                                                                                                    <input type="hidden" name="semester" value="${nameSemesterClicked}" />
                                                                                                    <input type="hidden" name="course" value="${enrollment.getEnrollmentId()}" />
                                                                                                    <a style="color: blue;" href="#" onclick="this.parentNode.submit(); return false;">${enrollment.getCourse().getCourseName()}(${enrollment.getCourse().getCourseId()})</a>
                                                                                                    <span>(${enrollment.getGroup().getGroupName()},from ${enrollment.getEnrollmentStartDate()} to ${enrollment.getEnrollmentEndDate()})</span>
                                                                                                </form>
                                                                                            </c:otherwise>
                                                                                        </c:choose>

                                                                                    </td>

                                                                                </tr>
                                                                            </c:forEach>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                            <td valign="top">
                                                <c:choose>
                                                    <c:when test="${ not empty listScoreByEnrollmentId}">
                                                        <h3 style="text-align: center;">... then see report</h3>
                                                        <div id="ctl00_mainContent_divGrade">
                                                            <table summary="Report">    
                                                                <thead style="text-transform: uppercase;background-color: #6b90da">
                                                                    <tr>
                                                                        <th>Grade category</th>
                                                                        <th>Grade item</th>
                                                                        <th style="padding-right: 5px;">Weight</th>
                                                                        <th style="padding-right: 5px;">Value</th>
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
                                                                                    <td style="padding-right: 10px;">${score.getCourseGrade().getCourseGradeGroup()}</td>
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
                                                                            <td style="padding-right: 10px; width: 30%">${score.getCourseGrade().getGrade().getGradeName()}</td>
                                                                            <td style="padding-right: 10px;">
                                                                                <fmt:setLocale value="en_US" />
                                                                                <fmt:formatNumber value="${score.getCourseGrade().getCourseGradeWeight()*100}" pattern="#.#" var="scoreValue"/>
                                                                                ${scoreValue}%
                                                                            </td>
                                                                            <td style="padding-right: 10px;">${score.getScore()}</td>
                                                                            <td style="padding-right: 10px;"></td>
                                                                        </tr>
                                                                        <c:set var="currentCourseGradeGroup" value="${score.getCourseGrade().getCourseGradeGroup()}" />
                                                                    </c:forEach>

                                                                </tbody>
                                                                <tfoot>
                                                                    <tr>
                                                                        <th rowspan="2">Course total</th>
                                                                        <th>Average</th>
                                                                        <th colspan="3">${average}</th>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>Status</th>
                                                                        <th colspan="3" data-status="${status}">${status}</th>
                                                                    </tr>
                                                                </tfoot>
                                                            </table>
                                                        </div>

                                                    </c:when>
                                                    <c:otherwise>

                                                    </c:otherwise>
                                                </c:choose>

                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <input type="hidden" name="ctl00$mainContent$hdError" id="ctl00_mainContent_hdError">
                            </div>
                        </td>
                    </tr>
                <td style="padding-top: 145px"></td>
                <tr style="border-bottom: 0 none">
                    <td>
                        <br>
                        <table width="100%" style="border: 1px solid transparent;" id="cssTable">
                            <tbody>
                                <tr>
                                    <td>
                                        <div id="ctl00_divSupport">
                                            <br>
                                            <b>Mọi góp ý, thắc mắc xin liên hệ: </b>
                                            <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13.333333969116211px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">
                                                Phòng dịch vụ sinh viên
                                            </span>: Email:
                                            <a href="mailto:dichvusinhvien@fe.edu.vn">dichvusinhvien@fe.edu.vn</a>.
                                            Điện thoại:
                                            <span class="style1" style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13.333333969116211px; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">(024)7308.13.13 </span>
                                            <br>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p style="text-align: center">
                                            © Powered by
                                            <a href="http://fpt.edu.vn" target="_blank">FPT University</a>
                                            &nbsp;|&nbsp;
                                            <a href="http://cms.fpt.edu.vn/" target="_blank">CMS</a>
                                            &nbsp;|&nbsp;
                                            <a href="http://library.fpt.edu.vn" target="_blank">library</a>
                                            &nbsp;|&nbsp;
                                            <a href="http://library.books24x7.com" target="_blank">books24x7</a>
                                            <span id="ctl00_lblHelpdesk"></span>
                                        </p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

    </body>
</html>
