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
		border: 1px solid black;
		border-collapse: collapse;
		text-align: center;
		width : 650px;
	}
	
	.button1 {
		height: 30px;
		width: 80px;
		background-color: #ecf3fd;
		border-radius: 20px;
		border: none;
		font-size: 15px;
	}
	
	.button2 {
		height: 30px;
		width: 80px;
		background-color: #f3f3f3;
		border-radius: 20px;
		border: none;
		font-size: 15px;
	}
	
</style>
</head>
<body>
<jsp:include page="../../views/common/menubar.jsp"></jsp:include>
<jsp:include page="../host/menuBar.jsp"></jsp:include>

		<div id="div" align="center">
		<h2>공간 리스트</h2><br>
		<hr>
				<table style="width: 1000px;">
						<tr>
							<td>공간번호</td>
							<td style="width: 2000px;">공간명</td>
							<td style="width: 800px;">지역</td>
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
							<td><button type="button" class="button1" onclick="location.href='/host/spaceModifyView.mobiil?spaceNo=${space.spaceNo}'">수정</button></td>
							<td><button type="button" class="button2" onclick="location.href='/host/spaceRemove.mobiil?spaceNo=${space.spaceNo}'">삭제</button></td>
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
		<br><br><br><br><br><br><br>
<jsp:include page="../../views/common/footer.jsp"></jsp:include>		
</body>
</html>