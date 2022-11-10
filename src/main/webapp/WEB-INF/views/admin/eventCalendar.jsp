<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/plugins/bootstrap/css/bootstrap.min.css">

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

#layer{
display:none;
padding: 10px;
z-index: 500
}


#modifyForm{
display:none;
background: white;
padding: 10px;
z-index: 600;
border-radius: 15px
}

</style>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href = "https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css"  rel='stylesheet' >
<script type="text/javascript" src = "https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js"></script>
<script>


   $("#calendar").ready(function() {
   		$(function () {
          var request = $.ajax({
              url: "/admin/calendar/printEvents.kh",
              method: "GET",
              dataType: "json"
          });
          
          request.done(function (eList) {
		        var calendarEl = document.getElementById('calendar');
		        var calendar = new FullCalendar.Calendar(calendarEl, {
		        	eventClick: function(info) { // 수정 삭제
		        		$("#layer").html("");
		        		var divLeft = info.jsEvent.pageX;
		        		var divTop = info.jsEvent.pageY;
		        		$("#layer").css({"left": divLeft, "top": divTop, "position":"absolute"}).show();
		        		var id = info.event.id;
		        		var oneEvent = info.event;
		        		$("#layer").append(
		        						"<input type='button' value = '수정' onclick='modify("+id +"," +  divLeft + "," + divTop + ")'>"
				 		       			+ " <input type='button' value = '삭제' onclick='remove("+id+")'>"
				 		       			+ " <input type='button' value = '닫기' onclick='layerClose()'>");
		        		// 값세팅
		        		$("#modify-title").val(info.event.title); 
		        	},
		         initialView: 'dayGridMonth',
		       	 themeSystem: 'bootstrap4',
		         height: 650,
		         defaultAllDay: true,
		         customButtons: {
		     	    myCustomButton: {
		     	      text: '일정 추가!',
		     	      click: function() {
		     	    	 window.open('/admin/calendar/register.kh', 'window', 'width=500, height=350, menubar=no, status=no, toolbar=no')
		     	      }
		     	    }
		        },
		        headerToolbar: {
					left: 'myCustomButton',
		        	center: 'title',
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
      
function layerClose(){
	if($("#layer").css("display") == "none"){
	    $("#layer").show();
	} else {
	    $("#layer").hide();
	}
}
    	
function formClose(){
	if($("#modifyForm").css("display") == "none"){
	    $("#modifyForm").show();
	} else {
	    $("#modifyForm").hide();
	}
}
 
function modify(id, divLeft, divTop) {
	$("#modifyForm").css({"left": divLeft, "top": divTop, "position":"absolute"}).show();
	$("#modifySubmit").click(function() {
		if($("#modify-title").val() == "" 
			|| $("#modify-start").val()== "" 
			|| $("#modify-end").val()== ""
			|| $("#modify-backgroundColor").val()== ""
			|| $("#modify-borderColor").val() == ""){
				alert("입력란을 확인하세요")	
				return false;
		}else{
			$.ajax({
				url: "/admin/calendar/modify.kh",
				data: {id: id
					, title: $("#modify-title").val()
					, start:$("#modify-start").val()
					, end: $("#modify-end").val()
					, backgroundColor: $("#modify-backgroundColor").val()
					, borderColor: $("#modify-borderColor").val()
				},
				type: "get",
				success: function(data) {
					if(data == "success"){
						location.reload();
					}else{
						alert("실패")
					}
				},
				error: function() {
					alert("실패")
				},
			})
		}
	})
}



     
function remove(id) {
	$.ajax({
		url: "/admin/calendar/deleteEvent.kh",
		data: {id: id},
		type: "get",
		success: function(data) {
			if(data == "success"){
				location.reload();
			}else{
				alert("입력란을 모두 채워주세요")
			}
		},
		error: function() {
			alert("실패")
		}
	})
}
</script>

<title>모빌 캘린더</title>
</head>
<body>
<jsp:include page="../../views/common/admin-top.jsp"></jsp:include>

<div id="layer">
</div>

<div class="page-wrapper">
	<div class="container">
		<div class="row">
		<jsp:include page="../../views/common/admin-left-sidebar.jsp"></jsp:include>
			<div id='calendar' class="col-md-10" >
			</div>
			<div id="modifyForm" class="col-md-2">
			<table class = "table">
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" class="form-control" id="modify-title" required="required"></td>
				</tr>
				<tr>
					<td>시작일</td>
					<td><input type="date" name="start" class="form-control" id="modify-start" required="required"></td>
				</tr>
				<tr>
					<td>종료일</td>
					<td><input type="date" name="end" class="form-control" id="modify-end" required="required"></td>
				</tr>
				<tr>
					<td>배경색</td>
					<td><input type="color" name="backgroundColor" class="form-control" id="modify-backgroundColor" required="required"></td>
				</tr>
				<tr>
					<td>테두리</td>
					<td><input type="color" name="borderColor" class="form-control" id="modify-borderColor" required="required" ></td>
				</tr>
				<tr align='right'>
					<td colspan='2'><input type='button' value="저장" id="modifySubmit" class='btn'><input type='button' value="닫기" id="formClose" onclick = "formClose()"  class='btn'> </td>
				</tr>
				
			</table>
		</div>
		</div>
	</div>
</div>
</body>
</html>