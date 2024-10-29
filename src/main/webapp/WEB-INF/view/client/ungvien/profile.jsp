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

    <!-- jequery image Preview -->
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

    <script>
        $(document).ready(() => {
            const avatarFile = $("#avatarFile");
            const orgImage = "${userpr.avatar}";
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
    
    <!-- header-start -->
    <jsp:include page="../layout/header.jsp" />
    <!-- header-end -->

    <!-- bradcam_area  -->
    <div class="bradcam_area bradcam_bg_2">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="bradcam_text">
                        <h3>Cùng Jobviet tìm kiếm những ứng viên tiềm năng</h3>
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
                <div class="col-lg-8" >
                    
                    <div class="card">
                        <div class="card-body">
                            <h4 class="mb-3">Thông tin tài khoản</h4>
                            <hr>

                            <div class=" col-12 mt-5">
                                <img class="mx-auto rounded-circle"
                                    style="width: 150px; height: 150px; display: none;" alt="avatar Preview" id="avatarPreview">
                                <div class="text-center my-3">
                                    ${userpr.fullName}
                                    <p class="fs-6">${userpr.email}</p>
                                </div>
                            </div>

                            <!-- Multi Columns Form -->
                            <form:form class="row g-3" method="post"
                                enctype="multipart/form-data" action="/update_profileuv"
                                modelAttribute="userpr">
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
                                
                                <div class="col-md-12 mb-3">
                                    <label for="fullName" class="form-label">Họ tên: </label>
                                    <form:input type="text" class="form-control ${not empty errorFullname ? 'is-invalid' : ''}" id="fullName"
                                        path="fullName" />
                                        ${errorFullname}    
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="inputEmail5" class="form-label">Email:</label>
                                    <form:input type="email" class="form-control ${not empty errorEmail ? 'is-invalid' : '' }"
                                        id="inputEmail5" path="email" readonly="true" /> 
                                        ${errorEmail}
                                </div>
                                <div class="col-6 mb-3">
                                    <label for="inputAddress2" class="form-label">Năm sinh :
                                    </label>
                                    <form:input type="text" class="form-control"
                                        id="inputAddress2" placeholder="dd/mm/yyyy"
                                        path="dateOfBirth" />
                                </div>
                                <div class="col-6 mb-3">
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
                                <div class="col-6 mb-3">
                                    <label for="plan" class="form-label">Loai tài khoản :</label>
                                    <form:input type="text" class="form-control"
                                        id="plan" path="plan.name" readonly="true"  />
                                </div>
                                <div class="col-md-6">
                                    <label for="avatarFile" class="form-label">Avatar:</label>
                                    <input class="form-control" type="file" id="avatarFile"
                                        accept=".png, .jpg, .jpeg, .svg, .webp" name="fileImage">
                                </div>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <div class="text-center col-md-12 mt-4">
                                    <button type="submit" class="btn btn-primary mx-auto">Câp nhât thông tin</button>
                                </div>
                            </form:form><!-- End Multi Columns Form -->

                        </div>    
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="blog_right_sidebar">
                        <aside class="single_sidebar_widget search_widget">
                            <h4 class="mb-3">Thay đổi mật khẩu</h4>
                            <hr>
                                <form class="" action="">
                                    <div class="form-group">
                                        <input type="password" class="form-control"  placeholder='password old' required>
                                     </div>
                                     <div class="form-group">
                                        <input type="password" class="form-control"  placeholder='password new' required>
                                     </div>
                                     <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
                                        type="submit">Lưu lại</button>
                                </form>
                        </aside>
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