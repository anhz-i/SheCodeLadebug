/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Section;

/**
 *
 * @author Hp
 */
public class SectionDAO {

    Connection con;
    String status;

    public SectionDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    public List<Section> getAll() throws Exception {
        ArrayList<Section> ar = new ArrayList<>();
        String sql = "select * from  Sections";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ar.add(new Section(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4)));
            }
        } catch (SQLException e) {
            status = "Error at read section" + e.getMessage();
        }
        return ar;
    }

    public List<Section> getSectionbyIDProject(int idPro) throws Exception {
        String sql = "select * from  Sections  where ProjectID=?";
        ArrayList<Section> ar = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, idPro);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ar.add(new Section(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4)));
            }
        } catch (SQLException e) {
            status = "Error at read section" + e.getMessage();
        }
        return ar;
    }

    public List<Section> searchSectionbyName(String name, String email) throws Exception {
        String sql = "select * from  Sections  where [name] like ? and UserID=?";
        ArrayList<Section> ar = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            ps.setString(2, email);            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ar.add(new Section(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4)));
            }
        } catch (SQLException e) {
            status = "Error at read Section" + e.getMessage();
        }
        return ar;
    }

    public Section getSectionbyID(int id) throws Exception {
        String sql = "select * from  Sections  where id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Section s = new Section(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
                return s;
            }
        } catch (SQLException e) {
            status = "Error at read section" + e.getMessage();
        }
        return null;
    }

    public void Insert(int id, String name, String date, int projectID) {
        String sql = "insert into  Sections  values(?,?,?,?)"; //insert database
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setString(3, date);
            ps.setInt(4, projectID);
            ps.execute();
        } catch (SQLException e) {
            status = "Error at Insert Student" + e.getMessage();
        }
    }

    public void Update(int id, String name) {
        String sql = "update  Sections  set [name]=? where id=?;";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(2, id);
            ps.setString(1, name);
            ps.execute();
        } catch (SQLException e) {
            status = "Error at Update Projects" + e.getMessage();
        }
        System.out.println("updated");
    }

    public void Delete(int id) {
        String sql = "delete from  Sections  where id=?;";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.execute();
        } catch (SQLException e) {
            status = "Error at delete Projects" + e.getMessage();
        }
    }

    public static void main(String[] args) throws Exception {
        SectionDAO s = new SectionDAO();
        s.Insert(1, "kkk", null, 1);
        System.out.println(s.getSectionbyID(1).getName());
    }
}
