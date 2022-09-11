/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAL.TaskDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author Hp
 */
@WebServlet(name = "AddTask", urlPatterns = {"/addtask"})
public class AddTask extends HttpServlet {

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
            out.println("<title>Servlet AddTask</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddTask at " + request.getContextPath() + "</h1>");
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
        String proid = request.getParameter("projectid");
        String secid = request.getParameter("sectionid");
        request.setAttribute("secid", secid);
        request.setAttribute("proid", proid);
        request.getRequestDispatcher("view/AddTask.jsp").forward(request, response);

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
        String proid = request.getParameter("projectid");
        String secid = request.getParameter("sectionid");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String startdate = LocalDate.now().toString();
        String duedate = request.getParameter("duedate");
        String priority = request.getParameter("priority");
        int id;
        TaskDAO t = new TaskDAO();
        try {
            if (t.getAll().isEmpty()) {
                id = 1;
            } else {
                id = t.getAll().get(t.getAll().size() - 1).getId() + 1;
            }
//            
            if (secid.isEmpty()) {
                secid = null;
            }
            if (proid.isEmpty()) {
                proid = null;
            }
            HttpSession session = request.getSession();
            User u = (User) session.getAttribute("user");
            t.Insert(id, name, startdate, duedate, description,  Integer.parseInt(priority), "", secid, proid, u.getId(), "");
            if (secid == null && proid == null) {
                response.sendRedirect("project");
            } else {
                response.sendRedirect("projectcheck?id=" + proid);
            }
        } catch (Exception ex) {
            Logger.getLogger(AddTask.class.getName()).log(Level.SEVERE, null, ex);
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
