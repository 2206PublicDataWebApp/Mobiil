<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인회원 로그인</title>
 <style>
        .login {
            text-align: center;
        }

        #input {
            height: 40px;
            width: 500px;
            font-size: 20px;
        }

        .button {
            height: 50px;
            width: 330px;
            background-color:rgb(212, 191, 232);
            border-radius: 5px;
            border: none;
            font-size: 18px;
        }
        
    </style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"></jsp:include>

    <div class="login">
        <h1>개인회원 로그인</h1>
        <br><br><br>
        <form action="/member/login.kh" method="post">
            <input style="margin: 1px 1px 10px 1px;" type="email" id="input" name="memberEmail" placeholder="이메일"><br>
            <input type="password" id="input" name="memberPwd" placeholder="비밀번호">
            <br><br>
            <div><button type="submit" class="button">로그인</button></div>
            <br>
            <a href="https://kauth.kakao.com/oauth/authorize?client_id=c61c3ed34bcf022b1aa5f4a4d4826902&redirect_uri=http://localhost:9454/member/kakaoLogin.kh&response_type=code">
				<img src="/resources/icon/kakao_login_large_wide.png" style="height:50px;" >
            </a>
            <br>
            <h5><b>카카오 로그인 시, 이메일 동의에 체크하셔야 가입이 가능합니다.</b></h5>
        </form>
        <br><br>
        <span>아직 모빌 회원이 아니신가요?</span>
        <span><a href="/member/joinView.kh"><b>회원가입</b></a></span>
        <br><br>
        <span>비밀번호를 잊으셨나요?</span>
        <span><a href="/login/findPwdView.kh"><b>비밀번호 찾기</b></a></span>
    </div>
       <br><br><br><br>
  <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>