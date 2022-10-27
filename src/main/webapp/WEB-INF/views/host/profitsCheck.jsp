<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정산확인</title>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>      
<style>
	table, td, th {
	  border : 1px solid black;
	  border-collapse : collapse;
	  text-align: center;
	}
	
	#div1{
		height: 100px;
		text-align: center;
		vertical-align: middle;
		line-height: 90px;
	}
	
	#div2{
		height: 80px;
		text-align: center;
	}
	
	#div3{
		height: 80px;
		text-align: center;
	}
	
	td {
		width : 130px;
	}
	
	 .button1 {
            height: 40px;
            width: 100px;
            background-color:#c5c1c1;
            border-radius: 20px;
            border: none;
            font-size: 20px;
            margin: 1px 1px 10px 50px;
            font-size: 15px;
        }
</style>
</head>
<body>
<jsp:include page="../../views/common/menubar.jsp"></jsp:include>
<jsp:include page="../host/menuBar.jsp"></jsp:include>
	<form action="/host/profitsCheck.kh" method="get">
		<div id="div1">
			<h3>총 판매 금액 : <span id="total"></span></h3>
		</div>

		<div id="div2">
			<span>조회기간 :</span> 
			<input type="date" name="date1"> ~ <input type="date" name="date2">
			<button type="submit" class="button">조회하기</button>
		</div>

		<div id="div3" align="center">
			<table border='1' align="center" id="table">
				<tr>
					<td>예약번호</td>
					<td>예약자</td>
					<td>예약날짜</td>
					<td>체크인</td>
					<td>체크아웃</td>
					<td>금액</td>
				</tr>
				<c:forEach items="${rList }" var="reservation">
					<tr>
						<td>${reservation.reservationNo }</td>
						<td>${reservation.memberName }</td>
						<td>${reservation.reservationDate}</td>
						<td>${reservation.revStart }</td>
						<td>${reservation.revEnd }</td>
						<td>${reservation.price }</td>
					<tr>
				</c:forEach>
			</table>
		</div>
	</form>
	
	<script>
	$(document).ready(function(){
		var rowCnt = 0;
		var col6 = 5;		// 여섯번째 col index
		var col6Sum = 0;	// 여섯번째 col sum
		
		$("#table tr").each(function(){
			if(rowCnt != 0){ // 첫번째줄 건너뜀
				var sell = $(this).children("td"); // td 객체
				
				$(sell).each(function() {
					var index = $(this).index();
					var value = $(this).text();
					
					if( index == col6){
						col6Sum += parseInt(value); 
					}
				});
			}
		rowCnt++;
	});
	$("#total").text(col6Sum);
	});
	
	</script>
	<br><br><br><br><br><br><br><br>
<jsp:include page="../../views/common/footer.jsp"></jsp:include>	
</body>
</html>