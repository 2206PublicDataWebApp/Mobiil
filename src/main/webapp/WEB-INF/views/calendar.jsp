<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="/resources/images/mobiil.ico">

<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

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

#calendar{
padding: 15px
}

</style>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href = "https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css"  rel='stylesheet' >
<script type="text/javascript" src = "https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js"></script>
<script>


   $("#calendar").ready(function() {
   		$(function () {
          var request = $.ajax({
              url: "/calendar/printEventsService.kh",
              method: "GET",
              dataType: "json"
          });
          
          request.done(function (eList) {
		        var calendarEl = document.getElementById('calendar');
		        var calendar = new FullCalendar.Calendar(calendarEl, {
		        	
		         initialView: 'dayGridMonth',
		       	 themeSystem: 'bootstrap4',
		         height: 650,
		         defaultAllDay: true,
		        
		        headerToolbar: {
					left: 'title',
		            right: 'prev,next today'
		          },
		        titleFormat: function (date) {
		             year = date.date.year;
		             month = date.date.month + 1;
		             return "Mobiil과 " + year + "년 " + month + "월";
		          },
		       	events: eList
		        });
		        calendar.render();
		      });
    	  })
      })

</script>

<title>모빌 캘린더</title>
</head>
<body>

	<div id='calendar' class="col-md-12" ></div>
	<div id='notice' class="col-md-12" >
		<p align='center'>추가하고 싶은 일정이 있으시다면 <span id="support-imge" class="material-symbols-outlined">contact_support</span>을 클릭해 관리자에게 문의하세요! </p>
	</div>
	
		
</body>
</html>