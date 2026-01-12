/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kampus.dao;

import com.kampus.model.Barang;
import com.kampus.util.KoneksiDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BarangDAO {

    // Method untuk mengambil SEMUA barang
    public List<Barang> getAllBarang() {
        List<Barang> listBarang = new ArrayList<>();
        String query = "SELECT * FROM barang ORDER BY id ASC";

        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Barang b = new Barang();
                b.setId(rs.getInt("id"));
                b.setNamaBarang(rs.getString("nama_barang"));
                b.setDeskripsi(rs.getString("deskripsi"));
                b.setStokTotal(rs.getInt("stok_total"));
                b.setStokTersedia(rs.getInt("stok_tersedia"));
                b.setGambar(rs.getString("gambar"));
                
                listBarang.add(b);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return listBarang;
    }
    
    // Nanti kita tambah method kurangiStok() di sini
}
