/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kampus.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class KoneksiDB {
    // PERBAIKAN 1: Ganti 'db_kampus' jadi 'projekPBO' sesuai pgAdmin kamu
    private static final String URL = "jdbc:postgresql://localhost:5432/projekPBO";
    
    // PERBAIKAN 2: Pastikan username & password benar
    private static final String USER = "postgres"; // Username default
    private static final String PASS = "123"; // <--- WAJIB DIGANTI dengan password PostgreSQL kamu saat install
    
    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection(URL, USER, PASS);
            // System.out.println("Koneksi Berhasil"); // Boleh dinyalakan buat cek di Output Netbeans
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Gagal Koneksi: " + e.getMessage()); // Biar tau errornya apa di Output
        }
        return conn;
    }
}