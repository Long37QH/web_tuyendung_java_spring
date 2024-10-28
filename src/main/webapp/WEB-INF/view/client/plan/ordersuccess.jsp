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
            <div class="w-50 m-auto">
                
                <h1 class="my-3 text-success text-center">Thanh toán thành công</h1>
                
                <h2 class="my-2">Chi tiết gói dịch vụ</h2>
                
                <table class="table table-bordered">
                    <tbody>
                        <tr>
                            <td>Thông tin gói dịch vụ:</td>
                            <td><span>Gói ${orderId}</span></td>
                        </tr>
                        <tr>
                            <td>Tổng tiền:</td>
                            <td><span><fmt:formatNumber type="number" value="${totalPrice / 100}" /> vnđ</span></td>
                        </tr>
                        <tr>
                            <td>Thời gian thanh toán:</td>
                            <td><span>${paymentTime}</span></td>
                        </tr>
                        <tr>
                            <td>Mã giao dịch:</td>
                            <td><span>${transactionId}</span></td>
                        </tr>
                    </tbody>
                </table>
                <a href="/" class="btn btn-primary">Về trang chủ</a>
            </div>
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
            <c:if test="${not empty message}">
                toastr.success("${message}");
            </c:if>
        });
    </script>
    </body>
    
    </html>