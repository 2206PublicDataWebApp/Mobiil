<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>개인/기업 로그인 선택</title>
    <style>
        .btn {
           width: 100%; 
           text-align: center;
        }
        .button {
            width: 250px;
            height : 250px;
            border-radius: 20px;
            background-color:rgb(212, 191, 232);
            border : none;
            font-size: 25px;
        }
        .span {
            text-align: center;
            font-size: 15px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"></jsp:include>
    <div class="btn">
        <button class="button" onclick="location.href='/member/loginView.kh'">개인회원<br>로그인 하기</button>
        <button class="button" onclick="location.href='/host/loginView.kh'">기업(호스트)회원<br>로그인 하기</button>
    </div>
    <div class="span">
        <span onclick="location.href='/member/joinView.kh'">개인 회원가입하기</span>
        <span> | </span> 
        <span onclick="location.href='/host/joinView.kh'">기업 회원가입하기</span> 
    </div>
      <br><br><br><br><br><br>
  <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>