<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Kakao Page</title>
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
    height: 40px;
    width: 400px;
    background-color:rgb(212, 191, 232);
    border-radius: 20px;
    border: none;
    font-size: 20px;
    margin: 1px 1px 10px 50px;
}
        
.remove {
    font-size: 15px;
    margin-left : 350px;
    cursor: pointer;
    
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
	
.required label:before {
color: rgb(238, 51, 34);
content: '* ';
}

.nick_ok{
color:#008000;
display: none;
}

.nick_already{
color:#6A82FB; 
display: none;
}

#email {
background-color: lightgray;
}

</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"></jsp:include>

    <div class="signup">
        <div class="span">
            <span onclick="location.href='/member/myKakaoInfo.kh'"><b>My 정보 수정</b></span> 
            <span> | </span>
            <span onclick="location.href='/member/mySpaceList.kh'">찜한 공간 보기</span> 
            <span> | </span> 
            <span onclick="location.href='/payment/list.kh'">결제 내역 보기</span>
            <span> | </span> 
            <span onclick="location.href='/partner/myPartnerInfo.kh?memberEmail=${loginUser.memberEmail}'">내 파트너 정보</span>
        </div>
        <br><br>
        <div class="required">
            <h1>카카오회원 정보 수정</h1>
            <br>
            <form name="myKakaoPage_form" action="/member/kakaoModify.kh" method="post">
                <label>이메일</label><input type="email" class="input" id="email" name="memberEmail" value="${member.memberEmail}" readonly><br>
                <br>
                <label>이름(실명)</label><input type="text" class="input" id="name" name="memberName" value="${member.memberName}"><br>
                <br>
                <label>닉네임</label><input type="text" class="input" id="nick" name="memberNick" value="${member.memberNick}" placeholder="특수문자 제외, 2자~8자" oninput = "checkNick()" >
                <br>
				<span class="nick_ok">사용 가능한 닉네임이에요 :)</span>
				<span class="nick_already">이미 사용중인 닉네임이에요 :(</span>
                <br>
                <div><button type="button" class="button" onclick="mykpageform_check();">수정하기</button></div>
                <br><br><br>
                <div><a type="button" class="remove" onclick="removeKakaoMember();">회원 탈퇴하기</a></div>
            </form>
        </div>
    </div>
    
    <script>
    function removeKakaoMember() {
		if(confirm("정말 탈퇴하시겠습니까?")) {
			location.href = "/member/kakaoRemove.kh";
		}
	}
    
    function mykpageform_check() {
        var name = document.getElementById("name");
        var nick = document.getElementById("nick");

        var nameCheck = /^[가-힣]{2,}$/;
        if (!nameCheck.test(name.value)) {
	        alert("이름은 한글 2글자 이상 입력하세요.");
	        name.focus();
        	return false;
   		}
        
        var nickCheck = /^[a-zA-Z0-9가-힣]{2,8}$/;
        if (!nickCheck.test(nick.value)) {
        alert("닉네임은 특수문자를 제외한 2~8자리로 입력하세요.");
        nick.focus();
        return false;
        }
        
        if ( $('.nick_already').is(':visible') ) {
			alert("사용중이 아닌 닉네임을 입력하세요.");
       		return false;
		}
        
        document.myKakaoPage_form.submit();
    }
    
        function checkNick(){
            var nickValue = $('#nick').val();
            
            $.ajax({
            	url : "/member/checkNick.kh",
                data: { "memberNick" : nickValue },
                type: "get",
                success : function(result){
                    if(result == 0){
                        $('.nick_ok').css("display","inline-block"); 
                        $('.nick_already').css("display", "none");
                    } else { 
                        $('.nick_already').css("display","inline-block");
                        $('.nick_ok').css("display", "none");
                    }
                },
                error:function(){
                    alert("에러입니다");
                }
            });
          };
  </script>
  
  
<br><br><br>
  <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>