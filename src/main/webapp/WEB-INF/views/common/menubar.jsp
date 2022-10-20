<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
  <title>Mobiil</title>

  <!-- Mobile Specific Metas
  ================================================== -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="Construction Html5 Template">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
  <meta name="author" content="Themefisher">
  <meta name="generator" content="Themefisher Constra HTML Template v1.0">
  
  <!-- theme meta -->
  <meta name="theme-name" content="aviato" />
  
  <!-- Favicon -->
  <link rel="shortcut icon" type="image/x-icon" href="/resources/images/favicon.png" />
  
  <!-- Themefisher Icon font -->
  <link rel="stylesheet" href="/resources/plugins/themefisher-font/style.css">
  <!-- bootstrap.min css -->
  <link rel="stylesheet" href="/resources/plugins/bootstrap/css/bootstrap.min.css">
  
  <!-- Animate css -->
  <link rel="stylesheet" href="/resources/plugins/animate/animate.css">
  <!-- Slick Carousel -->
  <link rel="stylesheet" href="/resources/plugins/slick/slick.css">
  <link rel="stylesheet" href="/resources/plugins/slick/slick-theme.css">
  
  <!-- Main Stylesheet -->
  <link rel="stylesheet" href="/resources/css/style.css">

</head>
<body>
<!-- Start Top Header Bar -->
<section class="top-header">
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-xs-12 col-sm-4">
				<div class="contact-number">
					<span>Final Project _ 빌려조</span>
				</div>
			</div>
			<div class="col-md-4 col-xs-12 col-sm-4">
				<!-- Site Logo -->
				<div class="logo text-center">
					<a href="/">
						<!-- replace logo here -->
						<img src="/resources//images/mobiil_logo.png" height="150px">
					</a>
				</div>
			</div>
			<div class="col-md-4 col-xs-12 col-sm-4">
				<!-- 상단 바 영역 나중에 cif로 보이고 안보이고 처리 -->
				<c:if test="${sessionScope.loginUser eq null }">
					<ul class="top-menu text-right list-inline">
						<li>
							<a href="/home/login.kh">로그인</a>
						</li>
					</ul>
				</c:if>
				<c:if test="${not empty loginUser }"> 
					<ul class="top-menu text-right list-inline">
						<li>
							<a href="/member/myInfo.kh">마이페이지</a>
						</li>
						<li>
							<a href="/">마이채팅</a>
						</li>
						<li>
							<a href="/member/logout.kh">로그아웃</a>
						</li>
						
<!-- 						<li>관리자페이지</li> -->
<!-- 						<li>호스트페이지</li> -->
					</ul>
				</c:if>
				</div>
		</div>
	</div>
</section><!-- End Top Header Bar -->


<!-- Main Menu Section -->
<section class="menu">
	<nav class="navbar navigation">
		<div class="container">

			<!-- Navbar Links -->
			<div id="navbar" class="navbar-collapse collapse text-center">
				<ul class="nav navbar-nav">

					<!-- Home -->
					<li>
						<a href="#">Home</a>
					</li>
					<li>
						<a href="#">Partner</a>
					</li>
					<li>
						<a href="#">Space</a>
					</li>		
				</ul>
			</div>			
		</div><!-- / .container -->
	</nav>
</section>


 
    
    
</body>
</html>