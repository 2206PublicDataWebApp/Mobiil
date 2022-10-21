<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인회원가입</title>
<style>
.signup {
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

	<div class="signup">
		<h1>개인 회원가입</h1>
		<br>
		<div class="required">
			<form name="join_form" action="/member/register.kh" method="post">
				<label>이름</label><input type="text" class="input" id="name" name="memberName" placeholder=""><br> 
				<label>전화번호</label><input type="text" class="input" id="phone" name="memberPhone" oninput="hypenTel(this)" maxlength="13" placeholder="숫자만 입력"><br> 
				<label>이메일</label><input type="email" class="input" id="email" name="memberEmail" placeholder=""><br>
				<label>비밀번호</label><input type="password" class="input" id="pwd" name="memberPwd" placeholder="영문자/숫자/특수문자 포함, 6자~20자"><br> 
				<label>비밀번호 확인</label><input type="password" class="input" id="pwd2" name="memberPwd2" placeholder="영문자/숫자/특수문자 포함, 6자~20자"><br> 
				<label>닉네임</label><input type="text" class="input" id="nick" name="memberNick" placeholder="특수문자 제외, 2자~8자"><br> 
				<br>
				<div>
					<button type="button" class="button" onclick="joinform_check();">회원가입하기</button>
				</div>
			</form>
		</div>
	</div>

	<script>
    const hypenTel = (target) => {
        target.value = target.value
            .replace(/[^0-9]/g, '')
            .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
    }
    
    function joinform_check() {
        var name = document.getElementById("name");
        var phone = document.getElementById("phone");
        var email = document.getElementById("email");
        var nick = document.getElementById("nick");
        var pwd = document.getElementById("pwd");
        var pwd2 = document.getElementById("pwd2");


        var nameCheck = /^[가-힣]{2,}$/;
        if (!nameCheck.test(name.value)) {
        alert("이름은 한글 2글자 이상 입력하세요.");
        name.focus();
        return false;
        }

        if(phone.value == "") {
        alert("전화번호를 입력하세요.");
        phone.focus();
        return false;
        }
        
        var phoneCheck = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
        if (!phoneCheck.test(phone.value)) {
            alert("올바른 형식의 전화번호를 입력하세요.");
            phone.focus();
            return false;
            }
        
        var emailCheck = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
        if (!emailCheck.test(email.value)) {
        alert("올바른 형식의 이메일을 입력하세요.");
        email.focus();
        return false;
        }
	 	
        if(pwd.value == "") {
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
 

        var nickCheck = /^[a-zA-Z0-9가-힣]{2,8}$/;
        if (!nickCheck.test(nick.value)) {
        alert("닉네임은 특수문자를 제외한 2~8자리로 입력하세요.");
        nick.focus();
        return false;
        }
        
        document.join_form.submit();
    }
  </script>
  <br><br><br><br><br><br>
  <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>