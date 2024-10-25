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
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

                    <script>
                        $(document).ready(() => {
                            const avatarFile = $("#avatarFile");
                            const orgImage = "${user.avatar}";
                            if (orgImage) {
                                const urlImage = "/images/avatar/" + orgImage;
                                $("#avatarPreview").attr("src", urlImage);
                                $("#avatarPreview").css({ "display": "block" });
                            }
                            avatarFile.change(function (e) {
                                const imgURL = URL.createObjectURL(e.target.files[0]);
                                $("#avatarPreview").attr("src", imgURL);
                                $("#avatarPreview").css({ "display": "block" });
                            });
                        }); 
                    </script>
                   
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
                                    <li class="breadcrumb-item"><a href="/admin/user">Quản lý User</a></li>
                                    <li class="breadcrumb-item active">Cập nhật thông tin user</li>
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
                                                    <h5 class="card-title">Thông tin User</h5>

                                                    <!-- Multi Columns Form -->
                                                    <form:form class="row g-3" method="post"
                                                        enctype="multipart/form-data" action="/admin/user/update"
                                                        modelAttribute="user">
                                                        <!-- validate -->
                                                        <c:set var="errorFullname">
                                                            <form:errors path="fullName" cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <c:set var="errorEmail">
                                                            <form:errors path="email" cssClass="invalid-feedback" />
                                                        </c:set>

                                                        <div class="col-md-12 d-none">
                                                            <label for="id" class="form-label">ID: </label>
                                                            <form:input type="text" class="form-control" id="id"
                                                                path="id" />
                                                        </div>
                                                        <div class=" col-12">
                                                            <img class="mx-auto rounded-circle"
                                                                style="width: 150px; height: 150px; display: none;"
                                                                alt="avatar Preview" id="avatarPreview">
                                                        </div>
                                                        <div class="col-md-12">
                                                            <label for="fullName" class="form-label">Họ tên: </label>
                                                            <form:input type="text" class="form-control ${not empty errorFullname ? 'is-invalid' : ''}" id="fullName"
                                                                path="fullName" />
                                                                ${errorFullname}
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="inputEmail5" class="form-label">Email:</label>
                                                            <form:input type="email" class="form-control ${not empty errorEmail ? 'is-invalid' : '' }"
                                                                id="inputEmail5" path="email" readonly="true" />
                                                                ${errorEmail}
                                                        </div>
                                                        <div class="col-6">
                                                            <label for="inputAddress2" class="form-label">Năm sinh :
                                                            </label>
                                                            <form:input type="text" class="form-control"
                                                                id="inputAddress2" placeholder="dd/mm/yyyy"
                                                                path="dateOfBirth" />
                                                        </div>
                                                        <div class="col-6">
                                                            <label for="inputAddress5" class="form-label">Địa chỉ :
                                                            </label>
                                                            <form:input type="text" class="form-control"
                                                                id="inputAddres5s" placeholder="Thành phố Vinh..."
                                                                path="addRess" />
                                                        </div>
                                                        <div class="col-6">
                                                            <label for="inputAddress2" class="form-label">Số điện thoại
                                                                : </label>
                                                            <form:input type="text" class="form-control"
                                                                id="inputAddress2" placeholder="+84" path="phone" />
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="inputState" class="form-label">Role : </label>
                                                            <form:select id="inputState" class="form-select"
                                                                path="role.name">
                                                                <form:option value="ADMIN" />
                                                                <form:option value="USER1" />
                                                                <form:option value="USER2" />
                                                            </form:select>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="avatarFile" class="form-label">Avatar:</label>
                                                            <input class="form-control" type="file" id="avatarFile"
                                                                accept=".png, .jpg, .jpeg" name="fileImage">
                                                        </div>
                                                        
                                                        <div class="col-md-12 d-none">
                                                            <label for="plan" class="form-label">gói: </label>
                                                            <form:input type="number" class="form-control" id="plan"
                                                                value="4" path="plan.id" />
                                                        </div>

                                                        <div class="text-center mt-4">
                                                            <button type="submit" class="btn btn-primary">Lưu
                                                                lại</button>
                                                                <a href="/admin/user" class="btn btn-success">Quay lại</a>
                                                        </div>
                                                    </form:form><!-- End Multi Columns Form -->

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