/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import com.kampus.dao.PeminjamanDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ProsesPengembalian extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            // Ambil data dari form admin (hidden input)
            int idPeminjaman = Integer.parseInt(request.getParameter("id_peminjaman"));
            int idBarang = Integer.parseInt(request.getParameter("id_barang"));
            int jumlah = Integer.parseInt(request.getParameter("jumlah"));
            
            PeminjamanDAO dao = new PeminjamanDAO();
            boolean sukses = dao.kembalikanBarang(idPeminjaman, idBarang, jumlah);
            
            if (sukses) {
                response.sendRedirect("dashboard_admin.jsp?status=kembali_sukses");
            } else {
                response.sendRedirect("dashboard_admin.jsp?status=gagal");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("dashboard_admin.jsp?status=error");
        }
    }
}