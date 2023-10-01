/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.authentication;

import dal.AccountDBContext;
import entity.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

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

              req.getRequestDispatcher("view/authentication/login.jsp").forward(req, resp);

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
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        Account param = new Account();
        System.out.println(username+password);
        param.setUsername(username);
        param.setPassword(password);

        AccountDBContext db = new AccountDBContext();
        Account loggedUser = db.get(param);

        if (loggedUser == null) {
            resp.getWriter().println("incorrect username or password");
        } else {
            resp.getWriter().println("Hello " + loggedUser.getDisplayname());
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

}
