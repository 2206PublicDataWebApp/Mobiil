<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>비밀번호 찾기</title>
    <style>
        .pwdfind {
            text-align: center;
            margin-top: 200px;
        }

        #email {
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

        .ment {
            font-size: 15px;
        }
    </style>
</head>
<body>
    <div class="pwdfind">
        <h1>비밀번호 찾기</h1>
        <br><br><br>
        <form name="email" action="/" method="post">
            <input type="email" id="email" placeholder="이메일" required>
            <div class="ment"><br>가입 시 사용한 이메일 주소를 입력해주세요.<br>입력하신 이메일로 임시 비밀번호를 보내드립니다.</div>
            <br>
            <div><button type="submit" class="button">임시 비밀번호 보내기</button></div>
        </form>
    </div>
</body>
</html>