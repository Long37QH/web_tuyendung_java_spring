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

    <!-- CKEditor 5 CDN -->
    <script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>

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
                        <h3 style="font-size: 32px;">${job.title}</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ bradcam_area  -->

    <div class="job_details_area">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="job_details_header">
                        <div class="single_jobs white-bg d-flex justify-content-between">
                            <div class="jobs_left d-flex align-items-center">
                                <div class="mr-4">
                                    <img class="rounded border border-dark" style="width: 80px;" src="/images/company/${job.user.logoCompany}" alt="">
                                </div>
                                <div class="jobs_conetent">
                                    <a href="#"><h4>${job.inductry}</h4></a>
                                    <div class="links_locat d-flex align-items-center">
                                        <div class="location">
                                            <p> <i class="fa-solid fa-business-time"></i> ${job.user.company}</p>
                                        </div>
                                        <div class="location">
                                            <p> <i class="fa fa-clock-o"></i> ${job.workingForm}</p>
                                        </div>
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
                            <h4>Chi tiết tin tuyển dụng</h4>
                            ${job.contentjob}
                        </div>
                    </div>
                    <div class="apply_job_form white-bg">
                        <h4>Ứng tuyển cho vị trí công việc</h4>
                        <form:form method="post" enctype="multipart/form-data" action="/applycv/${job.id}" modelAttribute="applyNew">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="input_field">
                                        <form:input type="text" placeholder="Họ tên ứng viên" path="receiverName"/>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="input_field">
                                        <form:input type="text" placeholder="Số điện thoại" path="receiverPhone"/>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="input_field">
                                        <form:input type="text" placeholder="Địa chỉ email" path="receiverEmail"/>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                          <button type="button" id="inputGroupFileAddon03"><i class="fa fa-cloud-upload" aria-hidden="true"></i>
                                          </button>
                                        </div>
                                        <div class="custom-file">
                                          <input type="file" name="fileCV" class="custom-file-input" id="inputGroupFile03" accept=".pdf" aria-describedby="inputGroupFileAddon03">
                                          <p id="fileName" class="custom-file-label" for="inputGroupFile03">Upload CV</p>
                                        </div>
                                      </div>
                                </div>
                                
                                <div class="col-md-12">
                                    <div class="input_field">
                                        <form:textarea name="#" id="editor" cols="30" rows="10" placeholder="Ghi chú thêm" path="mess2" ></form:textarea>
                                    </div>
                                </div>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <div class="col-md-12 mt-4">
                                    <div class="submit_btn">
                                        <button class="boxed-btn3 w-100" type="submit">Nộp hồ sơ ứng tuyển</button>
                                    </div>
                                </div>
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
                        <script>
                            // xử lí input file
                            document.getElementById('inputGroupFile03').addEventListener('change', function () {
                                const fileName = this.files.length > 0 ? this.files[0].name : "No file chosen";
                                document.getElementById('fileName').textContent = fileName;
                            });
                        </script>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="job_sumary">
                        <div class="summery_header">
                            <h3>Thông tin liên quan</h3>
                        </div>
                        <div class="job_content">
                            <ul>
                                <li>Ngày đăng tin: <span>${job.postingtime}</span></li>
                                <li>Số lượng tuyên dụng: <span>${job.quantity} nhân viên</span></li>
                                <li>Mức lương: <span>${job.salary}</span></li>
                                <li>Địa chỉ công ty: <span>${job.address}</span></li>
                                <li>Hình thức: <span> ${job.workingForm}</span></li>
                                <li>Hạn ứng tuyển: <span> ${job.dateline}</span></li>
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