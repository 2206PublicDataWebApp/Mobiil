<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배너 등록</title>
</head>
<body>

<jsp:include page="../../../views/common/admin-top.jsp"></jsp:include>

<div class="page-wrapper">
	<div class="container">
		<div class="row">
		<jsp:include page="../../../views/common/admin-left-sidebar.jsp"></jsp:include>
			<div class="col-md-10">
			<h1 align="center">배너 관리</h1>
		
		
	<c:forEach items="${bList }" var="banner" >
			<form action="/admin/banner/register.kh" method="post" enctype="multipart/form-data">
				<table align="center" class="table col-10 mb-3">
					<tr>
						<td width='5%'> ${banner.bannerNo }</td>
						<td width='30%'>
						<c:if test="${not empty banner.bannerFileName}">
							<img alt="본문이미지" src="/resources/images/slider/${banner.bannerRename }" width = '50%'>
						</c:if>
						<c:if test="${empty banner.bannerFileName}">
							<br>저장된 배너가 없습니다.
						</c:if>
						</td>
						<td width='20%'><input type="file" name="uploadFile"  
						src="/resources/images/slider/${banner.bannerRename }"></td>
						<td width='30%'><input type="text" name="bannerMsg" value="${banner.bannerMsg }"> </td>
						<td width='5%'><input type="submit" value="저장" class="btn btn-primary"></td>
						<td width='5%' ><input type="reset" value="취소" class="btn btn-danger"></td>
					</tr>
				</table>
				<input type="hidden" name="bannerNo" value='${banner.bannerNo }' >
			</form>
		</c:forEach>
		
		
			</div>		
		</div>
	</div>
</div>

</body>
</html>