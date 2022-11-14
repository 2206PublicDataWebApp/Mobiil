<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 정보 수정 페이지</title>

<style>
	table {
			width: 750px;
		}
		
	#td{
		text-align : center;
	}
	
	.input {
		height: 30px;
		width: 400px;
		font-size: 15px;
		margin: 1px 80px 10px 20px;
		text-align: center;
		font-weight: bolder;
	}
	
	.button1 {
		height: 40px;
		width: 100px;
		background-color: #ecf3fd;
		border-radius: 20px;
		border: none;
		font-size: 20px;
		margin: 1px 1px 10px 50px;
		font-size: 15px;
	}
	
	.button2 {
		height: 40px;
		width: 100px;
		background-color: #f3f3f3;
		border-radius: 20px;
		border: none;
		font-size: 20px;
		margin: 1px 1px 10px 50px;
		font-size: 15px;
	}
	
	#divv{
		margin-left : 20px;
	}
	
	.time{
	    align: center;
	    width: 400px;
	    text-align: center;
	    margin-left: 20px;
	    height: 45px;
	}
</style>


</head>


<body>
<jsp:include page="../../views/common/menubar.jsp"></jsp:include>
<jsp:include page="../host/menuBar.jsp"></jsp:include>

		<div id="div" align="center" style=" margin-right: 400px;">
		<h2>예약 정보 수정 페이지</h2><br>
		<hr>
		<form action="/host/reservationModify.mobiil" method="post">
		<input type="hidden" name="reservationNo" value="${rOne.reservationNo }">
			<table>
				<tr>
					<td id="td">예약자 성함</td>
					<td>
					<input type="text" id="memberName" class="input" name="memberName" size="31" value="${rOne.memberName }">
					</td>
				</tr>
				<tr>
					<td id="td">예약자 연락처</td>
					<td>
					<input type="text" id="memberPhone" class="input" name="memberPhone" size="31" value="${rOne.memberPhone }">
					</td>
				</tr>
				<tr>
					<td id="td">예약일자</td>
					<td>
					<input type="text" id="reservationDate" class="input" name="reservationDateStr" size="31" value="${rOne.reservationDate }" readonly>
					</td>
				</tr>
				<tr>
					<td id="td">체크인</td>
					<td>
					<%-- <input type="text" id="revStart" class="input" name="revStart" size="31" value="${rOne.revStart }"> --%>
					<select id="revStart" name="revStart" class="time" onchange="check2();">
						<option value="${rOne.revStart }">${rOne.revStart }</option>
						<option value="9">9시</option>
						<option value="10">10시</option>
						<option value="11">11시</option>
						<option value="12">12시</option>
						<option value="13">13시</option>
						<option value="14">14시</option>
						<option value="15">15시</option>
						<option value="16">16시</option>
						<option value="17">17시</option>
						<option value="18">18시</option>
						<option value="19">19시</option>
						<option value="20">20시</option>
						<option value="21">21시</option>
						<option value="22">22시</option>
						<option value="23">23시</option>
					</select>
					</td>
				</tr>
				<br>
				<tr>
					<td id="td">체크아웃</td>
					<td>
					<%-- <input type="text" id="revEnd" class="input" name="revEnd" size="31" value="${rOne.revEnd }"> --%>
					<select id="revEnd" name="revEnd" class="time" onchange="check();">
						<option value="${rOne.revEnd }">${rOne.revEnd }</option>
						<option value="9">9시</option>
						<option value="10">10시</option>
						<option value="11">11시</option>
						<option value="12">12시</option>
						<option value="13">13시</option>
						<option value="14">14시</option>
						<option value="15">15시</option>
						<option value="16">16시</option>
						<option value="17">17시</option>
						<option value="18">18시</option>
						<option value="19">19시</option>
						<option value="20">20시</option>
						<option value="21">21시</option>
						<option value="22">22시</option>
						<option value="23">23시</option>
					</select>
					</td>
				</tr>
				<tr>
					<td id="td">변경 전 금액</td>
					<td>
					<input type="text" id="price" class="input" name="price" size="31" value="${rOne.price }"><span id="hour"></span>
					</td>
				</tr>
				<tr>
					<td id="td">변경 후 금액</td>
					<td>
					<input type="text" id="price2" class="input" name="price2" size="31" value="">
					<div id="divv"></div>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<br><br>
						<input class="button1" type="submit" value="수정하기">
						<input class="button2" type="reset"  value="취소" onclick="location.href='/host/registList.mobiil'">
					</td>
				</tr>
			</table>
		</form>
		</div>
	<script>
	// 시간당 금액
	var price = ${rOne.price } / (${rOne.revEnd } - ${rOne.revStart });
	$("#hour").text("시간당 금액 : " + Math.floor(price)+"원");
	document.getElementById('hour').style.color="red";
	
	// 시간 체크
	function check() {
		var start = $("#revStart option:selected").val();
		var end	= $("#revEnd option:selected").val();
		var result = (end - start) * price;
		if(Number(start) >= Number(end)){
			alert("시간 설정이 잘못되었습니다.");
			$('#revStart option:eq(0)').prop('selected', true);
			$('#revEnd option:eq(0)').prop('selected', true);
		}
		if(Number(start) < Number(end)){
			$('input[name=price2]').attr('value',result);
			divv.innerHTML="차액 금액은 현장에서 환불 및 결제 됩니다.";
			document.getElementById('divv').style.color="red";
		}
	}
	
	// 시간 체크
	function check2() {
		var start = $("#revStart option:selected").val();
		var end	= $("#revEnd option:selected").val();
		var result = (end - start) * price;
		if(Number(start) >= Number(end)){
			alert("시간 설정이 잘못되었습니다.");
			$('#revStart option:eq(0)').prop('selected', true);
			$('#revEnd option:eq(0)').prop('selected', true);
		}
	}
	
	
	$("#revStart").blur(function() {
		var revStart = document.getElementById("revStart");
		var reg = /^[0-9]{1,2}$/
		if(!reg.test(revStart.value)){
			alert("시간 입력이 잘못되었습니다. 1~24의 숫자를 최소 1글자 이상 2글자까지 입력 가능합니다." );
			revStart.value = "";
			return false;
		}
	});
	
	$("#revEnd").blur(function() {
		var revEnd = document.getElementById("revEnd");
		var reg = /^[0-9]{1,2}$/
		if(!reg.test(revEnd.value)){
			alert("시간 입력이 잘못되었습니다. 1~24의 숫자를 최소 1글자 이상 2글자까지 입력 가능합니다." );
			revEnd.value = "";
			return false;
		}
	});
	
	$("#price2").change(function() {
		divv.innerHTML="차액 금액은 현장에서 환불 및 결제 됩니다.";
		document.getElementById('divv').style.color="red";
	});
	</script>
<jsp:include page="../../views/common/footer.jsp"></jsp:include>		
</body>
</html>