/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAL.ProjectDAO;
import DAL.SectionDAO;
import DAL.TaskDAO;
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
import model.Section;
import model.Task;
import model.User;

/**
 *
 * @author Hp
 */
@WebServlet(name = "Search", urlPatterns = {"/search"})
public class Search extends HttpServlet {

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
        request.getRequestDispatcher("view/Search.jsp").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        ProjectDAO p = new ProjectDAO();
        SectionDAO s = new SectionDAO();
        TaskDAO t = new TaskDAO();

        String name = request.getParameter("txt");
        try {
            HttpSession session = request.getSession();
            User u = (User) session.getAttribute("user");
            List<Project> project = p.searchProjectbyName(name, u.getEmail());
            List<Section> section = s.searchSectionbyName(name, u.getEmail());
            List<Task> task = t.searchTaskbyName(name, u.getId());
            for (Project ip : project) {
                out.print("<div class=\"task\">\n"
                        + "<a href=\"projectcheck?id=" + ip.getId() + "\">" + ip.getName() + "</a>\n"
                        + "<i style=\"color:grey;\">Project</i>"
                        + "                        </div>\n"
                        + "                        <hr>");
            }
            for (Section is : section) {
                out.print("<div class=\"task\">\n"
                        + "<a href=\"projectcheck?id=" + is.getProjectID() + "\">" + is.getName() + "</a>\n"
                        + "<i style=\"color:grey;\">Section</i>"
                        + "                        </div>\n"
                        + "                        <hr>");
            }
            for (Task it : task) {
                if (it.getProjectID() == null) {
                    out.print("<div class=\"task\">\n"
                            + "<a href=\"project\">" + it.getName() + "</a>\n"
                            + "<i style=\"color:grey;\">Task</i>"
                            + "                        </div>\n"
                            + "                        <hr>");
                } else {
                    out.print("<div class=\"task\">\n"
                            + "<a href=\"projectcheck?id=" + it.getProjectID() + "\">" + it.getName() + "</a>\n"
                            + "<i style=\"color:grey;\">Task</i>"
                            + "                        </div>\n"
                            + "                        <hr>");
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(Search.class.getName()).log(Level.SEVERE, null, ex);
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
