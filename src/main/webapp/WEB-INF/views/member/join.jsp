<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인회원 가입</title>
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

.email_ok {
	color: #008000;
	display: none;
}

.email_already {
	color: #6A82FB;
	display: none;
}

.nick_ok {
	color: #008000;
	display: none;
}

.nick_already {
	color: #6A82FB;
	display: none;
}
</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"></jsp:include>
	<div class="signup">
		<h1>개인 회원가입</h1>
		<br>
		<div class="required" >
			<form name="join_form" action="/member/register.kh" method="post">
				<label>이름</label><input type="text" class="input" id="name" name="memberName" placeholder=""><br> 
				<label>전화번호</label><input type="text" class="input" id="phone" name="memberPhone" oninput="hypenTel(this)" maxlength="13" placeholder="숫자만 입력"><br> 
				<label for="email">이메일</label>
				<input type="text" class="input" id="email" name="memberEmail" oninput = "checkEmail()" >
				<br>
				<span class="email_ok">사용 가능한 이메일이에요 :)</span>
				<span class="email_already">이미 사용중인 이메일이에요 :(</span>
				<div class="form-inline mb-3">
					<div class="mail_check_input_box" id="mail_check_input_box_false">
						<input style="width:300px; margin: 1px 1px 10px 70px;" type="text" class="mail_check_input form-control col-8" disabled="disabled">
						<button style="height:45px;" type="button" id="mail_check_button" class="btn btn-outline-primary btn-sm">인증번호 전송</button>
					</div>
				</div>
				<!-- 인증번호 확인 -->
				<div class="auth-success" id="auth-success">인증번호가 일치합니다.</div>
				<div class="auth-fail" id="auth-fail">인증번호가 일치하지 않습니다.</div>
				<br>
				<label>비밀번호</label><input type="password" class="input" id="pwd" name="memberPwd" placeholder="영문자/숫자/특수문자 포함, 6자~20자"><br> 
				<label>비밀번호 확인</label><input type="password" class="input" id="pwd2" name="memberPwd2" placeholder="영문자/숫자/특수문자 포함, 6자~20자"><br> 
				<label>닉네임</label>
				<input type="text" class="input" id="nick" name="memberNick" placeholder="특수문자 제외, 2자~8자" oninput = "checkNick()" >
				<br>
				<span class="nick_ok">사용 가능한 닉네임이에요 :)</span>
				<span class="nick_already">이미 사용중인 닉네임이에요 :(</span>
				<br><br>
				<div>
					<button type="button" class="button" onclick="joinform_check();">회원가입하기</button>
				</div>
			</form>
		</div>
	</div>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
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
		
		if ( $('.email_already').is(':visible') ) {
			alert("사용중이 아닌 이메일을 입력하세요.");
       		return false;
		}
	
		if ( $('.nick_already').is(':visible') ) {
			alert("사용중이 아닌 닉네임을 입력하세요.");
       		return false;
		}
		
        document.join_form.submit();
        
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
  <br><br><br><br><br><br>
  <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>