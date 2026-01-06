<%@page import="java.util.List"%>
<%@page import="com.kampus.model.Peminjaman"%>
<%@page import="com.kampus.dao.PeminjamanDAO"%>
<%@page import="com.kampus.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Logic Java (TETAP SAMA)
    User user = (User) session.getAttribute("user");
    if (user == null || !user.getRole().equals("admin")) {
        response.sendRedirect("login.jsp");
        return;
    }

    PeminjamanDAO dao = new PeminjamanDAO();
    List<Peminjaman> listPinjam = dao.getAllPeminjaman();
    
    // HITUNG STATISTIK SEDERHANA (Fitur Tambahan di JSP)
    int totalPeminjaman = listPinjam.size();
    int sedangDipinjam = 0;
    int sudahKembali = 0;
    
    for(Peminjaman p : listPinjam){
        if(p.getStatus().equals("Dipinjam")){
            sedangDipinjam++;
        } else {
            sudahKembali++;
        }
    }
%>
<!DOCTYPE html>
<html lang="id">
<head>
    <title>Dashboard Admin - Kampus Inventory</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <style>
        .stat-card {
            border: none;
            border-radius: 15px;
            transition: transform 0.2s;
        }
        .stat-card:hover {
            transform: translateY(-5px);
        }
        .icon-box {
            width: 50px;
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 12px;
            font-size: 1.5rem;
        }
        .table-custom th {
            background-color: #343a40;
            color: white;
            border: none;
        }
        .table-custom td {
            vertical-align: middle;
        }
    </style>
</head>
<body class="bg-light">
    
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
        <div class="container">
            <a class="navbar-brand fw-bold" href="#">
                <i class="bi bi-speedometer2 me-2"></i>Admin Panel
            </a>
            <div class="d-flex align-items-center">
                <div class="text-white me-3 text-end">
                    <div class="fw-bold"><%= user.getNama() %></div>
                    <div style="font-size: 0.75rem; opacity: 0.8;">Administrator</div>
                </div>
                <a href="logout.jsp" class="btn btn-outline-danger btn-sm rounded-pill">
                    <i class="bi bi-power"></i>
                </a>
            </div>
        </div>
    </nav>

    <div class="container mt-4 mb-5">
        
        <% if ("kembali_sukses".equals(request.getParameter("status"))) { %>
            <div class="alert alert-success alert-dismissible fade show rounded-3 shadow-sm">
                <i class="bi bi-check-circle-fill me-2"></i> Barang berhasil dikembalikan & Stok bertambah!
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        <% } %>

        <div class="row g-3 mb-4">
            <div class="col-md-4">
                <div class="card stat-card shadow-sm bg-primary text-white h-100">
                    <div class="card-body d-flex align-items-center">
                        <div class="icon-box bg-white bg-opacity-25 me-3">
                            <i class="bi bi-journal-text"></i>
                        </div>
                        <div>
                            <h6 class="card-title mb-0 opacity-75">Total Transaksi</h6>
                            <h2 class="fw-bold mb-0"><%= totalPeminjaman %></h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card stat-card shadow-sm bg-warning text-dark h-100">
                    <div class="card-body d-flex align-items-center">
                        <div class="icon-box bg-white bg-opacity-25 me-3">
                            <i class="bi bi-clock-history"></i>
                        </div>
                        <div>
                            <h6 class="card-title mb-0 opacity-75">Sedang Dipinjam</h6>
                            <h2 class="fw-bold mb-0"><%= sedangDipinjam %></h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card stat-card shadow-sm bg-success text-white h-100">
                    <div class="card-body d-flex align-items-center">
                        <div class="icon-box bg-white bg-opacity-25 me-3">
                            <i class="bi bi-check2-circle"></i>
                        </div>
                        <div>
                            <h6 class="card-title mb-0 opacity-75">Selesai / Kembali</h6>
                            <h2 class="fw-bold mb-0"><%= sudahKembali %></h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="card shadow border-0 rounded-4">
            <div class="card-header bg-white border-0 py-3 d-flex justify-content-between align-items-center">
                <h5 class="mb-0 fw-bold text-dark"><i class="bi bi-list-ul me-2 text-primary"></i>Riwayat Peminjaman</h5>
            </div>
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-hover table-custom mb-0">
                        <thead>
                            <tr>
                                <th class="ps-4 py-3">No</th>
                                <th class="py-3">Peminjam</th>
                                <th class="py-3">Barang</th>
                                <th class="py-3">Jumlah</th>
                                <th class="py-3">Tanggal</th>
                                <th class="py-3">Status</th>
                                <th class="py-3 text-center">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                            int no = 1;
                            for (Peminjaman p : listPinjam) { 
                            %>
                            <tr>
                                <td class="ps-4 fw-bold text-secondary"><%= no++ %></td>
                                <td>
                                    <div class="fw-bold"><%= p.getNamaPeminjam() %></div>
                                    <small class="text-muted"><i class="bi bi-card-heading"></i> NIM: <%= p.getUserId() %></small>
                                </td>
                                <td>
                                    <span class="text-primary fw-bold"><%= p.getNamaBarang() %></span>
                                </td>
                                <td><span class="badge bg-secondary rounded-pill"><%= p.getJumlah() %> Unit</span></td>
                                <td>
                                    <small class="d-block text-muted">Pinjam: <%= p.getTglPinjam() %></small>
                                    <small class="d-block text-muted">Kembali: <%= p.getTglKembali() %></small>
                                </td>
                                <td>
                                    <% if (p.getStatus().equals("Dipinjam")) { %>
                                        <span class="badge bg-warning text-dark border border-warning rounded-pill px-3">
                                            <i class="bi bi-hourglass-split me-1"></i> Dipinjam
                                        </span>
                                    <% } else { %>
                                        <span class="badge bg-success border border-success rounded-pill px-3">
                                            <i class="bi bi-check-all me-1"></i> Kembali
                                        </span>
                                    <% } %>
                                </td>
                                <td class="text-center">
                                    <% if (p.getStatus().equals("Dipinjam")) { %>
                                        <form action="ProsesPengembalian" method="post" onsubmit="return confirm('Yakin barang ini sudah dikembalikan?');">
                                            <input type="hidden" name="id_peminjaman" value="<%= p.getId() %>">
                                            <input type="hidden" name="id_barang" value="<%= p.getBarangId() %>">
                                            <input type="hidden" name="jumlah" value="<%= p.getJumlah() %>">
                                            
                                            <button type="submit" class="btn btn-primary btn-sm rounded-pill shadow-sm px-3">
                                                <i class="bi bi-arrow-return-left me-1"></i> Terima
                                            </button>
                                        </form>
                                    <% } else { %>
                                        <button class="btn btn-light btn-sm text-muted" disabled>
                                            <i class="bi bi-lock-fill"></i> Selesai
                                        </button>
                                    <% } %>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="card-footer bg-white border-0 py-3 text-center text-muted small">
                Data diperbarui secara real-time dari database.
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>