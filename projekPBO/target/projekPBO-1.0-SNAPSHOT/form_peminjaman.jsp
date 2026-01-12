<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Form Peminjaman Barang</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light">
        <div class="container mt-5">
            <div class="card shadow">
                <div class="card-header bg-primary text-white">
                    <h3>Form Peminjaman Barang Kampus</h3>
                </div>
                <div class="card-body">
                    <%
                        String status = request.getParameter("status");
                        if (status != null) {
                            if (status.equals("sukses")) {
                    %>
                    <div class="alert alert-success">Data Peminjaman Berhasil Disimpan!</div>
                    <%
                    } else if (status.equals("gagal")) {
                    %>
                    <div class="alert alert-danger">Gagal menyimpan data!</div>
                    <%
                            }
                        }
                    %>
                    <form action="ProsesPeminjaman" method="post">
                        <div class="mb-3">
                            <label>NIM</label>
                            <input type="text" name="nim" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label>Nama Mahasiswa</label>
                            <input type="text" name="nama" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label>Barang yang Dipinjam</label>
                            <input type="text" name="nama_barang" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label>Jumlah Barang</label>
                            <input type="number" name="jumlah" class="form-control" required>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label>Tanggal Peminjaman</label>
                                <input type="date" name="tgl_pinjam" class="form-control" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label>Tanggal Pengembalian</label>
                                <input type="date" name="tgl_kembali" class="form-control" required>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label>Keperluan / Deskripsi</label>
                            <textarea name="keperluan" class="form-control" rows="3" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-success">Ajukan Peminjaman</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>