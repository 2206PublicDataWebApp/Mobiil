<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>승인 거절 메일 작성</title>
</head>
<body>
<body id="body">

<jsp:include page="../../../views/common/menubar.jsp"></jsp:include>
<body>

<section class="products section">
	<div class="container">
		<div id = "mailSender">
			<div class="mb-3">
				  <label for="exampleFormControlInput1" class="form-label">Email address</label>
				  <input type="email" class="form-control" id="recipient" name ='recipient' value="${rejectedPartner.hostEmail }" readonly>
				</div>
			<div class="mb-3">
			  	<label for="exampleFormControlInput1" class="form-label">Subject</label>
				  <input type="text" class="form-control" id="subject" name ='subject' value="[공간 승인 거절]">
			</div>
			<div class="mb-3">
			  	<label for="exampleFormControlTextarea1" class="form-label">Text</label>
			  	<textarea class="form-control" id="mailtext" name ='mailtext' rows="3" >승인 거절 사유:</textarea>
			</div>
			<div class="mb-3">
				<input type='hidden' id="partnerNo" value='${rejectedPartner.spaceNo }'>
				<input type='button' id="sendMail" onclick = "sendRejectMail();"value = "전송">
				<input type='reset' value='취소'>
			</div>
		</div>
	</form>
	</div>
</section>
<script type="text/javascript">

	function sendRejectMail() {
		var partnerNo = $("#spaceNo").val();
		var recipient = $("#recipient").val();
		var subject = $("#subject").val();
		var text = $("#mailtext").val();
		if(confirm("전송하시겠습니까?")){
			$.ajax({
				url: "/host/spaceRejectMail.kh",
				type:"POST",
				data:{spaceNo: spaceNo,
					recipient: recipient,
					subject:subject,
					text:text
				},
				success: function(data) {
					if(data = 2) {
						alert("발송에 성공했습니다.");
						window.location.href = '/admin/space/list.kh';					
					}else{
						alert("발송 실패")
					}
					
				},
				error: function() {
					alert("서버 오류")
				},
			})
		}
	}
	

</script>

	</body>
</html>