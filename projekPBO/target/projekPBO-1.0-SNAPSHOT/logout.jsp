<%
    session.invalidate(); // Hapus sesi
    response.sendRedirect("login.jsp"); // Balik ke login
%>