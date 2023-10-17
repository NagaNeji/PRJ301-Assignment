/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mark;

import controller.authentication.BasedRequiredAuthenticationController;
import dal.CourseDBContext;
import dal.EnrollmentDBContext;
import dal.GradeDBContext;
import dal.StudentDBContext;
import entity.Account;
import entity.Course;
import entity.Enrollment;
import entity.Grade;
import entity.Student;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
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
     * @param LoggedUser
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CourseDBContext cDB = new CourseDBContext();
        StudentDBContext sDB = new StudentDBContext();
        GradeDBContext gDB = new GradeDBContext();
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        EnrollmentDBContext eDB = new EnrollmentDBContext();
        ArrayList<String> listSemesterName = eDB.getListSemesterNameByStudent(sDB.getById(a.getStudentid()));
        request.setAttribute("listSemesterName", listSemesterName);
        String nameSemesterClicked = request.getParameter("semester");
        ArrayList<Course> listCourseWithNameSemesterClicked = cDB.getListEnrollmentBySemesterName(nameSemesterClicked);
        request.setAttribute("listCourseWithNameSemesterClicked", listCourseWithNameSemesterClicked);
        request.setAttribute("nameSemesterClicked",nameSemesterClicked);
        String idCourseClicked = request.getParameter("course");
        Grade grade = gDB.getGradeBySemesterNameAndCourseID(nameSemesterClicked, idCourseClicked);
        request.setAttribute("grade", grade);
        request.setAttribute("status", grade.checkStatusGrade(grade));
        request.getRequestDispatcher("view/mark/markreport.jsp").forward(request, response);
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
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser) throws ServletException, IOException {
        processRequest(request, response);
    }

}
