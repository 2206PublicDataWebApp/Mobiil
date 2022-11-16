<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="shortcut icon" href="/resources/images/mobiil.ico">

<meta charset="UTF-8">
<title>정산확인</title>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>      
<style>
	table, td, th {
	  border : 1px solid black;
	  border-collapse : collapse;
	  text-align: center;
	}
	
	#div1{
		height: 100px;
		text-align: center;
		vertical-align: middle;
		line-height: 90px;
	}
	
	#div2{
		height: 80px;
		text-align: center;
	}
	
	#div3{
		height: 80px;
		text-align: center;
	}
	
	td {
		width : 130px;
	}
	
	 .button1 {
            height: 40px;
            width: 100px;
            background-color:#c5c1c1;
            border-radius: 20px;
            border: none;
            font-size: 20px;
            margin: 1px 1px 10px 50px;
            font-size: 15px;
        }
        
        #wapper{
        	margin-right : 200px;
        }
</style>
</head>
<body>
<jsp:include page="../../views/common/menubar.jsp"></jsp:include>
<jsp:include page="../host/menuBar.jsp"></jsp:include>

	<div id="wapper" style=" margin-right: 420px;">
	<form action="/host/profitsCheck.kh" method="get">
		<div id="div1">
			<h3>총 판매 금액 : <span id="total"><fmt:formatNumber value="${priceSum }" pattern="#,###" /></span></h3>
			
		</div>

		<div id="div2">
			<span>조회기간 :</span> 
			<input type="date" name="date1" value='${date1}'> ~ <input type="date" name="date2" value='${date2}'>
			<button type="submit" class="btn btn-default" id="profitCheck">조회하기</button>
		</div>
		<div id="div3" align="center">
			<table border='1' align="center" id="table" style="width: 1000px;">
				<tr>
					<td>예약번호</td>
					<td>예약자</td>
					<td>결제날짜</td>
					<td>예약날짜</td>
					<td>체크인</td>
					<td>체크아웃</td>
					<td>이용시간</td>
					<td>금액</td>
				</tr>
				<c:forEach items="${rList }" var="reservation"> 
					<tr>
						<td>${reservation.reservationNo }</td>
						<td>${reservation.memberName }</td>
						<td>${reservation.paymentDate}</td>
						<td>${reservation.reservationDate}</td>
						<td>${reservation.revStart }</td>
						<td>${reservation.revEnd }</td>
						<td>${reservation.revEnd - reservation.revStart}</td>
						<td>${(reservation.revEnd - reservation.revStart) * reservation.price}</td>
					<tr>
				</c:forEach>
				<tr>
					<td height="30" colspan="6" align="center">
						<ul class="pagination">
							<li>
								<c:if test="${currentPage ne 1 }">
									<a href="/host/profitsCheck.kh?page=${currentPage - 1}&date1=${date1}&date2=${date2}">이전</a>
								</c:if>
							</li>
							<li>
								<c:forEach var="page" begin="${startNavi }" end="${endNavi }">
									<a href="/host/profitsCheck.kh?page=${page }&date1=${date1}&date2=${date2}">${page }</a>
								</c:forEach>
							</li>
							<li>
								<c:if test="${currentPage ne maxPage}">
									<a href="/host/profitsCheck.kh?page=${currentPage + 1 }&date1=${date1}&date2=${date2}">다음</a>
								</c:if>
							</li>
					    </ul>
					</td>
				</tr>
			</table>
		</div>
	</form>
	</div>
	
	<script>
	/* $(window).on('load', function(){
	    $('#total').each(function(){
	        var txt = $(this).text();
	        $(this).html(txt.replace(/,/g, ''));

	        var len = $(this).text().length;
	        for (i = 0; i < len; i ++){
	            $(this).eq(i).text(commaNum($(this).eq(i).text()));
	        }
	    });

	    function commaNum(num){
	        var len, point, str;
	        num = num + '';
	        point = num.length % 3
	        len = num.length;
	        str = num.substring(0, point);
	        while (point < len){
	            if (str != '') str += ',';
	            str += num.substring(point, point + 3);
	            point += 3;
	        }
	        return str;
	    }
	});
	
	 $(document).ready(function(){	// 보여지는 페이징만 합계를 구하기 때문에 사용하지 않음.
		var rowCnt = 0;
		var col6 = 7;		// 여섯번째 col index
		var col6Sum = 0;	// 여섯번째 col sum
		
		$("#table tr").each(function(){
			if(rowCnt != 0){ // 첫번째줄 건너뜀
				var sell = $(this).children("td"); // td 객체
				
				$(sell).each(function() {
					var index = $(this).index();
					var value = $(this).text();
					
					if( index == col6){
						col6Sum += parseInt(value); 
					}
				});
			}
		rowCnt++;
	});
	$("#total").text(col6Sum);
	});  */
	</script>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="../../views/common/footer.jsp"></jsp:include>	
</body>
</html>