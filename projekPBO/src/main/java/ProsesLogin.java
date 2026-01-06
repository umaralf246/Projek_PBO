/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import com.kampus.dao.UserDAO;
import com.kampus.model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ProsesLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Ambil input dari form
        String nim = request.getParameter("nim");
        String pass = request.getParameter("password");
        
        // 2. Cek ke database via DAO
        UserDAO dao = new UserDAO();
        User user = dao.login(nim, pass);
        
        // 3. Logika Validasi
        if (user != null) {
            // LOGIN SUKSES
            
            // Buat Session (Supaya server ingat siapa yg login)
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            session.setAttribute("role", user.getRole());
            
            // Redirect sesuai Role
            if ("admin".equals(user.getRole())) {
                response.sendRedirect("dashboard_admin.jsp");
            } else {
                response.sendRedirect("dashboard_mahasiswa.jsp");
            }
            
        } else {
            // LOGIN GAGAL -> Balikin ke login page dengan pesan error
            response.sendRedirect("login.jsp?error=gagal");
        }
    }
}