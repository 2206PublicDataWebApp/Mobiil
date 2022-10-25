<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 내역</title>
</head>
<body>
<jsp:include page="../common/menubar.jsp"></jsp:include>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<table align="center" border="1" width="" class="table table-striped table-hover">
		<tr align="center">
			<th width="">예약번호</th>
			<th>결제일자</th>
			<th width="">공간명</th>
			<th width="">예약 일시</th>
			<th width="">결제금액</th>
			<th width="">리뷰</th>
		</tr>
		<c:if test="${!empty rList}">
		<c:forEach items="${rList }" var="reservation" varStatus="i">
			<tr align="center">
				<td>${i.count }</td>
				<td>${reservation.paymentDate}</td>
	<%-- 			<td><a href="/notice/detail.kh?noticeNo=${notice.noticeNo }&page=${currentPage }">${notice.noticeTitle }</a></td> --%>
				<td>${reservation.spaceTitle }</td>
				<td>${reservation.reservDate}</td>
				<td>${reservation.price}</td>
<!-- 				<td>리뷰</td> -->
				<td>
						내 리뷰 조회
				</td>
			</tr>
			</c:forEach>
		<tr align="center" height="20">
			<td colspan="6">
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
				<td colspan="6" align="center"><b>데이터가 존재하지 않습니다.</b></td>
			</tr>
		</c:if>
	</table>
  <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>