/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDate;

/**
 *
 * @author Hp
 */
public class Project {

    private int id;
    private String name;
    private String color;
    private String date = LocalDate.now().toString();
    private int UserID;

    public Project() {
        date = LocalDate.now().toString();
    }

    public Project(int id, String name, String color, String date, int UserID) {
        this.id = id;
        this.name = name;
        this.color = color;
        this.date = date;
        this.UserID = UserID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }
    
}
