<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--
 // WEBSITE: https://themefisher.com
 // TWITTER: https://twitter.com/themefisher
 // FACEBOOK: https://www.facebook.com/themefisher
 // GITHUB: https://github.com/themefisher/
-->

<html>
<head>
<link rel="shortcut icon" href="/resources/images/mobiil.ico">

<style type="text/css">

</style>


<title>Mobiil</title>
</head>

<body id="body">

<jsp:include page="../views/common/menubar.jsp"></jsp:include>

  


<div class="hero-slider">
	<c:forEach items="${bList }" var="banner" >
  <div class="slider-item th-fullpage hero-area" style="background-image: url(/resources/images/slider/${banner.bannerRename });">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 text-center">
	      <p data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".1">광고</p>
          <h1 data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".5">${banner.bannerMsg }</h1>
          <a data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".8" class="btn" href="${banner.bannerLink }">Shop Now</a>
        </div>
      </div>
    </div>
  </div>
  </c:forEach>
  

</div>

<section class="product-category section" >
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="title text-center">
					<h2>바로가기</h2>
				</div>
			</div>
			<div class="col-md-6">
				<div class="category-box category-box-2">
					<c:if test="${not empty loginUser or not empty loginHost  }">
					<a href="/partner/list.kh">
					</c:if>
					<c:if test="${empty loginUser and empty loginHost  }">
					<a href="#" onclick="showAlert()">
					</c:if>
						<img src="/resources/images/board/category/category-1.jpg" alt="" />
						<div class="content">
							<h3>파트너</h3>
							<p>TALK AND PLAY</p>
						</div>
					</a>	
				</div>
			</div>
			<div class="col-md-6">
				<div class="category-box category-box-2">
					<a href="/space/spaceList.kh">
						<img src="/resources/images/board/category/category-2.jpg" alt="" />
						<div class="content">
							<h3>공간</h3>
							<p>IN OUR PLACE</p>
						</div>
					</a>	
				</div>
			</div>
			
		</div>
	</div>
</section>




<jsp:include page="../views/common/footer.jsp"></jsp:include>

   <!-- 
    Essential Scripts
    =====================================-->
    
    <!-- Main jQuery -->
    <script src="/resources/plugins/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap 3.1 -->
    <script src="/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- Bootstrap Touchpin -->
    <script src="/resources/plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
    <!-- Instagram Feed Js -->
    <script src="/resources/plugins/instafeed/instafeed.min.js"></script>
    <!-- Video Lightbox Plugin -->
    <script src="/resources/plugins/ekko-lightbox/dist/ekko-lightbox.min.js"></script>
    <!-- Count Down Js -->
    <script src="/resources/plugins/syo-timer/build/jquery.syotimer.min.js"></script>

    <!-- slick Carousel -->
    <script src="/resources/plugins/slick/slick.min.js"></script>
    <script src="/resources/plugins/slick/slick-animation.min.js"></script>

    <!-- Main Js File -->
    <script src="/resources/js/script.js"></script>
    <script type="text/javascript">
    	function showAlert() {
    		alert("로그인 후 이용해주세요.")
    		location.href="/home/login.kh";
			
		}
    
    </script>


  </body>
  </html>
