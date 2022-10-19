<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행카세 : 관리자 페이지</title>
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
				<a class="function" href="/host/hostPage.mobiil">정보 조회</a>
			</li>
			<li>
				<a class="function" href="/host/hostModifyView.mobiil">정보 수정</a>
			</li>
			<li>
				<a class="function" href="#">예약 확인</a><br><br>
			</li>
			<li>
				<a class="function" href="/host/regervationListView.mobiil">예약 리스트</a>
			</li>
			<li>
				<a class="function" href="#" onclick="">정산 확인</a><br><br>
			</li>
			<li>
				<a class="function" href="/host/spaceInsertView.mobiil">공간 업로드</a><br><br>
			</li>
			<li>
				<a class="function" href="#" onclick="">공간 리스트</a>
			</li>
		</ul>
	</div>
</body>
</html>