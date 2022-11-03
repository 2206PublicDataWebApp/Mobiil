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
				<table align="center" class="table col-10 mb-3">
					<thead align='center'>
						<tr>
						<td>#</td>
						<td>배너 이미지</td>
						<td>메세지</td>
						<td>URL주소</td>
						<td>작성자</td>
						<td></td>
						</tr>
					
					</thead>
	<c:forEach items="${bList }" var="banner" >
		<c:if test="${empty banner.bannerFileName}">
			<form action="/admin/banner/register.kh" method="post" enctype="multipart/form-data" id="bannerForm">
		</c:if>
		<c:if test="${not empty banner.bannerFileName}">
			<form action="/admin/banner/updateContents.kh" method="post" enctype="multipart/form-data" id="bannerForm">
		</c:if>
					<tbody>
					<tr>
						<td > ${banner.bannerNo }</td>
						<td align='center' width = '100px'>
						<c:if test="${not empty banner.bannerFileName}">
							<img alt="본문이미지" src="/resources/images/slider/${banner.bannerRename }" width = '100px'>
							<br><input type = 'button' class='btn' value='배너이미지 변경' onclick ='changeImageWindow(${banner.bannerNo})'>
						</c:if>
						<c:if test="${empty banner.bannerFileName}">
							<img id="preview" width='150px'/>
							<br><input type="file" name="uploadFile" id="uploadFile" onchange="readURL(this);" required="required">
						</c:if>
						</td>
						<td ><input type="text" name="bannerMsg" class = "form-control"  value="${banner.bannerMsg }" required="required"> </td>
						<td ><input type="text" name="bannerLink" class = "form-control" value="${banner.bannerLink }" required="required"> </td>
						<td ><input type="text" name="writer" class = "form-control"  value = "관리자" required="required"></td>
						<c:if test="${empty banner.bannerFileName}">
							<td><input type="submit" value="저장" class="btn btn-primary" "></td>
						</c:if>
						<c:if test="${not empty banner.bannerFileName}">
							<td  ><input type="submit" value="저장" class="btn btn-primary"  ">
							<input type="button" value="삭제" class="btn btn-danger" onclick = 'removeBanner(${banner.bannerNo})'></td>
						</c:if>
					</tr>
					</tbody>
				<input type="hidden" name="bannerNo" value='${banner.bannerNo }' >
			</form>
		</c:forEach>
				</table>
		
		
			</div>		
		</div>
	</div>
</div>

<script type="text/javascript">
function changeImageWindow(bannerNo) {
	window.open('/admin/banner/imageRegister.kh?bannerNo='+bannerNo+'', 'window', 'width=500, height=600, menubar=no, status=no, toolbar=no')
}

function bSubmit() {
	if(confirm("저장하시겠습니까?")){
		return $("#bannerForm").submit();	
	}else{
		return false;
	}
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

function readURL(input) { // 파일 미리보기
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
	}


</script>


</body>
</html>