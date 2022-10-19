<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>호스트 페이지</title>

<style>
	#td{
		text-align : right;
	}
	
	
</style>


</head>


<body>
	<jsp:include page="../host/menuBar.jsp"></jsp:include>

		<div id="div" align="center">
		<h2>안녕하세요, OOO님</h2><br>
		<hr>
		
			<table>
				<tr>
					<td id="td">대표자명   :</td>
					<td>
					<input type="text" id="name" name="name" readonly>
					</td>
				</tr>
				<tr>
					<td id="td">상호명   :</td>
					<td>
					<input type="text" id="business_name" name="business_name" readonly>
					</td>
				</tr>
				<tr>
					<td id="td">연락처   :</td>
					<td>
					<input type="text" id="phone" name="phone" readonly>
					</td>
				</tr>
				<tr>
					<td id="td">사업자 등록번호   :</td>
					<td>
					<input type="text" id="businessNo" name="businessNo" readonly>
					</td>
				</tr>
				<tr>
					<td id="td">은행명   :</td>
					<td>
					<input type="text" id="bankName" name="bankName" readonly>
					</td>
				</tr>
				<tr>
					<td id="td">Email   :</td>
					<td>
					<input type="text" id="Email" name="Email" readonly>
					</td>
				</tr>
			</table>


	<span>사업자 등록증</span>
	
	<div>
		<input type="image" src="" alt="사업자등록증">	
	</div>
	

		</div>








</body>
</html>