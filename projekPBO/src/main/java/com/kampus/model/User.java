/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kampus.model;

public class User {
    private int id;
    private String nimNip;
    private String nama;
    private String password;
    private String role;

    public User() {}

    // Constructor lengkap
    public User(int id, String nimNip, String nama, String password, String role) {
        this.id = id;
        this.nimNip = nimNip;
        this.nama = nama;
        this.password = password;
        this.role = role;
    }
    
    // Getter Setter (Penting!)
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getNimNip() { return nimNip; }
    public void setNimNip(String nimNip) { this.nimNip = nimNip; }
    public String getNama() { return nama; }
    public void setNama(String nama) { this.nama = nama; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }
}