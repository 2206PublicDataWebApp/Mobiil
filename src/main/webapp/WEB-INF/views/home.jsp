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
<style type="text/css">
/* 일요일 날짜 빨간색 */
.fc-day-sun a {
  color: red;
  text-decoration: none;
}

/* 토요일 날짜 파란색 */
.fc-day-sat a {
  color: blue;
  text-decoration: none;
}

</style>

<link href = "https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css"  rel='stylesheet' >
<script type="text/javascript" src = "https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js"></script>
<script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
         initialView: 'dayGridMonth',
       	 themeSystem: 'bootstrap4',
         height: 650,
         titleFormat: function (date) {
             year = date.date.year;
             month = date.date.month + 1;
             return "Mobiil과 " + year + "년 " + month + "월";
           },
           events: [
        	    { // this object will be "parsed" into an Event Object
        	      title: '캘린더 해봄', // a property!
        	      start: '2022-11-04', // a property!
        	      end: '2022-11-04', // a property! ** see important note below about 'end' **/
        	      backgroundColor:'red',
        	      borderColor: 'red'
        	    },
        	    { // this object will be "parsed" into an Event Object
          	      title: '캘린더 해봄??', // a property!
          	      start: '2022-11-05', // a property!
          	      end: '2022-11-06', // a property! ** see important note below about 'end' **/
          	      backgroundColor:'blue',
          	      borderColor: 'blue'
          	    },
        	  ]
        });
        calendar.render();


      });
     //   calendar.addEvent( event [ title: '캘린더',  start: '2022-11-08' ,   end: '2022-11-04' ]);

    </script>

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
			
			  <div id='calendar' class="col-md-12" ></div>
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
