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
    <link rel="stylesheet" href="client/css/jquery-ui.css">
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

    <!-- bradcam_area  -->
    <div class="bradcam_area bradcam_bg_2">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="bradcam_text">
                        <h3>4536+ Việc làm chờ đón bạn</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ bradcam_area  -->

    <!-- job_listing_area_start  -->
    <div class="job_listing_area plus_padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="job_filter white-bg">
                        <div class="form_inner white-bg">
                            <h3><strong>Bộ lọc</strong></h3>
                            <div class="row g-4">
                                <div class="col-12" id="inductryFilter">
                                    <div class="mb-2"><b>Ngành Nghề</b></div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="inductry-1"
                                            value="CNTT-IT-PHAN-MEM">
                                        <label class="form-check-label" for="inductry-1">CNTT / IT Phần mềm</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="inductry-2"
                                            value="KINH-DOANH-BAN-HANG">
                                        <label class="form-check-label" for="inductry-2">Kinh doanh / Bán hàng</label>
                                    </div>

                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="inductry-3"
                                            value="HANH-CHINH-VAN-PHONG">
                                        <label class="form-check-label" for="inductry-3">Hành chính / Văn phòng</label>
                                    </div>

                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="inductry-4"
                                            value="GIAO-DUC-DAO-TAO">
                                        <label class="form-check-label" for="inductry-4">Giáo dục / Đào tạo</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="inductry-5"
                                            value="TU-VAN">
                                        <label class="form-check-label" for="inductry-5">Tư vấn</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="inductry-6"
                                            value="MARKETING-TRUYEN-THONG">
                                        <label class="form-check-label" for="inductry-6">Marketing / Truyền thông</label>
                                    </div>
                                </div>
                                
                                <div class="col-12" id="areaFilter">
                                    <div class="mb-2"><b>Khu vực</b></div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="area-1"
                                            value="Hà Nội">
                                        <label class="form-check-label" for="area-1">Hà Nội</label>
                                    </div>

                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="area-2"
                                            value="Nghệ An">
                                        <label class="form-check-label" for="area-2">Nghệ An</label>
                                    </div>

                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="area-3"
                                            value="Đà Nẵng">
                                        <label class="form-check-label" for="area-3">Đà Nẵng</label>
                                    </div>

                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="area-4"
                                            value="TP Hồ Chí Minh">
                                        <label class="form-check-label" for="area-4">TP Hồ Chí Minh</label>
                                    </div>

                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="area-5"
                                            value="Bắc Ninh">
                                        <label class="form-check-label" for="area-5">Bắc Ninh</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="area-6"
                                            value="Miền Bắc">
                                        <label class="form-check-label" for="area-6">Miền Bắc</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="area-7"
                                            value="Miền Trung">
                                        <label class="form-check-label" for="area-7">Miền Trung</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="area-8"
                                            value="Miền Nam">
                                        <label class="form-check-label" for="area-8">Miền Nam</label>
                                    </div>
                                </div>
                                <div class="col-12" id="workingFormFilter">
                                    <div class="mb-2"><b>Hình thức làm việc</b></div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="workingForm-1"
                                            value="Fulltime">
                                        <label class="form-check-label" for="workingForm-1">Fulltime</label>
                                    </div>

                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="workingForm-2"
                                            value="Parttime">
                                        <label class="form-check-label" for="workingForm-2">Parttime</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="workingForm-3"
                                            value="Remote">
                                        <label class="form-check-label" for="workingForm-3">Remote</label>
                                    </div>

                                </div>

                                <div class="col-12" id="experienceFilter">
                                    <div class="mb-2"><b>Yêu cầu kinh nghiệm</b></div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="experience-1"
                                            value="Dưới 1 năm">
                                        <label class="form-check-label" for="experience-1">Dưới 1 năm</label>
                                    </div>

                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="experience-2"
                                            value="1 năm">
                                        <label class="form-check-label" for="experience-2">1 năm</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="experience-3"
                                            value="2 năm">
                                        <label class="form-check-label" for="experience-3">2 năm</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="experience-4"
                                            value="3 năm">
                                        <label class="form-check-label" for="experience-4">3 năm</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="experience-5"
                                            value="4 năm">
                                        <label class="form-check-label" for="experience-5">4 năm</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="experience-6"
                                            value="5 năm">
                                        <label class="form-check-label" for="experience-6">5 năm</label>
                                    </div>

                                </div>

                                <div class="col-12" id="salaryFilter">
                                    <div class="mb-2"><b>Mức lương</b></div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="salary-1"
                                            value="5-10 triệu">
                                        <label class="form-check-label" for="salary-1">5-10 triệu</label>
                                    </div>

                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="salary-2"
                                            value="10-15 triệu">
                                        <label class="form-check-label" for="salary-2">10-15 triệu</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="salary-3"
                                            value="15-20 triệu">
                                        <label class="form-check-label" for="salary-3">15-20 triệu</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="salary-3"
                                            value="20-25 triệu">
                                        <label class="form-check-label" for="salary-3">20-25 triệu</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="salary-4"
                                            value="25-30 triệu">
                                        <label class="form-check-label" for="salary-4">25-30 triệu</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="salary-5"
                                            value="30-35 triệu">
                                        <label class="form-check-label" for="salary-5">30-35 triệu</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="salary-6"
                                            value="Trên 40 triệu">
                                        <label class="form-check-label" for="salary-6">Trên 40 triệu</label>
                                    </div>

                                </div>
                                
                                <div class="col-12 mt-4">
                                    <button
                                        class="boxed-btn3 w-100"
                                        id="btnFilter">
                                        Lọc kết quả
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="recent_joblist_wrap">
                        <div class="recent_joblist white-bg ">
                            <div class="row align-items-center">
                                <div class="col-md-4">
                                    <h4>Danh sách việc làm</h4>
                                </div>
                                <div class="col-md-8">
                                    <div class="serch_cat d-flex justify-content-end">
                                        <select>
                                            <option value="">Ngành Nghề</option>
                                            <option value="1">CNTT-IT phần mền</option>
                                            <option value="2">Công Nghệ Ô Tô </option>
                                            <option value="4">Tài Chính Ngân Hàng</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="job_lists m-0">
                        <div class="row">
                            <c:if test="${totalPages ==  0}">
                                <div class="col-lg-12 col-md-12">
                                    <div class="text-center" >Không tìm thấy việc làm</div>
                                </div>
                            </c:if>
                            <c:forEach var="job" items="${listjob}">
                                <div class="col-lg-12 col-md-12">
                                    <div class="single_jobs white-bg d-flex justify-content-between">
                                        <div class="jobs_left d-flex align-items-center">
                                            <div class="mr-3">
                                                <img class="rounded border border-dark" style="width: 75px;" src="/images/company/${job.user.logoCompany}" alt="">
                                            </div>
                                            <div class="jobs_conetent">
                                                <a href="/job/detail/${job.id}"><h4 style="width: 460px;" >${job.title}</h4></a>
                                                <div class="links_locat d-flex align-items-center">
                                                    <div class="location">
                                                        <p> <i class="fa fa-map-marker"></i> Khu vực ${job.area}</p>
                                                    </div>
                                                    <div class="location">
                                                        <p> <i class="fa-solid fa-money-bill-1"></i> ${job.salary}</p>
                                                    </div>
                                                    <div class="location">
                                                        <p> <i class="fa-solid fa-user"></i> SL: ${job.quantity}</p>
                                                    </div>
                    
                    
                                                </div>
                                                <div class="links_locat d-flex align-items-center">
                                                    <p> <i class="fa-solid fa-business-time"></i> ${job.user.company}</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="jobs_right">
                                            <div class="apply_now row d-flex align-items-center justify-content-center">
                                                <form action="/add-to-joblike/job/${job.id}" method="post">
                                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                    <button style="height: 40px;" class="boxed-btnlike mr-2" ><i class="fa-regular fa-heart"></i></button>
                                                </form>
                                                <a href="/job/detail/${job.id}" class="boxed-btn3">Ứng Tuyển</a>
                                            </div>
                                            <div class="date">
                                                <p>Date line: <strong>${job.dateline}</strong></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                <!-- phân trang -->
                        </div>
                        <c:if test="${totalPages > 0}">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="pagination_wrap">
                                        <ul>
                                            <c:if test="${curentPage != 1}">
                                                <li><a href="/job?page=${curentPage -1}${queryString}"> <i class="ti-angle-left"></i> </a></li>
                                            </c:if>
                                            <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                                                <li><a class="${(loop.index + 1) eq curentPage ? 'active':''}" href="/job?page=${loop.index + 1}${queryString}"><span>${loop.index + 1}</span></a></li>
                                            </c:forEach>
                                            <c:if test="${curentPage != totalPages}">
                                                <li><a href="/job?page=${curentPage + 1}${queryString}"> <i class="ti-angle-right"></i> </a></li>
                                            </c:if>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </c:if>
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
    <script src="client/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="client/js/vendor/modernizr-3.5.0.min.js"></script>
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
    <!-- <script src="js/gijgo.min.js"></script> -->
    <script src="client/js/range.js"></script>



    <!--contact js-->
    <script src="client/js/contact.js"></script>
    <script src="client/js/jquery.ajaxchimp.min.js"></script>
    <script src="client/js/jquery.form.js"></script>
    <script src="client/js/jquery.validate.min.js"></script>
    <script src="client/js/mail-script.js"></script>


    <script src="client/js/main.js"></script>
    <script src="client/js/main2.js"></script>

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