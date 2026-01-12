/*
 * Pastikan package ini sesuai dengan struktur foldermu.
 * Jika file ini ada di dalam "Source Packages > (default package)", hapus baris package ini.
 * Jika ada di com.kampus.controller, biarkan.
 */
// package com.kampus.controller; 

import com.kampus.dao.PeminjamanDAO;
import com.kampus.model.Peminjaman;
import com.kampus.model.User; // Kita butuh data user yg sedang login
import java.io.IOException;
import java.sql.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ProsesPeminjaman extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Cek User dari Session (Keamanan)
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            // Kalau belum login, lempar keluar
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // 2. Ambil data dari Form (Nanti formnya kita buat kirim ID Barang)
            // 'barang_id' nanti dikirim dari form input hidden atau select option
            int barangId = Integer.parseInt(request.getParameter("barang_id")); 
            int jumlah = Integer.parseInt(request.getParameter("jumlah"));
            Date tglPinjam = Date.valueOf(request.getParameter("tgl_pinjam"));
            Date tglKembali = Date.valueOf(request.getParameter("tgl_kembali"));
            String keperluan = request.getParameter("keperluan");

            // 3. Masukkan ke Objek Model Baru
            // Constructor: (userId, barangId, jumlah, tglPinjam, tglKembali, keperluan)
            Peminjaman p = new Peminjaman(user.getId(), barangId, jumlah, tglPinjam, tglKembali, keperluan);

            // 4. Simpan ke Database
            PeminjamanDAO dao = new PeminjamanDAO();
            boolean berhasil = dao.tambahPeminjaman(p);

            // 5. Redirect
            if (berhasil) {
                response.sendRedirect("dashboard_mahasiswa.jsp?status=sukses");
            } else {
                response.sendRedirect("dashboard_mahasiswa.jsp?status=gagal");
            }

        } catch (Exception e) {
            e.printStackTrace();
            // Jika error, kembalikan ke dashboard
            response.sendRedirect("dashboard_mahasiswa.jsp?status=error");
        }
    }
}