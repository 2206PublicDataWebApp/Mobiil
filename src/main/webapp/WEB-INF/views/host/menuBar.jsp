<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모빌</title>
	<style>
		body{
			font-family: 'Noto Sans KR', sans-serif;
		}
		ul{
			padding:0;
			list-style : none;
		}
		a{
			text-decoration : none;
		}
		.function{
			text-align: center;
		}
		li{
			text-align:center;
		}
		
		#side{
			float : left;
			width : 20%;
			border-right : 1px solid black;
			padding-left : 20px;
			font-size: 20px;
		}
	</style>
</head>
<body>

	<div id="side">
		<br>
		<ul>
			<li>
				<h3>호스트 페이지</h3>
			</li>
			<li>
				<a class="function" href="/host/hostInfo.mobiil">정보 조회</a>
			</li>
			<li>
				<a class="function" href="/host/hostModifyView.mobiil">정보 수정</a>
			</li>
			<li>
				<a class="function" href="/host/reservationCheck.mobiil?monthValue=${monthValue}">예약 확인</a><br><br>
			</li>
			<li>
				<a class="function" href="/host/registList.mobiil">예약 리스트</a>
			</li>
			<li>
				<a class="function" href="javascript:void(0)" onclick="getProfitsCheck();">정산 확인</a><br><br>
			</li>
			<li>
				<a class="function" href="/host/spaceInsertView.mobiil">공간 업로드</a><br><br>
			</li>
			<li>
				<a class="function" href="/host/spaceList.mobiil">공간 리스트</a>
			</li>
		</ul>
	</div>
	<script>
		function getProfitsCheck() {
			var today = new Date();
			var year = today.getFullYear();    // 년도
			var month = today.getMonth() + 1;  // 월
			var date = today.getDate(); 	   // 일자
			var day = today.getDay(); 		   // 요일
			// 오눌날짜
			var date1 = year + "-" + month + "-" + date;	
			
			var nowDate = new Date();	
			var weekDate = nowDate.getTime() - (7 * 24 * 60 * 60 * 1000);	// 일주일전 시간
			nowDate.setTime(weekDate);	// nowDate에 주입
			var weekYear = nowDate.getFullYear();	// 년도
			var weekMonth = nowDate.getMonth() +1;	// 월
			var weekDay = nowDate.getDate();		// 일자
			// 일주일전 날짜
			var date2 = weekYear + "-" + weekMonth + "-" + weekDay;
			
			location.href = "/host/profitsCheck.kh?date1="+date1+"&date2="+date2;
		}
	</script>
</body>
</html>