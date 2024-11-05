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

     <!-- CKEditor 5 CDN -->
    <script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>

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
    <div class="bradcam_area bradcam_bg_1">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="bradcam_text text-white">
                        <h2 class="text-white">Tạo mới bài đăng tuyển dụng</h2>
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
                <nav aria-label="breadcrumb ">
                    <ol class="breadcrumb border bx-border-radius">
                        <li class="breadcrumb-item"><a href="/">Trang chủ</a></li>
                        <li class="breadcrumb-item" aria-current="page">Thêm bài tuyển dụng
                        </li>
                    </ol>
                </nav>
            </div>
            <div class="row">
                <div class="col-lg-12" >
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <div class="row d-flex justify-content-between align-items-center mb-3">
                                <div class="col">
                                    <h4>Nhập thông tin bài đăng tuyển dụng</h4>
                                </div>
                                <div class="col d-grid gap-2 d-md-flex justify-content-md-end">
                                    <h4 class="btn btn-info" >Số lượt đăng  ${user.numPost}</h4>
                                </div>
                            </div>
                            <hr>
                            <form:form class="row g-3 p-4" method="post" enctype="multipart/form-data"
                            action="/tuyendung/taobaidang" modelAttribute="jobnew">
                                <!-- validate -->
                                <c:set var="errorTitle">
                                    <form:errors path="title" cssClass="invalid-feedback" />
                                </c:set>
                                <c:set var="errorJobPosition">
                                    <form:errors path="jobPosition" cssClass="invalid-feedback" />
                                </c:set>
                                <c:set var="errorAddress">
                                    <form:errors path="address" cssClass="invalid-feedback" />
                                </c:set>
                                <c:set var="errorYearOld">
                                    <form:errors path="yearOld" cssClass="invalid-feedback" />
                                </c:set>
                                <c:set var="errorQuantity">
                                    <form:errors path="quantity" cssClass="invalid-feedback" />
                                </c:set>
                                <c:set var="errorContentjob">
                                    <form:errors path="contentjob" cssClass="invalid-feedback" />
                                </c:set>
                                <c:set var="errorDateline">
                                    <form:errors path="dateline" cssClass="invalid-feedback" />
                                </c:set>
                                <!-- end validate -->
                                <div class="col-md-12 mb-3">
                                    <label class="form-label">Tiêu đề bài đăng:</label>
                                    <form:input type="text" class="form-control ${not empty errorTitle ? 'is-invalid' : ''} " placeholder="Tiêu đề" path="title" />
                                    ${errorTitle}
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Vị trí tuyển dụng:</label>
                                    <form:input type="text" class="form-control ${not empty errorJobPosition ? 'is-invalid' : ''} " placeholder="Vị trí tuyển dụng" path="jobPosition" />
                                    ${errorJobPosition}
                                </div>
                                
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Ngành :</label>
                                    <form:select class="form-select" path="inductry">
                                        <!-- <option selected></option> -->
                                        <form:option value="CNTT-IT-PHAN-MEM">CNTT / IT Phần mềm</form:option>
                                        <form:option value="KINH-DOANH-BAN-HANG">Kinh doanh / Bán hàng</form:option>
                                        <form:option value="HANH-CHINH-VAN-PHONG">Hành chính / Văn phòng</form:option>
                                        <form:option value="GIAO-DUC-DAO-TAO">Giáo dục / Đào tạo</form:option>
                                        <form:option value="TU-VAN">Tư vấn</form:option>
                                        <form:option value="MARKETING-TRUYEN-THONG">Marketing / Truyền thông</form:option>
                                    </form:select>
                                </div> 
                                <div class="col-md-3 mb-3">
                                    <label class="form-label">Số lượng:</label>
                                    <form:input type="number" class="form-control ${not empty errorQuantity ? 'is-invalid' : ''}" path="quantity" />
                                    ${errorQuantity}
                                </div> 
                                <div class="col-md-3 mb-3">
                                    <label class="form-label">Hình thức :</label>
                                    <form:select class="form-select" path="workingForm">
                                        <!-- <option selected></option> -->
                                        <form:option value="Fulltime">Fulltime</form:option>
                                        <form:option value="Parttime">Parttime</form:option>
                                        <form:option value="Remote">Remote</form:option>
                                    </form:select>
                                </div> 
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Mức lương :</label>
                                    <form:select class="form-select" path="salary">
                                        <!-- <option selected></option> -->
                                        <form:option value="5-10 triệu">5-10 triệu</form:option>
                                        <form:option value="10-15 triệu">10-15 triệu</form:option>
                                        <form:option value="15-20 triệu">15-20 triệu</form:option>
                                        <form:option value="20-25 triệu">20-25 triệu</form:option>
                                        <form:option value="25-30 triệu">25-30 triệu</form:option>
                                        <form:option value="30-35 triệu">30-40 triệu</form:option>
                                        <form:option value="Trên 40 triệu">Trên 40 triệu</form:option>
                                        <form:option value="Thỏa thuận">Thỏa thuận</form:option>
                                    </form:select>
                                </div> 
                                <div class="col-md-3 mb-3">
                                    <label class="form-label">Kinh nghiệm :</label>
                                    <form:select class="form-select" path="experience">
                                        <!-- <option selected></option> -->
                                        <form:option value="Dưới 1 năm">Dưới 1 năm</form:option>
                                        <form:option value="1 năm">1 năm</form:option>
                                        <form:option value="2 năm">2 năm</form:option>
                                        <form:option value="3 năm">3 năm</form:option>
                                        <form:option value="4 năm">4 năm</form:option>
                                        <form:option value="5 năm">5 năm</form:option>
                                    </form:select>
                                </div> 
                                <div class="col-md-3 mb-3">
                                    <label class="form-label">Băng cấp :</label>
                                    <form:select class="form-select" path="degree">
                                        <!-- <option selected></option> -->
                                        <form:option value="Đại học">Đại học</form:option>
                                        <form:option value="Cao đăng">Cao đăng</form:option>
                                        <form:option value="Trung cấp">Trung cấp</form:option>
                                    </form:select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Tuổi:</label>
                                    <form:input type="text" class="form-control ${not empty errorYearOld ? 'is-invalid' : ''} " path="yearOld" />
                                    ${errorYearOld}
                                </div> 
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Hạn tuyển dụng:</label>
                                    <form:input type="date" class="form-control ${not empty errorDateline ? 'is-invalid' : ''} " path="dateline" />
                                    ${errorDateline}
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Khu vực :</label>
                                    <form:select class="form-select" path="area">
                                        <!-- <option selected></option> -->
                                        <form:option value="Hà Nội">Hà Nội</form:option>
                                        <form:option value="Nghệ An">Nghệ An</form:option>
                                        <form:option value="Đà Nẵng">Đà Nẵng</form:option>
                                        <form:option value="TP Hồ Chí Minh">TP Hồ Chí Minh</form:option>
                                        <form:option value="Bắc Ninh">Bắc Ninh</form:option>
                                        <form:option value="Miền Bắc">Miền Bắc</form:option>
                                        <form:option value="Miền Trung">Miền Trung</form:option>
                                        <form:option value="Miền Nam">Miền Nam</form:option>
                                    </form:select>
                                </div> 

                                <div class="col-md-12 mb-3">
                                    <label class="form-label">Địa chỉ:</label>
                                    <form:input type="text" class="form-control ${not empty errorAddress ? 'is-invalid' : ''}" path="address" />
                                    ${errorAddress}
                                </div>

                                <!-- <div class="col-md-6 mb-3">
                                    <label for="image" class="form-label">Hình ảnh:</label>
                                    <input class="form-control" type="file" id="image" accept=".png, .jpg, .jpeg" name="imageJob">
                                </div>
                                <div class=" col-md-12 mb-3">
                                    <img style="max-height: 250px; display: none;" alt="avatar Preview"
                                        id="avatarPreview">
                                </div> 
                                 <div class="col-md-12 mb-3">
                                    <label for="" class="form-label">Mô tả nhanh</label>
                                    <textarea class="form-control" id="" rows="3"></textarea>
                                </div> -->

                                <div class="col-md-12 mb-3">
                                    <label class="form-label">Mô tả công việc:</label>
                                    <form:textarea class="form-control ${not empty errorContentjob ? 'is-invalid' : ''}" name="content" id="editor" path="contentjob" ></form:textarea>
                                    ${errorContentjob}
                                </div>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                
                                <div class="col-md-12 mt-3 text-center ">
                                    <button type="submit" class="btn btn-primary">Gửi đăng bài</button>
                                </div>
                            </form:form>
                            <!-- CKEditor 5 Script -->
                            <script>
                                ClassicEditor
                                    .create(document.querySelector('#editor'))
                                    .catch(error => {
                                        console.error(error);
                                    });
                            </script>
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