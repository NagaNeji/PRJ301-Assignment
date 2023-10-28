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
    <body style="background-color: white">


        <table>
            <tbody>
                <tr style="border-bottom: 0 none">
                    <td>
                        <div>
                            <h2>Grade report for <span id="ctl00_mainContent_lblRollNumber">Bạch Đức Thản (HE172581)</span></h2>
                            <table>
                                <tbody>
                                    <tr>
                                        <td valign="top">
                                            <h3>Select a term, course ...</h3>
                                            <table>
                                                <thead>
                                                    <tr>
                                                        <th>Term</th>
                                                        <th>Course</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td valign="top">
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
                                                        <td valign="top">
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
                                                    <div id="ctl00_mainContent_divGrade">
                                                        <table summary="Report">
                                                            <caption>... then see report</caption>
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

                                                            </tbody>
                                                            <tfoot>
                                                                <tr>
                                                                    <td rowspan="2">Course total</td>
                                                                    <td>Average</td>
                                                                    <td colspan="3">${average}</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Status</td>
                                                                    <td colspan="3">${status}</td>
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

    </body>
</html>
