<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ����Ʈ</title>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<style>
	#td{
		
		text-align : right;
	}
	
	
</style>


</head>


<body>
	<jsp:include page="../host/menuBar.jsp"></jsp:include>

		<div id="div" align="center">
		<h2>���� ����Ʈ</h2><br>
		<hr>
				<table>
						<tr>
							<td>No.</td>
							<td>������</td>
							<td>����</td>
							<td>�ݾ�</td>
							<td>����</td>
							<td>����</td>
						</tr>
						<c:forEach items="${sList }" var="space">
						<tr>
							<td>${space.spaceNo }</td>
							<td>${space.spaceName }</td>
							<td>${space.spaceArea }</td>
							<td>${space.spacePrice }</td>
							<td><button type="button" onclick="location.href='/host/spaceModifyView.mobiil?spaceNo=${space.spaceNo}'">����</button></td>
							<td><button type="button" onclick="location.href='/host/spaceRemove.mobiil?spaceNo=${space.spaceNo}'">����</button></td>
						</tr>
						</c:forEach>
						<tr>
							<td height="30" colspan="6" align="center">
								<ul class="pagination">
									<li>
										<c:if test="${currentPage ne 1 }">
											<a href="/host/spaceList.mobiil?page=${currentPage - 1}">����</a>
										</c:if>
									</li>
									<li>
										<c:forEach var="page" begin="${startNavi }" end="${endNavi }">
											<a href="/host/spaceList.mobiil?page=${page }">${page }</a>
										</c:forEach>
									</li>
									<li>
										<c:if test="${currentPage ne maxPage}">
											<a href="/host/spaceList.mobiil?page=${currentPage + 1 }">����</a>
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