<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
 <style>
        .signup {
            text-align: center;
            margin-top: 50px;
        }

        .input {
            height: 30px;
            width: 400px;
            font-size: 15px;
            margin: 1px 80px 10px 20px;
        }

        .button {
            height: 50px;
            width: 400px;
            background-color:rgb(212, 191, 232);
            border-radius: 10px;
            border: none;
            font-size: 15px;
        }
         .span {
            text-align: center;
            font-size: 15px;
            cursor: pointer;
        }
        .required label {
            font-weight: bold;
            display: inline-block; 
            width: 120px;
            text-align: right;
        }

    </style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"></jsp:include>

    <div class="signup">
        <div class="span">
            <span><b>My 정보 수정</b></span> 
            <span> | </span> 
<!--             <span onclick="location.href='/member/joinView.kh'"> -->
            <span onclick="location.href='#'">찜한 공간 보기</span> 
            <span> | </span> 
            <span onclick="location.href='#'">결제 내역 보기</span>
            <span> | </span> 
            <span onclick="location.href='/partner/myPartnerInfo.kh?memberEmail=${loginUser.memberEmail}'">내 파트너 정보</span>
        </div>
        <br><br><br>
        <div class="required">
<!--             <div>My 정보 수정</div> -->
            <form name="email" action="/" method="post">
                <label>이름</label><input type="text" class="input" id="name" readonly><br>
                <label>이메일</label><input type="email" class="input" id="email" readonly><br>
                <label>닉네임</label><input type="text" class="input" id="nick"><br>
                <label>비밀번호</label><input type="password" class="input" id="pwd"><br>
                <label>비밀번호 확인</label><input type="password" class="input" id="pwd2"><br>
                <label>전화번호</label><input type="text" class="input" id="phone" oninput="hypenTel(this)" maxlength="13"><br>
                <br>
                <div><button type="button" class="button" onclick="joinform_check();">수 정 ~</button></div>
            </form>
        </div>
    </div>
<br><br><br><br><br><br>
  <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>