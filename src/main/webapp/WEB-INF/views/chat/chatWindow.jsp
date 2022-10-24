<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
<style type="text/css">
body{
font-family: font-family: 'Gamja Flower', cursive;
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


#chatMsg{
display: none;
}

#chatLog{
overflow:scroll;
}
#me{

background-color:rgb(233, 229, 214);
color : black;
border-radius: 40px;
padding-left : 10px;
padding-right : 10px;
padding-top : 1px;
padding-bottom : 1px;
}

#other{
background-color:  rgb(54, 39, 6);
color : white;
border-radius: 40px;
padding-left : 10px;
padding-right : 10px;
padding-top : 1px;
padding-bottom : 1px;

}

.list{
pading:0;
margin-top: 50px;
width: 50px;
position: relative;}

.rightSide{
float: left;
padding-top: 50px;
margin-left: 150px;
position: relative;
}

ul{
    list-style-type: none;
    padding: 0px;
   margin-top: 50px;
    width: 150px;
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
<!-- 채팅방 리스트 -->
<div id = "list" >
	<table class= ''>
		<tr>
		<td>
			<ul>
<c:forEach items="${cList }" var="chatRoom" >
			<c:if test="${chatRoom.createUser eq loginUser.memberNick }">
					<a href= "javascript:void(0)" onclick = "showChatRoom(${chatRoom.roomNo });">
				<li>				
					<span>	${chatRoom.withUser } </span>
				</li>
					</a>
			</c:if>
		
			<c:if test="${chatRoom.createUser ne loginUser.memberNick }">
					<a href= "javascript:void(0)" onclick = "showChatRoom(${chatRoom.roomNo });">
				<li>				
					<span>	${chatRoom.createUser } </span>
				</li>
					</a>
			</c:if>
</c:forEach>
			</ul>
		</td>
		</tr>
	</table>
</div>

	<!--  채팅 로그 --> 

<div class = "rightSide">
<br>
	<table align = 'center' width='80%'  id=chatlog>
	
	</table>
	<table align='center' width='80%' id="chatMsg" >
		<tr >
		<td  ><textarea class = 'form-control' rows='1' cols='100' name='chat' id='chat'></textarea></td>
		<td  id='buttonArea'></td>
		</tr>
	</table>
	<span><br></span>
</div>
</div>

<script type="text/javascript">
	var $rightSide = $(".rightSide");
	var $chatlog = $("#chatlog");
	var $chatMsg = $("#chatMsg");
 	var memberNick = "${loginUser.memberNick}";

 	
	// 채팅방 열기
	function showChatRoom(roomNo) { // 리스트 중 하나 클릭하면 해당 로그 출력 + 입력칸 나옴 
	 	$chatlog.html(""); // 채팅방 하나만 보여지게 해당 테이블 내용을 비움
	 	getChatLog(roomNo);
	 	$("#buttonArea").html("");
	 	$("#buttonArea").append("<button type='button' class='btn btn-light' onclick='cSubmit("+roomNo+")'>SEND</button>")
		$chatMsg.css('display', 'block')
	}
	
	//채팅방 로그 가져오기(기존 이력)
 	function getChatLog(roomNo) {
 		var memberNick = "${loginUser.memberNick}"
	 		$.ajax({
	 			url: "/chat/chatLog.kh",
	 			data: {roomNo: roomNo},
	 			type: "get",
	 			success: function(data) {// 여기에 sender 피아식별해서 왼오 가를 수 있도록 세팅
	 				$chatlog.html("");
		 			for(var i = 0; i < data.length; i++){
		 				if(data[i].sender == memberNick){ //보낸사람이 로그인유저인경우
					 		var $chatOneLog = $("<tr>"); // 하나의 메세지 영역 tr 생성
		 					$chatOneLog.append( "<td align='right'><span id='me'>"+data[i].chat +"<br></span>" + "<span>" +data[i].createDate+ "</span></td>") //tr에 td붙임 
		 				}else{ // 보낸사람이 상대방인경우
					 		var $chatOneLog = $("<tr>"); // 하나의 메세지 영역 tr 생성 
		 					$chatOneLog.append( "<td align='left' ><span id='other'>"+data[i].chat +"<br></span>" + "<span>" +data[i].createDate+ "</span></td>") //tr에 td붙임 
		 				}
		 					$chatlog.append($chatOneLog);  //table에 tr 붙임
		 					$("#chat").focus(); // 다시 입력란 포커스
		 					$(document).scrollTop($(document).height()); // 스크롤 아래로
						 	//setInterval(getChatLog, 2000, roomNo);
		 				}
				},
				error: function() {
					console.log("뭔가 잘못되었다")
				}
	 		})
 	}
	
	
	// 채팅 전송
	function cSubmit(roomNo) {
		console.log(roomNo)
		var sender = "${loginUser.memberName}";
		var chat = $("#chat").val();
		$.ajax({
			url: "/chat/registerChat.kh",
			data: {"sender" : sender,
				"refRoomNo" : roomNo,
				"chat" : chat
			},
			type: "get",
			success: function(data) {
				if(data == "success"){
					$("#chat").val(""); // 밸류 초기화
					getChatLog(roomNo);
				}else{
					alert("chat 등록 실패!");
				}
			},
			error: function() {
				console.log("서버 처리 실패")
			}
		})
	}
	

	
	</script>

</body>
</html>