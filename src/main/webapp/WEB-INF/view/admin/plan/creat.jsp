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
          <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
            rel="stylesheet">

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

          <!-- CKEditor CDN -->
            <script src="https://cdn.ckeditor.com/4.18.0/standard/ckeditor.js"></script>

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
                  <li class="breadcrumb-item"><a href="/admin/plan">Quản lý dịch vụ</a></li>
                  <li class="breadcrumb-item active">Thêm mới gói dịch vụ</li>
                </ol>
              </nav>
            </div><!-- End Page Title -->
            <hr>
            <section class="section dashboard">
              <div class="row">

                <!-- Left side columns -->
                <div class="col-lg-12">
                  <div class="row">

                    <div class="col-lg-8 mx-auto">
                      <div class="card">
                        <div class="card-body">
                          <h5 class="card-title">Thông tin gói dịch vụ</h5>

                          <!-- Multi Columns Form -->
                          <form:form class="row g-3" method="post" enctype="multipart/form-data"
                            action="/admin/plan/creat" modelAttribute="plannew">

                            <!-- validate -->
                            <c:set var="errorDetailDesc">
                                <form:errors path="detail" cssClass="invalid-feedback" />
                            </c:set>
                            <c:set var="errorname">
                              <form:errors path="name" cssClass="invalid-feedback" />
                            </c:set>
                            <c:set var="errorDesc">
                              <form:errors path="description" cssClass="invalid-feedback" />
                            </c:set>

                            <div class="col-md-12">
                              <label for="name" class="form-label">Tên gói: </label>
                              <form:input type="text" class="form-control ${not empty errorname ? 'is-invalid' : ''}" id="name" path="name" />
                              ${errorname}
                            </div>
                            <div class="col-12">
                                <label for="description" class="form-label">Mô tả ngắn: </label>
                                <form:input type="text" class="form-control ${not empty errorDesc ? 'is-invalid' : ''}" id="description" path="description" />
                              ${errorDesc}
                            </div>
                            <div class="col-6">
                                <label for="price" class="form-label">Gía gói: </label>
                                <form:input type="number" min="0" class="form-control" id="price" path="price" />
                            </div>
                            <div class="col-6">
                              <label for="level" class="form-label">Câp độ: </label>
                              <form:input type="number" min="0" class="form-control" id="level" path="level" />
                          </div>
                            <div class="col-12">
                                <label for="detail" class="form-label">Nội dung gói:</label>
                                <form:textarea type="text"
                                    class="form-control ${not empty errorDetailDesc ? 'is-invalid' : ''}"
                                    id="editor" path="detail" />
                                ${errorDetailDesc}
                            </div>  
                            <div class="text-center">
                              <button type="submit" class="btn btn-primary">Lưu lại</button>
                              <button type="reset" class="btn btn-secondary">Làm mới</button>
                            </div>
                          </form:form><!-- End Multi Columns Form -->
                          <script>
                            // Khởi tạo CKEditor cho textarea
                            CKEDITOR.replace('editor');
                        </script>
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

          <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
              class="bi bi-arrow-up-short"></i></a>

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
            $(document).ready(function () {
              $('#example').DataTable();
            });
          </script>

        </body>

        </html>