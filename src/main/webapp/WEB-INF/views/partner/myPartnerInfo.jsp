<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="/resources/images/mobiil.ico">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Mobiil Partner</title>
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
				<td><h2>등록된 정보가 없습니다.</h2></td>
			</tr>
			<tr>
				<td align = 'right'><button type='button' class = 'btn btn-primary' onclick="location.href='/partner/registerView.kh'">등록하기</button></td>
			</tr>
		</table>
	</c:if>
	
	<c:if test='${!empty myPartnerInfo }'>
		<table align="center" class="table col-10">
			<tr  style=" border:none;">
				<td colspan = '4'  align = 'center'><h2>${myPartnerInfo.title }</h2> </td>
			<tr>
			<tr>
				<td colspan = '2' rowspan='3' align = 'center'><img src = "/resources/images/partner/${myPartnerInfo.profileRename }" width="300px"></td>
				
				<td  align='center'>작성자</td>
				<td><span>${myPartnerInfo.memberNick } </span></td>
			
			<tr>
				<td  align='center'>지역</td>
				<td>${myPartnerInfo.area }</td>
			</tr>
			<tr>
				<td  align='center'>악기</td>
				<td>${myPartnerInfo.instrument }</td>
			</tr>
			<tr>
				<td  colspan='4' > ${myPartnerInfo.contents } </td>
			</tr>
			<tr>
				<td colspan='4' align ='right' style="color:red"> 승인:  ${myPartnerInfo.approvalDate }</td>
			</tr>
		
			<tr>
			<td colspan='4' align='right'>
				<input type="button" value="수정하기" class='btn btn-dark' onclick="location.href='/partner/modify.kh?partnerNo=${myPartnerInfo.partnerNo}'">
				<input type="button" value="삭제하기" class='btn btn-dark' onclick='deletePartner(${myPartnerInfo.partnerNo});'">
				
			</td>
			</tr>
		</table>
	</c:if>
	</div>
	</section>
	
<jsp:include page="../../views/common/footer.jsp"></jsp:include>

<script type="text/javascript">
	function deletePartner(partnerNo) {
		if(confirm("삭제한 정보는 복구가 불가능합니다. 정말 삭제하시겠습니까?")){
			$.ajax({
				url:"/partner/deletePartner.kh",
				data:{partnerNo:partnerNo},
				type:"get",
				success: function(data) {
					if(data = "success"){
						alert("삭제되었습니다.")
						alert("마이페이지로 이동합니다.")
						window.location.href = "/member/myInfo.kh"				
					}else{
						alert("삭제에 실패하였습니다.")
					}
				},
				error: function() {
					alert("통신 오류")
				}
			})
		}else{
			return false;
		}
	}
</script>

</body>
</html>