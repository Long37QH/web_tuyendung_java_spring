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
                                            
        
                                            <!-- phân khi đang nhap tk ứng viên -->
                                            <c:if test="${sessionScope.roleUser == 'USER2'}">
                                                <div class="navbar-brand"  id="navbarNav">
                                                    <ul class="navbar-nav">
                                                        <li class="nav-item dropdown">
                                                            <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button"
                                                                data-bs-toggle="dropdown" aria-expanded="false">
                                                                <i class="fas fa-user"></i> <c:out value="${sessionScope.fullname}" />
                                                            </a>
                                                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                                <li class="d-flex align-items-center flex-column" style="min-width: 265px;">
                                                                    <img style="width: 80px; height: 80px; border-radius: 50%; overflow: hidden;"
                                                                        src="/images/avatar/${sessionScope.avatar}" />
                                                                    <div class="text-center my-3">
                                                                        <c:out value="${sessionScope.fullname}" />
                                                                        <p class="fs-6"><c:out value="${sessionScope.email}" /></p>
                                                                    </div>
                                                                </li>
                                                                <li><hr class="dropdown-divider"></li>
                                                                <li><a class="dropdown-item" href="#">hông tin tài khoản</a></li>
                                                                <li><a class="dropdown-item" href="#">Lịch sử ứng tuyển</a></li>
                                                                <li><a class="dropdown-item" href="#">Thay đổi mật khẩu</a></li>
                                                                <li><hr class="dropdown-divider"></li>
                                                                <li>
                                                                    <form action="/logout" method="post" >
                                                                        <input type="hidden" name="${_csrf.parameterName}"
                                                                                value="${_csrf.token}" />
                                                                        <button class="dropdown-item" >Đăng xuất</button>
                                                                    </form>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="d-none d-lg-block">
                                                    <a class="boxed-btn3" href="/login">Đăng tin</a>
                                                </div>
                                            </c:if>
                                            
                                             <!-- phần hiển thi dang nhap tk tuyen dụng -->
                                            <c:if test="${sessionScope.roleUser == 'USER1'}">
                                            <div class="navbar-brand"  id="navbarNav">
                                                <ul class="navbar-nav">
                                                    <li class="nav-item dropdown">
                                                        <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button"
                                                            data-bs-toggle="dropdown" aria-expanded="false">
                                                            <i class="fas fa-user"></i> <c:out value="${sessionScope.fullname}" />
                                                        </a>
                                                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                            <li class="d-flex align-items-center flex-column" style="min-width: 265px;">
                                                                <img style="width: 80px; height: 80px; border-radius: 50%; overflow: hidden;"
                                                                    src="/images/avatar/${sessionScope.avatar}" />
                                                                <div class="text-center my-3">
                                                                    <c:out value="${sessionScope.fullname}" />
                                                                    <p class="fs-6"><c:out value="${sessionScope.email}" /></p>
                                                                </div>
                                                            </li>
                                                            <li><hr class="dropdown-divider"></li>
                                                            <li><a class="dropdown-item" href="profile.html">Thông tin tài khoản</a></li>
                                                            <li><a class="dropdown-item" href="form_job.html">Đăng bài tuyển dụng</a></li>
                                                            <li><a class="dropdown-item" href="ds_tuyendung.html">Quản lý tuyển dụng dụng</a></li>
                                                            <li><a class="dropdown-item" href="plan.html">Đăng ký dịch vụ</a></li>
                                                            <li><hr class="dropdown-divider"></li>
                                                            <li>
                                                                <form action="/logout" method="post" >
                                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                                            value="${_csrf.token}" />
                                                                    <button class="dropdown-item" >Đăng xuất</button>
                                                                </form>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="d-none d-lg-block">
                                                <a class="boxed-btn3" href="/login">Ứng tuyển</a>
                                            </div>
                                            
                                            <!-- chư đăng nhập -->
                                            </c:if>
                                            <c:if test="${empty pageContext.request.userPrincipal}">
                                                <div class="phone_num d-none d-xl-block">
                                                    <a href="/login" class="nav-link fs-2 "><i class="fas fa-user"></i> Đăng nhập</a>
                                                </div> 
                                                <div class="d-none d-lg-block">
                                                    <a class="boxed-btn3" href="/login">Ứng tuyển</a>
                                                </div>
                                            </c:if>
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