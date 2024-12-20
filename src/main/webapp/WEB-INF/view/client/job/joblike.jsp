<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Job Board</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="/client/img/favicon.png">
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
                        <h2 class="text-white">Việc làm quan tâm</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ bradcam_area  -->

    <!-- job_listing_area_start  -->
    <div class="job_listing_area plus_padding">
        <div class="container">
            <div >
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
                        <li class="breadcrumb-item" aria-current="page">Danh sách việc làm yêu thích
                        </li>
                    </ol>
                </nav>
            </div>
            <div class="row">
                <div class="col-lg-12" >
                    <div class="job_listing_area">
                        <div class="container">
                            <div class="row align-items-center mt-4">
                                <div class="col-lg-12">
                                    <div class="brouse_job text-right">
                                        <a href="/job" class="boxed-btn4">Tìm kiếm thêm việc làm</a>
                                    </div>
                                    <c:if test="${empty listjob }">
                                        <div class="alert alert-secondary mt-4 ">
                                            Chưa có việc làm được thêm trong mục việc làm yêu thich!
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                            <c:if test="${!empty listjob }">
                                <div class="job_lists">
                                    <div class="row">
                                        <c:forEach var="joblike" items="${listjob}">
                                            <div class="col-lg-12 col-md-12">
                                                <div class="single_jobs white-bg d-flex justify-content-between">
                                                    <div class="jobs_left d-flex align-items-center">
                                                        <div class="mr-3">
                                                            <img class="rounded border border-dark" style="width: 75px;" src="/images/company/${joblike.job.user.logoCompany}" alt="">
                                                        </div>
                                                        <div class="jobs_conetent">
                                                            <a href="/job/detail/${joblike.job.id}">
                                                                <h4>${joblike.job.title}</h4>
                                                            </a>
                                                            <div class="links_locat d-flex align-items-center">
                        
                                                                <div class="location">
                                                                    <p> <i class="fa fa-map-marker"></i>Khu vực ${joblike.job.area}</p>
                                                                </div>
                                                                <div class="location">
                                                                    <p> <i class="fa fa-clock-o"></i> ${joblike.job.workingForm}</p>
                                                                </div>
                                                                <div class="location">
                                                                    <p> <i class="fa-solid fa-money-bill-1"></i>${joblike.job.salary}</p>
                                                                </div>
                        
                                                            </div>
                                                            <div class="links_locat d-flex align-items-center">
                                                                <p> <i class="fa-solid fa-business-time"></i> ${joblike.job.user.company}</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="jobs_right">
                                                        <div class="apply_now row d-flex align-items-center justify-content-center">
                                                            <!-- <form action="/remove-joblike/${joblike.id}" method="post">
                                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                                <button style="height: 40px;" class="boxed-btndelete mr-2" ><i class="fa-solid fa-trash-can"></i></button>
                                                            </form> -->
                                                            <a href="/job/detail/${joblike.job.id}" class="boxed-btn3">Ứng Tuyển</a>
                                                            <a class="" href="/remove-joblike/${joblike.id}"> <button style="height: 40px;" class="boxed-btndelete ml-2" ><i class="fa-solid fa-trash-can"></i></button> </a>
                                                        </div>
                                                        <div class="date">
                                                            <p>Date line: <strong>31/10/2024</strong></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>   
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="pagination_wrap">
                                                <ul>
                                                    <c:if test="${curentPage != 1}">
                                                        <li><a href="/list-job-like?page=${curentPage -1}"> <i class="ti-angle-left"></i> </a></li>
                                                    </c:if>
                                                    <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                                                        <li><a class="${(loop.index + 1) eq curentPage ? 'active':''}" href="/list-job-like?page=${loop.index + 1}"><span>${loop.index + 1}</span></a></li>
                                                    </c:forEach>
                                                    <c:if test="${curentPage != totalPages}">
                                                        <li><a href="/list-job-like?page=${curentPage + 1}"> <i class="ti-angle-right"></i> </a></li>
                                                    </c:if>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>
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