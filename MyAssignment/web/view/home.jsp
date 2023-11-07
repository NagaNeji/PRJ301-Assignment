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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="<%=request.getContextPath()%>/css/home.css" rel="stylesheet" type="text/css"/>
        <style>.label-primary {
                background-color: rgb(51,122,183);
                color: white;
                padding: 0px 7px;
                font-size: 12px;
                border-radius: 3px;
                font-weight: bold;
            }

            .content-container {
                display: flex;
                justify-content: space-between;
                align-items: center;
                background-color: rgb(240,240,240);
                border-radius: 4px;
            }

            .divControl {
                padding-left: 8px;
            }

            .divUser {
                padding-right: 7px;
            }

            .divUser a {
                background-color: rgb(92,184,92);
                border-radius: 5px;
                padding: 0 7px 2px 7px;
                color: #fff;
                font-size: 13px;
            }

            .divUser a:hover {
                color: #fff;
            }

            .divUser b {
                background-color: rgb(92,184,92);
                border-radius: 5px;
                padding: 0 7px 2px 7px;
                color: #fff;
                font-size: 13px;
            }

            .label-studentRoll {
                background-color: rgb(110,110,110);
                border-radius: 7px;
                color: #fff;
                font-size: 20px;
                padding: 7px 15px;
                font-weight: bold;
            }

            .label-studentMajor {
                background-color: rgb(91,192,222);
                border-radius: 7px;
                color: #fff;
                font-size: 20px;
                padding: 7px 15px;
                font-weight: bold;
            }

            .thead-inverse {
                background-color: rgb(107,144,218);
                text-transform: uppercase;
                color: #333;
                padding: 0px;
            }

            .thead-inverse th {
                font-weight: normal;
                font-size: 14px;
            }

            .table th {
                padding: 0.35rem;
                border-top: 1px solid #dee2e6;
                text-align: center;
            }

            .table td {
                font-size: 0.92rem;
            }

            .label2 {
                background-color: rgb(107,144,218);
                color: white;
                padding: 1px 7px 2px 7px;
                font-size: 24px;
                border-radius: 3px;
                font-weight: bold;
            }</style>
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
                                <b>Home</b>
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
                    </form>
                </div>
            </div>

            <a href="<%=request.getContextPath()%>/MarkReport">MarkReport</a>
            <br/>
            <a href="<%=request.getContextPath()%>/GradeTranscript">GradeTranscript</a>
        </div>

    </body>
</html>
