<%@page import="java.util.List"%>
<%@page import="com.kampus.model.Peminjaman"%>
<%@page import="com.kampus.dao.PeminjamanDAO"%>
<%@page import="com.kampus.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // --- LOGIC JAVA (TIDAK BERUBAH) ---
    User user = (User) session.getAttribute("user");
    if (user == null || !user.getRole().equals("admin")) {
        response.sendRedirect("login.jsp");
        return;
    }

    PeminjamanDAO dao = new PeminjamanDAO();
    List<Peminjaman> listPinjam = dao.getAllPeminjaman();
    
    // Hitung Statistik
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
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f6f9; /* Abu-abu sangat muda (clean) */
        }

        /* --- NAVBAR STYLE --- */
        .navbar-admin {
            background: linear-gradient(135deg, #0d6efd 0%, #004bb5 100%); /* Biru Gradient */
            box-shadow: 0 4px 15px rgba(13, 110, 253, 0.2);
            padding: 1rem 0;
        }

        /* --- STATS CARDS --- */
        .stat-card {
            border: none;
            border-radius: 16px;
            color: white;
            overflow: hidden;
            position: relative;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            height: 100%;
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.15);
        }

        .stat-card .card-body {
            position: relative;
            z-index: 2;
            padding: 1.5rem;
        }

        /* Icon Background Besar Transparan */
        .stat-icon-bg {
            position: absolute;
            right: -10px;
            bottom: -10px;
            font-size: 5rem;
            opacity: 0.2;
            transform: rotate(-15deg);
            z-index: 1;
        }

        /* Warna-warni Card */
        .bg-gradient-blue { background: linear-gradient(45deg, #4e73df, #224abe); }
        .bg-gradient-warning { background: linear-gradient(45deg, #f6c23e, #dda20a); }
        .bg-gradient-success { background: linear-gradient(45deg, #1cc88a, #13855c); }

        /* --- TABLE STYLE --- */
        .table-card {
            border: none;
            border-radius: 20px;
            box-shadow: 0 5px 25px rgba(0,0,0,0.05);
            background: white;
            overflow: hidden;
        }

        .table-header-blue {
            background-color: #e7f1ff; /* Biru muda banget */
            color: #0d6efd;
            font-weight: 600;
            border-bottom: 2px solid #cce0ff;
        }
        
        .table th {
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.85rem;
            padding: 1rem;
            vertical-align: middle;
        }
        
        .table td {
            vertical-align: middle;
            padding: 1rem;
        }

        /* Tombol Aksi */
        .btn-action {
            width: 35px;
            height: 35px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            transition: 0.2s;
        }
        .btn-action:hover { transform: scale(1.1); }

    </style>
</head>
<body>
    
    <nav class="navbar navbar-expand-lg navbar-dark navbar-admin mb-4">
        <div class="container">
            <a class="navbar-brand fw-bold d-flex align-items-center" href="#">
                <i class="bi bi-shield-lock-fill me-2 fs-4"></i>
                <span>Admin Panel</span>
            </a>
            
            <div class="d-flex align-items-center">
                <div class="text-white me-3 text-end d-none d-md-block">
                    <div class="fw-bold"><%= user.getNama() %></div>
                    <div style="font-size: 0.75rem; opacity: 0.8;">Administrator</div>
                </div>
                <div class="bg-white bg-opacity-25 rounded-circle p-1 me-3">
                    <i class="bi bi-person-fill text-white fs-4 px-1"></i>
                </div>
                <a href="logout.jsp" class="btn btn-light text-primary fw-bold rounded-pill px-4 shadow-sm btn-sm">
                    <i class="bi bi-box-arrow-right me-1"></i> Logout
                </a>
            </div>
        </div>
    </nav>

    <div class="container pb-5">
        
        <% if ("kembali_sukses".equals(request.getParameter("status"))) { %>
            <div class="alert alert-success alert-dismissible fade show rounded-3 shadow-sm border-0 mb-4">
                <i class="bi bi-check-circle-fill me-2"></i> Barang berhasil dikembalikan & Stok bertambah!
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        <% } else if ("hapus_sukses".equals(request.getParameter("status"))) { %>
            <div class="alert alert-danger alert-dismissible fade show rounded-3 shadow-sm border-0 mb-4">
                <i class="bi bi-trash-fill me-2"></i> Data riwayat berhasil dihapus!
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        <% } %>

        <h5 class="fw-bold text-secondary mb-3 ms-1">Ringkasan Data</h5>
        <div class="row g-4 mb-5">
            <div class="col-md-4">
                <div class="stat-card bg-gradient-blue">
                    <div class="card-body">
                        <h6 class="text-uppercase mb-1 opacity-75 small fw-bold">Total Transaksi</h6>
                        <h2 class="display-5 fw-bold mb-0"><%= totalPeminjaman %></h2>
                        <div class="stat-icon-bg"><i class="bi bi-journal-text"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="stat-card bg-gradient-warning">
                    <div class="card-body">
                        <h6 class="text-uppercase mb-1 opacity-75 small fw-bold text-dark">Sedang Dipinjam</h6>
                        <h2 class="display-5 fw-bold mb-0 text-dark"><%= sedangDipinjam %></h2>
                        <div class="stat-icon-bg text-dark"><i class="bi bi-clock-history"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="stat-card bg-gradient-success">
                    <div class="card-body">
                        <h6 class="text-uppercase mb-1 opacity-75 small fw-bold">Selesai / Kembali</h6>
                        <h2 class="display-5 fw-bold mb-0"><%= sudahKembali %></h2>
                        <div class="stat-icon-bg"><i class="bi bi-check2-circle"></i></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="d-flex justify-content-between align-items-center mb-3 ms-1">
            <h5 class="fw-bold text-secondary mb-0">Daftar Peminjaman Barang</h5>
            <button class="btn btn-primary btn-sm rounded-pill px-3" onclick="location.reload()">
                <i class="bi bi-arrow-clockwise me-1"></i> Refresh Data
            </button>
        </div>

        <div class="table-card">
            <div class="table-responsive">
                <table class="table table-hover mb-0">
                    <thead class="table-header-blue">
                        <tr>
                            <th class="ps-4">No</th>
                            <th>Info Peminjam</th>
                            <th>Barang & Jumlah</th>
                            <th>Tanggal Pinjam</th>
                            <th>Status</th>
                            <th class="text-center">Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                        int no = 1;
                        if(listPinjam.size() > 0) {
                            for (Peminjaman p : listPinjam) { 
                        %>
                        <tr>
                            <td class="ps-4 fw-bold text-secondary"><%= no++ %></td>
                            <td>
                                <div class="fw-bold text-dark"><%= p.getNamaPeminjam() %></div>
                                <div class="small text-muted"><i class="bi bi-person-badge me-1"></i>NIM: <%= p.getUserId() %></div>
                            </td>
                            <td>
                                <div class="fw-bold text-primary"><%= p.getNamaBarang() %></div>
                                <span class="badge bg-light text-dark border"><%= p.getJumlah() %> Unit</span>
                            </td>
                            <td>
                                <div class="small text-muted">Pinjam: <span class="text-dark fw-bold"><%= p.getTglPinjam() %></span></div>
                                <div class="small text-muted">Kembali: <span class="text-dark fw-bold"><%= p.getTglKembali() %></span></div>
                            </td>
                            <td>
                                <% if (p.getStatus().equals("Dipinjam")) { %>
                                    <span class="badge bg-warning text-dark bg-opacity-75 rounded-pill px-3 py-2">
                                        <i class="bi bi-hourglass-split me-1"></i> Dipinjam
                                    </span>
                                <% } else { %>
                                    <span class="badge bg-success bg-opacity-75 rounded-pill px-3 py-2">
                                        <i class="bi bi-check-all me-1"></i> Kembali
                                    </span>
                                <% } %>
                            </td>
                            <td class="text-center">
                                <div class="d-flex justify-content-center gap-2">
                                    
                                    <% if (p.getStatus().equals("Dipinjam")) { %>
                                        <form action="ProsesPengembalian" method="post" onsubmit="return confirm('Konfirmasi: Barang sudah dikembalikan? Stok akan bertambah.');">
                                            <input type="hidden" name="id_peminjaman" value="<%= p.getId() %>">
                                            <input type="hidden" name="id_barang" value="<%= p.getBarangId() %>">
                                            <input type="hidden" name="jumlah" value="<%= p.getJumlah() %>">
                                            
                                            <button type="submit" class="btn btn-primary btn-action shadow-sm" title="Terima Kembali">
                                                <i class="bi bi-check-lg"></i>
                                            </button>
                                        </form>
                                    <% } else { %>
                                        <button class="btn btn-secondary btn-action bg-opacity-25 border-0 text-secondary" disabled>
                                            <i class="bi bi-check2"></i>
                                        </button>
                                    <% } %>

                                    <form action="HapusPeminjaman" method="post" onsubmit="return confirm('HATI-HATI! Data akan dihapus permanen. Lanjutkan?');">
                                        <input type="hidden" name="id_peminjaman" value="<%= p.getId() %>">
                                        <button type="submit" class="btn btn-danger btn-action shadow-sm" title="Hapus Riwayat">
                                            <i class="bi bi-trash"></i>
                                        </button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                        <% 
                            } 
                        } else { 
                        %>
                            <tr>
                                <td colspan="6" class="text-center py-5 text-muted">
                                    <i class="bi bi-inbox fs-1 d-block mb-2"></i>
                                    Belum ada data peminjaman.
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
            <div class="card-footer bg-white border-top py-3 text-center text-muted small">
                Data sistem Kampus Inventory v2.0 &copy; 2025
            </div>
        </div>

    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>