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

          <!-- CKEditor 5 CDN -->
        <script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>


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
                  <li class="breadcrumb-item"><a href="/admin/tuyendung">Quản lý tuyển dung</a></li>
                  <li class="breadcrumb-item active">Thông tin chi tiết bài đăng</li>
                </ol>
              </nav>
            </div><!-- End Page Title -->
            <hr>
            <section class="section dashboard">
              <div class="row">

                <!-- Left side columns -->
                <div class="col-lg-12">
                  <div class="row">

                    <div class="col-lg-10 mx-auto">
                      <div class="card">
                        <div class="card-body">
                          <h5 class="card-title">Thông tin bài đăng tuyển dụng</h5>

                          <form:form class="row g-3 p-4" method="post" enctype="multipart/form-data"
                            action="/admin/tuyendung/dangbai" modelAttribute="jobup">
                                <!-- validate -->
                                <c:set var="errorTitle">
                                    <form:errors path="title" cssClass="invalid-feedback" />
                                </c:set>
                                <c:set var="errorJobPosition">
                                    <form:errors path="jobPosition" cssClass="invalid-feedback" />
                                </c:set>
                                <c:set var="errorAddress">
                                    <form:errors path="address" cssClass="invalid-feedback" />
                                </c:set>
                                <c:set var="errorYearOld">
                                    <form:errors path="yearOld" cssClass="invalid-feedback" />
                                </c:set>
                                <c:set var="errorQuantity">
                                    <form:errors path="quantity" cssClass="invalid-feedback" />
                                </c:set>
                                <c:set var="errorContentjob">
                                    <form:errors path="contentjob" cssClass="invalid-feedback" />
                                </c:set>
                                <c:set var="errorDateline">
                                    <form:errors path="dateline" cssClass="invalid-feedback" />
                                </c:set>
                                <!-- end validate -->
                                <div class="col-md-12 d-none">
                                    <label for="id" class="form-label">ID: </label>
                                    <form:input type="text" class="form-control" id="id" path="id" />
                                </div>
                                <div class="col-md-12 mb-3">
                                    <label class="form-label">Tiêu đề bài đăng:</label>
                                    <form:input type="text" class="form-control ${not empty errorTitle ? 'is-invalid' : ''} " placeholder="Tiêu đề" path="title" />
                                    ${errorTitle}
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Vị trí tuyển dụng:</label>
                                    <form:input type="text" class="form-control ${not empty errorJobPosition ? 'is-invalid' : ''} " placeholder="Vị trí tuyển dụng" path="jobPosition" />
                                    ${errorJobPosition}
                                </div>
                                
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Ngành :</label>
                                    <form:select class="form-select" path="inductry">
                                        <!-- <option selected></option> -->
                                        <form:option value="IT Phần mềm">CNTT / IT Phần mềm</form:option>
                                        <form:option value="Kinh doanh / Bán hàng">Kinh doanh / Bán hàng</form:option>
                                        <form:option value="Hành chính / Văn phòng">Hành chính / Văn phòng</form:option>
                                        <form:option value="Giáo dục / Đào tạo">Giáo dục / Đào tạo</form:option>
                                        <form:option value="Tư vấn">Tư vấn</form:option>
                                        <form:option value="Marketing / Truyền thông">Marketing / Truyền thông</form:option>
                                    </form:select>
                                </div> 
                                <div class="col-md-3 mb-3">
                                    <label class="form-label">Số lượng:</label>
                                    <form:input type="number" class="form-control ${not empty errorQuantity ? 'is-invalid' : ''}" path="quantity" />
                                    ${errorQuantity}
                                </div> 
                                <div class="col-md-3 mb-3">
                                    <label class="form-label">Hình thức :</label>
                                    <form:select class="form-select" path="workingForm">
                                        <!-- <option selected></option> -->
                                        <form:option value="Fulltime">Fulltime</form:option>
                                        <form:option value="Part time">Part time</form:option>
                                        <form:option value="Remote">Remote</form:option>
                                    </form:select>
                                </div> 
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Mức lương :</label>
                                    <form:select class="form-select" path="salary">
                                        <!-- <option selected></option> -->
                                        <form:option value="5-10 triệu">5-10 triệu</form:option>
                                        <form:option value="10-15 triệu">10-15 triệu</form:option>
                                        <form:option value="15-20 triệu">15-20 triệu</form:option>
                                        <form:option value="20-25 triệu">20-25 triệu</form:option>
                                        <form:option value="Thỏa thuận">Thỏa thuận</form:option>
                                    </form:select>
                                </div> 
                                <div class="col-md-3 mb-3">
                                    <label class="form-label">Kinh nghiệm :</label>
                                    <form:select class="form-select" path="experience">
                                        <!-- <option selected></option> -->
                                        <form:option value="Dưới 1 năm">Dưới 1 năm</form:option>
                                        <form:option value="1 năm">1 năm</form:option>
                                        <form:option value="2 năm">2 năm</form:option>
                                        <form:option value="3 năm">3 năm</form:option>
                                        <form:option value="4 năm">4 năm</form:option>
                                        <form:option value="5 năm">5 năm</form:option>
                                    </form:select>
                                </div> 
                                <div class="col-md-3 mb-3">
                                    <label class="form-label">Băng cấp :</label>
                                    <form:select class="form-select" path="degree">
                                        <!-- <option selected></option> -->
                                        <form:option value="Đại học">Đại học</form:option>
                                        <form:option value="Cao đăng">Cao đăng</form:option>
                                        <form:option value="Trung cấp">Trung cấp</form:option>
                                    </form:select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Tuổi:</label>
                                    <form:input type="text" class="form-control ${not empty errorYearOld ? 'is-invalid' : ''} " path="yearOld" />
                                    ${errorYearOld}
                                </div> 
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Hạn tuyển dụng:</label>
                                    <form:input type="text" class="form-control ${not empty errorDateline ? 'is-invalid' : ''} " path="dateline" />
                                    ${errorDateline}
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Khu vực :</label>
                                    <form:select class="form-select" path="area">
                                        <!-- <option selected></option> -->
                                        <form:option value="Hà Nội">Hà Nội</form:option>
                                        <form:option value="Nghệ An">Nghệ An</form:option>
                                        <form:option value="Đà Nẵng">Đà Nẵng</form:option>
                                        <form:option value="TP Hồ Chí Minh">TP Hồ Chí Minh</form:option>
                                        <form:option value="Bắc Ninh">Bắc Ninh</form:option>
                                        <form:option value="Miền Bắc">Miền Bắc</form:option>
                                        <form:option value="Miền Trung">Miền Trung</form:option>
                                        <form:option value="Miền Nam">Miền Nam</form:option>
                                    </form:select>
                                </div> 

                                <div class="col-md-12 mb-3">
                                    <label class="form-label">Địa chỉ:</label>
                                    <form:input type="text" class="form-control ${not empty errorAddress ? 'is-invalid' : ''}" path="address" />
                                    ${errorAddress}
                                </div>
                                <div class="col-md-12 mb-3">
                                    <label class="form-label">Mô tả công việc:</label>
                                    <form:textarea class="form-control ${not empty errorContentjob ? 'is-invalid' : ''}" name="content" id="editor" path="contentjob" ></form:textarea>
                                    ${errorContentjob}
                                </div>
                                
                                <div class="col-md-12 mt-3 text-center ">
                                    <a href="/admin/tuyendung/ds_baidang" class="btn btn-success mr-3">Quay lại</a>
                                    <button type="submit" class="btn btn-primary">Đăng bài</button>
                                </div>
                            </form:form>
                            <!-- CKEditor 5 Script -->
                            <script>
                                ClassicEditor
                                    .create(document.querySelector('#editor'))
                                    .catch(error => {
                                        console.error(error);
                                    });
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