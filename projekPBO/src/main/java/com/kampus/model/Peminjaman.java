package com.kampus.model;
import java.sql.Date;

public class Peminjaman {
    // Kolom Database utama
    private int id;
    private int userId;
    private int barangId;
    private int jumlah;
    private Date tglPinjam;
    private Date tglKembali;
    private String keperluan;
    private String status;
    
    // Atribut BANTUAN (Untuk ditampilkan di Tabel Admin/User)
    // Tidak disimpan ke tabel peminjaman, tapi diambil dari JOIN tabel users & barang
    private String namaPeminjam; 
    private String namaBarang;

    public Peminjaman() {}

    // Constructor untuk Input Data (Insert)
    public Peminjaman(int userId, int barangId, int jumlah, Date tglPinjam, Date tglKembali, String keperluan) {
        this.userId = userId;
        this.barangId = barangId;
        this.jumlah = jumlah;
        this.tglPinjam = tglPinjam;
        this.tglKembali = tglKembali;
        this.keperluan = keperluan;
    }
    
    // --- GETTER & SETTER LENGKAP ---

    // 1. ID (Penyebab Error tadi)
    public int getId() { return id; }
    public void setId(int id) { this.id = id; } // <--- INI YANG HILANG TADI

    // 2. Status (Penyebab Error tadi)
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; } // <--- INI JUGA HILANG

    // 3. Data User & Barang
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    
    public int getBarangId() { return barangId; }
    public void setBarangId(int barangId) { this.barangId = barangId; }

    // 4. Data Peminjaman
    public int getJumlah() { return jumlah; }
    public void setJumlah(int jumlah) { this.jumlah = jumlah; }

    public Date getTglPinjam() { return tglPinjam; }
    public void setTglPinjam(Date tglPinjam) { this.tglPinjam = tglPinjam; }

    public Date getTglKembali() { return tglKembali; }
    public void setTglKembali(Date tglKembali) { this.tglKembali = tglKembali; }

    public String getKeperluan() { return keperluan; }
    public void setKeperluan(String keperluan) { this.keperluan = keperluan; }

    // 5. Data Tambahan untuk Tampilan (Join)
    public String getNamaPeminjam() { return namaPeminjam; }
    public void setNamaPeminjam(String namaPeminjam) { this.namaPeminjam = namaPeminjam; }

    public String getNamaBarang() { return namaBarang; }
    public void setNamaBarang(String namaBarang) { this.namaBarang = namaBarang; }
}