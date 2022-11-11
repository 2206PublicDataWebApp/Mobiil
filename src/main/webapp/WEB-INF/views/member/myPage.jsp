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
	
	#name, #email {
		 background-color: lightgray;
	}
.nick_ok{
color:#008000;
display: none;
}

.nick_already{
color:#6A82FB; 
display: none;
}
    </style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"></jsp:include>

    <div class="signup">
        <div class="span">
            <span onclick="location.href='/member/myInfo.kh'"><b>My 정보 수정</b></span> 
            <span> | </span>
            <span onclick="location.href='/member/mySpaceList.kh'">찜한 공간 보기</span> 
            <span> | </span> 
            <span onclick="location.href='/payment/list.kh'">결제 내역 보기</span>
            <span> | </span> 
            <span onclick="location.href='/partner/myPartnerInfo.kh?memberEmail=${loginUser.memberEmail}'">내 파트너 정보</span>
        </div>
        <br><br><br>
        <div class="required">
<!--             <div>My 정보 수정</div> -->
            <form name="mypage_form" action="/member/modify.kh" method="post">
                <input type="hidden" class="input" id="nick" name="originNick" value="${member.memberNick }" ><br>
                <label>이름</label><input type="text" class="input" id="name" name="memberName" value="${member.memberName }" readonly><br>
                <label>이메일</label><input type="email" class="input" id="email" name="memberEmail" value="${member.memberEmail }" readonly><br>
                <label>닉네임</label><input type="text" class="input" id="nick2" name="memberNick" value="${member.memberNick }" oninput = "checkNick()"><br>
				<span class="nick_ok">사용 가능한 닉네임이에요 :)</span>
				<span class="nick_already">이미 사용중인 닉네임이에요 :(</span>
                <br>
                <label>비밀번호</label><input type="password" class="input" id="pwd" name="memberPwd" value="${member.memberPwd }" ><br>
                <label>비밀번호 확인</label><input type="password" class="input" id="pwd2"  value="${member.memberPwd }" ><br>
                <label>전화번호</label><input type="text" class="input" id="phone" name="memberPhone" value="${member.memberPhone }" oninput="hypenTel(this)" maxlength="13"><br>
                <br>
                <div><button type="button" class="button" onclick="mypageform_check();">수정하기</button></div>
                <br><br><br>
                <div><a type="button" class="remove" onclick="removeMember();">회원 탈퇴하기</a></div>
            </form>
        </div>
    </div>
 <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script>
    
    function removeMember() {
		if(confirm("정말 탈퇴하시겠습니까?")) {
			location.href = "/member/remove.kh";
		}
	}
    
    const hypenTel = (target) => {
        target.value = target.value
            .replace(/[^0-9]/g, '')
            .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
    }
    
    function mypageform_check() {
    	if(confirm("닉네임 변경시 기존 채팅과 파트너 정보가 리셋됩니다. 수정하시겠습니까?")){
        var name = document.getElementById("name");
        var email = document.getElementById("email");
        var nick = document.getElementById("nick2");
        var pwd = document.getElementById("pwd");
        var pwd2 = document.getElementById("pwd2");
        var phone = document.getElementById("phone");


        var nameCheck = /^[가-힣]{2,}$/;
        if (!nameCheck.test(name.value)) {
        alert("이름은 한글 2글자 이상 입력하세요.");
        name.focus();
        return false;
        }
        
        var emailCheck = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
        if (!emailCheck.test(email.value)) {
        alert("올바른 형식의 이메일을 입력하세요.");
        email.focus();
        return false;
        }
	 	
        var nickCheck = /^[a-zA-Z0-9가-힣]{2,8}$/;
        if (!nickCheck.test(nick.value)) {
        alert("닉네임은 특수문자를 제외한 2~8자리로 입력하세요.");
        nick.focus();
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
            
        document.mypage_form.submit();
    	}
    }
    
    function checkNick(){
        var nickValue = $('#nick2').val();
        
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