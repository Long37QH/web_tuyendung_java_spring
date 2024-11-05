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
    <link rel="stylesheet" href="/client/css/gijgo.css">
    <link rel="stylesheet" href="/client/css/animate.min.css">
    <link rel="stylesheet" href="/client/css/slicknav.css">

    <link rel="stylesheet" href="/client/css/style.css">
    <!-- <link rel="stylesheet" href="css/responsive.css"> -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

    <style>
        .category-btns button {
          margin-right: 5px;
        }
        .job-count {
          background-color: #fff8ee;
          color: #333;
          border-radius: 15px;
          padding: 5px 10px;
          font-size: 0.9rem;
          font-weight: 500;
        }
        .highlighted {
          border-color: #00a65a;
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
                        <h3>Các công ty nổi bật</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ bradcam_area  -->

    <!-- featured_candidates_area_start  -->
    <div class="featured_candidates_area ">
        <div class="container pt-4" style="max-width: 1150px;">
            
                <h3 class="text-success">Thương hiệu lớn tiêu biểu</h3>
                <p>Những thương hiệu tuyển dụng đã khẳng định được vị thế trên thị trường.</p>
              
                <!-- Category Buttons -->
                <div class="category-btns mb-4">
                  <button class="btn btn-outline-secondary">Tất cả</button>
                  <button class="btn btn-outline-secondary">Ngân hàng</button>
                  <button class="btn btn-outline-secondary">Bất động sản</button>
                  <button class="btn btn-outline-secondary">Xây dựng</button>
                  <button class="btn btn-outline-secondary">IT - Phần mềm</button>
                  <button class="btn btn-outline-secondary">Tài chính</button>
                  <button class="btn btn-outline-secondary">Bán lẻ - Hàng tiêu dùng - FMCG</button>
                  <button class="btn btn-outline-secondary">Sản xuất</button>
                </div>
              
                <!-- Company Cards -->
                <div class="row mt-5">
                    <c:forEach var="user" items="${listcompany}">
                        <div class="card col-md-4 col-lg-4 m-2" style="max-width: 350px;">
                            <div class="card-body job-card d-flex">
                            <div class="col-4">
                                <img style="width: 100%;" src="/images/company/${user.logoCompany}" alt="Everland" class="img-fluid">
                            </div>
                            <div class="col-8">
                                <h6>${user.company}</h6>
                                <p>Bất động sản</p>
                                <span class="job-count">${user.sumjob} việc làm</span>
                            </div>
                            </div>
                        </div>
                    </c:forEach>
                    
                  <!-- Add more cards as needed -->
                </div>
            
            <div class="row">
                <div class="col-lg-12">
                    <div class="pagination_wrap">
                        <ul>
                            <c:if test="${curentPage != 1}">
                                    <li><a href="/company?page=${curentPage -1}"> <i class="ti-angle-left"></i> </a></li>
                                </c:if>
                                <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                                    <li><a class="${(loop.index + 1) eq curentPage ? 'active':''}" href="/company?page=${loop.index + 1}"><span>${loop.index + 1}</span></a></li>
                                </c:forEach>
                                <c:if test="${curentPage != totalPages}">
                                    <li><a href="/company?page=${curentPage + 1}"> <i class="ti-angle-right"></i> </a></li>
                                </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- featured_candidates_area_end  -->

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
    <script src="/client/js/gijgo.min.js"></script>



    <!--contact js-->
    <script src="/client/js/contact.js"></script>
    <script src="/client/js/jquery.ajaxchimp.min.js"></script>
    <script src="/client/js/jquery.form.js"></script>
    <script src="/client/js/jquery.validate.min.js"></script>
    <script src="/client/js/mail-script.js"></script>


    <script src="/client/js/main.js"></script>
</body>

</html>