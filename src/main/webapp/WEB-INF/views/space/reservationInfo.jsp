<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<button onclick="cancelPay()">환불하기</button>

<script type="text/javascript">
function cancelPay() {
    jQuery.ajax({
      "url": "https://api.iamport.kr/payments/cancel",
      "type": "POST",
      "contentType": "application/json",
      "headers": {
          "Content-Type": "application/json",
          "Authorization": "Bearer a4c75e35b1c50a76d56fb088806352e083ea654e" // 아임포트 서버로부터 발급받은 엑세스 토큰
        },
      "data": JSON.stringify({
    	"imp_uid": 
        "merchant_uid": "MB21666913963525", // 예: ORD20180131-0000011
        "cancel_request_amount": 100, // 환불금액
        "reason": "테스트 결제 환불" // 환불사유
      }),
      "dataType": "json"
    });
  }
</script>
</body>
</html>