<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 정보 수정 페이지</title>

<style>
	#td{
		text-align : center;
	}
	
	
</style>


</head>


<body>
	<jsp:include page="../host/menuBar.jsp"></jsp:include>

		<div id="div" align="center">
		<h2>예약 정보 수정 페이지</h2><br>
		<hr>
		<form action="/host/reservationModify.mobiil" method="post">
		<input type="hidden" name="reservationNo" value="${rOne.reservationNo }">
			<table>
				<tr>
					<td id="td">예약자 성함</td>
					<td>
					<input type="text" id="memberName" name="memberName" size="31" value="${rOne.memberName }">
					</td>
				</tr>
				<tr>
					<td id="td">예약자 연락처</td>
					<td>
					<input type="text" id="memberPhone" name="memberPhone" size="31" value="${rOne.memberPhone }">
					</td>
				</tr>
				<tr>
					<td id="td">예약일자</td>
					<td>
					<input type="text" id="reservationDate" name="reservationDateStr" size="31" value="${rOne.reservationDate }" readonly>
					</td>
				</tr>
				<tr>
					<td id="td">체크인</td>
					<td>
					<input type="text" id="revStart" name="revStart" size="31" value="${rOne.revStart }">
					</td>
				</tr>
				<tr>
					<td id="td">체크아웃</td>
					<td>
					<input type="text" id="revEnd" name="revEnd" size="31" value="${rOne.revEnd }">
					</td>
				</tr>
				<tr>
					<td id="td">금액</td>
					<td>
					<input type="text" id="price" name="price" size="31" value="${rOne.price }">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<br><br>
						<input type="submit" value="수정하기">
						<input type="reset"  value="취소">
					</td>
				</tr>
			</table>
		</form>
		</div>
</body>
</html>