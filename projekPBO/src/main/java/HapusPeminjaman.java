import com.kampus.util.KoneksiDB;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class HapusPeminjaman extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idStr = request.getParameter("id_peminjaman");
        
        if(idStr != null) {
            int id = Integer.parseInt(idStr);
            try (Connection conn = KoneksiDB.getConnection()) {
                // Query Hapus
                String query = "DELETE FROM peminjaman WHERE id = ?";
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setInt(1, id);
                ps.executeUpdate();
                
                response.sendRedirect("dashboard_admin.jsp?status=hapus_sukses");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}