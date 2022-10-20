<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파트너 디테일</title>
</head>
<body>
	<body id="body">

	<jsp:include page="../../views/common/menubar.jsp"></jsp:include>
	<body>
<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">내 파트너 정보</h1>
				</div>
			</div>
		</div>
	</div>
</section>


		<section class="products section">
			<div class="container">
	
	<c:if test='${empty myPartnerInfo }'>
		<table align="center" class="table col-10">
			<tr>
				<td>등록된 정보가 없습니다.</td>
			</tr>
			<tr>
				<td><button type='button' onclick="location.href='/partner/registerView.kh'">등록하기</button></td>
			</tr>
		</table>
	</c:if>
	<c:if test='${!empty myPartnerInfo }'>
		<table align="center" class="table col-10">
			<tr>
				<td  class="col-2" scope="col" align='center'>썸네일</td>
				<td><img src = "/resources/images/partner/${myPartnerInfo.profileRename }" width="300px"></td>
				
			</tr>
			<tr>
				<td  class="col-2" scope="col" align='center'>제목</td>
				<td>${myPartnerInfo.title } </td>
			<tr>
				<td class="col-2" scope="col" align='center'>작성자</td>
				<td>${myPartnerInfo.memberNick }</td>
			</tr>
			<tr>
				<td  class="col-2" scope="col" align='center'>지역</td>
				<td>${myPartnerInfo.area }</td>
			</tr>
			<tr>
				<td  class="col-2" scope="col" align='center'>악기</td>
				<td>${myPartnerInfo.instrument }</td>
			</tr>
			<tr>
				<td  class="col-2" scope="col" align='center' >내용</td>
				<td> ${myPartnerInfo.instrument } </td>
			</tr>
			<tr>
			<td colspan='2' align='right'>
				<input type="button" value="수정하기" class='btn btn-dark' onclick="location.href=''">
			</td>
			</tr>
		</table>
	</c:if>
	</div>
	</section>
	
<jsp:include page="../../views/common/footer.jsp"></jsp:include>

</body>
</html>