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
    <link rel="shortcut icon" type="image/x-icon" href="client/img/favicon.png">
    <!-- Place favicon.ico in the root directory -->

    <!-- CSS here -->
    <link rel="stylesheet" href="client/css/bootstrap.min.css">
    <link rel="stylesheet" href="client/css/owl.carousel.min.css">
    <link rel="stylesheet" href="client/css/magnific-popup.css">
    <link rel="stylesheet" href="client/css/font-awesome.min.css">
    <link rel="stylesheet" href="client/css/themify-icons.css">
    <link rel="stylesheet" href="client/css/nice-select.css">
    <link rel="stylesheet" href="client/css/flaticon.css">
    <link rel="stylesheet" href="client/css/gijgo.css">
    <link rel="stylesheet" href="client/css/animate.min.css">
    <link rel="stylesheet" href="client/css/slicknav.css">

    <link rel="stylesheet" href="client/css/style.css">
    <!-- <link rel="stylesheet" href="css/responsive.css"> -->

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

    <!-- slider_area_start -->
    <div class="slider_area">
        <div class="single_slider  d-flex align-items-center slider_bg_1">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-7 col-md-6">
                        <div class="slider_text">
                            <h5 class="wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".2s">100+ Nhà Tuyển Dụng
                            </h5>
                            <h3 class="wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".3s">Job Listing Kết Nối
                                Cơ Hội Tìm Kiếm Việc Làm</h3>
                            <p class="wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".4s">Cùng Chúng Tôi Tìm
                                Những Công việc Tuyệt Vời</p>
                            <div class="sldier_btn wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".5s">
                                <a href="#" class="boxed-btn3">Tìm Kiếm Ngay</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="ilstration_img wow fadeInRight d-none d-lg-block text-right" data-wow-duration="1s"
            data-wow-delay=".2s">
            <img src="client/img/banner/illustration.png" alt="">
        </div>
    </div>
    <!-- slider_area_end -->

    <!-- catagory_area -->
    <div class="catagory_area">
        <div class="container">
            <div class="row cat_search">
                <div class="col-lg-3 col-md-4">
                    <div class="single_input">
                        <input type="text" placeholder="Vị trí tuyển dụng">
                    </div>
                </div>
                <div class="col-lg-3 col-md-4">
                    <div class="single_input">
                        <select class="wide">
                            <option data-display="Địa Điểm">Địa Điểm</option>
                            <option value="1">Hà Nội</option>
                            <option value="2">Nghệ An</option>
                            <option value="4">Đà Nẵng</option>
                        </select>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4">
                    <div class="single_input">
                        <select class="wide">
                            <option data-display="Ngành nghề">Ngành Nghề</option>
                            <option value="1">Công Nghệ Thông Tin</option>
                            <option value="2">Điện Tử Viễn Thông</option>
                            <option value="4">Công Nghệ Ô Tô</option>
                        </select>
                    </div>
                </div>
                <div class="col-lg-3 col-md-12">
                    <div class="job_btn">
                        <a href="#" class="boxed-btn3">Tìm Kiếm</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ catagory_area -->
    <!-- top ngành strat -->
    <div class="featured_candidates_area mbot-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section_title text-center mb-10 ">
                        <h4 style="margin-top: 40px;">Top ngành nghề</h4>
                    </div>
                </div>
            </div>

            <div class="row">
                <!-- Kinh doanh/Bán hàng -->
                <div class="col-lg-3 col-md-6 mb-4">
                    <a href="#">
                        <div class="card job-category-card p-4 text-center">
                            <i class="fas fa-shopping-cart category-icon"></i>
                            <h3 class="category-title">Kinh doanh / Bán hàng</h3>
                            <p class="category-description">Cơ hội trong các lĩnh vực kinh doanh và bán hàng hàng đầu.
                            </p>
                        </div>
                    </a>
                </div>
                <!-- IT Phần mềm -->
                <div class="col-lg-3 col-md-6 mb-4">
                    <a href="#">
                        <div class="card job-category-card p-4 text-center">
                            <i class="fas fa-laptop-code category-icon"></i>
                            <h3 class="category-title">IT Phần mềm</h3>
                            <p class="category-description">Khám phá sự nghiệp phát triển phần mềm và công nghệ.</p>
                        </div>
                    </a>
                </div>
                <!-- Hành chính / Văn phòng -->
                <div class="col-lg-3 col-md-6 mb-4">
                    <a href="#">
                        <div class="card job-category-card p-4 text-center">
                            <i class="fas fa-building category-icon"></i>
                            <h3 class="category-title">Hành chính / Văn phòng</h3>
                            <p class="category-description">Công việc văn phòng và hành chính tại các công ty lớn.</p>
                        </div>
                    </a>
                </div>
                <!-- Giáo dục / Đào tạo -->
                <div class="col-lg-3 col-md-6 mb-4">
                    <a href="#">
                        <div class="card job-category-card p-4 text-center">
                            <i class="fas fa-chalkboard-teacher category-icon"></i>
                            <h3 class="category-title">Giáo dục / Đào tạo</h3>
                            <p class="category-description">Cơ hội phát triển trong lĩnh vực giáo dục và đào tạo.</p>
                        </div>
                    </a>
                </div>
                <!-- Tư vấn -->
                <div class="col-lg-3 col-md-6 mb-4">
                    <a href="#">
                        <div class="card job-category-card p-4 text-center">
                            <i class="fas fa-user-tie category-icon"></i>
                            <h3 class="category-title">Tư vấn</h3>
                            <p class="category-description">Khám phá cơ hội trong lĩnh vực tư vấn chuyên nghiệp.</p>
                        </div>
                    </a>
                </div>
                <!-- Marketing / Truyền thông -->
                <div class="col-lg-3 col-md-6 mb-4">
                    <a href="#">
                        <div class="card job-category-card p-4 text-center">
                            <i class="fas fa-bullhorn category-icon"></i>
                            <h3 class="category-title">Marketing / Truyền thông</h3>
                            <p class="category-description">Lĩnh vực marketing và truyền thông sáng tạo.
                            </p>
                        </div>
                    </a>
                </div>
                <!-- Vận tải / Vận kho -->
                <div class="col-lg-3 col-md-6 mb-4">
                    <a href="#">
                        <div class="card job-category-card p-4 text-center">
                            <i class="fas fa-truck category-icon"></i>
                            <h3 class="category-title">Vận tải / Vận kho</h3>
                            <p class="category-description">Cơ hội làm việc trong vận tải, logistics và kho vận.</p>
                        </div>
                    </a>
                </div>
                <!-- Kế toán / Kiểm toán -->
                <div class="col-lg-3 col-md-6 mb-4">
                    <a href="#">
                        <div class="card job-category-card p-4 text-center">
                            <i class="fas fa-calculator category-icon"></i>
                            <h3 class="category-title">Kế toán / Kiểm toán</h3>
                            <p class="category-description">Cơ hội nghề nghiệp trong lĩnh vực kế toán và kiểm toán.</p>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-- featured_candidates_area_start  -->
    <div class="featured_candidates_area ">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section_title  ">
                        <h4 style="margin-top: 40px;">Các công ty nổi bật</h4>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="candidate_active owl-carousel">
                        <div class="single_candidates text-center">
                            <div class="thumb">
                                <img src="client/img/svg_icon/1.svg" alt="">
                            </div>
                            <a href="#">
                                <h4>Markary Jondon</h4>
                            </a>
                            <!-- <p>Software Engineer</p> -->
                        </div>
                        <div class="single_candidates text-center">
                            <div class="thumb">
                                <img src="client/img/svg_icon/2.svg" alt="">
                            </div>
                            <a href="#">
                                <h4>Markary Jondon</h4>
                            </a>
                            <!-- <p>Software Engineer</p> -->
                        </div>
                        <div class="single_candidates text-center">
                            <div class="thumb">
                                <img src="client/img/svg_icon/3.svg" alt="">
                            </div>
                            <a href="#">
                                <h4>Markary Jondon</h4>
                            </a>
                            <!-- <p>Software Engineer</p> -->
                        </div>
                        <div class="single_candidates text-center">
                            <div class="thumb">
                                <img src="client/img/svg_icon/4.svg" alt="">
                            </div>
                            <a href="#">
                                <h4>Markary Jondon</h4>
                            </a>
                            <!-- <p>Software Engineer</p> -->
                        </div>
                        <div class="single_candidates text-center">
                            <div class="thumb">
                                <img src="client/img/svg_icon/5.svg" alt="">
                            </div>
                            <a href="#">
                                <h4>Markary Jondon</h4>
                            </a>
                            <!-- <p>Software Engineer</p> -->
                        </div>
                        <div class="single_candidates text-center">
                            <div class="thumb">
                                <img src="client/img/svg_icon/6.svg" alt="">
                            </div>
                            <a href="#">
                                <h4>Markary Jondon</h4>
                            </a>
                            <!-- <p>Software Engineer</p> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- job_listing_area_start  -->
    <div class="job_listing_area">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <div class="section_title">
                        <h4>Việc làm hấp dẫn</h4>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="brouse_job text-right">
                        <a href="/job" class="boxed-btn4">Tìm kiếm thêm việc làm</a>
                    </div>
                </div>
            </div>
            <div class="job_lists">
                <div class="row">
                    <c:forEach var="job" items="${listjob}">
                        <div class="col-lg-12 col-md-12">
                            <div class="single_jobs white-bg d-flex justify-content-between">
                                <div class="jobs_left d-flex align-items-center">
                                    <div class="mr-3">
                                        <img class="rounded border border-dark" style="width: 75px;" src="/images/company/${job.user.logoCompany}" alt="">
                                    </div>
                                    <div class="jobs_conetent">
                                        <a href="/job/detail/${job.id}">
                                            <h4>${job.title}</h4>
                                        </a>
                                        <div class="links_locat d-flex align-items-center">

                                            <div class="location">
                                                <p> <i class="fa fa-map-marker"></i>Khu vực ${job.area}</p>
                                            </div>
                                            <div class="location">
                                                <p> <i class="fa fa-clock-o"></i> ${job.workingForm}</p>
                                            </div>
                                            <div class="location">
                                                <p> <i class="fa-solid fa-money-bill-1"></i> ${job.salary}</p>
                                            </div>

                                        </div>
                                        <div class="links_locat d-flex align-items-center">
                                            <p> <i class="fa-solid fa-business-time"></i> ${job.user.company}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="jobs_right">
                                    <div class="apply_now row d-flex align-items-center justify-content-center">
                                        <form action="/add-to-joblike/${job.id}" method="post">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <button style="height: 40px;" class="boxed-btnlike mr-2" ><i class="fa-regular fa-heart"></i></button>
                                        </form>
                                        <!-- <a class="heart_mark" href="#"> <i class="ti-heart"></i> </a> -->
                                        <a href="/job/detail/${job.id}" class="boxed-btn3">Ứng Tuyển</a>
                                    </div>
                                    <div class="date">
                                        <p>Date line: <strong>${job.dateline}</strong></p>
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
                                    <li><a href="/?page=${curentPage -1}"> <i class="ti-angle-left"></i> </a></li>
                                </c:if>
                                <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                                    <li><a class="${(loop.index + 1) eq curentPage ? 'active':''}" href="/?page=${loop.index + 1}"><span>${loop.index + 1}</span></a></li>
                                </c:forEach>
                                <c:if test="${curentPage != totalPages}">
                                    <li><a href="/?page=${curentPage + 1}"> <i class="ti-angle-right"></i> </a></li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- job_listing_area_end  -->

    <!-- job_searcing_wrap  -->
    <div class="job_searcing_wrap overlay">
        <div class="container">
            <div class="row">
                <div class="col-lg-5 offset-lg-1 col-md-6">
                    <div class="searching_text">
                        <h3>Bạn đang tìm kiếm việc làm?</h3>
                        <p>Tìm kiếm, ứng tuyển công việc nhanh chóng với nhiều nhà tuyển dụng </p>
                        <a href="#" class="boxed-btn3">Ứng tuyển ngay </a>
                    </div>
                </div>
                <div class="col-lg-5 offset-lg-1 col-md-6">
                    <div class="searching_text">
                        <h3>Bạn đang tìm kiếm ứng viên?</h3>
                        <p>Đăng tin nhanh chóng và nhận được nhiều hồ sơ ứng tuyển </p>
                        <a href="#" class="boxed-btn3">Đăng tuyển ngay</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- job_searcing_wrap end  -->

    <!-- testimonial_area  -->
    <jsp:include page="../layout/testimonial.jsp" />
    <!-- /testimonial_area  -->


    <!-- footer start -->
    <jsp:include page="../layout/footer.jsp" />
    <!--/ footer end  -->

    <!-- link that opens popup -->
    <!-- JS here -->
    <script src="client/js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="client/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="client/js/popper.min.js"></script>
    <script src="client/js/bootstrap.min.js"></script>
    <script src="client/js/owl.carousel.min.js"></script>
    <script src="client/js/isotope.pkgd.min.js"></script>
    <script src="client/js/ajax-form.js"></script>
    <script src="client/js/waypoints.min.js"></script>
    <script src="client/js/jquery.counterup.min.js"></script>
    <script src="client/js/imagesloaded.pkgd.min.js"></script>
    <script src="client/js/scrollIt.js"></script>
    <script src="client/js/jquery.scrollUp.min.js"></script>
    <script src="client/js/wow.min.js"></script>
    <script src="client/js/nice-select.min.js"></script>
    <script src="client/js/jquery.slicknav.min.js"></script>
    <script src="client/js/jquery.magnific-popup.min.js"></script>
    <script src="client/js/plugins.js"></script>
    <script src="client/js/gijgo.min.js"></script>



    <!--contact js-->
    <script src="client/js/contact.js"></script>
    <script src="client/js/jquery.ajaxchimp.min.js"></script>
    <script src="client/js/jquery.form.js"></script>
    <script src="client/js/jquery.validate.min.js"></script>
    <script src="client/js/mail-script.js"></script>


    <script src="client/js/main.js"></script>

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