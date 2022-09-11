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
import model.User;

/**
 *
 * @author Hp
 */
public class UserDAO {

    Connection con;
    String status;

    public UserDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    public List<User> getAll() throws Exception {
        ArrayList<User> ar = new ArrayList<>();
        String sql = "select * from [User]";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ar.add(new User(rs.getString(2), rs.getString(3)));
                
            }
        } catch (SQLException e) {
            status = "Error at read account" + e.getMessage();
        }
        return ar;
    }

    public User getUserbyEmail(String email) throws Exception {
        String sql = "select * from [User] where email=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getString(1), rs.getString(2), rs.getString(3));
                return u;
            }
        } catch (SQLException e) {
            status = "Error at read account" + e.getMessage();
        }
        return null;
    }

    public User getUser(String email, String pass) throws Exception {
        String sql = "select * from [User] where email=? and [User].pass=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6));
                return u;
            }
        } catch (SQLException e) {
            status = "Error at read account" + e.getMessage();
        }
        return null;
    }

    public void Insert(String email, String password) {
        String sql = "insert into [User] ([name], email, [password]) \n"
                + "values(?,?,?)";
        String name = email.split("@")[0];
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.execute();
        } catch (SQLException e) {
            status = "Error at Insert Account" + e.getMessage();
        }
        System.out.println("done");
    }

    public void Update(String name, String email, String password) {
        String sql = "update [User] set [name]=?, [password]=? where email=?;";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(3, email);
            ps.setString(1, name);
            ps.setString(2, password);
            ps.execute();
        } catch (SQLException e) {
            status = "Error at Update Account" + e.getMessage();
        }
        System.out.println("updated");
    }

    public void Delete(String email) {
        String sql = "delete from [User] where email=?;";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.execute();
        } catch (SQLException e) {
            status = "Error at delete Account" + e.getMessage();
        }
        System.out.println("done");
    }

    public static void main(String[] args) throws Exception {
        UserDAO u = new UserDAO();
        //User ue = u.getUser("", "345");
        //u.Insert("anhkthhe@gmail.com", "123");
////        u.Delete("anhnapu2002@gmail.com");
//        User user = u.getUserbyEmail("anhnapu2002@gmail.com");
//        u.Update(user.getName(), user.getEmail(), "456");
//        user = u.getUserbyEmail("anhkthhe160643@fpt.edu.vn");
//        System.out.println(user.getPassword());
        List<User> listu = u.getAll();
        for (User user : listu) {
            System.out.println(user.getEmail());
        }
//       u.Delete("anhkthhe@gmail.com");
//       listu = u.getAll();
//        for (User user : listu) {
//            System.out.println(user.getEmail());
//        }
    }
}
