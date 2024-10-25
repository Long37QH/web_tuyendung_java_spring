<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Dashboard</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="/adminpl/assets/img/logo.png" rel="icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/adminpl/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/adminpl/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/adminpl/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="/adminpl/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="/adminpl/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="/adminpl/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="/adminpl/assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- jequery image Preview -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

  <!-- Template Main CSS File -->
  <link href="/adminpl/assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: NiceAdmin - v2.4.0
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

  <!-- ======= Header ======= -->
  <jsp:include page="../layout/header.jsp" />
  <!-- End Header -->

  <!-- ======= Sidebar ======= -->
  <jsp:include page="../layout/sidebar.jsp" />
  <!-- End Sidebar-->

  <main id="main" class="main" style="min-height: 580px;">

    <div class="pagetitle">
      <h1>Dashboard</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="/admin">Home</a></li>
          <li class="breadcrumb-item active">Dashboard</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
        <div class="col-lg-12">
          <div class="row">

            <!-- job Card -->
            <div class="col-xxl-3 col-md-6">
              <div class="card info-card revenue-card">
                <!-- <div class="filter">
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                      <h6>Filter</h6>
                    </li>

                    <li><a class="dropdown-item" href="#">Today</a></li>
                    <li><a class="dropdown-item" href="#">This Month</a></li>
                    <li><a class="dropdown-item" href="#">This Year</a></li>
                  </ul>
                </div> -->
                <div class="card-body">
                  <h5 class="card-title"><a href="#">Việc làm tuyển dụng </a></h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-door-open-fill"></i>
                    </div>
                    <div class="ps-3">
                      <h6>20</h6>
                      <span class="text-muted small pt-2 ps-1">Việc làm</span>
                    </div>
                  </div>
                </div>
              </div>
            </div><!-- End job Card-->

            <!-- ung vien Card -->
            <div class="col-xxl-3 col-md-6">
              <div class="card info-card sales-card">
                <!-- <div class="filter">
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                      <h6>Filter</h6>
                    </li>

                    <li><a class="dropdown-item" href="#">Today</a></li>
                    <li><a class="dropdown-item" href="#">This Month</a></li>
                    <li><a class="dropdown-item" href="#">This Year</a></li>
                  </ul>
                </div> -->
                <div class="card-body">
                  <h5 class="card-title"><a href="#">Tài khoản ứng viên</a> </h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-people"></i>
                    </div>
                    <div class="ps-3">
                      <h6>145</h6>
                      <span class="text-muted small pt-2 ps-1">Tài khoản</span>
                    </div>
                  </div>
                </div>

              </div>
            </div><!-- ung vien Card -->

            <!-- tuyen dung Card -->
            <div class="col-xxl-3 col-xl-12">
              <div class="card info-card customers-card">
                <!-- <div class="filter">
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                      <h6>Filter</h6>
                    </li>

                    <li><a class="dropdown-item" href="#">Today</a></li>
                    <li><a class="dropdown-item" href="#">This Month</a></li>
                    <li><a class="dropdown-item" href="#">This Year</a></li>
                  </ul>
                </div> -->
                <div class="card-body">
                  <h5 class="card-title"><a href="#">Nhà tuyển dụng</a></h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-people"></i>
                    </div>
                    <div class="ps-3">
                      <h6>40</h6>
                      <span class="text-muted small pt-2 ps-1">Tài khoản</span>

                    </div>
                  </div>

                </div>
              </div>

            </div><!-- end tuyển dung Card -->
           <!-- ung vien Card -->
           <div class="col-xxl-3 col-md-6">
            <div class="card info-card sales-card">
              <!-- <div class="filter">
                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                  <li class="dropdown-header text-start">
                    <h6>Filter</h6>
                  </li>

                  <li><a class="dropdown-item" href="#">Today</a></li>
                  <li><a class="dropdown-item" href="#">This Month</a></li>
                  <li><a class="dropdown-item" href="#">This Year</a></li>
                </ul>
              </div> -->
              <div class="card-body">
                <h5 class="card-title"><a href="#">Bài viết mổi bật</a> </h5>

                <div class="d-flex align-items-center">
                  <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                    <i class="bi bi-people"></i>
                  </div>
                  <div class="ps-3">
                    <h6>25</h6>
                    <span class="text-muted small pt-2 ps-1">Bài</span>
                  </div>
                </div>
              </div>

            </div>
          </div><!-- ung vien Card -->

          </div>
        </div><!-- End Left side columns -->
      </div>
    </section>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <jsp:include page="../layout/footer.jsp" />
  <!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="/adminpl/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="/adminpl/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/adminpl/assets/vendor/chart.js/chart.min.js"></script>
  <script src="/adminpl/assets/vendor/echarts/echarts.min.js"></script>
  <script src="/adminpl/assets/vendor/quill/quill.min.js"></script>
  <script src="/adminpl/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <!-- <script src="assets/vendor/tinymce/tinymce.min.js"></script> -->
  <script src="/adminpl/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="/adminpl/assets/js/main.js"></script>

</body>

</html>