<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 리스트</title>

<style>
	#td{
		
		text-align : right;
	}
	
	
</style>


</head>


<body>
	<jsp:include page="../host/menuBar.jsp"></jsp:include>

	<div id="div" align="center">
		<h2>예약 리스트</h2>
		<br>
		<hr>
		<table>
			<tr>
				<td>No.</td>
				<td>예약자</td>
				<td>예약일자</td>
				<td>예약시간</td>
				<td>수정</td>
				<td>삭제</td>
			</tr>
			<%-- <c:forEach items="" var=""> --%>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td><button onclick="">수정</button></td>
					<td><button onclick="">삭제</button></td>
				</tr>
			<%-- </c:forEach> --%>
			<tr>
				<td height="30" colspan="6" align="center">
					<ul class="pagination">
						<li><c:if test="${currentPage ne 1 }">
								<a href="/host/registList.mobiil?page=${currentPage - 1}">이전</a>
							</c:if></li>
						<li><c:forEach var="page" begin="${startNavi }"
								end="${endNavi }">
								<a href="/host/registList.mobiil?page=${page }">${page }</a>
							</c:forEach></li>
						<li><c:if test="${currentPage ne maxPage}">
								<a href="/host/registList.mobiil?page=${currentPage + 1 }">다음</a>
							</c:if></li>
					</ul>
				</td>
			</tr>
		</table>
		<br>
		<br>
	</div>
</body>
</html>