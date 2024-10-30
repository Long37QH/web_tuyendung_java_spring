<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

  <!-- Template Main CSS File -->
  <link href="/adminpl/assets/css/style.css" rel="stylesheet">
  <!-- jequery image Preview -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

  <!-- DataTables CSS -->
  <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap5.min.css">

  <!-- cdn icon -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

  <script>
    $(document).ready(() => {
        const avatarFile = $("#avatarFile");
        avatarFile.change(function (e) {
            const imgURL = URL.createObjectURL(e.target.files[0]);
            $("#avatarPreview").attr("src", imgURL);
            $("#avatarPreview").css({ "display": "block" });
        });
    }); 
</script>
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
          <li class="breadcrumb-item"><a href="/admin/user">Quản lý nhà tuyển dụng</a></li>
          <li class="breadcrumb-item active">Thông ti nhà tuyển dụng</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->
    <hr>
    <section class="section dashboard ">
      <div class="row">

        <!-- Left side columns -->
        <div class="col-lg-12">
          <div class="row">

            <div class="col-lg-12" >
                <div class="d-flex justify-content-between mb-2">
                    <h3 class="">Thông tin nhà tuyển dụng </h3>
                </div>
                <hr class="">
                <div class="card mb-2 mx-auto" style="width: 70%;">
                    <img  class="mx-auto mt-4 rounded-circle border border-dark" src="/images/company/${user.logoCompany}" style="height: 150px; width: 150px;" alt="anh dai dien">
                    <div class="card-header text-center">
                      <h6 class="fw-bold" >${user.company}</h6>
                      ${user.role.position}
                    </div>
                    <div class="card-header ">
                        Thông tin chi tiết
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><strong>Tên doang nghiêp/công ty :</strong> ${user.company}</li>
                        <li class="list-group-item"><strong>Tên người dùng :</strong> ${user.fullName}</li>
                        <li class="list-group-item"><strong>Email :</strong> ${user.email}</li>
                        <li class="list-group-item"><strong>Phone :</strong> ${user.phone}</li>
                        <li class="list-group-item"><strong>AddRess :</strong> ${user.addRess}</li>
                        <li class="list-group-item"><strong>Giới thiêu công ty :</strong> ${user.descCompany}</li>
                        <li class="list-group-item"><strong>Loại tài khoản :</strong> ${user.plan.name}</li>
                    </ul>
                    <hr>
                    <div class="text-center mt-3 mb-4">
                      <a href="/admin/tuyendung" class="btn btn-success">Quay lại</a>
                  </div>
                </div>
            </div>

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
  <script src="/adminpl/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="/adminpl/assets/js/main.js"></script>
  <!-- DataTables JS -->
  <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
  <script src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.min.js"></script>

  <!-- DataTable Initialization -->
  <script>
      $(document).ready(function() {
          $('#example').DataTable();
      });
  </script>

</body>

</html>