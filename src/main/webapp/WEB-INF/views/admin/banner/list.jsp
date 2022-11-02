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
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>


<jsp:include page="../../../views/common/admin-top.jsp"></jsp:include>

<div class="page-wrapper">
	<div class="container">
		<div class="row">
		<jsp:include page="../../../views/common/admin-left-sidebar.jsp"></jsp:include>
			<div class="col-md-10">
			<h1 align="center">배너 관리</h1>
		
		
	<c:forEach items="${bList }" var="banner" >
		<c:if test="${empty banner.bannerFileName}">
			<form action="/admin/banner/register.kh" method="post" enctype="multipart/form-data">
		</c:if>
		<c:if test="${not empty banner.bannerFileName}">
			<form action="/admin/banner/updateContents.kh" method="post" enctype="multipart/form-data">
		</c:if>
				<table align="center" class="table col-10 mb-3">
					<tr>
						<td width='5%'> ${banner.bannerNo }</td>
						<td width='30%'>
						<c:if test="${not empty banner.bannerFileName}">
							<img alt="본문이미지" src="/resources/images/slider/${banner.bannerRename }" width = '50%'>
							<br><input type = 'button' value='배너이미지 변경' onclick ='changeImageWindow(${banner.bannerNo})'>
						</c:if>
						<c:if test="${empty banner.bannerFileName}">
							<br>저장된 배너가 없습니다.
							<br><input type="file" name="uploadFile" src="/resources/images/slider/${banner.bannerRename }">
						</c:if>
						</td>
						<td width='30%'><input type="text" name="bannerMsg" value="${banner.bannerMsg }"> </td>
						<td width='30%'><input type="text" name="bannerLink" value="${banner.bannerLink }"> </td>
						<c:if test="${empty banner.bannerFileName}">
						<td width='5%'><input type="submit" value="저장" class="btn btn-primary"></td>
						</c:if>
						<c:if test="${not empty banner.bannerFileName}">
							<td width='5%' ><input type="submit" value="저장" class="btn btn-primary" ></td>
							<td width='5%'><input type="button" value="삭제" class="btn btn-danger" onclick = 'removeBanner(${banner.bannerNo})'></td>
						</c:if>
					</tr>
				</table>
				<input type="hidden" name="bannerNo" value='${banner.bannerNo }' >
			</form>
		</c:forEach>
		
		
			</div>		
		</div>
	</div>
</div>

<script type="text/javascript">
function changeImageWindow(bannerNo) {
	window.open('/admin/banner/imageRegister.kh?bannerNo='+bannerNo+'', 'window', 'width=500, height=700, menubar=no, status=no, toolbar=no')
}

function removeBanner(bannerNo) {
	if(confirm("정말 삭제하시겠습니까? 삭제 후에는 복구가 불가능합니다.")){
		$.ajax({
			url:"/admin/banner/remove.kh",
			data: {bannerNo: bannerNo},
			type: "get",
			success: function(data) {
				if(data != "success"){
					console.log("error")
				}else{
					location.reload();
				}
			},
			error: function() {
				console.log("서버통신 실패")
			}
		})
	}
}

</script>


</body>
</html>