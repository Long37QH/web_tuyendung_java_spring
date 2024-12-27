<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Job Board</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
    <!-- Place favicon.ico in the root directory -->

    <!-- CSS here -->
    <link rel="stylesheet" href="/client/css/bootstrap.min.css">
    <link rel="stylesheet" href="/client/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/client/css/magnific-popup.css">
    <link rel="stylesheet" href="/client/css/font-awesome.min.css">
    <link rel="stylesheet" href="/client/css/themify-icons.css">
    <link rel="stylesheet" href="/client/css/nice-select.css">
    <link rel="stylesheet" href="/client/css/flaticon.css">
    <link rel="stylesheet" href="/client/css/jquery-ui.css">
    <link rel="stylesheet" href="/client/css/gijgo.css">
    <link rel="stylesheet" href="/client/css/animate.min.css">
    <link rel="stylesheet" href="/client/css/slicknav.css">

    <link rel="stylesheet" href="/client/css/style.css">
    <!-- <link rel="stylesheet" href="css/responsive.css"> -->

     <!-- CKEditor CDN -->
     <script src="https://cdn.ckeditor.com/4.18.0/standard/ckeditor.js"></script>

    <!-- cdn icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

    <!-- jequery toastr -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- Toastr CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet" />
    <!-- Toastr JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap5.min.css">

    <style>
        .toast-custom-top-right {
            top: 100px !important; /* Cách top 300px */
            right: 12px !important; /* Khoảng cách bên phải */
            position: fixed;
            z-index: 9999;
        }
    </style>
    

</head>

<body>
    <!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

    <!-- header-start -->
    <jsp:include page="../layout/header.jsp" />
    <!-- header-end -->

    <!-- bradcam_area  -->
    <div class="bradcam_area bradcam_bg_2">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="bradcam_text text-white">
                        <h2 class="text-white">Quản lý hồ sơ ứng tuyển</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ bradcam_area  -->

    <!-- job_listing_area_start  -->
    <div class="job_listing_area py-4">
        <div class="container">
            <div>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
                        <li class="breadcrumb-item" aria-current="page">Quản lý hồ sơ ứng tuyển
                        </li>
                    </ol>
                </nav>
            </div>
            <div class="row">
                <div class="col-lg-12" >
                    <h4 class="mb-3">Danh sách ứng viên ứng tuyển</h4>
                    <hr>
                    <table id="example" class="table table-striped table-bordered table-hover mt-4">
                        <thead>
                            <tr>
                                <th>TT</th>
                                <th>Tên ứng viên</th>
                                <th>Vị trí Ứng tuyển</th>      
                                <th>Apply time</th>
                                <th>Kinh nghiệm</th>
                                <th>Trạng thái hồ sơ</th>
                                <th>Tác vụ</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="apply" items="${applies}" varStatus="status" >
                                <tr>
                                    <th>${status.index + 1}</th>
                                    <td>${apply.user.fullName}</td>
                                    <td style="width: 150px;" >${apply.job.title}</td>
                                    <td style="width: 100px;" >${apply.timeapply}</td>
                                    <td>${apply.experience == 0 ? 'Dưới 1 ' : apply.experience} năm</td>
                                    <td>${apply.status}</td>
                                    <td>
                                        <!-- <a class="btn btn-success"
                                            href="#"><i class="fa-regular fa-eye"></i> Xem</a>
                                        <a class="btn btn-primary"
                                            href="#"><i class="fa-solid fa-user-tag"></i> Ứng viên</a> -->
                                        <a class="btn btn-success mx-2 "
                                            href="/tuyendung/ds_hosoungtuyen/cvdetail?userid=${apply.user.id}&jobid=${apply.job.id}"><i class="fa-solid fa-pen-nib"></i> Xem thông tin</a>
                                        <a class="btn btn-danger"
                                            href="/tuyendung/loaiungvien/${apply.id}"><i class="fa-regular fa-trash-can"></i> Loại ứng viên</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!-- job_listing_area_end  -->

    <!-- footer start -->
   <jsp:include page="../layout/footer.jsp" />
   <!--/ footer end  -->

    <!-- link that opens popup -->
    <!-- JS here -->
    <script src="/client/js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="/client/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="/client/js/popper.min.js"></script>
    <script src="/client/js/bootstrap.min.js"></script>
    <script src="/client/js/owl.carousel.min.js"></script>
    <script src="/client/js/isotope.pkgd.min.js"></script>
    <script src="/client/js/ajax-form.js"></script>
    <script src="/client/js/waypoints.min.js"></script>
    <script src="/client/js/jquery.counterup.min.js"></script>
    <script src="/client/js/imagesloaded.pkgd.min.js"></script>
    <script src="/client/js/scrollIt.js"></script>
    <script src="/client/js/jquery.scrollUp.min.js"></script>
    <script src="/client/js/wow.min.js"></script>
    <script src="/client/js/nice-select.min.js"></script>
    <script src="/client/js/jquery.slicknav.min.js"></script>
    <script src="/client/js/jquery.magnific-popup.min.js"></script>
    <script src="/client/js/plugins.js"></script>
    <!-- <script src="js/gijgo.min.js"></script> -->
    <script src="/client/js/range.js"></script>



    <!--contact js-->
    <script src="/client/js/contact.js"></script>
    <script src="/client/js/jquery.ajaxchimp.min.js"></script>
    <script src="/client/js/jquery.form.js"></script>
    <script src="/client/js/jquery.validate.min.js"></script>
    <script src="/client/js/mail-script.js"></script>


    <script src="/client/js/main.js"></script>

    <!-- Bootstrap 5 JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

    <!-- jQuery (DataTables cần jQuery) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- DataTables JS -->
    <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.min.js"></script>

    <!-- DataTable Initialization -->
    <script>
        $(document).ready(function() {
            $('#example').DataTable();
        });
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

	<script>
        $( function() {
            $( "#slider-range" ).slider({
                range: true,
                min: 0,
                max: 24600,
                values: [ 750, 24600 ],
                slide: function( event, ui ) {
                    $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] +"/ Year" );
                }
            });
            $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) +
                " - $" + $( "#slider-range" ).slider( "values", 1 ) + "/ Year");
        } );
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                toastr.options = {
                    "closeButton": true,
                    "debug": false,
                    "newestOnTop": true,
                    "progressBar": true,
                    "positionClass": "toast-custom-top-right", // Thay đổi vị trí hiển thị
                    "preventDuplicates": true,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "3000", // Thời gian tồn tại của thông báo
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                };
                // Check if there's a flash attribute 'message'
                <c:if test="${not empty message}">
                    toastr.success("${message}");
                </c:if>    
            });
        </script>
</body>

</html>