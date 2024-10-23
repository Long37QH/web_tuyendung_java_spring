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
</head>

<body>
    <!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

    <!-- header-start -->
    <jsp:include page="../layout/header.jsp" />
    <!-- header-end -->

    <!-- bradcam_area  -->
    <div class="bradcam_area bradcam_bg_1">
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
                            <h3>Bộ lọc</h3>
                            <form action="#">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="single_field">
                                            <input type="text" placeholder="Vị trí tuyển dụng">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="single_field">
                                            <select class="wide">
                                                <option value="">Khu vực</option>
                                                <option value="1">Rangpur</option>
                                                <option value="2">Dhaka </option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="single_field">
                                            <select class="wide">
                                                <option value="">Nghành nghề</option>
                                                <option value="1">Category 1</option>
                                                <option value="2">Category 2 </option>
                                            </select>
                                        </div>
                                    </div>
                
                                    <div class="col-lg-12">
                                        <div class="single_field">
                                            <select class="wide">
                                                <option value="">Hình Thức</option>
                                                <option value="1">full time </option>
                                                <option value="2">part time </option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="single_field">
                                            <select class="wide">
                                                <option value="">Kinh nghiệm</option>
                                                <option value="1">1 Năm</option>
                                                <option value="2">2 Năm</option>
                                            </select>
                                        </div>
                                    </div>
                                    
                                </div>
                            </form>
                        </div>
                        <div class="range_wrap">
                            <label for="amount">Price range:</label>
                            <div id="slider-range"></div>
                            <p>
                                <input type="text" id="amount" readonly style="border:0; color:#7A838B; font-size: 14px; font-weight:400;">
                            </p>
                        </div>
                        <div class="reset_btn">
                            <button  class="boxed-btn3 w-100" type="submit">Lọc kết quả</button>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="recent_joblist_wrap">
                        <div class="recent_joblist white-bg ">
                            <div class="row align-items-center">
                                <div class="col-md-6">
                                    <h4>Danh sách việc làm</h4>
                                </div>
                                <div class="col-md-6">
                                    <div class="serch_cat d-flex justify-content-end">
                                        <select>
                                            <option value="">Ngành Nghề</option>
                                            <option value="1">Công Nghệ Thông Tin</option>
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
                            <div class="col-lg-12 col-md-12">
                                <div class="single_jobs white-bg d-flex justify-content-between">
                                    <div class="jobs_left d-flex align-items-center">
                                        <div class="thumb">
                                            <img src="client/img/svg_icon/1.svg" alt="">
                                        </div>
                                        <div class="jobs_conetent">
                                            <a href="job_details.html"><h4>Software Engineer</h4></a>
                                            <div class="links_locat d-flex align-items-center">
                                                <div class="location">
                                                    <p> <i class="fa fa-map-marker"></i> Thành phố Vinh, Nghệ an</p>
                                                </div>
                                                <div class="location">
                                                    <p> <i class="fa-solid fa-money-bill-1"></i> 10 - 15 triệu</p>
                                                </div>
                
                                            </div>
                                            <div class="links_locat d-flex align-items-center">
                                                <p> <i class="fa-solid fa-business-time"></i> CÔNG TY TNHH BẢO HIỂM NHÂN THỌ AIA (VIỆT NAM)</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="jobs_right">
                                        <div class="apply_now">
                                            <a class="heart_mark" href="#"> <i class="fa fa-heart"></i> </a>
                                            <a href="job_details.html" class="boxed-btn3">Ứng Tuyển</a>
                                        </div>
                                        <div class="date">
                                            <p>Date line: <strong>31/10/2024</strong></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12">
                                <div class="single_jobs white-bg d-flex justify-content-between">
                                    <div class="jobs_left d-flex align-items-center">
                                        <div class="thumb">
                                            <img src="client/img/svg_icon/2.svg" alt="">
                                        </div>
                                        <div class="jobs_conetent">
                                            <a href="job_details.html">
                                                <h4>Software Engineer</h4>
                                            </a>
                                            <div class="links_locat d-flex align-items-center">
                                                <div class="location">
                                                    <p> <i class="fa fa-map-marker"></i> Thành phố Vinh, Nghệ an</p>
                                                </div>
                                                <div class="location">
                                                    <p> <i class="fa-solid fa-money-bill-1"></i> 10 - 15 triệu</p>
                                                </div>
                            
                                            </div>
                                            <div class="links_locat d-flex align-items-center">
                                                <p> <i class="fa-solid fa-business-time"></i> CÔNG TY TNHH BẢO HIỂM NHÂN THỌ AIA (VIỆT NAM)</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="jobs_right">
                                        <div class="apply_now">
                                            <a class="heart_mark" href="#"> <i class="fa fa-heart"></i> </a>
                                            <a href="job_details.html" class="boxed-btn3">Ứng Tuyển</a>
                                        </div>
                                        <div class="date">
                                            <p>Date line: <strong>31/10/2024</strong></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12">
                                <div class="single_jobs white-bg d-flex justify-content-between">
                                    <div class="jobs_left d-flex align-items-center">
                                        <div class="thumb">
                                            <img src="client/img/svg_icon/3.svg" alt="">
                                        </div>
                                        <div class="jobs_conetent">
                                            <a href="job_details.html">
                                                <h4>Software Engineer</h4>
                                            </a>
                                            <div class="links_locat d-flex align-items-center">
                                                <div class="location">
                                                    <p> <i class="fa fa-map-marker"></i> Thành phố Vinh, Nghệ an</p>
                                                </div>
                                                <div class="location">
                                                    <p> <i class="fa-solid fa-money-bill-1"></i> 10 - 15 triệu</p>
                                                </div>
                            
                                            </div>
                                            <div class="links_locat d-flex align-items-center">
                                                <p> <i class="fa-solid fa-business-time"></i> CÔNG TY TNHH BẢO HIỂM NHÂN THỌ AIA (VIỆT NAM)</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="jobs_right">
                                        <div class="apply_now">
                                            <a class="heart_mark" href="#"> <i class="fa fa-heart"></i> </a>
                                            <a href="job_details.html" class="boxed-btn3">Ứng Tuyển</a>
                                        </div>
                                        <div class="date">
                                            <p>Date line: <strong>31/10/2024</strong></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12">
                                <div class="single_jobs white-bg d-flex justify-content-between">
                                    <div class="jobs_left d-flex align-items-center">
                                        <div class="thumb">
                                            <img src="client/img/svg_icon/4.svg" alt="">
                                        </div>
                                        <div class="jobs_conetent">
                                            <a href="job_details.html">
                                                <h4>Software Engineer</h4>
                                            </a>
                                            <div class="links_locat d-flex align-items-center">
                                                <div class="location">
                                                    <p> <i class="fa fa-map-marker"></i> Thành phố Vinh, Nghệ an</p>
                                                </div>
                                                <div class="location">
                                                    <p> <i class="fa-solid fa-money-bill-1"></i> 10 - 15 triệu</p>
                                                </div>
                            
                                            </div>
                                            <div class="links_locat d-flex align-items-center">
                                                <p> <i class="fa-solid fa-business-time"></i> CÔNG TY TNHH BẢO HIỂM NHÂN THỌ AIA (VIỆT NAM)</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="jobs_right">
                                        <div class="apply_now">
                                            <a class="heart_mark" href="#"> <i class="fa fa-heart"></i> </a>
                                            <a href="job_details.html" class="boxed-btn3">Ứng Tuyển</a>
                                        </div>
                                        <div class="date">
                                            <p>Date line: <strong>31/10/2024</strong></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12">
                                <div class="single_jobs white-bg d-flex justify-content-between">
                                    <div class="jobs_left d-flex align-items-center">
                                        <div class="thumb">
                                            <img src="client/img/svg_icon/5.svg" alt="">
                                        </div>
                                        <div class="jobs_conetent">
                                            <a href="job_details.html">
                                                <h4>Software Engineer</h4>
                                            </a>
                                            <div class="links_locat d-flex align-items-center">
                                                <div class="location">
                                                    <p> <i class="fa fa-map-marker"></i> Thành phố Vinh, Nghệ an</p>
                                                </div>
                                                <div class="location">
                                                    <p> <i class="fa-solid fa-money-bill-1"></i> 10 - 15 triệu</p>
                                                </div>
                            
                                            </div>
                                            <div class="links_locat d-flex align-items-center">
                                                <p> <i class="fa-solid fa-business-time"></i> CÔNG TY TNHH BẢO HIỂM NHÂN THỌ AIA (VIỆT NAM)</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="jobs_right">
                                        <div class="apply_now">
                                            <a class="heart_mark" href="#"> <i class="fa fa-heart"></i> </a>
                                            <a href="job_details.html" class="boxed-btn3">Ứng Tuyển</a>
                                        </div>
                                        <div class="date">
                                            <p>Date line: <strong>31/10/2024</strong></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12">
                                <div class="single_jobs white-bg d-flex justify-content-between">
                                    <div class="jobs_left d-flex align-items-center">
                                        <div class="thumb">
                                            <img src="client/img/svg_icon/6.svg" alt="">
                                        </div>
                                        <div class="jobs_conetent">
                                            <a href="job_details.html">
                                                <h4>Software Engineer</h4>
                                            </a>
                                            <div class="links_locat d-flex align-items-center">
                                                <div class="location">
                                                    <p> <i class="fa fa-map-marker"></i> Thành phố Vinh, Nghệ an</p>
                                                </div>
                                                <div class="location">
                                                    <p> <i class="fa-solid fa-money-bill-1"></i> 10 - 15 triệu</p>
                                                </div>
                            
                                            </div>
                                            <div class="links_locat d-flex align-items-center">
                                                <p> <i class="fa-solid fa-business-time"></i> CÔNG TY TNHH BẢO HIỂM NHÂN THỌ AIA (VIỆT NAM)</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="jobs_right">
                                        <div class="apply_now">
                                            <a class="heart_mark" href="#"> <i class="fa fa-heart"></i> </a>
                                            <a href="job_details.html" class="boxed-btn3">Ứng Tuyển</a>
                                        </div>
                                        <div class="date">
                                            <p>Date line: <strong>31/10/2024</strong></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                <!-- phân trang -->
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="pagination_wrap">
                                    <ul>
                                        <li><a href="#"> <i class="ti-angle-left"></i> </a></li>
                                        <li><a href="#"><span>01</span></a></li>
                                        <li><a href="#"><span>02</span></a></li>
                                        <li><a href="#"> <i class="ti-angle-right"></i> </a></li>
                                    </ul>
                                </div>
                            </div>
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
</body>

</html>