<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트 페이지</title>

<style>
		#td{
		text-align : center;
	}
	
	#image{
		widtg : 250px;
		height : 250px;
	}
	
	#imageTr{
		text-align : right;
	}
</style>


</head>


<body>
	<jsp:include page="../host/menuBar.jsp"></jsp:include>

		<h2 align="center">안녕하세요, OOO님</h2><br>
		<hr>
		
			<table align="center">
				<tr>
					<td id="td">대표자명   :</td>
					<td>
					<input type="text" id="name" name="name" value="${hOne.hostName }" readonly>
					</td>
				</tr>
				<tr>
					<td id="td">상호명   :</td>
					<td>
					<input type="text" id="business_name" name="business_name" value="${hOne.companyName }"readonly>
					</td>
				</tr>
				<tr>
					<td id="td">연락처   :</td>
					<td>
					<input type="text" id="phone" name="phone" value="${hOne.hostPhone }" readonly>
					</td>
				</tr>
				<tr>
					<td id="td">사업자 등록번호   :</td>
					<td>
					<input type="text" id="businessNo" name="businessNo" value="${hOne.companyRegNum }" readonly>
					</td>
				</tr>
				<tr>
					<td id="td">은행명   :</td>
					<td>
					<input type="text" id="bankName" name="bankName" value="${hOne.accountName }" readonly>
					</td>
				</tr>
				<tr>
					<td id="td">Email   :</td>
					<td>
					<input type="text" id="Email" name="Email" value="${hOne.hostEmail }" readonly>
					</td>
				</tr>
				<tr>
					<td id="td" colspan ='2'>사업자 등록증 </td>
					<td></td>
				</tr>
				<tr>
					<td colspan='2'><div><input type="image" id="image" src="/resources/hostFiles/${hOne.regPhotoRename }" alt="사업자등록증">	</div></td>
					<td><td>
				</tr>
			</table>
</body>
</html>