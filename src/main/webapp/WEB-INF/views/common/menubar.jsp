<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>

<style type="text/css">

#support{
 	position : fixed;
 	z-index: 100;
 	bottom: 25px; right: 25px; 
 	font-size: 100px
 	
}

#support-imge{
 	font-size: 70px
}

#calendar-img{
 	font-size: 70px
}

#admin-support{
 	font-size: 10px
}
</style>


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
  
    <!-- 서머노트 및 제이쿼리 추가해야할 부분 -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="/resources/js/summernote-lite.js"></script>
  <script src="/resources/js/summernote/lang/summernote-ko-KR.js"></script>
  <link rel="stylesheet" href="/resources/css/summernote-lite.css">
  
<!--    구글 아이콘 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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
				<c:if test="${sessionScope.loginUser eq null and sessionScope.loginHost eq null }">			
					<ul class="top-menu text-right list-inline">
						<li>
							<a href="/home/login.kh">로그인</a>
						</li>
						<li><a href="/admin/bannerMail.kh">광고 문의</a></li>
					</ul>
				</c:if>
				<!-- 로그인 유저 -->
				<ul class="top-menu text-right list-inline">
				<c:if test="${not empty loginUser and loginUser.mStatus eq 'Y' and loginUser.memberNick ne '관리자' }"> 
						
						<li>
							<a href= "#" onclick="chatWindow('${loginUser.memberNick }')" id='myChat'></a>
						</li>
					<c:if test="${loginUser.kakaoStatus eq 'N' }"> 
						<li>
							<a href="/member/myInfo.kh">마이페이지</a>
						</li>
					</c:if>	
					<c:if test="${loginUser.kakaoStatus eq 'Y' }"> 
						<li>
							<a href="/member/myKakaoInfo.kh">마이페이지</a>
						</li>
					</c:if>
						<li>
							<a href="/member/logout.kh">로그아웃</a>
						</li>
						
						<!-- 관리자 문의 -->
						<div id = "support">
							<p><a href = "#" onclick="openChatRoom('${loginUser.memberNick}', '관리자');">	<span id="support-imge" class="material-symbols-outlined">contact_support</span></a>
							<a href = "#"  onclick="openCalendar();"><span id="calendar-img" class="material-symbols-outlined">event</span></a></p>
						</div>
				</c:if>
				<c:if test="${not empty loginUser and loginUser.mStatus eq 'N' and loginUser.memberNick ne '관리자' }"> 
						<li>
							카카오 회원은<a href="/member/changeNickView.kh"><b>[닉네임 수정]</b></a>후 
							<br>서비스 이용이 가능합니다.
						</li>
						<br><br>
						<li>
							<a href="/member/logout.kh">로그아웃</a>
						</li>
				</c:if>
				<!-- 로그인 호스트 -->
				<c:if test="${not empty loginHost}"> 
						<li>
							<a href= "#" onclick="chatWindow('${loginHost.memberNick }')"  id='myChat'></a>
						</li>
						<li>
							<a href="/host/hostInfo.mobiil">호스트페이지</a>
						</li>
						<li>
							<a href="/member/logout.kh">로그아웃</a>
						</li>
							<!-- 관리자 문의 -->
						<div id = "support">
							<p><a href = "#" onclick="openChatRoom('${loginUser.memberNick}', '관리자');">	<span id="support-imge" class="material-symbols-outlined">contact_support</span></a>
							<a href = "#"  onclick="openCalendar();"><span id="calendar-img" class="material-symbols-outlined">event</span></a></p>
						</div>
				</c:if>
				<!-- 로그인 관리자 -->
				<c:if test="${not empty loginUser and loginUser.memberNick eq '관리자' }"> 
						<li>
							<a href= "#" onclick="chatWindow('${loginUser.memberNick }')" id='myChat'></a>
						</li>
						<li><a href="/admin/dashboard.kh">관리자페이지</a></li>
						<li>
							<a href="/member/logout.kh">로그아웃</a>
						</li>
				</c:if>
					</ul>
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
					<c:if test="${not empty loginUser or not empty loginHost  }">
						<a href="/partner/list.kh">PARTNER</a>
					</c:if>
					<c:if test="${empty loginUser and empty loginHost  }">
						<a href="#" onclick="showAlert()">PARTNER</a>
					</c:if>
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
	
	
	if (memberNick != null) {
			$.ajax({
				url : "/chat/getTotalUnread.kh",
				data : {
					memberNick : memberNick
				},
				type : "get",
				success : function(data) {
					$("#myChat").text("마이채팅 (" + data + ")");
				},
				error : function() {
					console.log("에러")
				}

			})
		}
	}

	function showAlert() {
		alert("로그인 후 이용해주세요.")
		location.href = "/home/login.kh";
	}

	function openChatRoom(createUser, withUser) {
		if (confirm("채팅을 시작하시겠습니까?")) {
			$
					.ajax({
						url : "/chat/createChatRoom.kh",
						tyep : "get",
						data : {
							createUser : createUser,
							withUser : withUser
						},
						success : function(data) {
							console.log(data);
							if (data == "already") {
								alert("이미 생성된 채팅방입니다");
								window
										.open('/chat/chatWindow.kh?memberNick='
												+ createUser + '', 'window',
												'width=500, height=700, menubar=no, status=no, toolbar=no');
							} else if (data == "fail") {
								alert("생성에 실패했습니다.");
							} else {
								alert("채팅이 시작됩니다.");
								window
										.open('/chat/chatWindow.kh?memberNick='
												+ createUser + '', 'window',
												'width=500, height=700, menubar=no, status=no, toolbar=no');
							}
						},
						error : function() {
							alert("에러")
						},
					})
		}
	}

	function openCalendar() {
		window.open('/calendar.kh', 'window',
				'width=900, height=700, menubar=no, status=no, toolbar=no');
	}
</script>
 
    
    
</body>
</html>