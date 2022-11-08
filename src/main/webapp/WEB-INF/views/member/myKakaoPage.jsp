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


	.email_ok{
	color:#008000;
	display: none;
	}
	
	.email_already{
	color:#6A82FB; 
	display: none;
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
            <h5>이름(실명)과 닉네임을 수정하세요.</h5>
            <br>
            <form name="myKakaoPage_form" action="/member/kakaoModify.kh" method="post">
                <label>이름(실명)</label><input type="text" class="input" id="name" name="memberName" value="${member.memberName}"><br>
                <br>
                <label>닉네임</label><input type="text" class="input" id="nick" name="memberNick" value="${member.memberNick}" placeholder="특수문자 제외, 2자~8자" oninput = "checkNick()" >
                <br>
				<span class="nick_ok">사용 가능한 닉네임이에요 :)</span>
				<span class="nick_already">이미 사용중인 닉네임이에요 :(</span>
                <br>
                <label>이메일</label><input type="email" class="input" id="email" name="memberEmail" value="${member.memberEmail}"  oninput = "checkEmail()" required><br>
                <br>
				<span class="email_ok">사용 가능한 이메일이에요 :)</span>
				<span class="email_already">이미 사용중인 이메일이에요 :(</span>
				<div class="form-inline mb-3">
					<div class="mail_check_input_box" id="mail_check_input_box_false">
						<input type="text" class="mail_check_input form-control col-8" disabled="disabled">
						<button type="button" id="mail_check_button" class="btn btn-outline-primary btn-sm">인증번호 전송</button>
					</div>
				</div>
				<!-- 인증번호 확인 -->
				<div class="auth-success" id="auth-success">인증번호가 일치합니다.</div>
				<div class="auth-fail" id="auth-fail">인증번호가 일치하지 않습니다.</div>
                <div><button type="button" class="button" onclick="mykpageform_check();">수정하기</button></div>
                <br><br><br>
                <div><a type="button" class="remove" onclick="removeKakaoMember();">회원 탈퇴하기</a></div>
            </form>
        </div>
    </div>
    
    <script>
    function removeKakaoMember() {
		if(confirm("정말 탈퇴하시겠습니까?")) {
			location.href = "/member/remove.kh";
		}
	}
    
    function mykpageform_check() {
        var name = document.getElementById("name");
        var nick = document.getElementById("nick");
        var email = document.getElementById("email");

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
        
        var emailCheck = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
        if (!emailCheck.test(email.value)) {
        alert("올바른 형식의 이메일을 입력하세요.");
        email.focus();
        return false;
        }
	 	
        
        var inputCode = $(".mail_check_input").val();
        if (inputCode == "") {
        	alert("인증번호를 입력하세요.");
    		return false;
        }
        
		if (inputCode != "" || code != "") {
			if (inputCode != code) {
				alert("올바른 인증번호를 입력하세요.");
        		return false;
			}
		}
		
        document.myKakaoPage_form.submit();
    }
    
    function checkEmail(){
        var emailValue = $('#email').val();
        
        $.ajax({
        	url : "/member/checkEmail.kh",
            data: { "memberEmail" : emailValue },
            type: "get",
            success : function(result){
                if(result == 0){ // 사용 가능 이메일
                    $('.email_ok').css("display","inline-block"); 
                    $('.email_already').css("display", "none");
                    $('#mail_check_button').css("display", "inline-block");
                } else { // 이미 존재하는 이메일
                    $('.email_already').css("display","inline-block");
                    $('.email_ok').css("display", "none");
                    $('#mail_check_button').css("display", "none");
                }
            },
            error:function(){
                alert("에러입니다");
            }
        });
      };
        
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

            
            
    		//인증번호 코드
    		
    		$("#auth-success").hide();
    		$("#auth-fail").hide();

    		var checkCode = false;

    		//인증번호를 저장할 변수
    		var code = "";
    		
    		//인증번호 이메일 전송
    		$("#mail_check_button").on("click", function(e){
    			e.preventDefault();
    			var email = $("#email").val();
    			var checkBox = $(".mail_check_input");
    			
    			$.ajax({
    				type:"get",
    				url : "/mailCheck",
    				data : {memberEmail : email},
    				success : function(data){ // 인증번호를 가져옴
	        			alert("인증번호가 발송되었습니다. 메일함을 확인해주세요.");
    					checkBox.attr("disabled", false); // 인증번호 입력 가능
    					checkBox.val(''); // 기존에 값이 있었으면 지워줌
    					$("#auth-success").hide();
    					$("#auth-fail").hide();
    					checkCode = false;
    					code = data; // 인증번호를 변수에 저장
    				},
    				error : function(data) {
            			alert("인증번호 발송 실패");
    				}
    			});
    		});
    		
    		//인증코드 입력 시 동일성 확인
    		$(".mail_check_input").keyup(function() {
    			var inputCode = $(".mail_check_input").val();
    			if (inputCode != "" || code != "") {
    				if (inputCode == code) {
    					$("#auth-success").show();
    					$("#auth-success").css('color','green');
    					$("#auth-fail").hide();
    					$(".mail_check_input").attr("disabled", true); //인증번호 입력 멈춤
    					checkCode = true;
    				} else {
    					$("#auth-success").hide();
    					$("#auth-fail").show();
    					$("#auth-fail").css('color','red');

    					checkCode = false;
    				}
    			}
    		});
    		
  </script>
  
  
<br><br><br>
  <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>