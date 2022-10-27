<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#border {
	border-bottom: 1px solid;
}

.td {
	height: 50px;
}

.tb {
	width: 70%;
	margin-left: auto;
	margin-right: auto;
	border : 1px solid;
}

.th {
	text-align: center;
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
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	<div class="signup">
		<div class="span">
            <span onclick="location.href='/member/myInfo.kh'">My 정보 수정</span> 
            <span> | </span>
            <span onclick="location.href='#'">찜한 공간 보기</span> 
            <span> | </span> 
            <span onclick="location.href='/payment/list.kh'"><b>결제 내역 보기</b></span>
            <span> | </span> 
            <span onclick="location.href='/partner/myPartnerInfo.kh?memberEmail=${loginUser.memberEmail}'">내 파트너 정보</span>
        </div>
		<br><br><br>
		<table border="0" class="tb">
			<tr>
				<th width="150" class="th" rowspan="5">예약 정보</th>
				<td width="150" class="td">공간명</td>
				<td width="300"><a href="">${reservation.spaceName}</a></td>
				<td width="100"><c:if test="${reservation.reviewStatus eq 'Y'}">
						<button type="button" onclick="location.href='/review/detail.kh?reviewNo=${reservation.reviewNo}&page=${currentPage }';" class="btn btn-info">내 리뷰 조회</button>
					</c:if> <c:if test="${reservation.reviewStatus eq 'N'}">
						<button type="button"
							onclick="location.href='/review/writeView.kh';"
							class="btn btn-info">리뷰 작성</button>
					</c:if></td>
				<td width="100">
					<button type="button" onclick="" class="btn btn-danger">예약 취소</button>
				</td>
			</tr>
			<tr>
				<!-- <td></td> -->
				<td class="td">날짜</td>
				<td>${reservation.reservationDate}</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<!-- <td></td> -->
				<td class="td">시간</td>
				<td>${reservation.revStart}~ ${reservation.revEnd}</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<!-- <td></td> -->
				<td class="td">사용료</td>
				<td>${reservation.price}</td>
				<td></td>
				<td></td>
			</tr>
			<tr id="border">
				<!-- <td></td> -->
				<td class="td">예약번호</td>
				<td>${reservation.reservationNo}</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<th class="th" rowspan="2">예약 정보</th>
				<td class="td">이름</td>
				<td>${reservation.memberName}</td>
				<td></td>
				<td></td>
			</tr>
			<tr id="border">
				<!-- <td></td> -->
				<td class="td">연락처</td>
				<td>${reservation.memberPhone}</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<th class="th" rowspan="3">결제 정보</th>
				<td class="td">결제 방법</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<!-- <td></td> -->
				<td class="td">결제 금액</td>
				<td>${reservation.price}</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<!-- <td></td> -->
				<td class="td">결제 일시</td>
				<td>${reservation.paymentDate}</td>
				<td></td>
				<td></td>
			</tr>
		</table>
<br><br><br>
		<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>