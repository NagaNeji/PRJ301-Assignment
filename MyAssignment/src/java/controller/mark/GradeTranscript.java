/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mark;

import controller.authentication.BasedRequiredAuthenticationController;
import dal.EnrollmentDBContext;
import dal.MajorCourseDBContext;
import dal.ScoreDBContext;
import dal.StudentDBContext;
import entity.Account;
import entity.Enrollment;
import entity.GradeReportRow;
import entity.MajorCourse;
import entity.Score;
import entity.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "GradeTranscript", urlPatterns = {"/GradeTranscript"})
public class GradeTranscript extends BasedRequiredAuthenticationController {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @param LoggedUser
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Account LoggedUser)
            throws ServletException, IOException {
        ControllerGradeReport controller = new ControllerGradeReport();
        ArrayList<GradeReportRow> listGradeReportRow = new ArrayList<>();
        StudentDBContext db = new StudentDBContext();
        Student s = db.getById(LoggedUser.getStudentId());
        request.setAttribute("student", s);

        listGradeReportRow = controller.getListGradeTranscriptRowByStudentId(LoggedUser.getStudentId());

        listGradeReportRow.size();
        request.setAttribute("listGradeReportRow", listGradeReportRow);
        request.getRequestDispatcher("view/gradetranscript.jsp").forward(request, response);
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
