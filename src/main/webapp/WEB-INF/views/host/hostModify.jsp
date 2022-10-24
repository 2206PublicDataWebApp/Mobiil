<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트 수정 페이지</title>

<style>
	#td{
		text-align : center;
	}
	
	
</style>


</head>


<body>
	<jsp:include page="../host/menuBar.jsp"></jsp:include>

		<div id="div" align="center">
		<h2>호스트 정보 수정 페이지</h2><br>
		<hr>
		<form action="/host/hostModify.mobiil" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td id="td">대표자명   :</td>
					<td>
					<input type="text" id="hostName" name="hostName" size="31" value="${sessionScope.loginUser.hostName }">
					</td>
				</tr>
				<tr>
					<td id="td">상호명   :</td>
					<td>
					<input type="text" id="companyName" name="companyName" size="31" value="${sessionScope.loginUser.companyName }">
					</td>
				</tr>
				<tr>
					<td id="td">연락처   :</td>
					<td>
					<input type="text" id="hostPhone" name="hostPhone" size="31" value="${sessionScope.loginUser.hostPhone }">
					</td>
				</tr>
				<tr>
					<td id="td">사업자 등록번호   :</td>
					<td>
					<input type="text" id="companyRegNum" name="companyRegNum" size="31" value="${sessionScope.loginUser.companyRegNum }">
					</td>
				</tr>
				<tr>
					<td id="td">은행명   :</td>
					<td>
					<input type="text" id="accountName" name="accountName" size="31" value="${sessionScope.loginUser.accountName }">
					</td>
				</tr>
				<tr>
					<td id="td">Email   :</td>
					<td>
					<input type="text" id="hostEmail" name="hostEmail" size="31" value="${sessionScope.loginUser.hostEmail }" readonly>
					</td>
				</tr>
				<tr>
					<td>사업자 등록증</td>
					<td>
						<input type="hidden" value="" name="regPhotoRename">
						<input type="file" name="reloadFile">
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