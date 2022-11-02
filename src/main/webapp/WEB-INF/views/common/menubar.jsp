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
  <!-- 제이쿼리 -->
  <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

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
				<c:if test="${sessionScope.loginUser eq null and sessionScope.loginHost eq null}">			
					<ul class="top-menu text-right list-inline">
						<li>
							<a href="/home/login.kh">로그인</a>
						</li>
					</ul>
				</c:if>
				<c:if test="${not empty loginUser or not empty loginHost}"> 
					<ul class="top-menu text-right list-inline">
						<li>
							<a href="/member/myInfo.kh">마이페이지</a>
						</li>
						<li>
						<c:if test="${!empty loginUser }">
							<a href= "#" onclick="chatWindow('${loginUser.memberNick }')" id='myChat'></a>
						
						</c:if>
						<c:if test="${!empty loginHost}">
							<a href= "#" onclick="chatWindow('${loginHost.memberNick }')"  id='myChat'></a>
						</c:if>
						</li>
						<li>
							<a href="/member/logout.kh">로그아웃</a>
						</li>
						<li><a href="/admin/dashboard.kh">관리자페이지</a></li>
						<li><a href="/host/hostInfo.mobiil">호스트페이지</a></li>
						<li><a href="/admin/bannerMail.kh">광고 문의</a></li>
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
						<a href="/">Home</a>
					</li>
					<li>
						<a href="/partner/list.kh">Partner</a>
					</li>
					<li>
						<a href="/space/spaceList.kh">Space</a>
					</li>		
				</ul>
			</div>			
		</div><!-- / .container -->
	</nav>
</section>


<script type="text/javascript">


getTotalUnread();

function chatWindow(memberNick) {
	window.open('/chat/chatWindow.kh?memberNick='+memberNick+'', 'window', 'width=500, height=700, menubar=no, status=no, toolbar=no');
}

function  getTotalUnread() {
	if("${loginHost.memberNick }" !=  ""){
		var memberNick = "${loginHost.memberNick }";
	}
	if("${loginUser.memberNick }" != ""){
		var memberNick = "${loginUser.memberNick }";
	}
	$.ajax({
		url:"/chat/getTotalUnread.kh",
		data:{memberNick :memberNick},
		type: "get",
		success: function(data) {
			$("#myChat").text("마이채팅 (" + data + ")");
		},
		error: function() {
			console.log("에러")
		}
	})
}
</script>
 
    
    
</body>
</html>