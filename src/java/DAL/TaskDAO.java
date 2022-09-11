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
import model.Task;

public class TaskDAO {

    Connection con;
    String status;

    public TaskDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    public List<Task> getAll() throws Exception {
        ArrayList<Task> ar = new ArrayList<>();
        String sql = "select * from Tasks ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ar.add(new Task(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getString(11)));

            }
        } catch (SQLException e) {
            status = "Error at read account" + e.getMessage();
        }
        return ar;
    }

    public List<Task> getTaskbySectionID(int idSection) throws Exception {
        String sql = "select * from Tasks where SectionID=?";
        ArrayList<Task> ar = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, idSection);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ar.add(new Task(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getString(11)));

            }
        } catch (SQLException e) {
            status = "Error at read account" + e.getMessage();
        }
        return ar;
    }

    public List<Task> getTaskbyPriority(int priority) throws Exception {
        String sql = "select * from Tasks where priority=? order by DueDate";
        ArrayList<Task> ar = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, priority);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ar.add(new Task(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getString(11)));

            }
        } catch (SQLException e) {
            status = "Error at read account" + e.getMessage();
        }
        return ar;
    }

    public List<Task> getTaskbyProjectID(int idPro) throws Exception {
        String sql = "select * from Tasks where ProjectID=?";
        ArrayList<Task> ar = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, idPro);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ar.add(new Task(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getString(11)));

            }
        } catch (SQLException e) {
            status = "Error at read account" + e.getMessage();
        }
        return ar;
    }

    public List<Task> getTaskbyUserID(int id) throws Exception {
        String sql = "select * from Tasks where UserID=?";
        ArrayList<Task> ar = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ar.add(new Task(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getString(11)));

            }
        } catch (SQLException e) {
            status = "Error at read account" + e.getMessage();
        }
        return ar;
    }

    public List<Task> searchTaskbyName(String name, int id) throws Exception {
        String sql = "select * from Tasks where [name] like ? and UserID=?";
        ArrayList<Task> ar = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            ps.setInt(2, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ar.add(new Task(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getString(11)));
            }
        } catch (SQLException e) {
            status = "Error at read Task" + e.getMessage();
        }
        return ar;
    }

    public List<Task> searchTaskbyDueDate(String dueDate, int id) throws Exception {
        String sql = "select * from Tasks where DueDate = ? and UserID=?";
        ArrayList<Task> ar = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, dueDate);
            ps.setInt(2, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ar.add(new Task(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getString(11)));
            }
        } catch (SQLException e) {
            status = "Error at read Task" + e.getMessage();
        }
        return ar;
    }

    public List<Task> getTaskOverdate(String dueDate, int id) throws Exception {
        String sql = "select * from Tasks where DueDate < ? and UserID=? order by DueDate desc";
        ArrayList<Task> ar = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, dueDate);
            ps.setInt(2, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ar.add(new Task(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getString(11)));
            }
        } catch (SQLException e) {
            status = "Error at read Task" + e.getMessage();
        }
        return ar;
    }

    public List<Task> getTaskUpcoming(String dueDate, int id) throws Exception {
        String sql = "select * from Tasks where DueDate > ? or DueDate is null and UserID=? order by DueDate desc";
        ArrayList<Task> ar = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, dueDate);
            ps.setInt(2, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ar.add(new Task(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getString(11)));
            }
        } catch (SQLException e) {
            status = "Error at read Task" + e.getMessage();
        }
        return ar;
    }

    public Task getTask(int id) throws Exception {
        String sql = "select * from Tasks where id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Task t = new Task(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getString(11));
                return t;
            }
        } catch (SQLException e) {
            status = "Error at read account" + e.getMessage();
        }
        return null;
    }

    public List<Task> TaskSortByPriority(int id) {
        String sql = "select * from Tasks where UserID=? order by priority ";
        ArrayList<Task> ar = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ar.add(new Task(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getString(11)));
            }
        } catch (SQLException e) {
            status = "Error at read Task" + e.getMessage();
        }
        return ar;
    }

    public List<Task> TaskSortByDueDate(int id) {
        String sql = "select * from Tasks where UserID=? order by DueDate";
        ArrayList<Task> ar = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ar.add(new Task(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getString(11)));
            }
        } catch (SQLException e) {
            status = "Error at read Task" + e.getMessage();
        }
        return ar;
    }

    public void Insert(int id, String name, String startDate, String dueDate, String description, int priority, String status, String sectionID, String projectID, int userID, String image) {
        String sql = "insert into Tasks values(?,?,?,?,?,?,?,?,?,?,?)"; //insert database                
        try {
            if (dueDate.isEmpty()) {
                dueDate = null;
            }
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setString(3, startDate);
            ps.setString(4, dueDate);
            ps.setString(5, description);
            ps.setInt(6, priority);
            ps.setString(7, status);
            ps.setString(8, sectionID);
            ps.setString(9, projectID);            
            ps.setInt(10, userID);
            ps.setString(11, image);            
            ps.execute();
        } catch (Exception e) {
            status = "Error at Insert Student" + e.getMessage();
        }
    }

    public void Update(int id, String name, String dueDate, String description, int priority) {
        String sql = "update Tasks set [name]=?, dueDate=?, description=?, priority=? where id=?;";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(5, id);
            ps.setString(1, name);
            ps.setString(2, dueDate);
            ps.setString(3, description);
            ps.setInt(4, priority);
            ps.execute();
        } catch (SQLException e) {
            status = "Error at Update Tasks " + e.getMessage();
        }
        System.out.println("updated");
    }

    public void Delete(int id) {
        String sql = "delete from Tasks where id=?;";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.execute();
        } catch (SQLException e) {
            status = "Error at delete Tasks " + e.getMessage();
        }
    }
    
    
    public static void main(String[] args) throws Exception {
        TaskDAO t = new TaskDAO();
        t.Insert(2, "kkk", "2022-07-08", "1900-01-01", "test", 1, "approve", "", "", 1, "");      
        List<Task> task = t.getTaskbyUserID(1);
        for (Task item : task) {
            System.out.println(item.getDueDate());
        }
    }

    

}
