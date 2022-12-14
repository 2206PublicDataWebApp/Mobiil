<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="/resources/images/mobiil.ico">

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
<style type="text/css">


body{
font-family:'Gamja Flower', cursive;
overflow: scroll;
}

#header{
display: block;
background: black;
position: fixed;
  left: 0;
  top: 0;
  width: 100%;;
  color: white;
  z-index: 3;
}


.list{
pading:0;
margin-top: 50px;
width: 100%;
position: relative;}



ul{
    list-style-type: none;
    padding: 0px;
   margin-top: 50px;
width: 100%;
    background: white;
    height: 100%;
    position: fixed;
    border-right: 1px grey solid;
    
}

li {
 text-decoration: none;
     margin: 0px;
 
    padding: 10px;
    display: block;
    color: black;
    
    font-weight: bold;
    
}

li:hover {
    background: #E9E5D6;
     font-weight: bold;
    color: #000;
  }

a{
text-decoration: none;
color:black;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>채팅 리스트</title>
<meta charset="UTF-8">
</head>

<body>
<span id="header" align='center'><h1>myChat</h1></span>
<div id='container'>
<div id = "list" >
	<table>
		<tr>
		<td>
			<ul>
<c:forEach items="${cList }" var="chatRoom" >
		<c:if test="${chatRoom.roomStatus eq 'Y' }">
			<c:if test="${!empty loginUser.memberNick }"> 
				<c:if test="${chatRoom.createUser eq loginUser.memberNick }">
						<a href= "/chat/chatRoom.kh?memberNick=${loginUser.memberNick }&roomNo=${chatRoom.roomNo}" >
					<li>		
						<img id='${chatRoom.withUser}img' src="/resources/images/ghost.png" width='10%'>	
						<span onmouseover="showProfile('${chatRoom.withUser}')">	${chatRoom.withUser }(${chatRoom.unReadCount}) </span>
					</li>
						</a>
				</c:if>
			
				<c:if test="${chatRoom.createUser ne loginUser.memberNick }">
						<a href= "/chat/chatRoom.kh?memberNick=${loginUser.memberNick }&roomNo=${chatRoom.roomNo}">
					<li>	
						<img id='${chatRoom.createUser}img' src="/resources/images/ghost.png" width='10%'>	
						<span onmouseover="showProfile('${chatRoom.createUser}')" >	${chatRoom.createUser }(${chatRoom.unReadCount}) </span>
					</li>
						</a>
				</c:if>
			</c:if>
			
			
			<c:if test="${!empty loginHost.memberNick }"> 
				<c:if test="${chatRoom.createUser eq loginHost.memberNick }">
						<a href= "/chat/chatRoom.kh?memberNick=${loginHost.memberNick }&roomNo=${chatRoom.roomNo}" >
					<li>		
						<img id='${chatRoom.withUser}img' src="/resources/images/ghost.png" width='10%'>	
						<span onmouseover="showProfile('${chatRoom.withUser}')">	${chatRoom.withUser }(${chatRoom.unReadCount}) </span>
						
					</li>
						</a>
				</c:if>
			
				<c:if test="${chatRoom.createUser ne loginHost.memberNick }">
						<a href= "/chat/chatRoom.kh?memberNick=${loginHost.memberNick }&roomNo=${chatRoom.roomNo}">
					<li>	
						<img id='${chatRoom.createUser}img' src="/resources/images/ghost.png" width='10%'>	
						<span onmouseover="showProfile('${chatRoom.createUser}')" >	${chatRoom.createUser }(${chatRoom.unReadCount}) </span>
						
					</li>
						</a>
				</c:if>
			</c:if>
		</c:if>
		
		<c:if test="${(chatRoom.roomStatus eq 'N')}">
		<c:if test="${!empty loginUser.memberNick }"> 
			<c:if test="${chatRoom.createUser eq loginUser.memberNick }">
				<a href= "/chat/chatRoom.kh?memberNick=${loginUser.memberNick }&roomNo=${chatRoom.roomNo}&roomStatus=${chatRoom.roomStatus}">
					<li>				
						<span>	${chatRoom.withUser }와의 채팅이 종료되었습니다. 금일 자정 채팅방이 삭제됩니다.</span>
					</li>
				</a>
			</c:if>
		
			<c:if test="${chatRoom.createUser ne loginUser.memberNick }">
				<a href= "/chat/chatRoom.kh?memberNick=${loginUser.memberNick }&roomNo=${chatRoom.roomNo}&roomStatus=${chatRoom.roomStatus}">
					<li>				
						<span>	${chatRoom.createUser }와의 채팅이 종료되었습니다. 금일 자정 채팅방이 삭제됩니다.</span>
					</li>
				</a>
			</c:if>
		</c:if>
		<c:if test="${!empty loginHost.memberNick }"> 
			<c:if test="${chatRoom.createUser eq loginHost.memberNick }">
				<a href= "/chat/chatRoom.kh?memberNick=${loginHost.memberNick }&roomNo=${chatRoom.roomNo}&roomStatus=${chatRoom.roomStatus}">
					<li>				
						<span>	${chatRoom.withUser }와의 채팅이 종료되었습니다. 금일 자정 채팅방이 삭제됩니다.</span>
					</li>
				</a>
			</c:if>
		
			<c:if test="${chatRoom.createUser ne loginHost.memberNick }">
				<a href= "/chat/chatRoom.kh?memberNick=${loginHost.memberNick }&roomNo=${chatRoom.roomNo}&roomStatus=${chatRoom.roomStatus}">
					<li>				
						<span>	${chatRoom.createUser }와의 채팅이 종료되었습니다. 금일 자정 채팅방이 삭제됩니다.</span>
					</li>
				</a>
			</c:if>
		</c:if>
		
		</c:if>
		
</c:forEach>
			</ul>
		</td>
		</tr>
	</table>
</div>


</div>

<script type="text/javascript">
	setTimeout(function(){
	location.reload();
	},5*60*1000); // 5분 두 한번 리로드	

 	function showProfile(memberNick) {
		if(memberNick != "관리자" && memberNick != null){
			$.ajax({
				url:"getProfile",
				data:{memberNick: memberNick},
				success: function(data) {
					console.log(data)
					if(data != "noPartner"){
					 $("#"+memberNick+"img").attr("src", "/resources/images/partner/"+data)
					}
				} ,
				error: function() {
					console.log("에러")
				}
			})
		}
	}	
</script>
</body>
</html>