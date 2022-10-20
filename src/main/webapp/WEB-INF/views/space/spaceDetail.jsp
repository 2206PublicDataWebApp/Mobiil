<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mobiil</title>
</head>
<body>
<jsp:include page="../../views/common/menubar.jsp"></jsp:include>
<input type="button" value="호스트와 채팅하기" onclick="chatting()">
<input type="button" value="결제하기" onclick="payment()">
<jsp:include page="../../views/common/footer.jsp"></jsp:include>

<script type="text/javascript">
	function payment(){
		location.href = "/payment";
	}
	
	function chatting(){
		location.href = "";
	}
</script>
</body>
</html>