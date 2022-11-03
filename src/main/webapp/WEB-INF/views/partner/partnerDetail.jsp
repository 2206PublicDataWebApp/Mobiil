<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    
<!DOCTYPE html>
<html>
<head>
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
					<h1 class="page-name">${partner.memberNick } 파트너님!</h1>
				</div>
			</div>
		</div>
	</div>
</section>


		<section class="products section">
			<div class="container">
	
	<c:if test='${empty partner }'>
		<table align="center" class="table col-10">
			<tr>
				<td>등록된 정보가 없습니다.</td>
			</tr>
		</table>
	</c:if>
	
	<c:if test='${!empty partner }'>
		<table align="center" class="table col-10 " style=" border:none;">
			<tr  style=" border:none;">
				<td colspan = '4'  align = 'center'><h2>${partner.title }</h2> </td>
			<tr>
			<tr>
				<td colspan = '2' rowspan='3' align = 'center'><img src = "/resources/images/partner/${partner.profileRename }" width="300px"></td>
				
				<td  align='center'>작성자</td>
				<td><span>${partner.memberNick } </span></td>
			
			<tr>
				<td  align='center'>지역</td>
				<td>${partner.area }</td>
			</tr>
			<tr>
				<td  align='center'>악기</td>
				<td>${partner.instrument }</td>
			</tr>
			<tr>
				<td  colspan='4' > ${partner.contents } </td>
			</tr>
			<tr>
				<td colspan='4' align ='right' style="color:red"> 승인:  ${partner.approvalDate }</td>
			</tr>
		
			<tr>
			<td colspan='4' align='right'>
				<c:if test='${!empty loginUser.memberNick }'>
					<input type="button" class = 'btn btn-primary' onclick="openChatRoom('${loginUser.memberNick}', '${partner.memberNick }');" value='채팅하기'>
				</c:if>
				<c:if test='${!empty loginHost.memberNick }'>
					<input type="button" class = 'btn btn-primary'  onclick="openChatRoom('${loginHost.memberNick}', '${partner.memberNick }');" value='채팅하기'>
				</c:if>
				<input type="button"  class = 'btn btn btn-secondary'onclick="history.back(-1);" value='이전으로'>
			<c:if test='${loginUser.memberNick eq "관리자" }'>
				<input type="button"  class="btn btn-success" onclick="approve(${partner.partnerNo}, '${partner.approval }');" value='승인'>
				<input type="button" class="btn btn-danger" onclick="location.href='/admin/rejectMail.kh?partnerNo=${partner.partnerNo}';" value='거부'>
			</c:if>
			</td>
			</tr>
		</table>
	</c:if>
	</div>
	</section>
	
<jsp:include page="../../views/common/footer.jsp"></jsp:include>
<script type="text/javascript">

	function approve(partnerNo,approval) {
		if(approval == 'Y'){
			alert("이미 승인된 회원입니다.");
		}else{
			$.ajax({
				url:"/admin/approvePartner.kh",
				tyep: "get",
				data: {partnerNo: partnerNo},
				success:
					function(data) {
						if(data = "success"){
							alert("승인되었습니다.");
							window.location.href = '/admin/partner/list.kh'					
						}else{
							alert("실패")
						}
					},
				error:
					function() {
						alert("에러")
					},
			})
		}
	}
	
	function openChatRoom(createUser, withUser) {
		if(confirm("채팅을 시작하시겠습니까?")){
			$.ajax({
				url:"/chat/createChatRoom.kh",
				tyep: "get",
				data: {createUser: createUser,
						withUser:withUser},
				success:
					function(data) {
						if(data == "already"){
							alert("이미 생성된 채팅방입니다");
							window.open('/chat/chatWindow.kh?memberNick='+createUser+'', 'window', 'width=500, height=700, menubar=no, status=no, toolbar=no');
						}else if(data == "success"){
							alert("채팅이 시작됩니다.");
							window.open('/chat/chatWindow.kh?memberNick='+createUser+'', 'window', 'width=500, height=700, menubar=no, status=no, toolbar=no');
						}else if(data == "needRegist"){
							alert("파트너 등록이 필요합니다");
							location.href = "/member/myInfo.kh"
						}else{
							alert("실패")
						}
					},
				error:
					function() {
						alert("에러")
					},
			})
		}
	}
	
</script>

</body>
</html>