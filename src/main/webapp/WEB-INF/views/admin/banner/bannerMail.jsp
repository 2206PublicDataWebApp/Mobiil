<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고 문의 메일 작성</title>
<link rel="shortcut icon" href="/resources/images/mobiil.ico">

</head>
<body>
<body id="body">

<jsp:include page="../../../views/common/menubar.jsp"></jsp:include>
<body>

<section class="products section">
	<div class="container">
	<form action="/admin/bannerMailSend.kh" method="post">
		<div id = "mailSender">
			<div class="mb-3">
				  <label for="exampleFormControlInput1" class="form-label">Email address</label>
				  <input type="email" class="form-control" id="exampleFormControlInput1" name ='recipient' placeholder="name@example.com">
				</div>
			<div class="mb-3">
			  	<label for="exampleFormControlInput1" class="form-label">Subject</label>
				  <input type="text" class="form-control" id="exampleFormControlInput1" name ='subject' placeholder="subject">
			</div>
			<div class="mb-3">
			  	<label for="exampleFormControlTextarea1" class="form-label">Text</label>
			  	<textarea class="form-control" id="exampleFormControlTextarea1" name ='text' rows="3"></textarea>
			</div>
			<div class="mb-3">
				<input type='submit' value = "전송">
				<input type='reset' value='취소'>
			</div>
		</div>
	</form>
	</div>
</section>
	
</html>