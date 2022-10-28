<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 정보 수정 페이지</title>

<style>
	table {
			width: 750px;
		}
		
	#td{
		text-align : center;
	}
	
	.input {
		height: 30px;
		width: 400px;
		font-size: 15px;
		margin: 1px 80px 10px 20px;
		text-align: center;
		font-weight: bolder;
	}
	
	.button1 {
		height: 40px;
		width: 100px;
		background-color: #ecf3fd;
		border-radius: 20px;
		border: none;
		font-size: 20px;
		margin: 1px 1px 10px 50px;
		font-size: 15px;
	}
	
	.button2 {
		height: 40px;
		width: 100px;
		background-color: #f3f3f3;
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

		<div id="div" align="center">
		<h2>예약 정보 수정 페이지</h2><br>
		<hr>
		<form action="/host/reservationModify.mobiil" method="post">
		<input type="hidden" name="reservationNo" value="${rOne.reservationNo }">
			<table>
				<tr>
					<td id="td">예약자 성함</td>
					<td>
					<input type="text" id="memberName" class="input" name="memberName" size="31" value="${rOne.memberName }">
					</td>
				</tr>
				<tr>
					<td id="td">예약자 연락처</td>
					<td>
					<input type="text" id="memberPhone" class="input" name="memberPhone" size="31" value="${rOne.memberPhone }">
					</td>
				</tr>
				<tr>
					<td id="td">예약일자</td>
					<td>
					<input type="text" id="reservationDate" class="input" name="reservationDateStr" size="31" value="${rOne.reservationDate }" readonly>
					</td>
				</tr>
				<tr>
					<td id="td">체크인</td>
					<td>
					<input type="text" id="revStart" class="input" name="revStart" size="31" value="${rOne.revStart }">
					</td>
				</tr>
				<tr>
					<td id="td">체크아웃</td>
					<td>
					<input type="text" id="revEnd" class="input" name="revEnd" size="31" value="${rOne.revEnd }">
					</td>
				</tr>
				<tr>
					<td id="td">금액</td>
					<td>
					<input type="text" id="price" class="input" name="price" size="31" value="${rOne.price }">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<br><br>
						<input class="button1" type="submit" value="수정하기">
						<input class="button2" type="reset"  value="취소" onclick="location.href='/host/registList.mobiil'">
					</td>
				</tr>
			</table>
		</form>
		</div>
<jsp:include page="../../views/common/footer.jsp"></jsp:include>		
</body>
</html>