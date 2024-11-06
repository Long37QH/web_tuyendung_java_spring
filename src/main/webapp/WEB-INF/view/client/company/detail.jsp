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
    <link rel="stylesheet" href="/client/css/gijgo.css">
    <link rel="stylesheet" href="/client/css/animate.min.css">
    <link rel="stylesheet" href="/client/css/slicknav.css">

    <link rel="stylesheet" href="/client/css/style.css">
    <!-- <link rel="stylesheet" href="css/responsive.css"> -->

    <!-- cdn icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
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
                        <h3>${user.company}</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ bradcam_area  -->

    <div class="job_details_area">
        <div class="container" style="max-width: 1190px;">
            <div class="row">
                <div class="col-lg-9">
                    <div class="job_details_header">
                        <div class="single_jobs white-bg d-flex justify-content-between">
                            <div class="jobs_left d-flex align-items-center">
                                <div class="mr-4">
                                    <img class="rounded border border-dark" style="width: 80px;" src="/images/company/${user.logoCompany}" alt="">
                                </div>
                                <div class="jobs_conetent">
                                    <a href="#">${user.company}</a>
                                    <div class="links_locat d-flex align-items-center">
                                        <div class="location">
                                            <p> <i class="fa-solid fa-business-time"></i>${user.descCompany}</p>
                                        </div>
                                        <!-- <div class="location">
                                            <p> <i class="fa fa-clock-o"></i> descCompany</p>
                                        </div> -->
                                    </div>
                                </div>
                            </div>
                            <div class="jobs_right">
                                <div class="apply_now">
                                    <a class="heart_mark" href="#"> <i class="ti-heart"></i> </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="descript_wrap white-bg">
                        <div class="single_wrap">
                            <h4>Giới thiệu công ty</h4>
                            <p>${user.descLongCompany}</p>
                        </div>
                    </div>
                    
                    <div class="col-lg-12 white-bg">
                        <div class="recent_joblist_wrap">
                            <div class="recent_joblist white-bg ">
                                <div class="row align-items-center">
                                    <div class="col-md-6">
                                        <h4>Vị tri công ty tuyển dụng</h4>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                        <hr> 
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
                            </div>
                            <!-- phân trang -->
                            <div class="row">
                                <div class="col-lg-12 mb-4">
                                    <div class="pagination_wrap">
                                        <ul>
                                            <c:if test="${curentPage != 1}">
                                                <li><a href="/company/detail?page=${curentPage -1}&${queryString}"> <i class="ti-angle-left"></i> </a></li>
                                            </c:if>
                                            <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                                                <li><a class="${(loop.index + 1) eq curentPage ? 'active':''}" href="/company/detail?page=${loop.index + 1}&${queryString}"><span>${loop.index + 1}</span></a></li>
                                            </c:forEach>
                                            <c:if test="${curentPage != totalPages}">
                                                <li><a href="/company/detail?page=${curentPage + 1}&${queryString}"> <i class="ti-angle-right"></i> </a></li>
                                            </c:if>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="job_sumary">
                        <div class="summery_header">
                            <h3>Thông tin liên quan</h3>
                        </div>
                        <div class="job_content">
                            <ul>
                                <li>Lĩnh vực hoạt động: <span>${user.descCompany}</span></li>
                                <li>Địa chỉ công ty: <span>102A Bùi Minh Trực, Phường 6, Quận 8, Tp.HCM</span></li>
                            </ul>
                        </div>
                    </div>
                    <div class="share_wrap d-flex">
                        <span>Share at:</span>
                        <ul>
                            <li><a href="#"> <i class="ti-facebook"></i></a> </li>
                            <li><a href="#"> <i class="fa-brands fa-google-plus"></i></a> </li>
                            <li><a href="#"> <i class="fa-brands fa-twitter"></i></a> </li>
                            <li><a href="#"> <i class="fa-brands fa-instagram"></i></a> </li>
                        </ul>
                    </div>
                    <!-- google map -->
                    <div class="job_location_wrap">
                        <div class="job_lok_inner">
                            <div id="map" style="height: 200px;">
                                <iframe
                                    src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15679.910073269462!2d106.652771!3d10.736216!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752e42a75f0195%3A0x314927b21152836e!2zMTAyQSDEkC4gQsO5aSBNaW5oIFRy4buxYywgUGjGsOG7nW5nIDYsIFF14bqtbiA4LCBUUC4gSOG7kyBDaMOtIE1pbmgsIFZp4buHdCBOYW0!5e0!3m2!1svi!2sus!4v1727250111369!5m2!1svi!2sus"
                                    width="400" height="300" style="border:0;" allowfullscreen="" loading="lazy"
                                    referrerpolicy="no-referrer-when-downgrade"></iframe>
                            </div>  
                          </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- footer start -->
    <jsp:include page="../layout/footer.jsp" />
    <!--/ footer end  -->

    <!-- link that opens popup -->
    <!-- JS here -->
    <script src="/clint/js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="/clint/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="/clint/js/popper.min.js"></script>
    <script src="/clint/js/bootstrap.min.js"></script>
    <script src="/clint/js/owl.carousel.min.js"></script>
    <script src="/clint/js/isotope.pkgd.min.js"></script>
    <script src="/clint/js/ajax-form.js"></script>
    <script src="/clint/js/waypoints.min.js"></script>
    <script src="/clint/js/jquery.counterup.min.js"></script>
    <script src="/clint/js/imagesloaded.pkgd.min.js"></script>
    <script src="/clint/js/scrollIt.js"></script>
    <script src="/clint/js/jquery.scrollUp.min.js"></script>
    <script src="/clint/js/wow.min.js"></script>
    <script src="/clint/js/nice-select.min.js"></script>
    <script src="/clint/js/jquery.slicknav.min.js"></script>
    <script src="/clint/js/jquery.magnific-popup.min.js"></script>
    <script src="/clint/js/plugins.js"></script>
    <script src="/clint/js/gijgo.min.js"></script>



    <!--contact js-->
    <script src="/clint/js/contact.js"></script>
    <script src="/clint/js/jquery.ajaxchimp.min.js"></script>
    <script src="/clint/js/jquery.form.js"></script>
    <script src="/clint/js/jquery.validate.min.js"></script>
    <script src="/clint/js/mail-script.js"></script>


    <script src="/clint/js/main.js"></script>
</body>

</html>