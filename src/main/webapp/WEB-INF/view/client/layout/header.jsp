<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <header>
                <div class="header-area ">
                    <div id="sticky-header" class="main-header-area">
                        <div class="container-fluid ">
                            <div class="header_bottom_border">
                                <div class="row align-items-center">
                                    <div class="col-xl-2 col-lg-2">
                                        <div class="logo">
                                            <a href="/">
                                                <img src="client/img/logo.png" alt="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-7">
                                        <div class="main-menu  d-none d-lg-block mx-auto">
                                            <nav>
                                                <ul id="navigation">
                                                    <li><a href="/">Trang Chủ</a></li>
                                                    <li><a href="/job">Việc làm</a></li>
                                                    <li><a href="congty.html">Công ty</a></li>
                                                    <li><a href="plan.html">Dịch vụ</a></li>
                                                    <li><a href="#">Cẩm nang nghề nghiệp <i class="ti-angle-down"></i></a>
                                                        <ul class="submenu">
                                                            <li><a href="/post">Định hướng nghề nghiệp</a></li>
                                                            <li><a href="/post">Top công việc</a></li>
                                                        </ul>
                                                    </li> 
                                                </ul>
                                            </nav>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-3 d-none d-lg-block">
                                        <div class="Appointment">
                                            <!-- chưa đăng nhập đăng nhập -->
                                            <!-- <div class="phone_num d-none d-xl-block">
                                                <a href="#" class="nav-link fs-2 "><i class="fas fa-user"></i> Đăng nhập</a>
                                            </div> 
                                            <div class="d-none d-lg-block">
                                                <a class="boxed-btn3" href="#">Ứng tuyển</a>
                                            </div> -->
                                           
        
                                            <!-- phân khi đang nhap tk ứng viên -->
                                            <!-- <div class="navbar-brand"  id="navbarNav">
                                                <ul class="navbar-nav">
                                                    <li class="nav-item dropdown">
                                                        <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button"
                                                            data-bs-toggle="dropdown" aria-expanded="false">
                                                            <i class="fas fa-user"></i> Đinh Viết Long
                                                        </a>
                                                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                            <li class="d-flex align-items-center flex-column" style="min-width: 265px;">
                                                                <img style="width: 80px; height: 80px; border-radius: 50%; overflow: hidden;"
                                                                    src="client/img/elements/d.jpg" />
                                                                <div class="text-center my-3">
                                                                    Đinh viết long
                                                                    <p class="fs-6">demo@gmail.com</p>
                                                                </div>
                                                            </li>
                                                            <li><hr class="dropdown-divider"></li>
                                                            <li><a class="dropdown-item" href="#">Thông tin cá nhân</a></li>
                                                            <li><a class="dropdown-item" href="#">Lịch sử úng tuyển</a></li>
                                                            <li><a class="dropdown-item" href="#">Thay đổi mật khẩu</a></li>
                                                            <li><hr class="dropdown-divider"></li>
                                                            <li><a class="dropdown-item" href="#">Đăng xuất</a></li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="d-none d-lg-block">
                                                <a class="boxed-btn3" href="#">Đăng tin</a>
                                            </div> -->
        
                                            <!-- phần hiển thi dang nhap tk tuyen dụng -->
                                            <div class="navbar-brand"  id="navbarNav">
                                                <ul class="navbar-nav">
                                                    <li class="nav-item dropdown">
                                                        <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button"
                                                            data-bs-toggle="dropdown" aria-expanded="false">
                                                            <i class="fas fa-user"></i> Công ty FGC
                                                        </a>
                                                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                            <li class="d-flex align-items-center flex-column" style="min-width: 265px;">
                                                                <img style="width: 80px; height: 80px; border-radius: 50%; overflow: hidden;"
                                                                    src="client/img/elements/d.jpg" />
                                                                <div class="text-center my-3">
                                                                    Công ty FGC
                                                                    <p class="fs-6">FGCdemo@gmail.com</p>
                                                                </div>
                                                            </li>
                                                            <li><hr class="dropdown-divider"></li>
                                                            <li><a class="dropdown-item" href="profile.html">Thông tin tài khoản</a></li>
                                                            <li><a class="dropdown-item" href="form_job.html">Đăng bài tuyển dụng</a></li>
                                                            <li><a class="dropdown-item" href="ds_tuyendung.html">Quản lý tuyển dụng dụng</a></li>
                                                            <li><a class="dropdown-item" href="plan.html">Đăng ký dịch vụ</a></li>
                                                            <li><hr class="dropdown-divider"></li>
                                                            <li><a class="dropdown-item" href="#">Đăng xuất</a></li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="d-none d-lg-block">
                                                <a class="boxed-btn3" href="#">Ứng tuyển</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="mobile_menu d-block d-lg-none"></div>
                                    </div>
                                </div>
                            </div>
        
                        </div>
                    </div>
                </div>   
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
            </header>