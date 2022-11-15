<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 상세 조회</title>
<style>
#border {
	border-bottom: 1px solid;
}

.td {
	height: 50px;
    background-color: rgb(237, 228, 245);
}

.tb {
	width: 70%;
	margin-left: auto;
	margin-right: auto;
	border : 1px solid;
}

.th {
	text-align: center;
	background-color: rgb(228, 213, 242);
}

.signup {
	text-align: center;
	margin-top: 50px;
}

.span {
	text-align: center;
	font-size: 15px;
	cursor: pointer;
}

.data {
	background-color: rgb(242, 237, 245);
}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	<div class="signup">
		<div class="span">
		<c:if test="${loginUser.kakaoStatus eq 'N' }">
			<span onclick="location.href='/member/myInfo.kh'">My 정보 수정</span>
		</c:if>
		<c:if test="${loginUser.kakaoStatus eq 'Y' }">
			<span onclick="location.href='/member/myKakaoInfo.kh'">My 정보 수정</span>
		</c:if>	            
			<span> | </span>
            <span onclick="location.href='/member/mySpaceList.kh'">찜한 공간 보기</span> 
            <span> | </span> 
            <span onclick="location.href='/payment/list.kh'"><b>결제 내역 보기</b></span>
            <span> | </span> 
            <span onclick="location.href='/partner/myPartnerInfo.kh?memberEmail=${loginUser.memberEmail}'">내 파트너 정보</span>
        </div>
		<br><br><br>
		<table border="0" class="tb">
			<tr>
				<th width="80" class="th" rowspan="5">예약 정보</th>
				<td width="80" class="td">공간명</td>
				<td width="200" class="data"><a href="/space/spaceDetail.kh?spaceNo=${reservation.spaceNo}"><b>[ ${reservation.spaceName} ]</b></a></td>
			</tr>
			<tr>
				<td class="td">날짜</td>
				<td class="data">${reservation.reservationDate}</td>
			</tr>
			<tr>
				<td class="td">시간</td>
				<td class="data">${reservation.revStart}시 ~ ${reservation.revEnd}시</td>
			</tr>
			<tr>
				<td class="td">사용료</td>
				<td class="data">${reservation.price}원</td>
			</tr>
			<tr id="border">
				<td class="td">예약번호</td>
				<td class="data">${reservation.reservationNo}</td>
			</tr>
			<tr>
				<th class="th" rowspan="2">예약 정보</th>
				<td class="td">이름</td>
				<td class="data">${reservation.memberName}</td>
			</tr>
			<tr id="border">
				<td class="td">연락처</td>
				<td class="data">${reservation.memberPhone}</td>
			</tr>
			<tr>
				<th class="th" rowspan="2">결제 정보</th>
				<td class="td">결제 금액</td>
				<td class="data">${reservation.price}원</td>
			</tr>
			<tr>
				<td class="td">결제일</td>
				<td class="data">${reservation.paymentDate}</td>
			</tr>
		</table>
		<br>
		<span><b>* 예약 취소는 호스트에게 문의해주세요. *</b></span>
		</div>
<br><br><br>
		<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>