/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mark;

import controller.authentication.BasedRequiredAuthenticationController;
import dal.EnrollmentDBContext;
import dal.ScoreDBContext;
import entity.Account;
import entity.Enrollment;
import entity.Score;
import entity.Semester;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author PC
 */
@WebServlet(name = "MarkReport", urlPatterns = {"/MarkReport"})
public class MarkReport extends BasedRequiredAuthenticationController {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Account LoggedUser)
            throws ServletException, IOException {
        ScoreDBContext scoreDB = new ScoreDBContext();
        EnrollmentDBContext enrollmentDB = new EnrollmentDBContext();

        ArrayList<Semester> listSemester = enrollmentDB.getListSemesterByStudentId(LoggedUser.getStudentId());
        request.setAttribute("listSemester", listSemester);

        String nameSemesterClicked = request.getParameter("semester");
        if (nameSemesterClicked==null) {
            nameSemesterClicked = listSemester.get(listSemester.size() - 1).getSemesterName();
        }
        ArrayList<Enrollment> listEnrollmentWithNameSemesterClicked = enrollmentDB.getListEnrollmentBySemesterName(nameSemesterClicked);
        request.setAttribute("listEnrollmentWithNameSemesterClicked", listEnrollmentWithNameSemesterClicked);

        request.setAttribute("nameSemesterClicked", nameSemesterClicked);

        String idEnrollmentClicked = request.getParameter("course");
        ArrayList<Score> listScoreByEnrollmentId = scoreDB.getListScoreByEnrollmentId(idEnrollmentClicked);
        request.setAttribute("idEnrollmentClicked", idEnrollmentClicked);
        request.setAttribute("listScoreByEnrollmentId", listScoreByEnrollmentId);

        request.setAttribute("average", scoreDB.getAverage(listScoreByEnrollmentId));
        request.setAttribute("status", scoreDB.getStatus(listScoreByEnrollmentId));
        request.getRequestDispatcher("view/markreport.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser) throws ServletException, IOException {
        processRequest(request, response, LoggedUser);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser) throws ServletException, IOException {
        processRequest(request, response, LoggedUser);
    }

}
