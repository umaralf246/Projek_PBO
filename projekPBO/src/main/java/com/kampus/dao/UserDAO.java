/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kampus.dao;

import com.kampus.model.User;
import com.kampus.util.KoneksiDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
    
    // Method untuk mengecek login
    public User login(String nimNip, String password) {
        User user = null;
        String query = "SELECT * FROM users WHERE nim_nip = ? AND password = ?";
        
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, nimNip);
            ps.setString(2, password);
            
            ResultSet rs = ps.executeQuery();
            
            // Jika data ditemukan
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setNimNip(rs.getString("nim_nip"));
                user.setNama(rs.getString("nama"));
                user.setRole(rs.getString("role")); // Penting: Admin atau Mahasiswa
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}
