<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>기업회원 가입</title>
    <style>
        .signup {
            text-align: center;
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
        
        .required label {
            font-weight: bold;
            display: inline-block; 
            width: 150px;
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
    </style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"></jsp:include>

    <div class="signup">
        <h1>기업(호스트) 회원가입</h1>
        <br>
        <div class="required">
            <form name="join_form" action="/host/register.kh" method="post" enctype="multipart/form-data">
                <label>이메일</label>
                <input type="email" class="input" id="email" name="hostEmail" oninput = "checkEmail()" >
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
				<br>
                <label>비밀번호</label><input type="password" class="input" id="pwd" name="hostPwd" placeholder="문자/숫자/기호 포함, 6자~20자"><br>
                <label>비밀번호 확인</label><input type="password" class="input" id="pwd2" name="hostPwd2" placeholder="문자/숫자/기호 포함, 6자~20자" ><br><br>
                <label>대표자명</label><input type="text" class="input" id="name" name="hostName" placeholder="" ><br>
                <label>상호명</label><input type="text" class="input" id="space" name="companyName" placeholder="" ><br>
                <label>전화번호</label><input type="text" class="input" id="phone" name="hostPhone" oninput="hypenTel(this)" maxlength="13" placeholder="숫자만 입력" ><br>
                <label>은행명</label><input type="text" class="input" id="bank" name="accountName" placeholder="ex)국민은행/카카오뱅크 등" ><br>
                <label>예금주명</label><input type="text" class="input" id="holder" name="accountHolder" placeholder="" ><br>
                <label>계좌번호</label><input type="text" class="input" id="num" name="accountNumber" placeholder="숫자만 입력" ><br>
                <label>사업자 등록번호</label><input type="text" class="input" id="reg" name="companyRegNum" oninput="hypenReg(this)" maxlength="10" placeholder="숫자만 입력" ><br>
                <div style="width: 650px;  margin: auto;">
                <div style="float:left; margin-right:20px;"><label for="photo">사업자 등록증 사진</label></div>
                <div><input type="file" class="input" id="file" name="uploadFile" accept=".jpg, .jpeg, .png"><br></div>
				</div>
				<img id="preview" style="width:600px; height:800px; display:none; margin-left:auto; margin-right:auto;">
                <br>
                <div><button type="button" class="button" onclick="joinform_check();">회원가입하기</button></div>
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
            
            const hypenReg = (target) => {
            target.value = target.value
                .replace(/[^0-9]/g, '')
                .replace(/^(\d{3})(\d{2})(\d{5})$/, `$1-$2-$3`);
            }

      function joinform_check() {
        var email = document.getElementById("email");
        var pwd = document.getElementById("pwd");
        var pwd2 = document.getElementById("pwd2");
        var name = document.getElementById("name");
        var space = document.getElementById("space");
        var phone = document.getElementById("phone");
        var bank = document.getElementById("bank");
        var holder = document.getElementById("holder");
        var num = document.getElementById("num");
        var reg = document.getElementById("reg");
        var file = document.getElementById("file");

        var emailCheck = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
        if (!emailCheck.test(email.value)) {
            alert("올바른 이메일 형식을 입력하세요.");
            email.focus();
            return false;
        }
        
        if ( $('.email_already').is(':visible') ) {
			alert("사용중이 아닌 이메일을 입력하세요.");
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
        
        var nameCheck = /^[가-힣]{2,}$/;
        if (!nameCheck.test(name.value)) {
            alert("대표자명은 한글 2글자 이상 입력하세요.");
            name.focus();
            return false;
            }

        if(space.value == "") {
            alert("상호명을 입력하세요.");
            space.focus();
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
        
        if(bank.value == "") {
            alert("은행명을 입력하세요.");
            bank.focus();
            return false;
        }
        
        var bankCheck = /^[가-힣]{4,}$/;
        if (!bankCheck.test(bank.value)) {
            alert("은행명을 올바르게 입력하세요.");
            bank.focus();
            return false;
            }

        if(holder.value == "") {
            alert("예금주명을 입력하세요.");
            holder.focus();
            return false;
        }
        
        var holderCheck = /^[가-힣]{2,}$/;
        if (!holderCheck.test(holder.value)) {
            alert("예금주명은 한글 2글자 이상 입력하세요.");
            holder.focus();
            return false;
            }

        var numCheck = /^[0-9]+$/;
        if (!numCheck.test(num.value)) {
            alert("계좌번호는 숫자만 입력하세요.");
            num.focus();
            return false;
        }
        
        if(reg.value == "") {
            alert("사업자 등록번호를 입력하세요.");
            reg.focus();
            return false;
        }
        
        var regCheck = /^[0-9]{3}-[0-9]{2}-[0-9]{5}/;
        if (!regCheck.test(reg.value)) {
            alert("올바른 형식의 사업자 등록번호를 입력하세요.");
            reg.focus();
            return false;
            }
        
        if(file.value == "") {
            alert("사업자 등록증 사진을 등록하세요.");
            file.focus();
            return false;
        }

        document.join_form.submit();
        
      }

      function checkEmail(){
          var emailValue = $('#email').val();
          $.ajax({
          	url : "/host/checkEmail.kh",
              data: { "hostEmail" : emailValue },
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
				url : "/hostMailCheck",
				data : {hostEmail : email},
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
          
		$(document).ready(function() {
			$("#file").on("change", handleImgFileSelect);
		})
		
			function handleImgFileSelect(e){
				var files = e.target.files;
				var reader = new FileReader();
				reader.onload = function(e){
					$("#preview").attr("src", e.target.result);
					$("#preview").css("display", "block");
				}
				reader.readAsDataURL(files[0]);

			}
      </script>
      
  <br><br><br><br><br><br>
  <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>