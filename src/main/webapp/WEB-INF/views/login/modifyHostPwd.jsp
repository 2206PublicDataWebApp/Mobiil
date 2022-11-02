<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업회원 비밀번호 변경</title>
<style>
.modPwd {
	text-align: center;
	margin-top: 100px;
}

.input {
	height: 30px;
	width: 400px;
	font-size: 15px;
	margin: 1px 80px 10px 20px;
	border-color: rgb(239, 237, 237);
}

.button {
	height: 50px;
	width: 400px;
	background-color: rgb(212, 191, 232);
	border-radius: 10px;
	border: none;
	font-size: 15px;
}

.required label {
	font-weight: bold;
	display: inline-block;
	width: 120px;
	text-align: right;
}

.required label:before {
	color: rgb(238, 51, 34);
	content: '* ';
}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>

	<div class="modPwd">
		<h1>기업회원 비밀번호 변경</h1>
		<br>
		<div class="required">
			<form id="password-modify" name="" action="/login/modifyHostPwd.kh" method="post">
				<input type="hidden" name="hostEmail" value="${hostEmail}">
				<label>비밀번호</label><input type="password" class="input" id="pwd" name="hostPwd" placeholder="영문자/숫자/특수문자 포함, 6자~20자"><br>
				<label>비밀번호 확인</label><input type="password" class="input" id="pwd2" name="hostPwd2" placeholder="영문자/숫자/특수문자 포함, 6자~20자"><br>
				<button type="submit" class="button" onclick="modifyPwd();">비밀번호 변경하기</button>
			</form>
		</div>
		
	</div>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script>
	
	 $(function() {
         $("#password-modify").on("submit", function() {

			var pwd = document.getElementById("pwd");
			var pwd2 = document.getElementById("pwd2");

			if (pwd.value == "") {
				alert("비밀번호를 입력하세요.");
				pwd.focus();
				return false;
			}

			var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,20}$/;
			if (!pwdCheck.test(pwd.value)) {
				alert("비밀번호는 영문자+숫자+특수문자 조합으로 6~20자리 사용해야 합니다.");
				pwd.focus();
				return false;
			}

			if (pwd2.value !== pwd.value) {
				alert("비밀번호가 일치하지 않습니다.");
				pwd2.focus();
				return false;
			}

         });
     });
	</script>
	<br><br><br><br><br><br>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>