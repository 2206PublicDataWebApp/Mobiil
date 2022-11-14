<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>개인회원 비밀번호 찾기</title>
    <style>
    	#input{
    		width : 200px;
    	}
    	.email_ok{
		color:red;
		display: none;
		}
		
		.email_already{
		color:#008000; 
		display: none;
		}
	
        .pwdfind {
            text-align: center;
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
<jsp:include page="../common/menubar.jsp"></jsp:include>

    <div class="pwdfind">
        <h1>개인회원 비밀번호 찾기</h1>
        <br><br><br>
        <form name="email" action="/" method="post">
            <input type="text" class="input" id="email" name="email" placeholder="이메일" oninput = "checkEmail()" >
            <br>
				<span class="email_ok">존재하지 않는 이메일입니다. 다른 이메일을 입력하세요.</span>
				<span class="email_already">존재하는 이메일입니다.</span>
				
				<div class="form-inline mb-3">
					<div class="mail_check_input_box" id="mail_check_input_box_false">
						<input type="text" id="input" class="mail_check_input form-control col-8" disabled="disabled">
						<button type="button" id="mail_check_button" class="btn btn-outline-primary btn-sm">인증번호 전송</button>
					</div>
				</div>
				<!-- 인증번호 확인 -->
				<div class="auth-success" id="auth-success">인증번호가 일치합니다.</div>
				<div class="auth-fail" id="auth-fail">인증번호가 일치하지 않습니다.</div>
				
            <div class="ment"><br>인증번호를 입력 후 비밀번호를 변경하세요.</div>
            <br>
            
            <div class="form-inline mb-3">
					<div class="mail_check_input_box" id="mail_check_input_box_false">
						<button type="button" class="button" onclick="modifyPwd();">비밀번호 변경하러 가기</button>
					</div>
			</div>
        </form>
    </div>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
     
	<script>
	function modifyPwd() {
		
        var email = $("#email");

        var emailCheck = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
        if (!emailCheck.test(email.val())) {
	        alert("올바른 형식의 이메일을 입력하세요.");
	        email.focus();
	        return false;
	     }
		
		if ( $('.email_ok').is(':visible') ) {
			alert("가입이력이 있는 이메일을 입력하세요.");
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

		location.href = "/login/modifyPwdView.kh?memberEmail="+email.val();
    }
	
	
	function checkEmail(){
        var emailValue = $('#email').val();
        
        $.ajax({
        	url : "/member/checkMemberEmail.kh",
            data: { "memberEmail" : emailValue },
            type: "get",
            success : function(result){
                if(result == 0){ // 회원 정보에 존재하지 않는 이메일
                    $('.email_ok').css("display","inline-block"); 
                    $('.email_already').css("display", "none");
                    $('#mail_check_button').css("display", "none");
                } else { // 회원 정보에 존재하는 이메일
                    $('.email_already').css("display","inline-block");
                    $('.email_ok').css("display", "none");
                    $('#mail_check_button').css("display", "inline-block");
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
			url : "/findPwd",
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