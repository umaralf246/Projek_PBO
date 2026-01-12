<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <title>Kampus Inventory - Official</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

    <style>
        html { scroll-behavior: smooth; }
        body { font-family: 'Poppins', sans-serif; overflow-x: hidden; }
        section { scroll-margin-top: 70px; }

        /* NAVBAR STYLE */
        .navbar { transition: all 0.3s ease-in-out; padding: 1.5rem 0; }
        .navbar-scrolled { background-color: #0d6efd; box-shadow: 0 5px 20px rgba(0,0,0,0.1); padding: 0.8rem 0; }
        .offcanvas { background: #0d6efd; color: white; }
        .offcanvas-header .btn-close { filter: invert(1); }
        .nav-link { color: rgba(255,255,255,0.7); font-size: 1.1rem; margin-bottom: 0.5rem; transition: 0.3s; border-left: 3px solid transparent; padding-left: 0px; }
        .nav-link:hover, .nav-link.active { color: #ffffff !important; font-weight: bold; padding-left: 10px; border-left: 3px solid white; }

        /* HERO SECTION */
        #home {
            background: linear-gradient(135deg, rgba(13, 110, 253, 0.9) 0%, rgba(0, 97, 242, 0.8) 100%), 
                        url('https://images.unsplash.com/photo-1523050854058-8df90110c9f1?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80');
            background-size: cover; background-position: center; height: 100vh;
            display: flex; align-items: center; color: white; position: relative;
        }
        .btn-cta { background: white; color: #0d6efd; border: none; padding: 12px 35px; font-weight: 700; border-radius: 50px; text-decoration: none; box-shadow: 0 5px 15px rgba(0,0,0,0.1); transition: 0.3s; }
        .btn-cta:hover { transform: translateY(-3px); background: #f8f9fa; color: #004bb5; }

        /* GALLERY IMAGES */
        .gallery-item { overflow: hidden; border-radius: 15px; cursor: pointer; position: relative; height: 250px; }
        .gallery-item img { width: 100%; height: 100%; object-fit: cover; transition: transform 0.5s ease; }
        .gallery-item:hover img { transform: scale(1.1); }
        .gallery-overlay {
            position: absolute; top: 0; left: 0; width: 100%; height: 100%;
            background: rgba(13, 110, 253, 0.7); opacity: 0;
            display: flex; align-items: center; justify-content: center;
            transition: 0.3s; color: white; font-weight: bold;
        }
        .gallery-item:hover .gallery-overlay { opacity: 1; }

        /* CARDS & ICONS */
        .contact-card { border: none; border-radius: 20px; padding: 2rem; background: white; box-shadow: 0 10px 30px rgba(0,0,0,0.05); transition: 0.3s; }
        .contact-card:hover { transform: translateY(-10px); box-shadow: 0 15px 40px rgba(0,0,0,0.1); }
        .img-about { border-radius: 20px; box-shadow: 0 15px 40px rgba(13, 110, 253, 0.2); }
    </style>
</head>
<body data-bs-spy="scroll" data-bs-target="#offcanvasNavbar">

    <nav class="navbar fixed-top" id="mainNavbar">
        <div class="container">
            <a class="navbar-brand fw-bold fs-4 text-white" href="#"><i class="bi bi-box-seam-fill me-2"></i>KampusInv</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"><i class="bi bi-list text-white fs-2"></i></button>
            <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar">
                <div class="offcanvas-header">
                    <h5 class="offcanvas-title fw-bold">Menu</h5>
                    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"></button>
                </div>
                <div class="offcanvas-body">
                    <ul class="navbar-nav justify-content-end flex-grow-1 pe-3 mt-4">
                        <li class="nav-item"><a class="nav-link active" id="link-home" href="#home"><i class="bi bi-house-door me-2"></i>Home</a></li>
                        <li class="nav-item"><a class="nav-link" id="link-about" href="#about"><i class="bi bi-info-circle me-2"></i>About Us</a></li>
                        <li class="nav-item"><a class="nav-link" id="link-gallery" href="#gallery"><i class="bi bi-images me-2"></i>Gallery</a></li>
                        <li class="nav-item"><a class="nav-link" id="link-contact" href="#contact"><i class="bi bi-telephone me-2"></i>Contact</a></li>
                        <hr class="border-light opacity-25">
                        <li class="nav-item mt-3"><a href="login.jsp" class="btn btn-light w-100 fw-bold text-primary rounded-pill py-2">Login</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>

    <section id="home">
        <div class="container text-center" data-aos="zoom-in" data-aos-duration="1000">
            <span class="badge px-3 py-2 rounded-pill mb-3 fw-bold" style="background: rgba(255,255,255,0.2); border: 1px solid rgba(255,255,255,0.4);">🚀 Sistem Peminjaman v2.0</span>
            <h1 class="display-3 fw-bold mb-4">Sistem Inventaris<br>Kampus Terpadu</h1>
            <p class="lead mb-5 opacity-75 mx-auto text-light" style="max-width: 700px;">Kelola peminjaman barang praktikum dengan mudah, cepat, dan transparan.</p>
            <a href="login.jsp" class="btn-cta">Mulai Pinjam <i class="bi bi-arrow-right-short"></i></a>
        </div>
        <div style="position: absolute; bottom: 0; left: 0; width: 100%; overflow: hidden; line-height: 0;">
            <svg viewBox="0 0 1200 120" preserveAspectRatio="none" style="width: 100%; height: 60px; fill: #f8f9fa;"><path d="M321.39,56.44c58-10.79,114.16-30.13,172-41.86,82.39-16.72,168.19-17.73,250.45-.39C823.78,31,906.67,72,985.66,92.83c70.05,18.48,146.53,26.09,214.34,3V0H0V27.35A600.21,600.21,0,0,0,321.39,56.44Z"></path></svg>
        </div>
    </section>

    <section id="about" class="py-5 bg-light">
        <div class="container py-5">
            <div class="text-center mb-5" data-aos="fade-up">
                <h6 class="text-primary fw-bold text-uppercase">Tentang Kami</h6>
                <h2 class="fw-bold">Digitalisasi Kampus</h2>
            </div>
            <div class="row align-items-center g-5">
                <div class="col-md-6" data-aos="fade-right"><img src="https://images.unsplash.com/photo-1522071820081-009f0129c71c" class="img-fluid img-about" alt="Team"></div>
                <div class="col-md-6" data-aos="fade-left">
                    <h3 class="fw-bold mb-3">Misi & Visi</h3>
                    <p class="text-muted lead">Menggantikan sistem manual kertas dengan sistem digital berbasis Web Java Enterprise yang real-time.</p>
                    <ul class="list-unstyled mt-4">
                        <li class="mb-3"><i class="bi bi-check-circle-fill text-primary me-2"></i> Efisiensi Waktu</li>
                        <li class="mb-3"><i class="bi bi-check-circle-fill text-primary me-2"></i> Transparansi Stok</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <section id="gallery" class="py-5 bg-white">
        <div class="container py-5">
            <div class="text-center mb-5" data-aos="fade-down">
                <h6 class="text-primary fw-bold text-uppercase">Fasilitas Kami</h6>
                <h2 class="fw-bold">Galeri Inventaris & Kegiatan</h2>
                <p class="text-muted">Dokumentasi penggunaan alat dan fasilitas kampus.</p>
            </div>
            <div class="row g-4">
                <div class="col-md-4" data-aos="zoom-in" data-aos-delay="100">
                    <div class="gallery-item">
                        <img src="https://images.unsplash.com/photo-1517077304055-6e89abbf09b0?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Lab Komputer">
                        <div class="gallery-overlay"><i class="bi bi-pc-display me-2"></i> Lab Komputer</div>
                    </div>
                </div>
                <div class="col-md-4" data-aos="zoom-in" data-aos-delay="200">
                    <div class="gallery-item">
                        <img src="https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Alat Praktikum">
                        <div class="gallery-overlay"><i class="bi bi-tools me-2"></i> Alat Praktikum</div>
                    </div>
                </div>
                <div class="col-md-4" data-aos="zoom-in" data-aos-delay="300">
                    <div class="gallery-item">
                        <img src="https://images.unsplash.com/photo-1590402494682-cd3fb53b1f70?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Proyektor Kelas">
                        <div class="gallery-overlay"><i class="bi bi-projector me-2"></i> Multimedia</div>
                    </div>
                </div>
                <div class="col-md-4" data-aos="zoom-in" data-aos-delay="400">
                    <div class="gallery-item">
                        <img src="https://images.unsplash.com/photo-1604328727766-a151d1045ab4?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Ruang Diskusi">
                        <div class="gallery-overlay"><i class="bi bi-people me-2"></i> Ruang Diskusi</div>
                    </div>
                </div>
                <div class="col-md-4" data-aos="zoom-in" data-aos-delay="500">
                    <div class="gallery-item">
                        <img src="https://images.unsplash.com/photo-1563986768609-322da13575f3?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Server Room">
                        <div class="gallery-overlay"><i class="bi bi-hdd-network me-2"></i> Server Room</div>
                    </div>
                </div>
                <div class="col-md-4" data-aos="zoom-in" data-aos-delay="600">
                    <div class="gallery-item">
                        <img src="https://images.unsplash.com/photo-1550751827-4bd374c3f58b?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Keamanan">
                        <div class="gallery-overlay"><i class="bi bi-shield-lock me-2"></i> Cyber Security</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="contact" class="py-5" style="background-color: #f0f8ff;">
        <div class="container py-5">
            <div class="text-center mb-5" data-aos="fade-down">
                <h6 class="text-primary fw-bold text-uppercase">Bantuan</h6>
                <h2 class="fw-bold">Hubungi Admin</h2>
            </div>
            <div class="row g-4 justify-content-center">
                <div class="col-md-4" data-aos="fade-up" data-aos-delay="100"><div class="contact-card text-center h-100"><i class="bi bi-envelope-at-fill fs-1 text-primary mb-3"></i><h5>Email</h5><p class="text-muted small">admin@kampus.ac.id</p></div></div>
                <div class="col-md-4" data-aos="fade-up" data-aos-delay="200"><div class="contact-card text-center h-100"><i class="bi bi-geo-alt-fill fs-1 text-primary mb-3"></i><h5>Lokasi</h5><p class="text-muted small">Gedung FIK Lantai 2</p></div></div>
            </div>
        </div>
    </section>

    <footer class="bg-dark text-white py-4 text-center">
        <div class="container"><small>&copy; 2025 Kampus Inventory System.</small></div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init();
        const navEl = document.getElementById('mainNavbar');
        window.addEventListener('scroll', () => { if (window.scrollY > 50) navEl.classList.add('navbar-scrolled'); else navEl.classList.remove('navbar-scrolled'); });
        
        // INTERSECTION OBSERVER (Buat Active Menu Pindah Otomatis)
        const sections = document.querySelectorAll("section");
        const navItems = document.querySelectorAll(".nav-link");
        const observer = new IntersectionObserver((entries) => {
            entries.forEach((entry) => {
                if (entry.isIntersecting) {
                    navItems.forEach((link) => link.classList.remove("active"));
                    const activeLink = document.querySelector(`.nav-link[href="#${entry.target.id}"]`);
                    if (activeLink) activeLink.classList.add("active");
                }
            });
        }, { root: null, threshold: 0.3, rootMargin: "-50px 0px -50px 0px" });
        sections.forEach((s) => observer.observe(s));
    </script>
</body>
</html>