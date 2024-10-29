<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
<html lang="en">

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
    <link rel="stylesheet" href="client/css/bootstrap.min.css">
    <link rel="stylesheet" href="client/css/owl.carousel.min.css">
    <link rel="stylesheet" href="client/css/magnific-popup.css">
    <link rel="stylesheet" href="client/css/font-awesome.min.css">
    <link rel="stylesheet" href="client/css/themify-icons.css">
    <link rel="stylesheet" href="client/css/nice-select.css">
    <link rel="stylesheet" href="client/css/flaticon.css">
    <link rel="stylesheet" href="client/css/gijgo.css">
    <link rel="stylesheet" href="client/css/animate.css">
    <link rel="stylesheet" href="client/css/slicknav.css">
    <link rel="stylesheet" href="client/css/style.css">
    <link rel="stylesheet" href="client/css/responsive.css">
    
    <!-- cdn icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="client/css/plan.css">

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
    <!-- header-start -->
    <jsp:include page="../layout/header.jsp" />
    <!-- header-end -->

    <div class="bradcam_area bradcam_bg_2">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="bradcam_text">
                        <h3>Các gói dịch chúng tôi cung cấp</h3>
                        <p>Cộng hưởng sức mạnh công nghệ tạo ra hiệu quả đột phá cho tin tuyển dụng của Doanh nghiệp</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Pricing Cards -->
    <div class="container py-5">
        <div class="row row-cols-1 row-cols-md-3 mb-3 text-center">

            <!-- Basic Plan -->
            <c:forEach var="plan" items="${listplans}">
                <div class="col mb-4">
                    <div class="card">
                        <div class="card-header ${plan.name == 'Standard' ? 'bg-success' : 'bg-primary' }  text-white">
                            <h4 class="my-0 fw-normal">Gói ${plan.name}</h4>
                        </div>
                        <div class="card-body">
                            <h3 class="">
                                <fmt:formatNumber type="number" value="${plan.price}" /> đ
                                <small class="text-muted fw-light">/Tháng</small>
                            </h3>
                            <ul class="list-unstyled mt-3 mb-4">
                                ${plan.detail}
                            </ul>
                            <form action="/submitOrder" method="post">
                                <input type="hidden" type="text" value="${plan.id}" name="id">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <button class="btn btn-custom">Đăng ký gói</button>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <!-- Standard Plan -->
            <!-- <div class="col mb-4">
                <div class="card">
                    <div class="card-header bg-success text-white">
                        <h4 class="my-0 fw-normal">Standard</h4>
                    </div>
                    <div class="card-body">
                        <h1 class="price">$49<small class="text-muted fw-light">/mo</small></h1>
                        <ul class="list-unstyled mt-3 mb-4">
                            <li>5 job posts</li>
                            <li>Priority email support</li>
                            <li>Advanced analytics</li>
                        </ul>
                        <button type="button" class="btn btn-custom">Sign up</button>
                    </div>
                </div>
            </div> -->

            <!-- Premium Plan -->
            <!-- <div class="col mb-4">
                <div class="card">
                    <div class="card-header bg-warning text-white">
                        <h4 class="my-0 fw-normal">Premium</h4>
                    </div>
                    <div class="card-body">
                        <h1 class="price">$99<small class="text-muted fw-light">/mo</small></h1>
                        <ul class="list-unstyled mt-3 mb-4">
                            <li>Unlimited job posts</li>
                            <li>24/7 support</li>
                            <li>Detailed analytics</li>
                        </ul>
                        <button type="button" class="btn btn-custom">Sign up</button>
                    </div>
                </div>
            </div> -->
        </div>
    </div>

    <!-- footer start -->
    <jsp:include page="../layout/footer.jsp" />
    <!--/ footer end  -->
    
    
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
    
    <script src="js/main.js"></script>
    <script>
        $('#datepicker').datepicker({
            iconsLibrary: 'fontawesome',
            icons: {
                rightIcon: '<span class="fa fa-caret-down"></span>'
            }
        });
        $('#datepicker2').datepicker({
            iconsLibrary: 'fontawesome',
            icons: {
                rightIcon: '<span class="fa fa-caret-down"></span>'
            }

        });
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
            <c:if test="${not empty errorMessage}">
                toastr.error("${errorMessage}");
            </c:if>
           
        });
    </script>
    </body>
    
    </html>