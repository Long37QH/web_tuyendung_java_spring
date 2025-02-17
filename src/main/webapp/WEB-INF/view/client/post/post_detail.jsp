<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!doctype html>
<html class="no-js" lang="zxx">

<head>
   <meta charset="utf-8">
   <meta http-equiv="x-ua-compatible" content="ie=edge">
   <title>Finloans</title>
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
  <div class="bradcam_area bradcam_bg_3">
      <div class="container">
          <div class="row">
              <div class="col-xl-12">
                  <div class="bradcam_text">
                     <h3>${post.category.name}</h3>
                     <p>${post.category.description}</p>
                  </div>
              </div>
          </div>
      </div>
  </div>
  <!--/ bradcam_area  -->

   <!--================Blog Area =================-->
   <section class="blog_area single-post-area section-padding">
      <div class="container">
         <div class="row">
            <div class="col-lg-8 posts-list">
               <div class="single-post">
                  <div class="feature-img">
                     <img class="img-fluid" src="/images/post/${post.image}" alt="">
                  </div>
                  <div class="blog_details">
                     <h2>${post.title}</h2>
                     <ul class="blog-info-link mt-3 mb-4">
                        <li><a href="#"><i class="fa fa-user"></i> ${post.author}</a></li>
                        <li><a href="#"><i class="fa fa-comments"></i> <Strong>${post.view}</Strong>Lượt xem</a></li>
                     </ul>
                     <p class="excert">
                        ${post.content}
                     </p>
                    
                  </div>
               </div>
               <div class="navigation-top">
                  <div class="d-sm-flex justify-content-between text-center">
                     <p class="like-info"><span class="align-middle"><i class="fa fa-heart"></i></span> Lily and 4
                        people like this</p>
                     <div class="col-sm-4 text-center my-2 my-sm-0">
                        <!-- <p class="comment-count"><span class="align-middle"><i class="fa fa-comment"></i></span> 06 Comments</p> -->
                     </div>
                     <ul class="social-icons">
                        <li><a href="#"><i class="ti-facebook"></i></a></li>
                        <li><a href="#"><i class="fa-brands fa-google-plus"></i></a></li>
                        <li><a href="#"><i class="fa-brands fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa-brands fa-instagram"></i></a></li>
                     </ul>
                  </div>
               </div>
               <div class="comments-area">
                  <h4>05 Comments</h4>
                  <div class="comment-list">
                     <div class="single-comment justify-content-between d-flex">
                        <div class="user justify-content-between d-flex">
                           <div class="thumb">
                              <img src="/client/img/comment/comment_1.png" alt="">
                           </div>
                           <div class="desc">
                              <p class="comment">
                                 Multiply sea night grass fourth day sea lesser rule open subdue female fill which them
                                 Blessed, give fill lesser bearing multiply sea night grass fourth day sea lesser
                              </p>
                              <div class="d-flex justify-content-between">
                                 <div class="d-flex align-items-center">
                                    <h5>
                                       <a href="#">Emilly Blunt</a>
                                    </h5>
                                    <p class="date">December 4, 2017 at 3:12 pm </p>
                                 </div>
                                 <div class="reply-btn">
                                    <a href="#" class="btn-reply text-uppercase">reply</a>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="comment-list">
                     <div class="single-comment justify-content-between d-flex">
                        <div class="user justify-content-between d-flex">
                           <div class="thumb">
                              <img src="/client/img/comment/comment_2.png" alt="">
                           </div>
                           <div class="desc">
                              <p class="comment">
                                 Multiply sea night grass fourth day sea lesser rule open subdue female fill which them
                                 Blessed, give fill lesser bearing multiply sea night grass fourth day sea lesser
                              </p>
                              <div class="d-flex justify-content-between">
                                 <div class="d-flex align-items-center">
                                    <h5>
                                       <a href="#">Emilly Blunt</a>
                                    </h5>
                                    <p class="date">December 4, 2017 at 3:12 pm </p>
                                 </div>
                                 <div class="reply-btn">
                                    <a href="#" class="btn-reply text-uppercase">reply</a>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="comment-list">
                     <div class="single-comment justify-content-between d-flex">
                        <div class="user justify-content-between d-flex">
                           <div class="thumb">
                              <img src="/client/img/comment/comment_3.png" alt="">
                           </div>
                           <div class="desc">
                              <p class="comment">
                                 Multiply sea night grass fourth day sea lesser rule open subdue female fill which them
                                 Blessed, give fill lesser bearing multiply sea night grass fourth day sea lesser
                              </p>
                              <div class="d-flex justify-content-between">
                                 <div class="d-flex align-items-center">
                                    <h5>
                                       <a href="#">Emilly Blunt</a>
                                    </h5>
                                    <p class="date">December 4, 2017 at 3:12 pm </p>
                                 </div>
                                 <div class="reply-btn">
                                    <a href="#" class="btn-reply text-uppercase">reply</a>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="comment-form">
                  <h4>Leave a Reply</h4>
                  <form class="form-contact comment_form" action="#" id="commentForm">
                     <div class="row">
                        <div class="col-12">
                           <div class="form-group">
                              <textarea class="form-control w-100" name="comment" id="comment" cols="30" rows="9"
                                 placeholder="Write Comment"></textarea>
                           </div>
                        </div>
                        <div class="col-sm-6">
                           <div class="form-group">
                              <input class="form-control" name="name" id="name" type="text" placeholder="Name">
                           </div>
                        </div>
                        <div class="col-sm-6">
                           <div class="form-group">
                              <input class="form-control" name="email" id="email" type="email" placeholder="Email">
                           </div>
                        </div>
                        <div class="col-12">
                           <div class="form-group">
                              <input class="form-control" name="website" id="website" type="text" placeholder="Website">
                           </div>
                        </div>
                     </div>
                     <div class="form-group">
                        <button type="submit" class="button button-contactForm btn_1 boxed-btn">Send Message</button>
                     </div>
                  </form>
               </div>
            </div>
            <div class="col-lg-4">
               <div class="blog_right_sidebar">
                  <aside class="single_sidebar_widget search_widget">
                     <form action="#">
                        <div class="form-group">
                           <div class="input-group mb-3">
                              <input type="text" class="form-control" placeholder='Nhập bài viết' onfocus="this.placeholder = ''"
                                 onblur="this.placeholder = 'Search Keyword'">
                              <div class="input-group-append">
                                 <button class="btn" type="button"><i class="ti-search"></i></button>
                              </div>
                           </div>
                        </div>
                        <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn" type="submit">Tìm kiếm</button>
                     </form>
                  </aside>
            
                  <aside class="single_sidebar_widget post_category_widget">
                     <h4 class="widget_title">Danh mục quan tâm</h4>
                     <ul class="list cat-list">
                        <c:forEach var="sumpost" items="${result}">
                           <li>
                              <a href="/post?category=${sumpost[0].replace(' ', '-')}" class="d-flex">
                                 <p class="mr-2">${sumpost[0]}</p>
                                 <p>(${sumpost[1]} bài)</p>
                              </a>
                           </li>
                        </c:forEach>      
                     </ul>
                  </aside>
            
                  <aside class="single_sidebar_widget popular_post_widget">
                     <h3 class="widget_title">Các vài viêt nổi bật</h3>
                     <c:forEach var="postHot" items="${postHots}">
                        <div class="media post_item">
                           <img src="/images/post/${postHot.image}" style="width: 100px;" alt="post">
                           <div class="media-body">
                                 <a href="/post/${postHot.id}">
                                    <h3>${postHot.title}</h3>
                                 </a>
                                 <p>${postHot.timeposting}</p>
                           </div>
                        </div>
                     </c:forEach>
                  </aside>
                  <aside class="single_sidebar_widget tag_cloud_widget">
                     <h4 class="widget_title">Top ngành nghề</h4>
                     <ul class="list">
                        <li>
                           <a href="#">Công nghệ thông tin</a>
                        </li>
                        <li>
                           <a href="#">Thiết kế</a>
                        </li>
                        <li>
                           <a href="#">Công nghệ ô tô</a>
                        </li>
                        <li>
                           <a href="#">Du lịch</a>
                        </li>
                        <li>
                           <a href="#">Ngân hàng</a>
                        </li>
                        <li>
                           <a href="#">Tài chính</a>
                        </li>
                     </ul>
                  </aside>
            
            
                  <aside class="single_sidebar_widget instagram_feeds">
                     <h4 class="widget_title">Top công ty</h4>
                     <ul class="instagram_row flex-wrap">
                        <li>
                           <a href="#">
                              <img class="img-fluid" src="/client/img/svg_icon/1.svg" alt="">
                           </a>
                           <p>fpt shop</p>
                        </li>
                        <li>
                           <a href="#">
                              <img class="img-fluid" src="/client/img/svg_icon/2.svg" alt="">
                           </a>
                           <p>fpt shop</p>
                        </li>
                        <li>
                           <a href="#">
                              <img class="img-fluid" src="/client/img/svg_icon/3.svg" alt="">
                           </a>
                           <p>fpt shop</p>
                        </li>
                        <li>
                           <a href="#">
                              <img class="img-fluid" src="/client/img/svg_icon/4.svg" alt="">
                           </a>
                           <p>fpt shop</p>
                        </li>
                        <li>
                           <a href="#">
                              <img class="img-fluid" src="/client/img/svg_icon/5.svg" alt="">
                           </a>
                           <p>fpt shop</p>
                        </li>
                        <li>
                           <a href="#">
                              <img class="img-fluid" src="/client/img/svg_icon/6.svg" alt="">
                           </a>
                           <p>fpt shop</p>
                        </li>
                     </ul>
                  </aside>
            
            
                  <aside class="single_sidebar_widget newsletter_widget">
                     <h4 class="widget_title">Newsletter</h4>
            
                     <form action="#">
                        <div class="form-group">
                           <input type="email" class="form-control" onfocus="this.placeholder = ''"
                              onblur="this.placeholder = 'Enter email'" placeholder='Enter email' required>
                        </div>
                        <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
                           type="submit">Subscribe</button>
                     </form>
                  </aside>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!--================ Blog Area end =================-->

    <!-- footer start -->
    <jsp:include page="../layout/footer.jsp" />
    <!--/ footer end  -->


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