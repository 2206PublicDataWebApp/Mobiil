<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 리스트</title>

<style>

table, td, th {
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
	width : 650px;
}


.button1 {
	height: 30px;
	width: 80px;
	background-color: #ecf3fd;
	border-radius: 20px;
	border: none;
	font-size: 15px;
}

.button2 {
	height: 30px;
	width: 80px;
	background-color: #f3f3f3;
	border-radius: 20px;
	border: none;
	font-size: 15px;
}
</style>


</head>


<body>
<jsp:include page="../../views/common/menubar.jsp"></jsp:include>
<jsp:include page="../host/menuBar.jsp"></jsp:include>

	<div id="div" align="center" style=" margin-right: 400px;">
		<h2>예약 리스트</h2>
		<br>
		<hr>
		<table border='1' style="width: 1000px;">
			<tr>
				<td>예약번호</td>
				<td>예약자</td>
				<td>결제일자</td>
				<td>예약일자</td>
				<td>체크인</td>
				<td>체크아웃</td>
				<td>수정</td>
				<td>삭제</td>
			</tr>
			 <c:forEach items="${rList}" var="reservation"> 
				<tr>
					<td>${reservation.reservationNo }</td>
					<td>${reservation.memberName }</td>
					<td>${reservation.paymentDate }</td>
					<td>${reservation.reservationDate }</td>
					<td>${reservation.revStart }시</td>
					<td>${reservation.revEnd }시</td>
					<td><button type="button" class="button1" onclick="location.href='/host/reservationModifyView.mobiil?reservationNo=${reservation.reservationNo}'">수정</button></td>
					<td><button type="button" class="button2" onclick="location.href='/host/reservationRemove.mobiil?reservationNo=${reservation.reservationNo}'">삭제</button></td>
				</tr>
			 </c:forEach> 
			<tr>
				<td height="30" colspan="6" align="center">
					<ul class="pagination">
						<li>
						<c:if test="${currentPage ne 1 }">
								<a href="/host/registList.mobiil?page=${currentPage - 1}">이전</a>
							</c:if>
						</li>
						<li>
						<c:forEach var="page" begin="${startNavi }" end="${endNavi }">
								<a href="/host/registList.mobiil?page=${page }">${page }</a>
						</c:forEach>
						</li>
						<li>
						<c:if test="${currentPage ne maxPage}">
								<a href="/host/registList.mobiil?page=${currentPage + 1 }">다음</a>
						</c:if>
						</li>
					</ul>
				</td>
			</tr>
		</table>
		<br>
		<br>
	</div>
	<br><br><br><br><br><br><br><br>
<jsp:include page="../../views/common/footer.jsp"></jsp:include>	
</body>
</html>