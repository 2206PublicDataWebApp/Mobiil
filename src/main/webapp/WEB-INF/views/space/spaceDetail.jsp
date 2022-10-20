<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mobiil</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<!-- fullcalendar CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/locales-all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js"></script>
<style type="text/css">
.fc-day-sat a {
  color: blue;
  text-decoration: none;
}
.fc-day-sun a {
  color: red;
  text-decoration: none;
}
</style>
</head>
<body>
<jsp:include page="../../views/common/menubar.jsp"></jsp:include>
<div style="float:center;width:300px;font-size:11px;" id='calendar'></div>

<select id="startTime" onchange="check();">
<option value="시작">시작</option>
<option value="9">9시</option>
<option value="10">10시</option>
<option value="11">11시</option>
<option value="12">12시</option>
<option value="13">13시</option>
<option value="14">14시</option>
<option value="15">15시</option>
<option value="16">16시</option>
<option value="17">17시</option>
<option value="18">18시</option>
<option value="19">19시</option>
<option value="20">20시</option>
<option value="21">21시</option>
<option value="22">22시</option>
<option value="23">23시</option>
</select>
<select id="endTime" onchange="check();">
<option value="끝">끝</option>
<option value="10">10시</option>
<option value="11">11시</option>
<option value="12">12시</option>
<option value="13">13시</option>
<option value="14">14시</option>
<option value="15">15시</option>
<option value="16">16시</option>
<option value="17">17시</option>
<option value="18">18시</option>
<option value="19">19시</option>
<option value="20">20시</option>
<option value="21">21시</option>
<option value="22">22시</option>
<option value="23">23시</option>
<option value="24">24시</option>
</select>
<input type="button" value="호스트와 채팅하기" onclick="chatting()">
<input type="button" value="결제하기" onclick="payment()">
<jsp:include page="../../views/common/footer.jsp"></jsp:include>

<script type="text/javascript">
var sDate = "";
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
    	headerToolbar: {
    		left: 'prev',
            center: 'title',
            right: 'next'
        },
        locale: "ko",
        height: 360,
    	initialView: 'dayGridMonth',
    	editable: false,
    	unselectAuto : true,
    	selectOverlap : false,
    	dateClick: function (dateClickInfo) {
    		  // get all fc-day element
    		  const fcDayElements = document.querySelectorAll(
    		    ".fc-daygrid-day.fc-day"
    		  );
    		  // init background color found element
    		  fcDayElements.forEach((element, key, parent) => {
    		    element.style.backgroundColor = "";
    		  });
    		  // set background color clicked Element
    		  dateClickInfo.dayEl.style.backgroundColor = "#CAF5DC";
    		  sDate = dateClickInfo.dateStr;
    		  alert(sDate); // 날짜 담기
    		},
    	  function( dropInfo ) { 
    		  event.remove();
    	  }
    });
    calendar.render();
  });
  
	function payment(){
		var start = $('#startTime option:selected').val();
		var end = $('#endTime option:selected').val();
		if(sDate == "" || start == "시작" || end == "끝"){
			alert("날짜 혹은 시간을 선택해주세요.");
		}
		console.log(sDate);
		$.ajax({
			url : "/space/checkTime",
			data : {"start": start, "end":end, "reservDate":sDate},
			type : "get",
			success : function(result) {
				
				if(result != 0){
					alert("예약할 수 없는 시간입니다.");
					/* location.href = "/space/payment"; */
				}else{
					alert("예약 가능한 시간입니다.");
				}
			},
			error : function(){
				alert("통신 실패");
			}
		})
	}
	
	function chatting(){
		location.href = "";
	}
	
	function check(){
		var start = $('#startTime option:selected').val();
		var end = $('#endTime option:selected').val();
		if(Number(start) >= Number(end)){
			alert("잘못된 시간을 선택하셨습니다.");
			$('#startTime option:eq(0)').prop('selected', true);
			$('#endTime option:eq(0)').prop('selected', true);
		}
	}
</script>
</body>
</html>