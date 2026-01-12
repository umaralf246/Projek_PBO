<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <title>Login - Sistem Peminjaman Kampus</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #0061f2 0%, #6900f2 100%);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative; /* Penting buat tombol back absolute */
        }
        
        /* Style Tombol Kembali */
        .btn-back-home {
            position: absolute;
            top: 20px;
            left: 20px;
            background: rgba(255, 255, 255, 0.2);
            color: white;
            border: 1px solid rgba(255, 255, 255, 0.3);
            backdrop-filter: blur(5px);
            padding: 8px 20px;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 500;
            font-size: 0.9rem;
            transition: all 0.3s ease;
            z-index: 100; /* Supaya selalu di atas */
        }

        .btn-back-home:hover {
            background: white;
            color: #0061f2;
            transform: translateX(-3px); /* Efek gerak dikit ke kiri */
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .login-card {
            border: none;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.2);
            background: rgba(255, 255, 255, 0.95);
            overflow: hidden;
        }

        .login-header {
            background: #fff;
            padding-bottom: 0;
        }

        .icon-bg {
            width: 70px;
            height: 70px;
            background: linear-gradient(135deg, #0d6efd, #00c6ff);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            color: white;
            margin: 0 auto 1rem;
            box-shadow: 0 5px 15px rgba(13, 110, 253, 0.3);
        }

        .form-control {
            border-radius: 10px;
            padding: 12px 15px;
            border: 1px solid #e1e1e1;
            background-color: #f8f9fa;
            transition: all 0.3s;
        }

        .form-control:focus {
            background-color: #fff;
            box-shadow: 0 0 0 4px rgba(13, 110, 253, 0.1);
            border-color: #0d6efd;
        }

        .input-group-text {
            border-radius: 10px 0 0 10px;
            border: 1px solid #e1e1e1;
            border-right: none;
            background-color: #f8f9fa;
            color: #6c757d;
        }
        
        .form-control {
            border-left: none;
            border-radius: 0 10px 10px 0;
        }
        
        .input-group:focus-within .input-group-text {
            border-color: #0d6efd;
            background-color: #fff;
        }

        .btn-login {
            border-radius: 10px;
            padding: 12px;
            font-weight: 600;
            background: linear-gradient(135deg, #0d6efd, #0056b3);
            border: none;
            transition: transform 0.2s;
        }

        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(13, 110, 253, 0.4);
        }

        .footer-text {
            font-size: 0.8rem;
            color: rgba(255,255,255,0.7);
            margin-top: 2rem;
        }
    </style>
</head>
<body>

    <a href="index.jsp" class="btn-back-home">
        <i class="bi bi-arrow-left me-1"></i> Kembali ke Home
    </a>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-5 col-lg-4">
                
                <div class="card login-card p-4">
                    <div class="card-body">
                        <div class="text-center mb-4 login-header">
                            <div class="icon-bg">
                                <i class="bi bi-buildings-fill"></i>
                            </div>
                            <h4 class="fw-bold text-dark">Selamat Datang</h4>
                            <p class="text-muted small">Silakan login untuk meminjam barang</p>
                        </div>

                        <% if ("gagal".equals(request.getParameter("error"))) { %>
                            <div class="alert alert-danger d-flex align-items-center rounded-3 p-2 small mb-3" role="alert">
                                <i class="bi bi-exclamation-circle-fill me-2 fs-5"></i>
                                <div>NIM/NIP atau Password salah!</div>
                            </div>
                        <% } %>

                        <form action="ProsesLogin" method="post">
                            
                            <div class="mb-3">
                                <label class="form-label small text-muted fw-bold ms-1">NIM / NIP</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
                                    <input type="text" name="nim" class="form-control" placeholder="Masukan ID User..." required autofocus>
                                </div>
                            </div>

                            <div class="mb-4">
                                <label class="form-label small text-muted fw-bold ms-1">Password</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
                                    <input type="password" name="password" class="form-control" placeholder="Masukan Password..." required>
                                </div>
                            </div>

                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary btn-login text-white">
                                    MASUK SEKARANG <i class="bi bi-arrow-right-short ms-1"></i>
                                </button>
                            </div>

                        </form>
                    </div>
                </div>

                <div class="text-center footer-text">
                    &copy; 2025 Projek PBO Kampus Inventory<br>
                    <small>Dibuat dengan <i class="bi bi-heart-fill text-danger"></i> & Java Servlet</small>
                </div>

            </div>
        </div>
    </div>

</body>
</html>