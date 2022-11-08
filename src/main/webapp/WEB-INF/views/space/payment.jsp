<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Mobbil Payment</title>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<!-- iamport -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<style type="text/css">
input[type=text]{
	border-width:1px;
}
</style>
</head>
<body>
<jsp:include page="../../views/common/menubar.jsp"></jsp:include>
<div class="container" style="text-align:center;">
<div style='margin-bottom:50px;text-align:center;display:inline-block;float:center;'>
<h2 style='margin-top:80px;margin-bottom:50px;'>예약정보</h2>
<div style='display:inline-block;float:center;text-align:center;border:1px solid #000;padding:55px;'>
<h4 style='text-align:left;margin-bottom:10px;'><b>공간명</b> : ${spaceName }</h4>
<h4 style='text-align:left;margin-bottom:10px;'><b>날짜　</b> : ${sDate }</h4>
<h4 style='text-align:left;margin-bottom:10px;'><b>시간　</b> : ${start }시 ~ ${end }시</h4>
<h4 style='text-align:left;'><b>사용료</b> : ${price }원</h4>
</div>
</div>
<hr>
<div style='margin-bottom:80px;text-align:center;display:inline-block;float:center;'>
<h2 style='margin-top:50px;margin-bottom:50px;'>예약자 정보</h2>
<div style='display:inline-block;float:center;text-align:center;'>
<input type="checkbox" name="checkbox" id="checkbox" value="checkbox" style="margin-bottom:10px;margin-left:100px;">내 정보 불러오기
<br>
이름　　 : <input type="text" id="memberName" class="memberName" style="height:24px;margin-bottom:10px;">
<br>
전화번호 : <input type="text" id="memberPhone" class="memberPhone" style="height:24px;margin-bottom:10px;">
<br><br>
<input type="radio" name="paymethod" value="card"> 신용카드
<input type="radio" name="paymethod" value="trans"> 실시간 계좌이체
<input type="radio" name="paymethod" value= "kakaopay"> 카카오페이
<br><br><br>
<input type="button" value="뒤로가기" onclick="back();" class="btn-main" style="padding-left:20px;padding-right:20px;margin-right:20px;">
<input type="button" value="결제하기" onclick="requestPay();" class="btn-main" style="padding-left:20px;padding-right:20px;">
</div>
</div>
</div>
<br><br><br><br><br><br><br><br><br>
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
	var mPhone = $('.memberPhone').val();
	console.log(mPhone);
	var price = ${price };
	var spaceNo = ${spaceNo};
	const sDate = new Date('${sDate}');
	var reservDate = sDate.toLocaleDateString();
	var date = new Date();
	var yyyy = date.getFullYear();
	var mm = date.getMonth()+1;
	var dd = date.getDate();
	var paymentDate = yyyy + "-" + mm + "-" + dd;
	console.log(typeof(paymentDate));
	var start = ${start };
	var end = ${end };
    IMP.init("imp55727473"); // 예: imp00000000
    // IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay({ // param
        pg: "html5_inicis",
        pay_method: paymethod,
        merchant_uid: "MB" + spaceNo + new Date().getTime(),
        name: '${spaceName }',
        amount: price,
        buyer_email: '',
        buyer_name: memberName,
        buyer_tel: mPhone,
        custom_data : { paymentDate:paymentDate, memberName:memberName, memberPhone:mPhone, memberEmail:"${loginUser.memberEmail }", spaceNo : spaceNo, reservDate:reservDate, revStart:start, revEnd:end}
    }, function (rsp) { // callback
        if (rsp.success) {
            $.ajax({
            	url : "/space/paymentResult.kh",
            	type : "get",
            	data : {"reservNo" : rsp.merchant_uid, "price" : rsp.paid_amount, "paymentDate" : rsp.custom_data.paymentDate,
            			"memberName" : rsp.custom_data.memberName, "memberPhone" : rsp.custom_data.memberPhone,
            			"memberEmail" : rsp.custom_data.memberEmail, "spaceNo" : rsp.custom_data.spaceNo,
            			"reservDate" : rsp.custom_data.reservDate, "revStart" : rsp.custom_data.revStart,
            			"revEnd" : rsp.custom_data.revEnd},
				success : function(data){
					location.href='/space/reservationInfo.kh?reservationNo='+data.reservationNo;
				},
				error : function(){
					alert("통신 실패");
				}
            });
        } else {
            // 결제 실패 시 로직,
        }
    });
  }
  
function back(){
	location.href='javascript:history.back()';
}
</script>
</body>
</html>