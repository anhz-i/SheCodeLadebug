/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAL.ProjectDAO;
import DAL.SendEmail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Project;
import model.User;

/**
 *
 * @author Hp
 */
@WebServlet(name = "ShareProject", urlPatterns = {"/shareproject"})
public class ShareProject extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ShareProject</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShareProject at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String id = request.getParameter("id");
        ProjectDAO p = new ProjectDAO();
        Project pro = (Project) session.getAttribute("project");
        List<String> listemail;
        try {
            if (pro == null) {
                pro = p.getProject(Integer.parseInt(id));
                session.setAttribute("project", pro);
                listemail = p.getEmailPermission(Integer.parseInt(id));
            } else {
                listemail = p.getEmailPermission(pro.getId());
            }
            request.setAttribute("shareemail", listemail);
            request.getRequestDispatcher("view/ShareProject.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ShareProject.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Project pro = (Project) session.getAttribute("project");
        User user = (User) session.getAttribute("user");
        ProjectDAO p = new ProjectDAO();
        String email = request.getParameter("email");
        List<String> listemail = p.getEmailPermission(pro.getId());
        int kt=0;
        for (String item : listemail) {
            if (item.trim().equals(email.trim())) {
                request.setAttribute("mes", "Email existed!");
                kt = 1;
                request.getRequestDispatcher("view/ShareProject.jsp").forward(request, response);
//                request.getRequestDispatcher("shareproject?id=" + pro.getId()).forward(request, response);
        
            }
        }
        if (kt == 0) {            
            SendEmail.send(email.trim(), "Share Project", user.getEmail() + " share " + pro.getName().toUpperCase() + " project with you<br>" + "<a href=\"http://localhost:9999/FinalProject/project\">Visit project</a>", "vannths160268@fpt.edu.vn", "iwillgowhenfirstsnow");
            p.ProjectShare(email, pro.getId());
            response.sendRedirect("shareproject");
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
