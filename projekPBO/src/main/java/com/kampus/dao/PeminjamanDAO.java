package com.kampus.dao;

import com.kampus.model.Peminjaman;
import com.kampus.util.KoneksiDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PeminjamanDAO {
    
    // 1. INPUT PEMINJAMAN (Kurangi Stok)
    public boolean tambahPeminjaman(Peminjaman p) {
        Connection conn = null;
        PreparedStatement psInsert = null;
        PreparedStatement psUpdate = null;
        boolean berhasil = false;
        
        String queryInsert = "INSERT INTO peminjaman (user_id, barang_id, jumlah, tgl_pinjam, tgl_kembali, keperluan, status) VALUES (?, ?, ?, ?, ?, ?, 'Dipinjam')";
        String queryUpdate = "UPDATE barang SET stok_tersedia = stok_tersedia - ? WHERE id = ?";
        
        try {
            conn = KoneksiDB.getConnection();
            conn.setAutoCommit(false); // Mulai Transaksi
            
            psInsert = conn.prepareStatement(queryInsert);
            psInsert.setInt(1, p.getUserId());
            psInsert.setInt(2, p.getBarangId());
            psInsert.setInt(3, p.getJumlah());
            psInsert.setDate(4, p.getTglPinjam());
            psInsert.setDate(5, p.getTglKembali());
            psInsert.setString(6, p.getKeperluan());
            psInsert.executeUpdate();
            
            psUpdate = conn.prepareStatement(queryUpdate);
            psUpdate.setInt(1, p.getJumlah());
            psUpdate.setInt(2, p.getBarangId());
            psUpdate.executeUpdate();
            
            conn.commit(); // Simpan Transaksi
            berhasil = true;
            
        } catch (SQLException e) {
            e.printStackTrace();
            try { if (conn != null) conn.rollback(); } catch (SQLException ex) {}
        } finally {
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
        return berhasil;
    }

    // 2. LIHAT SEMUA DATA (Untuk Admin)
    public List<Peminjaman> getAllPeminjaman() {
        List<Peminjaman> list = new ArrayList<>();
        // Join 3 Tabel: peminjaman, users, barang
        String query = "SELECT p.*, u.nama AS nama_peminjam, b.nama_barang " +
                       "FROM peminjaman p " +
                       "JOIN users u ON p.user_id = u.id " +
                       "JOIN barang b ON p.barang_id = b.id " +
                       "ORDER BY p.id DESC"; // Yang terbaru paling atas
        
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            
            while(rs.next()) {
                Peminjaman p = new Peminjaman();
                p.setId(rs.getInt("id"));
                p.setUserId(rs.getInt("user_id"));
                p.setBarangId(rs.getInt("barang_id"));
                p.setJumlah(rs.getInt("jumlah"));
                p.setTglPinjam(rs.getDate("tgl_pinjam"));
                p.setTglKembali(rs.getDate("tgl_kembali"));
                p.setKeperluan(rs.getString("keperluan"));
                p.setStatus(rs.getString("status"));
                
                // Set Data Tambahan (Nama Mahasiswa & Barang)
                p.setNamaPeminjam(rs.getString("nama_peminjam"));
                p.setNamaBarang(rs.getString("nama_barang"));
                
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // 3. PROSES PENGEMBALIAN (Tambah Stok Balik)
    public boolean kembalikanBarang(int idPeminjaman, int idBarang, int jumlah) {
        Connection conn = null;
        PreparedStatement psStatus = null;
        PreparedStatement psStok = null;
        boolean berhasil = false;
        
        String queryStatus = "UPDATE peminjaman SET status = 'Kembali' WHERE id = ?";
        String queryStok = "UPDATE barang SET stok_tersedia = stok_tersedia + ? WHERE id = ?";
        
        try {
            conn = KoneksiDB.getConnection();
            conn.setAutoCommit(false); // Mulai Transaksi
            
            // Update Status jadi 'Kembali'
            psStatus = conn.prepareStatement(queryStatus);
            psStatus.setInt(1, idPeminjaman);
            psStatus.executeUpdate();
            
            // Balikin Stok Barang
            psStok = conn.prepareStatement(queryStok);
            psStok.setInt(1, jumlah);
            psStok.setInt(2, idBarang);
            psStok.executeUpdate();
            
            conn.commit();
            berhasil = true;
        } catch (SQLException e) {
            e.printStackTrace();
            try { if (conn != null) conn.rollback(); } catch (SQLException ex) {}
        } finally {
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
        return berhasil;
    }
}