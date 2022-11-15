<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 목록 조회</title>
 <style>
.th {
  text-align: center;
}

.paylist {
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
<div class="paylist">
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
	<table align="center" border="0" width="" class="table table-striped table-hover">
		<tr>
			<th class="th" width="100">번호</th>
			<th class="th" width="250">예약번호</th>
			<th class="th" width="150">결제일자</th>
			<th class="th" width="300">공간명</th>
			<th class="th" width="150">예약일자</th>
			<th class="th" width="150">결제금액</th>
			<th class="th" width="100">리뷰</th>
		</tr>
		<c:if test="${!empty rList}">
		<c:forEach items="${rList }" var="reservation" varStatus="i">
			<tr>
				<td>${i.count}</td>
				<td><a href="/payment/detail.kh?reservationNo=${reservation.reservationNo}&page=${currentPage }"><b>[ ${reservation.reservationNo} ]<b></a></td>
				<td>${reservation.paymentDate}</td>
				<td><a href="/space/spaceDetail.kh?spaceNo=${reservation.spaceNo}"><b>[ ${reservation.spaceName} ]<b></a></td>
				<td>${reservation.reservationDate}</td>
				<td>${reservation.price}원</td>
				<td>
					<c:if test="${reservation.reviewStatus eq 'Y'}">
						<button type="button" onclick="location.href='/review/detail.kh?reviewNo=${reservation.reviewNo}&reservationNo=${reservation.reservationNo}&page=${currentPage }';" class="btn btn-info">내 리뷰 조회</button>
					</c:if>
					<c:if test="${reservation.reviewStatus eq 'N'}">
						<button type="button" onclick="location.href='/review/writeView.kh?reservationNo=${reservation.reservationNo}&page=${currentPage }';" class="btn btn-info">리뷰 작성</button>
					</c:if>
				</td>
			</tr>
			</c:forEach>
		<tr align="center" height="20">
			<td colspan="7">
				<c:if test="${currentPage != 1 }">
					<a href="/payment/list.kh?page=${currentPage - 1 }" class="btn btn-primary"><</a>
				</c:if>
				<c:forEach var="p" begin="${startNavi }" end="${endNavi }">
					<c:if test="${currentPage eq p }">
						<b class="btn btn-primary">${p }</b>
					</c:if>
					<c:if test="${currentPage ne p }">
						<a href="/payment/list.kh?page=${p }" class="btn btn-light">${p }</a>
					</c:if>
				</c:forEach>
				<c:if test="${maxPage > currentPage }">
					<a href="/payment/list.kh?page=${currentPage + 1 }" class="btn btn-primary">></a>
				</c:if>
			</td>
		</tr>
		</c:if>
		<c:if test="${empty rList }">
			<tr>
				<td colspan="7" align="center"><h4><b>결제 내역이 존재하지 않습니다.</b></h4></td>
			</tr>
		</c:if>
	</table>
	</div>
  <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>