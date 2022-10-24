<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>채팅방</title>



<meta charset="UTF-8">
</head>


<body>

<div class = "list">
	<c:forEach items="${cList }" var="chatRoom" >
		<a href= "javascript:void(0)" onclick = "showChatRoom( ${chatRoom.roomNo });">
			<table>
				<tr>
				<td><b>채팅방 번호:</b></td>
				<td>${chatRoom.roomNo }</td>
				
				<c:if test="${chatRoom.createUser eq loginUser.memberNick }">
					<td><b>상대방:</b> ${chatRoom.withUser }</td>
				</c:if>
				<c:if test="${chatRoom.createUser ne loginUser.memberNick }">
					<td><b>상대방:</b> ${chatRoom.createUser }</td>
				</c:if>
				</tr>
			</table>
		</a>
	</c:forEach>
</div>

	<!--  채팅 로그 --> 

<div class = "rightSide">
	<table align='center' width='80%' border='1' id="chatLog">

	</table>
</div>

<script type="text/javascript">
	function showChatRoom(roomNo) { // 리스트 중 하나 클릭하면 해당 로그 출력 + 입력칸 나옴 
		event.preventDefault();
			$("#chatLog").html(""); // 채팅방 하나만 보여지게 해당 테이블 내용을 비움
			getChatLog(roomNo); // 채팅로그 줄줄 출력하는 펑션
			var $table = $("#chatLog");
			var $tr = $("<tr>");
			var $chat = $tr.append("<td><textarea rows='3' name='chat' id='chat'></textarea></td><td><button type='button' onclick='cSubmit("+roomNo+")'>전송</button></td>");
			$table.append($tr);
		}
	
	
 	function getChatLog(roomNo) {
 		$.ajax({
 			url: "/chat/chatLog.kh",
 			data: {roomNo: roomNo},
 			type: "get",
 			success: function(data) {// 여기에 sender 피아식별해서 왼오 가를 수 있도록 세팅해야함
 				
				
			},
			error: function() {
				console.log("뭔가 잘못되었다")
			}
 		})
		
		
 	}
	
	
	// 채팅 전송
	function cSubmit(roomNo) {
		var sender = "${loginUser.memberName}";
		var refRoomNo = roomNo; // 룸넘버 가져와야
		var chat = $("#chat").val();
		$.ajax({
			url: "/chat/registerChat.kh",
			data: {"sender" : sender,
				"refRoomNo" : refRoomNo,
				"chat" : chat
			},
			type: "get",
			success: function(data) {
				if(data == "success"){
					$("#chat").val(""); // 밸류 초기화
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