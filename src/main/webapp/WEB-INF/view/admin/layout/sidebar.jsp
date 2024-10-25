<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <aside id="sidebar" class="sidebar">

            <ul class="sidebar-nav" id="sidebar-nav">
        
              <li class="nav-item">
                <a class="nav-link " href="/admin">
                  <i class="bi bi-grid"></i>
                  <span>Dashboard</span>
                </a>
              </li><!-- End Dashboard Nav -->
        
              <li class="nav-item">
                <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
                  <i class="bi bi-menu-button-wide"></i><span>Quản lý nhà tuyển dụng</span><i class="bi bi-chevron-down ms-auto"></i>
                </a>
                <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                  <li>
                    <a href="#">
                      <i class="bi bi-circle"></i><span>Danh sach nhà tuyển dụng</span>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="bi bi-circle"></i><span>Bài tuyển dụng chờ duyệt</span>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="bi bi-circle"></i><span>Danh sách bài tuyên dụng</span>
                    </a>
                  </li>
                </ul>
              </li><!-- End tuyen dung Nav -->
        
              <li class="nav-item">
                <a class="nav-link collapsed" data-bs-target="#ungvien" data-bs-toggle="collapse" href="#">
                  <i class="bi bi-person"></i><span>Quản lý ứng viên</span><i class="bi bi-chevron-down ms-auto"></i>
                </a>
                <ul id="ungvien" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                  <li>
                    <a href="#">
                      <i class="bi bi-circle"></i><span>Danh sách ứng viên</span>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="bi bi-circle"></i><span>Quản lý cv ứng tuyển</span>
                    </a>
                  </li>
                </ul>
              </li><!-- End ung vien Nav -->
        
              <li class="nav-item">
                <a class="nav-link collapsed" data-bs-target="#post" data-bs-toggle="collapse" href="#">
                  <i class="bi bi-journal-text"></i><span>Quản lý bài viết</span><i class="bi bi-chevron-down ms-auto"></i>
                </a>
                <ul id="post" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                  <li>
                    <a href="/admin/categorypost">
                      <i class="bi bi-circle"></i><span>Danh muc bài viết</span>
                    </a>
                  </li>
                  <li>
                    <a href="/admin/post">
                      <i class="bi bi-circle"></i><span>Dah sách bài viết</span>
                    </a>
                  </li>
                </ul>
              </li><!-- End ung vien Nav -->
        
              <li class="nav-item">
                <a class="nav-link collapsed" href="/admin/user">
                  <i class="bi bi-person-check-fill"></i>
                  <span>Quản lý tài khoản</span>
                </a>
              </li>
        
        
              <li class="nav-item">
                <a class="nav-link collapsed" href="/admin/plan">
                  <i class="bi bi-hourglass-bottom"></i>
                  <span>Quản lý dịch vụ</span>
                </a>
              </li>
        
              <li class="nav-item">
                <a class="nav-link collapsed" href="ds_congty.html">
                  <i class="bi bi-card-list"></i>
                  <span>Quản lý công ty</span>
                </a>
              </li>
        
        
              <li class="nav-heading">Pages</li>
        
              <li class="nav-item">
                <form class="d-none" id="myForm" action="/logout" method="post" >
                  <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
                </form>
                <a onclick="document.getElementById('myForm').submit(); return false;" class="nav-link collapsed" >
                  <i class="bi bi-box-arrow-right"></i>
                  <span>Đăng xuất</span>
                </a>
              </li><!-- End Login Page Nav -->
        
        
            </ul>
        
          </aside>