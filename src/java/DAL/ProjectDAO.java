/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import model.Project;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Hp
 */
public class ProjectDAO {

    Connection con;
    String status;

    public ProjectDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    public List<Project> getAll() throws Exception {
        ArrayList<Project> ar = new ArrayList<>();
        String sql = "select * from  Projects";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ar.add(new Project(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5)));
            }
        } catch (SQLException e) {
            status = "Error at read account" + e.getMessage();
        }
        return ar;
    }

    public List<Project> getProjectbyUserID(int id) throws Exception {
        String sql = "select * from Projects where UserID=?";
        ArrayList<Project> ar = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ar.add(new Project(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5)));
            }
        } catch (SQLException e) {
            status = "Error at read account" + e.getMessage();
        }
        return ar;
    }

    public List<String> getEmailPermission(int id) {
        ArrayList<String> ar = new ArrayList<>();
        String sql = "select email from  Permission where ProjectID = ?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ar.add(rs.getString(1));                
            }
        } catch (SQLException e) {
            status = "Error at read account" + e.getMessage();
        }
        return ar;
    }

    public List<Project> searchProjectbyName(String name, String email) throws Exception {
        String sql = "select * from Projects where [name] like ? and UserID=?";
        ArrayList<Project> ar = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            ps.setString(2, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ar.add(new Project(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5)));
            }
        } catch (SQLException e) {
            status = "Error at read project" + e.getMessage();
        }
        return ar;
    }

    public Project getProject(int id) throws Exception {
        String sql = "select * from Projects where id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Project p = new Project(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5));
                return p;
            }
        } catch (SQLException e) {
            status = "Error at read account" + e.getMessage();
        }
        return null;
    }

    public void Insert(int id, String name, String color, String date, String email, String view) {
        String sql = "insert into Projects values(?,?,?,?,?,?)"; //insert database
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setString(3, color);
            ps.setString(4, date);
            ps.setString(5, email);
            ps.setString(6, view);
            ps.execute();
        } catch (SQLException e) {
            status = "Error at Insert Student" + e.getMessage();
        }
    }

    public void Update(int id, String name, String color, String view) {
        String sql = "update Projects set [name]=?, color=?, [view]=? where id=?;";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(4, id);
            ps.setString(1, name);
            ps.setString(2, color);
            ps.setString(3, view);
            ps.execute();
        } catch (SQLException e) {
            status = "Error at Update Projects" + e.getMessage();
        }
        System.out.println("updated");
    }

    public void Delete(int id) {
        String sql = "delete from Projects where id=?;";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.execute();
        } catch (SQLException e) {
            status = "Error at delete Projects" + e.getMessage();
        }
    }

    public void ProjectShare(String email, int id) {
        String sql = "insert into Permission values(?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setInt(2, id);
            ps.execute();
        } catch (Exception ex) {
            Logger.getLogger(ProjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    public void DeletePermission(int id, String email) {
        String sql = "delete from Permission where ProjectID=? and email=?;";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, email);
            ps.execute();
        } catch (SQLException e) {
            status = "Error at delete Projects" + e.getMessage();
        }
    }

    public static void main(String[] args) throws Exception {
        ProjectDAO p = new ProjectDAO();
        List<Project> list;
//        p.Insert(list.get(list.size() - 1).getId() + 1, "prj2", "brown", LocalDate.now().toString(), null, null);
        //list = p.getAll();
        //System.out.println(list.get(2).getDate());
//        p.Delete(4);
        list = p.getProjectbyUserID(1);
        //System.out.println("1." + list.get(0).getName());
        for (Project item : list) {
            System.out.println(". " + item.getName());
        }

    }
}
