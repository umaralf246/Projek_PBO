/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kampus.model;

public class Barang {
    private int id;
    private String namaBarang;
    private String deskripsi;
    private int stokTotal;    // <--- Pastikan ini ada
    private int stokTersedia;
    private String gambar;

    public Barang() {}

    // Constructor, Getter, dan Setter
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNamaBarang() { return namaBarang; }
    public void setNamaBarang(String namaBarang) { this.namaBarang = namaBarang; }

    public String getDeskripsi() { return deskripsi; }
    public void setDeskripsi(String deskripsi) { this.deskripsi = deskripsi; }

    // --- INI YANG PENTING BIAR GAK / 0 ---
    public int getStokTotal() { return stokTotal; }
    public void setStokTotal(int stokTotal) { this.stokTotal = stokTotal; }
    // -------------------------------------

    public int getStokTersedia() { return stokTersedia; }
    public void setStokTersedia(int stokTersedia) { this.stokTersedia = stokTersedia; }

    public String getGambar() { return gambar; }
    public void setGambar(String gambar) { this.gambar = gambar; }
}