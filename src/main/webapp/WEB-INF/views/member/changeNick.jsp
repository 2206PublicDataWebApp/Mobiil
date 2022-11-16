<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="/resources/images/mobiil.ico">

<meta charset="UTF-8">
<title>닉네임 변경</title>
<style>
.nick {
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
	background-color: rgb(212, 191, 232);
	border-radius: 20px;
	border: none;
	font-size: 20px;
	margin: 1px 1px 10px 50px;
}

.remove {
	font-size: 15px;
	margin-left: 350px;
	cursor: pointer;
}

.span {
	text-align: center;
	font-size: 15px;
	cursor: pointer;
}

.nick label {
	font-weight: bold;
	display: inline-block;
	width: 120px;
	text-align: right;
}

.nick label:before {
	color: rgb(238, 51, 34);
	content: '* ';
}

.nick_ok {
	color: #008000;
	display: none;
}

.nick_already {
	color: #6A82FB;
	display: none;
}

#originNick {
	background-color : gray;
}
</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"></jsp:include>

	<div class="nick">
		<h1>닉네임 수정</h1><br>
		<h5>닉네임 수정 후 사이트 이용이 가능합니다.</h5>
		<h6>(현재 닉네임이 사용중인 닉네임이 아닌 경우 똑같이 변경 가능)</h6>
		<br>
		<form name="nick_form" action="/member/changeNick.kh" method="post">
			<input type="hidden" name="mStatus" value="${member.mStatus }">
			<input type="hidden" name="memberEmail" value="${member.memberEmail }">
			<label>현재 닉네임</label><input type="text" class="input" id="originNick" value="${member.memberNick}" readonly> <br>
			<label>변경할 닉네임</label><input type="text" class="input" id="nick" name="memberNick" placeholder="특수문자 제외, 2자~8자" oninput="checkNick()"> <br>
			<span class="nick_ok">사용 가능한 닉네임이에요 :)</span> 
			<span class="nick_already">이미 사용중인 닉네임이에요 :(</span> <br>
			<div>
				<button type="button" class="button" onclick="nickform_check();">수정하기</button>
			</div>
			<br><br><br>
		</form>
	</div>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script>
		function nickform_check() {
			var nick = document.getElementById("nick");

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
			
			document.nick_form.submit();
		}

		function checkNick() {
			var nickValue = $('#nick').val();

			$.ajax({
				url : "/member/checkNick.kh",
				data : {
					"memberNick" : nickValue
				},
				type : "get",
				success : function(result) {
					if (result == 0) {
						$('.nick_ok').css("display", "inline-block");
						$('.nick_already').css("display", "none");
					} else {
						$('.nick_already').css("display", "inline-block");
						$('.nick_ok').css("display", "none");
					}
				},
				error : function() {
					alert("에러입니다");
				}
			});
		};
		
	</script>
	  <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>