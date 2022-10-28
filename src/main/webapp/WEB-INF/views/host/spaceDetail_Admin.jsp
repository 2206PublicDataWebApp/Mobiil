<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    
<!DOCTYPE html>
<html>
<head>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
					<h1 class="page-name">${space.spaceName }의 정보</h1>
				</div>
			</div>
		</div>
	</div>
</section>


		<section class="products section">
			<div class="container">
	
	<c:if test='${empty space }'>
		<table align="center" class="table col-10">
			<tr>
				<td>등록된 정보가 없습니다.</td>
			</tr>
		</table>
	</c:if>
	
	<c:if test='${!empty space }'>
		<table align="center" class="table col-10">
			<%-- <tr>
				<td  class="col-2" scope="col" align='center'>썸네일</td>
				<td><img src = "/resources/images/partner/${space.profileRename }" width="300px"></td>
				
			</tr> --%>
			<tr>
				<td  class="col-2" scope="col" align='center'>제목</td>
				<td>${space.spaceName } </td>
			<tr>
				<td class="col-2" scope="col" align='center'>작성자</td>
				<td>${space.hostEmail }</td>
			</tr>
			<tr>
				<td  class="col-2" scope="col" align='center'>지역</td>
				<td>${space.spaceArea }</td>
			</tr>
			<tr>
				<td  class="col-2" scope="col" align='center'>금액</td>
				<td>${space.spacePrice }</td>
			</tr>
			<tr>
				<td  class="col-2" scope="col" align='center' >내용</td>
				<td> ${space.spaceComent } </td>
			</tr>
			<tr>
				<td  class="col-2" scope="col" align='center' >승인일</td>
				<td> ${space.approvalDate } </td>
			</tr>
			<tr>
			<td colspan='2' align='right'>
				<input type="button" onclick="history.back(-1);" value='이전으로'>
			<c:if test='${loginUser.memberNick eq "관리자" }'>
				<input type="button" onclick="approve(${space.spaceNo}, '${space.approval }');" value='승인'>
				<input type="button" onclick="location.href='/host/rejectMail.kh?spaceNo=${space.spaceNo}';" value='거부'>
			</c:if>
			</td>
			</tr>
		</table>
	</c:if>
	</div>
	</section>
	
<jsp:include page="../../views/common/footer.jsp"></jsp:include>
<script type="text/javascript">

	function approve(spaceNo,approval) {
		if(approval == 'Y'){
			alert("이미 승인된 회원입니다.");
		}else{
			$.ajax({
				url:"/host/approveSpace.kh",
				tyep: "get",
				data: {spaceNo: spaceNo},
				success:
					function(data) {
						if(data = "success"){
							alert("승인되었습니다.");
							window.location.href = '/admin/space/list.kh'					
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
		$.ajax({
			url:"/chat/createChatRoom.kh",
			tyep: "get",
			data: {createUser: createUser,
					withUser:withUser},
			success:
				function(data) {
				console.log(data);
					if(data == "already"){
						alert("이미 생성된 채팅방입니다");
						window.open('/chat/chatWindow.kh?memberNick='+createUser+'', 'window', 'width=800, height=700, menubar=no, status=no, toolbar=no');
					}else if(data == "success"){
						alert("채팅이 시작됩니다.");
						window.open('/chat/chatWindow.kh?memberNick='+createUser+'', 'window', 'width=800, height=700, menubar=no, status=no, toolbar=no');
					}else{
						alert("생성에 실패했습니다.");
					}
				},
			error:
				function() {
					alert("에러")
				},
		})
	}
	
</script>

</body>
</html>