<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<!-- iamport -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<title>Mobiil</title>
</head>
<body>
<jsp:include page="../../views/common/menubar.jsp"></jsp:include>

<h1>예약이 완료되었습니다.</h1>

<h2>예약 정보</h2>
<div>
${rsv.spaceName }
이용료 : ${rsv.price } 원
날짜 : ${rsv.reservationDate }
시간 : ${rsv.revStart }시 ~ ${rsv.revEnd }시
사용료 : ${rsv.memberName }
예약자 이름 : ${rsv.memberName }
예약자 전화번호 : ${rsv.memberPhone }
</div>
<input type="button" onclick="history();" value="결제내역 확인">
<input type="button" onclick="main();" value="메인으로 가기">

<jsp:include page="../../views/common/footer.jsp"></jsp:include>
<script type="text/javascript">
function history(){
	location.href="/payment/list.kh";
}
function main(){
	location.href="/";
}
</script>
</body>
</html>