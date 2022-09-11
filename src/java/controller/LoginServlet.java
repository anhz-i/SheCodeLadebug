package controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import DAL.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author Hp
 */
@WebServlet(urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User us = (User) session.getAttribute("user");
        if (us != null) {
            response.sendRedirect("project");
        } else {
            request.getRequestDispatcher("view/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("do post login");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");

        if (!Character.isLetter(email.charAt(email.length() - 1))) {
            request.setAttribute("error", "Error Login!");
            request.getRequestDispatcher("view/login.jsp").forward(request, response);

        }
        UserDAO u = new UserDAO();
        User user;
        try {
            user = u.getUser(email, pass);
            if (user == null) {
                request.setAttribute("error", "Email or password is incorrect!");
                request.getRequestDispatcher("view/login.jsp").forward(request, response);

            } else {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                System.out.println(user.getEmail());
//                Cookie e = new Cookie("emailC", email);
//                Cookie p = new Cookie("passC", pass);
//                e.setMaxAge(60 * 60 * 24 * 7);
//                p.setMaxAge(60 * 60 * 24 * 7);
//                response.addCookie(e);
//                response.addCookie(p);
                response.sendRedirect("project");
            }
        } catch (Exception ex) {
            System.out.println(ex);
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
