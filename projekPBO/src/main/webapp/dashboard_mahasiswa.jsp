<%@page import="java.util.List"%>
<%@page import="com.kampus.dao.BarangDAO"%>
<%@page import="com.kampus.model.Barang"%>
<%@page import="com.kampus.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // LOGIC JAVA (TETAP SAMA)
    User user = (User) session.getAttribute("user");
    if (user == null || !user.getRole().equals("mahasiswa")) {
        response.sendRedirect("login.jsp");
        return;
    }
    BarangDAO barangDAO = new BarangDAO();
    List<Barang> listBarang = barangDAO.getAllBarang();
%>
<!DOCTYPE html>
<html lang="id">
<head>
    <title>Dashboard Mahasiswa - Kampus Inventory</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    
    <style>
        .hover-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: none;
            border-radius: 15px;
        }
        .hover-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.15) !important;
        }
        .hero-section {
            background: linear-gradient(135deg, #0d6efd 0%, #0099ff 100%);
            color: white;
            padding: 3rem 0;
            border-radius: 0 0 30px 30px;
            margin-bottom: 3rem;
        }
        .stock-badge {
            position: absolute;
            top: 15px;
            right: 15px;
            font-size: 0.9rem;
        }
    </style>
</head>
<body class="bg-light">

    <nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top shadow-sm">
        <div class="container">
            <a class="navbar-brand fw-bold text-primary" href="#">
                <i class="bi bi-box-seam-fill me-2"></i>KampusInv
            </a>
            <div class="d-flex text-dark align-items-center">
                <span class="me-3 fw-bold">
                    <i class="bi bi-person-circle me-1 text-secondary"></i> <%= user.getNama() %>
                </span>
                <a href="logout.jsp" class="btn btn-danger btn-sm rounded-pill px-3">
                    <i class="bi bi-box-arrow-right me-1"></i> Logout
                </a>
            </div>
        </div>
    </nav>

    <div class="hero-section text-center pt-5">
        <div class="container mt-4">
            <h1 class="display-5 fw-bold">Mau Pinjam Apa Hari Ini?</h1>
            <p class="lead">Sistem peminjaman barang kampus yang mudah, cepat, dan transparan.</p>
        </div>
    </div>

    <div class="container mb-5">
        
        <% if ("sukses".equals(request.getParameter("status"))) { %>
            <div class="alert alert-success alert-dismissible fade show shadow-sm rounded-3" role="alert">
                <i class="bi bi-check-circle-fill me-2"></i> <strong>Berhasil!</strong> Permintaan peminjaman telah diajukan.
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        <% } else if ("gagal".equals(request.getParameter("status"))) { %>
            <div class="alert alert-danger shadow-sm rounded-3"><i class="bi bi-exclamation-triangle-fill me-2"></i> Gagal! Cek stok barang.</div>
        <% } %>

        <div class="d-flex justify-content-between align-items-center mb-4">
            <h4 class="fw-bold text-dark"><i class="bi bi-grid-fill me-2 text-primary"></i>Katalog Barang</h4>
            <span class="badge bg-secondary rounded-pill px-3 py-2"><%= listBarang.size() %> Items</span>
        </div>

        <div class="row g-4">
            <% for (Barang b : listBarang) { %>
            <div class="col-md-6 col-lg-3">
                <div class="card h-100 hover-card shadow-sm bg-white overflow-hidden">
                    
                    <span class="badge <%= b.getStokTersedia() > 0 ? "bg-success" : "bg-danger" %> stock-badge rounded-pill shadow-sm">
                        <%= b.getStokTersedia() > 0 ? "Tersedia" : "Habis" %>
                    </span>

                    <div style="height: 200px; overflow: hidden; background: #f8f9fa; display: flex; align-items: center; justify-content: center;">
                        <img src="images/<%= b.getGambar() %>" alt="<%= b.getNamaBarang() %>" style="width: 100%; height: 100%; object-fit: cover;">
                    </div>
                    
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title fw-bold text-dark"><%= b.getNamaBarang() %></h5>
                        <div class="mt-auto">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <small class="text-muted"><i class="bi bi-archive me-1"></i>Stok:</small>
                                <span class="fw-bold text-primary fs-5">
                                    <%= b.getStokTersedia() %> <span class="text-muted fs-6 fw-normal">/ <%= b.getStokTotal() %></span>
                                </span>
                            </div>

                            <% if (b.getStokTersedia() > 0) { %>
                                <button type="button" class="btn btn-primary w-100 rounded-pill fw-bold shadow-sm" 
                                        data-bs-toggle="modal" data-bs-target="#modalPinjam<%= b.getId() %>">
                                    <i class="bi bi-cart-plus me-1"></i> Pinjam
                                </button>
                            <% } else { %>
                                <button class="btn btn-secondary w-100 rounded-pill" disabled>
                                    <i class="bi bi-x-circle me-1"></i> Stok Habis
                                </button>
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="modalPinjam<%= b.getId() %>" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content border-0 shadow-lg rounded-4">
                        <div class="modal-header bg-primary text-white rounded-top-4">
                            <h5 class="modal-title"><i class="bi bi-bag-check me-2"></i>Pinjam <%= b.getNamaBarang() %></h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                        </div>
                        <form action="ProsesPeminjaman" method="post">
                            <div class="modal-body p-4">
                                <input type="hidden" name="barang_id" value="<%= b.getId() %>">
                                
                                <div class="alert alert-info py-2 small">
                                    <i class="bi bi-info-circle me-1"></i> Maksimal pinjam: <strong><%= b.getStokTersedia() %> unit</strong>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label fw-bold text-secondary">Jumlah</label>
                                    <input type="number" name="jumlah" class="form-control form-control-lg" min="1" max="<%= b.getStokTersedia() %>" required>
                                </div>
                                <div class="row g-2">
                                    <div class="col-6 mb-3">
                                        <label class="form-label fw-bold text-secondary">Dari Tgl</label>
                                        <input type="date" name="tgl_pinjam" class="form-control" required>
                                    </div>
                                    <div class="col-6 mb-3">
                                        <label class="form-label fw-bold text-secondary">Sampai Tgl</label>
                                        <input type="date" name="tgl_kembali" class="form-control" required>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label fw-bold text-secondary">Keperluan</label>
                                    <textarea name="keperluan" class="form-control" rows="3" placeholder="Contoh: Untuk praktikum Multimedia..." required></textarea>
                                </div>
                            </div>
                            <div class="modal-footer bg-light rounded-bottom-4">
                                <button type="button" class="btn btn-link text-secondary text-decoration-none" data-bs-dismiss="modal">Batal</button>
                                <button type="submit" class="btn btn-primary px-4 rounded-pill fw-bold">Ajukan</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <% } %> 
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>