<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/calendar.css">	
<title>예약 확인</title>
</head>
<body>
<jsp:include page="../../views/common/menubar.jsp"></jsp:include>
<jsp:include page="../host/menuBar.jsp"></jsp:include>
	<div class="calendar"> 
    <div class="header">
      <div class="year-month"></div>  <!-- 월 표시 -->
      <div class="nav">
        <button class="nav-btn go-prev" onclick="prevMonth()">&lt;</button>
        <button class="nav-btn go-today" onclick="goToday()">Today</button>
        <button class="nav-btn go-next" onclick="nextMonth()">&gt;</button>
      </div>
    </div>
    <div class="main">
      <div class="days">
        <div class="day">일</div>
        <div class="day">월</div>
        <div class="day">화</div>
        <div class="day">수</div>
        <div class="day">목</div>
        <div class="day">금</div>
        <div class="day">토</div>
      </div>
      <div class="dates"></div>
    </div>
  </div>
  
  <script>	// 여기서 달력 span태그에 값 넣기 시도해보기
  window.onload = function() {
	  <c:forEach items="${rList}" var="reservation">
		var rDate = '${reservation.reservationDate}'
		document.getElementById(rDate).textContent  += '"예약자 : '+'${reservation.memberName}"'
													+ ' "예약시간 : ' + '${reservation.revStart}시' + '~' + '${reservation.revEnd}시"'; // span 태그 내부에 예약자 성함 넣기
	  </c:forEach>
  }
  </script>
  
 <script src="../resources/js/calendar.js"></script>
 <br><br><br><br><br><br><br><br>
 <jsp:include page="../../views/common/footer.jsp"></jsp:include>	
</body>
</html>