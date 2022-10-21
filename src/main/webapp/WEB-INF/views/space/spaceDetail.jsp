<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mobiil</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=163c926f2747f3a404b998b190a36731"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script>

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
<div>
<h1>${space.spaceName }</h1>
</div>
<div>
${space.spaceComent }
</div>
<div id="map" style="width:500px;height:400px;"></div>

<br><br><br><br><br>
<div style="float:center;width:300px;font-size:11px;" id='calendar'></div>
<br><br><br><br><br>
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
	
	// 카카오 지도
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	var geocoder = new kakao.maps.services.Geocoder(); // 주소-좌표간 변환 서비스 객체 생성
	var callback = function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	        console.log(result);
	    }
	};
	geocoder.addressSearch(${space.address}, callback);
	mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// fullcalender
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
	    		  const clickDate = new Date(sDate);
	    		  const today = new Date();
	    		  if(today>clickDate){
	    			  alert("선택할 수 없는 날짜입니다.");
	    		  }
	    		},
	    	  function( dropInfo ) { 
	    		  event.remove();
	    	  }
	    });
	    calendar.render();
	  });

	// 결제하기 누르면 날짜 및 시간 유효성 검사
	function payment(){
		var start = $('#startTime option:selected').val();
		var end = $('#endTime option:selected').val();
		if(sDate == "" || start == "시작" || end == "끝"){
			alert("날짜 혹은 시간을 확인해주세요.");
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
	
	// 채팅 이동
	function chatting(){
		location.href = "";
	}
	
	// 시작시간 > 끝시간 선택시 option 리셋 유효성 검사
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