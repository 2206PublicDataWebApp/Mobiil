<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ����Ʈ</title>

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
							<td>��������</td>
							<td>����ð�</td>
							<td>����</td>
							<td>����</td>
						</tr>
					<c:forEach items="" var="">
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td><button onclick="location='/host/checkedRegister?registeNo='">����</button></td>
							<td><button>����</button></td>
						</tr>
					</c:forEach>
						<tr>
							<td height="30" colspan="6" align="center">
								<ul class="pagination">
									<li>
										<c:if test="${currentPage ne 1 }">
											<a href="/host/registList.mobiil?page=${currentPage - 1}">����</a>
										</c:if>
									</li>
									<li>
										<c:forEach var="page" begin="${startNavi }" end="${endNavi }">
											<a href="/host/registList.mobiil?page=${page }">${page }</a>
										</c:forEach>
									</li>
									<li>
										<c:if test="${currentPage ne maxPage}">
											<a href="/host/registList.mobiil?page=${currentPage + 1 }">����</a>
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