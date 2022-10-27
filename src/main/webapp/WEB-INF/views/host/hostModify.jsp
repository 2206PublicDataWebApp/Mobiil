<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트 수정 페이지</title>

<style>
	#td{
		text-align : right;
	}
	
	.input {
           height: 30px;
           width: 400px;
           font-size: 15px;
           margin: 1px 80px 10px 20px;
           text-align: center;
           font-weight: bolder;
       }
       
       .file{
       	   margin-left: 20px;
       }
       
       .button1 {
            height: 40px;
            width: 100px;
            background-color:#ecf3fd;
            border-radius: 20px;
            border: none;
            font-size: 20px;
            margin: 1px 1px 10px 50px;
            font-size: 15px;
        }
        
        .button2 {
            height: 40px;
            width: 100px;
            background-color:#f3f3f3;
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
		<h2>호스트 정보 수정 페이지</h2><br>
		<hr>
		<form action="/host/hostModify.mobiil" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td id="td">대표자명</td>
					<td>
					<input type="text" id="hostName" class="input" name="hostName" size="31" value="${sessionScope.loginHost.hostName }">
					</td>
				</tr>
				<tr>
					<td id="td">상호명</td>
					<td>
					<input type="text" id="companyName" class="input" name="companyName" size="31" value="${sessionScope.loginHost.companyName }">
					</td>
				</tr>
				<tr>
					<td id="td">연락처</td>
					<td>
					<input type="text" id="hostPhone" class="input" name="hostPhone" size="31" value="${sessionScope.loginHost.hostPhone }">
					</td>
				</tr>
				<tr>
					<td id="td">사업자 등록번호</td>
					<td>
					<input type="text" id="companyRegNum" class="input" name="companyRegNum" size="31" value="${sessionScope.loginHost.companyRegNum }">
					</td>
				</tr>
				<tr>
					<td id="td">은행명</td>
					<td>
					<input type="text" id="accountName" class="input" name="accountName" size="31" value="${sessionScope.loginHost.accountName }">
					</td>
				</tr>
				<tr>
					<td id="td">Email</td>
					<td>
					<input type="text" id="hostEmail" class="input" name="hostEmail" size="31" value="${sessionScope.loginHost.hostEmail }" readonly>
					</td>
				</tr>
				<tr>
					<td>사업자 등록증</td>
					<td>
						<input type="hidden" value="" name="regPhotoRename">
						<input type="file" class="file" name="reloadFile">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<br><br>
						<input type="submit" class="button1" value="수정하기">
						<input type="reset"  class="button2" value="취소">
					</td>
				</tr>
			</table>
		</form>
		</div>
		<br><br><br><br><br><br><br><br>
<jsp:include page="../../views/common/footer.jsp"></jsp:include>		
</body>
</html>