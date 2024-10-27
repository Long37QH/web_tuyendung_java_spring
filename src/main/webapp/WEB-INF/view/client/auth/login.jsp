<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <!DOCTYPE html>
        <html lang="zxx">

        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">

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
          <title>Trang Đăng Nhập</title>
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
                      <h2>Đăng Nhập</h2>
                      <form method="post" action="/login">   
                        <div class="form-group">
                          <input type="email" class="form-control" name="username" placeholder="Email">
                        </div>
                        <div class="form-group">
                          <input type="password" class="form-control" name="password" placeholder="Password">
                        </div>
                        <div>
                          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </div>
                        <c:if test="${param.error != null}">
                          <div class="my-2" style="color: red;">Tài khoản không tồn tại</div>
                        </c:if>
                        <c:if test="${param.logout != null}">
                          <div class="my-2" style="color: green;">Đăng xuất thành công</div>
                        </c:if>
                        <button type="submit" class="btn">Đăng nhập</button>
                      </form>
                      <div class="mt-3">
                        <a href="/register">Bạn Chưa có tài khoản? Đăng ký ngay</a>
                      </div>
                    </div>
                    <div class="end">
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
                    </div>
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