<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정산확인</title>
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
		width : 100px;
	}
</style>
</head>
<body>
	<jsp:include page="../host/menuBar.jsp"></jsp:include>
	<form action="/host/profitsCheck.kh" method="get">
		<div id="div1">
			<h3>총 판매 금액 :</h3>
		</div>

		<div id="div2">
			<span>조회기간 :</span> 
			<input type="date" name="date1"> ~ <input type="date" name="date2">
			<button type="submit">조회하기</button>
		</div>

		<div id="div3" align="center">
			<table border='1' align="center">
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
						<td>${reservation.PRICE }</td>
					<tr>
				</c:forEach>
			</table>
		</div>
	</form>
</body>
</html>