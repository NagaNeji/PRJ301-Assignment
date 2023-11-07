/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.authentication;

import dal.AccountDBContext;
import dal.CampusDBContext;
import entity.Account;
import entity.Campus;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

/**
 *
 * @author PC
 */
public class LoginController extends HttpServlet {

    /**
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        CampusDBContext campusDB = new CampusDBContext();
        ArrayList<Campus> listCampus = campusDB.getList();
        req.setAttribute("list", listCampus);
        req.getRequestDispatcher("view/login.jsp").forward(req, resp);

    }

    /**
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String campusId = req.getParameter("campus");
        Account param = new Account();
        param.setUsername(username);
        param.setPassword(password);
        param.setCampusId(campusId);
        AccountDBContext db = new AccountDBContext();
        Account loggedUser = db.get(param);

        if (loggedUser == null || (loggedUser.getCampusId() == null ? param.getCampusId() != null : !loggedUser.getCampusId().equals(param.getCampusId()))) {
            req.setAttribute("checkAuthentication", "F");
            CampusDBContext campusDB = new CampusDBContext();
            ArrayList<Campus> listCampus = campusDB.getList();
            req.setAttribute("list", listCampus);
            req.getRequestDispatcher("view/login.jsp").forward(req, resp);
        } else {
            String remember = req.getParameter("remember");

            HttpSession session = req.getSession();
            session.setAttribute("account", loggedUser);

            if (remember != null) {
                Cookie c_user = new Cookie("user", username);
                Cookie c_pass = new Cookie("pass", password);
                c_user.setMaxAge(3600 * 24);
                c_pass.setMaxAge(3600 * 24);
                resp.addCookie(c_user);
                resp.addCookie(c_pass);
            }
            resp.sendRedirect("home");
        }

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

    protected void processRequest(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
    }

}
