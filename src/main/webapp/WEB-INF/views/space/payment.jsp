<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<!-- iamport -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

</head>
<body>
<jsp:include page="../../views/common/menubar.jsp"></jsp:include>

<input type="radio" name="paymethod" value="card"> 신용카드
<input type="radio" name="paymethod" value="trans"> 실시간 계좌이체
<input type="radio" name="paymethod" value= "kakaopay"> 카카오페이
<input type="button" value="결제하기" onclick="requestPay();">
<jsp:include page="../../views/common/footer.jsp"></jsp:include>
<script>
  
function requestPay() {
	var paymethod = $('input:radio[name=paymethod]:checked').val();
	var IMP = window.IMP; // 생략 가능
    IMP.init("imp55727473"); // 예: imp00000000
    // IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay({ // param
        pg: "html5_inicis",
        pay_method: paymethod,
        merchant_uid: "ORD20180131-0000011",
        name: sDate,
        amount: 100,
        buyer_email: "gildong@gmail.com",
        buyer_name: "홍길동",
        buyer_tel: sDate,
        buyer_addr: "서울특별시 강남구 신사동",
        buyer_postcode: "01181"
    }, function (rsp) { // callback
        if (rsp.success) {
            // 결제 성공 시 로직,
        } else {
            // 결제 실패 시 로직,
        }
    });
  }
</script>
</body>
</html>