<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트 페이지</title>
<style>
		#td{
		text-align : right;
	}
	
	#image{
	  	width: 500px;
		height : 300px;
		margin-left: 50px;
	}
	
	#imageTr{
		text-align : right;
	}
	
	#imgtd{
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
        
      #wapper{
      	text-align : center;
      }
</style>


</head>

<body>
<jsp:include page="../../views/common/menubar.jsp"></jsp:include>
	<div id="wapper">
	<jsp:include page="../host/menuBar.jsp"></jsp:include>
		<h2 align="center">안녕하세요, OOO님</h2><br>
		<hr>
		
			<table align="center">
				<tr>
					<td id="td">대표자명 </td>
					<td>
					<input type="text" id="name" class="input" name="name" value="${hOne.hostName }" readonly>
					</td>
				</tr>
				<tr>
					<td id="td">상호명</td>
					<td>
					<input type="text" id="business_name" class="input" name="business_name" value="${hOne.companyName }"readonly>
					</td>
				</tr>
				<tr>
					<td id="td">연락처</td>
					<td>
					<input type="text" id="phone" class="input" name="phone" value="${hOne.hostPhone }" readonly>
					</td>
				</tr>
				<tr>
					<td>사업자 등록번호</td>
					<td>
					<input type="text" id="businessNo" class="input" name="businessNo" value="${hOne.companyRegNum }" readonly>
					</td>
				</tr>
				<tr>
					<td id="td">은행명</td>
					<td>
					<input type="text" id="bankName" class="input" name="bankName" value="${hOne.accountName }" readonly>
					</td>
				</tr>
				<tr>
					<td id="td">Email</td>
					<td>
					<input type="text" id="Email" class="input" name="Email" value="${hOne.hostEmail }" readonly>
					</td>
				</tr>
				<br>
				<tr>
					<td id="imgtd" colspan ='2'>사업자 등록증 </td>
					<td></td>
				</tr>
				<tr>
					<td colspan='2'><div><input type="image" id="image" src="/resources/hostFiles/${hOne.regPhotoRename }" alt="사업자등록증">	</div></td>
					<td><td>
				</tr>
			</table>
		</div>	
		<br><br><br><br><br><br><br>
<jsp:include page="../../views/common/footer.jsp"></jsp:include>
</body>
</html>