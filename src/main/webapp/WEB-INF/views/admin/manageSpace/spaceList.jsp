<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../../../views/common/admin-top.jsp"></jsp:include>


<div class="page-wrapper">
	<div class="container">
		<div class="row">
		<jsp:include page="../../../views/common/admin-left-sidebar.jsp"></jsp:include>
			<div class="col-md-10">
				<table align="center" class="table col-10 mb-3">
					
					<tr>
						<td > 번호</td>
						<td > 공간명</td>
						<td > 승인여부</td>
						<td > 승인일 </td>
						<td > 승인 거부 메일 </td>
						
					</tr>
					<c:forEach items="${sList }" var="space" >
					<tr>
						<td > ${space.spaceNo }</td>
						<td > <a href='/space/detail.kh?spaceNo=${space.spaceNo } '>${space.spaceName }</a></td>
						<td > 
						<c:if test='${space.approval eq "N"}'><b style = "color:red"> ${space.approval}</b></c:if>
						<c:if test='${space.approval eq "Y"}'>${space.approval}</c:if>
						</td>
						<td > ${space.approvalDate }</td>
						<td > ${space.rejectMailChk }</td>
					</tr>
					</c:forEach>
					
					<tr>
				<td height="30" colspan="6" align="center">
					<ul class="pagination">
						<li>
						<c:if test="${currentPage ne 1 }">
								<a href="/admin/space/list.kh?page=${currentPage - 1}">이전</a>
							</c:if>
						</li>
						<li>
						<c:forEach var="page" begin="${startNavi }" end="${endNavi }">
								<a href="/admin/space/list.kh?page=${page }">${page }</a>
						</c:forEach>
						</li>
						<li>
						<c:if test="${currentPage ne maxPage}">
								<a href="/admin/space/list.kh?page=${currentPage + 1 }">다음</a>
						</c:if>
						</li>
					</ul>
				</td>
			</tr>
				</table>
				
	
			</div>		
		</div>
	</div>
</div>

</body>
</html>