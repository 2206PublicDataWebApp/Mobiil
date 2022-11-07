<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
         defaultAllDay: true,
         customButtons: {
     	    myCustomButton: {
     	      text: '일정 추가!',
     	      click: function() {
     	    	 window.open('/admin/calendar/register.kh', 'window', 'width=500, height=600, menubar=no, status=no, toolbar=no')
     	      }
     	    }
        },
        headerToolbar: {
            center: 'title',
            right: 'prev,next today myCustomButton'
          },
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
          	      borderColor: 'blue',
          	      allday: true
          	    },
        	  ]
        });
        calendar.render();
      });

    </script>

<title>Insert title here</title>
</head>
<body>
<jsp:include page="../../views/common/admin-top.jsp"></jsp:include>

<div class="page-wrapper">
	<div class="container">
		<div class="row">
		<jsp:include page="../../views/common/admin-left-sidebar.jsp"></jsp:include>
			<div id='calendar' class="col-md-12" >
			</div>
		</div>
	</div>
</div>
			
</body>
</html>