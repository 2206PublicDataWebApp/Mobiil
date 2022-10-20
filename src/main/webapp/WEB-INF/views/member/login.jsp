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
            width: 500px;
            background-color:rgb(212, 191, 232);
            border-radius: 10px;
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

            <div>
                <span style="padding: 1px 295px 1px 1px;">
                    <input style="margin-top: 10px;" type="checkbox" name="" id=""> 자동 로그인
                </span>
                <span>
                    <a href="">비밀번호 찾기</a>
                </span>
            </div>

            <br>
            <div><button type="submit" class="button">로그인 하기</button></div>
            카카오 로그인
        </form>
        <span>아직 모빌 회원이 아니신가요?</span>
        <span><a href="/member/joinView.kh"><b>회원가입</b></a></span>
    </div>
       <br><br><br><br>
  <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>