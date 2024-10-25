<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
<html lang="zxx">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Trang đăng ký</title>

  <link rel="stylesheet" href="auth/assets/css/bootstrap.min.css">

  <link rel="stylesheet" href="auth/assets/css/meanmenu.css">

  <link rel="stylesheet" href="auth/assets/css/nice-select.min.css">

  <link rel="stylesheet" href="auth/assets/css/boxicons.min.css">

  <link rel="stylesheet" href="auth/assets/fonts/flaticon.css">

  <link rel="stylesheet" href="auth/assets/css/magnific-popup.min.css">

  <link rel="stylesheet" href="auth/assets/css/odometer.min.css">

  <link rel="stylesheet" href="auth/assets/css/owl.carousel.min.css">
  <link rel="stylesheet" href="auth/assets/css/owl.theme.default.min.css">

  <link rel="stylesheet" href="auth/assets/css/animate.min.css">

  <link rel="stylesheet" href="auth/assets/css/style.css">

  <link rel="stylesheet" href="auth/assets/css/responsive.css">
  
  <link rel="icon" type="image/png" href="admin/assets/img/logo.png">
</head>

<body>

  <div class="loader">
    <div class="d-table">
      <div class="d-table-cell">
        <div class="spinner"></div>
      </div>
    </div>
  </div>


  <div class="user-form-area">
    <div class="container-fluid p-0">
      <div class="row m-0 align-items-center">
        <div class="col-lg-6 p-0">
          <div class="user-img">
            <img src="auth/assets/img/resgister-bg.jpg" alt="User">
          </div>
        </div>
        <div class="col-lg-6 p-0">
          <div class="user-content">
            <div class="top">
              <h3 style="color: #21a212;">Đăng ký tài khoản</h3>
              <form:form method="post" action="/register" modelAttribute="registerUser">
                <c:set var="errorEmail">
                    <form:errors path="email" cssClass="invalid-feedback" />
                </c:set>
                <c:set var="errorPass">
                    <form:errors path="confirmPassword" cssClass="invalid-feedback" />
                </c:set>
                <c:set var="errorName">
                    <form:errors path="firstName" cssClass="invalid-feedback" />
                </c:set>
                <c:set var="errorPhone">
                    <form:errors path="phone" cssClass="invalid-feedback" />
                </c:set>
                <c:set var="errorAddress">
                    <form:errors path="addRess" cssClass="invalid-feedback" />
                </c:set>

                <div class="form-group">
                    <form:input type="text" class="form-control ${not empty errorName ? 'is-invalid' : '' }" placeholder="First Name" path="firstName" />
                    ${errorName}
                </div>
                <div class="form-group">
                    <form:input type="text" class="form-control" placeholder="Last Name" path="lastName" />
                </div>
                <div class="form-group">
                    <form:input type="email" class="form-control ${not empty errorEmail ? 'is-invalid' : '' }" placeholder="Email" path="email" />
                    ${errorEmail}
                </div>
                <div class="form-group">
                    <form:input type="text" class="form-control ${not empty errorPhone ? 'is-invalid' : '' }" placeholder="Số điện thoại" path="phone" />
                    ${errorPhone}
                </div>
                <div class="form-group">
                    <form:input type="text" class="form-control ${not empty errorAddress ? 'is-invalid' : '' }" placeholder="Địa chỉ" path="addRess" />
                    ${errorAddress}
                </div>
                <div class="row">
                    <div class="form-group col-8">
                        <form:input type="text" class="form-control" placeholder="Ngày sinh" path="dateOfBirth" />
                    </div>
                    <div class="form-group col-4">
                        <form:select class="form-control mb-3" path="roleName" >
                            <form:option value="USER2">Tài khoản ứng viên</form:option>
                            <form:option value="USER1">Tài khoản nhà tuyển dụng</form:option>
                          </form:select>
                    </div>
                </div>
                
                
                <div class="form-group">
                    <form:input type="password" class="form-control" placeholder="Password" path="password" />
                </div>
                <div class="form-group">
                  <form:input type="password" class="form-control  ${not empty errorPass ? 'is-invalid' : '' }" placeholder="Confirm Password" path="confirmPassword" />
                  ${errorPass}
                </div>
                <button type="submit" class="btn">Đăng ký</button>
              </form:form>
              <div class="mt-3" >
                <a href="/login">Bạn đã có tài khoản? Đăng nhập ngay</a>
              </div>
            </div>
            <!-- <div class="end">
              <ul>
                <li>
                  <a href="#" target="_blank">
                    <i class='bx bxl-facebook'></i>
                  </a>
                </li>
                <li>
                  <a href="#" target="_blank">
                    <i class='bx bxl-twitter'></i>
                  </a>
                </li>
                <li>
                  <a href="#" target="_blank">
                    <i class='bx bxl-linkedin'></i>
                  </a>
                </li>
                <li>
                  <a href="#" target="_blank">
                    <i class='bx bxl-pinterest-alt'></i>
                  </a>
                </li>
              </ul>
            </div> -->
          </div>
        </div>
      </div>
    </div>
  </div>


  <script src="auth/assets/js/jquery-3.5.1.min.js"></script>
  <script src="auth/assets/js/popper.min.js"></script>
  <script src="auth/assets/js/bootstrap.min.js"></script>

  <script src="auth/assets/js/form-validator.min.js"></script>

  <script src="auth/assets/js/contact-form-script.js"></script>

  <script src="auth/assets/js/jquery.ajaxchimp.min.js"></script>

  <script src="auth/assets/js/jquery.meanmenu.js"></script>

  <script src="auth/assets/js/jquery.nice-select.min.js"></script>

  <script src="auth/assets/js/jquery.mixitup.min.js"></script>

  <script src="auth/assets/js/jquery.magnific-popup.min.js"></script>

  <script src="auth/assets/js/odometer.min.js"></script>
  <script src="auth/assets/js/jquery.appear.js"></script>

  <script src="auth/assets/js/owl.carousel.min.js"></script>

  <script src="auth/assets/js/progressbar.min.js"></script>

  <script src="auth/assets/js/custom.js"></script>
</body>


</html>