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

<div>
<h2>예약정보</h2>
공간명 : ${spaceName }
날짜 : ${sDate }
시간 : ${start }시 ~ ${end }시
사용료 : ${price }
</div>
<div>
<h2>예약자 정보</h2>
<input type="checkbox" name="checkbox" id="checkbox" value="checkbox">내 정보 불러오기
이름 : <input type="text" id="memberName" class="memberName">
연락처 : <input type="text" id="memberPhone" class="memberPhone">
</div>
<input type="radio" name="paymethod" value="card"> 신용카드
<input type="radio" name="paymethod" value="trans"> 실시간 계좌이체
<input type="radio" name="paymethod" value= "kakaopay"> 카카오페이
<input type="button" value="결제하기" onclick="requestPay();">
<jsp:include page="../../views/common/footer.jsp"></jsp:include>
<script>

$('#checkbox').click(function(){
	if($('#checkbox').is(":checked") == true){
		$('.memberName').val('${loginUser.memberName }');
		$('.memberPhone').val('${loginUser.memberPhone }');
	} else{
		$('.memberName').val('');
		$('.memberPhone').val('');
	}
});
function requestPay() {
	var paymethod = $('input:radio[name=paymethod]:checked').val();
	var IMP = window.IMP; // 생략 가능
	var memberName = $('.memberName').val();
	var memberPhone = $('.memberPhone').val();
    IMP.init("imp55727473"); // 예: imp00000000
    // IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay({ // param
        pg: "html5_inicis",
        pay_method: paymethod,
        merchant_uid: "ORD20180131-0000011",
        name: 'dd',
        amount: 100,
        buyer_email: "${loginUser.memberEmail }",
        buyer_name: memberName,
        buyer_tel: memberPhone,
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