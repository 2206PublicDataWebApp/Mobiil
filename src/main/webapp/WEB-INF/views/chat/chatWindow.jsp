<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
<style type="text/css">


body{
font-family:'Gamja Flower', cursive;
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
    overflow: auto;
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
<title>채팅방</title>



<meta charset="UTF-8">
</head>


<body>

<span id="header"><h1>myChat</h1></span>
<div id='container'>
<div id = "list" >
	<table class= ''>
		<tr>
		<td>
			<ul>
<c:forEach items="${cList }" var="chatRoom" >

		<c:if test="${chatRoom.roomStatus eq 'Y' }">
			<c:if test="${chatRoom.createUser eq loginUser.memberNick }">
					<a href= "/chat/chatRoom.kh?memberNick=${loginUser.memberNick }&roomNo=${chatRoom.roomNo}" >
				<li>				
					<span>	${chatRoom.withUser }(${chatRoom.unReadCount}) </span>
				</li>
					</a>
			</c:if>
		
			<c:if test="${chatRoom.createUser ne loginUser.memberNick }">
					<a href= "/chat/chatRoom.kh?memberNick=${loginUser.memberNick }&roomNo=${chatRoom.roomNo}">
				<li>				
					<span>	${chatRoom.createUser }(${chatRoom.unReadCount}) </span>
				</li>
					</a>
			</c:if>
		</c:if>
		
		<c:if test="${(chatRoom.roomStatus eq 'N') and (chatRoom.listDeleteDate < today)}">
			<c:if test="${chatRoom.createUser eq loginUser.memberNick }">
				<li>				
					<span>	${chatRoom.withUser }와의 채팅이 종료되었습니다. 3일 후 채팅방이 삭제됩니다.</span>
					<button type='button' onclick='ask()'>재활성화 요청</button>
				</li>
			</c:if>
		
			<c:if test="${chatRoom.createUser ne loginUser.memberNick }">
				<li>				
					<span>	${chatRoom.createUser }와의 채팅이 종료되었습니다. 3일 후 채팅방이 삭제됩니다.</span>
					<button type='button' onclick='ask(${chatRoom.roomNo})'>재활성화 요청</button>
				</li>
			</c:if>
		</c:if>
		<c:if test="${(chatRoom.roomStatus eq 'N') and (chatRoom.listDeleteDate >= today)}">
		
		</c:if>
		
		
</c:forEach>
			</ul>
		</td>
		</tr>
	</table>
</div>


</div>

<script type="text/javascript">
	function ask(roomNo) { // 재활성화 요청 누르면 메일로 재활성화 요청 링크를 보냄 그거 누르면 수락-->업데이트
		$.ajax({
			url: "chat/askMail.kh",
			data: {roomNo: roomNo}, //
			type: "get",
			success: function(data) {
				if(data == success){
					alert("활성화 메일 요청 성공")
				}else{
					alert("활성화 메일 요청 실패")
				}
			},
			error: function() {
				console.log("실패")
			},
			
		})
		
	}
</script>


</body>
</html>