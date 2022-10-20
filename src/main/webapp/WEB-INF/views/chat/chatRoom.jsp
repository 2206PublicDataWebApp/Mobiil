<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myChat</title>
</head>
<body>

<div class = "list">
	<c:forEach items="${cList }" var="chatRoom" varStatus="i">
		<a href= "javascript:void(0)" onclick = "showChatRoom(this, ${chatRoom.roomNo });">
			<table>
				<tr>
				<td><b>채팅방 번호:</b></td>
				<td>${chatRoom.roomNo }</td>
<%-- 				<td><b>채팅방 만든 시간:</b> ${chatRoom.createDate }</td> --%>
				<td><b>만든 사람:</b> ${chatRoom.createUser }</td>
				<td><b>같이할 사람:</b> ${chatRoom.withUser }</td>
				</tr>
			</table>
		</a>
	</c:forEach>
</div>


<script type="text/javascript">
	function showChatRoom(obj,roomNo) { // 리스트 중 하나 클릭하면 해당 로그 출력 + 입력칸 나옴 + 입력하면 append
		event.preventDefault();
		getChatLog(roomNo); // 채팅로그 줄줄 출력하는 펑션
		var $table = $("#chatLog");
		var $tr = $("<tr>");
		var $msg = $tr.append("<td><textarea rows='3' cols='55' name='chat' id='chat'></textarea></td><td><button id='cSubmit'></td>");
		$table.append($tr);
	}
	
	
 	function getChatLog(roomNo) {
 		$.ajax({
 			url: "/chatting/chatLog.kh",
 			data: {roomNo: roomNo},
 			type: "get",
 			success: function(data) {// 여기에 sender 피아식별해서 왼오 가를 수 있도록 세팅해야함
 				
				
			},
			error: function() {
				console.log("뭔가 잘못되었다")
			}
 		})
		
		
 	}
	
	
	
	$("#cSubmit").click(function() {
		var sender = "${loginUser.memberName}";
		var refRoomNo = ""; // this의 룸넘버 가져와야
		var msg = $("#msg").val();
		$.ajax({
			url: "chatting/registerChat.kh",
			data: {"sender" : sender,
				"refRoomNo" : refRoomNo,
				"msg" : msg
			},
			type: "post",
			success: function(data) {
				if(data == "success"){
					alert("댓글 등록 성공!");
					$("#msg").val(""); // 밸류 초기화
				}else{
					alert("댓글 등록 실패!");
				}
			},
			error: function() {
				console.log("서버 처리 실패")
			}
		})
	})
	
	</script>

</body>
</html>