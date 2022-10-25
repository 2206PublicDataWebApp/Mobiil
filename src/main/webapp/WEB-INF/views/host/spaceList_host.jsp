<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공간 리스트</title>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<style>
	
	table, td, th {
	  border : 1px solid black;
	  border-collapse : collapse;
	  text-align: center;
	};
	
</style>
</head>
<body>
	<jsp:include page="../host/menuBar.jsp"></jsp:include>

		<div id="div" align="center">
		<h2>공간 리스트</h2><br>
		<hr>
				<table>
						<tr>
							<td>공간번호</td>
							<td>공간명</td>
							<td>지역</td>
							<td>금액</td>
							<td>수정</td>
							<td>삭제</td>
						</tr>
						<c:forEach items="${sList }" var="space">
						<tr>
							<td>${space.spaceNo }</td>
							<td>${space.spaceName }</td>
							<td>${space.spaceArea }</td>
							<td>${space.spacePrice }</td>
							<td><button type="button" onclick="location.href='/host/spaceModifyView.mobiil?spaceNo=${space.spaceNo}'">수정</button></td>
							<td><button type="button" onclick="location.href='/host/spaceRemove.mobiil?spaceNo=${space.spaceNo}'">삭제</button></td>
						</tr>
						</c:forEach>
						<tr>
							<td height="30" colspan="6" align="center">
								<ul class="pagination">
									<li>
										<c:if test="${currentPage ne 1 }">
											<a href="/host/spaceList.mobiil?page=${currentPage - 1}">이전</a>
										</c:if>
									</li>
									<li>
										<c:forEach var="page" begin="${startNavi }" end="${endNavi }">
											<a href="/host/spaceList.mobiil?page=${page }">${page }</a>
										</c:forEach>
									</li>
									<li>
										<c:if test="${currentPage ne maxPage}">
											<a href="/host/spaceList.mobiil?page=${currentPage + 1 }">다음</a>
										</c:if>
									</li>
							    </ul>
							</td>
						</tr>
				</table>
				<br><br>
		</div>
</body>
</html>