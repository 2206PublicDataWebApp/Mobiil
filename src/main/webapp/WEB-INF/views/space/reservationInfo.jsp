<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Mobiil ReservationInfo</title>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<!-- iamport -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<title>Mobiil</title>
</head>
<body>
<jsp:include page="../../views/common/menubar.jsp"></jsp:include>
<div class="container" style="text-align:center;">
<div style='margin-bottom:50px;text-align:center;display:inline-block;float:center;'>
<h1 style='margin-top:80px;margin-bottom:50px;'>결제 및 예약이 완료되었습니다.</h1>
<hr>
<h2 style='margin-top:50px;margin-bottom:50px;'>예약 정보</h2>
<div style='display:inline-block;float:center;text-align:center;border:1px solid #000;padding:55px;'>
<h4 style='text-align:left;margin-bottom:15px;'><b>공간명</b> : ${rsv.spaceName }</h4>
<h4 style='text-align:left;margin-bottom:15px;'><b>날짜</b> : ${rsv.reservationDate }</h4>
<h4 style='text-align:left;margin-bottom:15px;'><b>시간</b> : ${rsv.revStart }시 ~ ${rsv.revEnd }시</h4>
<h4 style='text-align:left;margin-bottom:15px;'><b>이용료</b> : ${rsv.price }원</h4>
<h4 style='text-align:left;margin-bottom:15px;'><b>예약자 이름</b> : ${rsv.memberName }</h4>
<h4 style='text-align:left;margin-bottom:45px;'><b>예약자 전화번호</b> : ${rsv.memberPhone }</h4>
<input type="button" onclick="history();" value="결제내역 확인" class="btn-main" style="padding-left:20px;padding-right:20px;margin-right:20px;">
<input type="button" onclick="main();" value="메인으로 가기" class="btn-main" style="padding-left:20px;padding-right:20px;">
</div>
</div>
</div>
<br><br><br><br><br><br><br><br>
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