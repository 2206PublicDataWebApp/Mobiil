<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">


<style type="text/css">

body{
font-family:'Gamja Flower', cursive;
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
display: block;
}

#chatMsgArea{
   width: 100%;
  height: 70px;
  position: fixed;
  bottom: 5px;
    }

#chatLogArea{
margin-top: 50px;
margin-bottom:75px;

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
font-size: 20px
}

#other{
background-color:  rgb(54, 39, 6);
color : white;
border-radius: 40px;
padding-left : 10px;
padding-right : 10px;
padding-top : 1px;
padding-bottom : 1px;
font-size: 20px
}
</style>
</head>
<body>

<%--  <span id="header" align='center'><h1>myChat</h1> <a href='/chat/chatWindow.kh?memberNick=${memberNick }'>리스트로</a></q></span> --%>
<span id="header" align='center'><h1>myChat</h1> <a href= "javascript:void(0)" onclick = "clearRoom();">리스트로</a></q></span>

<br>
	<!--  채팅 로그 --> 
<div id='chatLogArea'>
	<table align = 'center'  width='90%'  id='chatlog'>
	
	</table>
</div>
	
<!-- 	메세지전송 -->
<div id="chatMsgArea">
	<table align='center' width='90%' id="chatMsg" >
		<tr >
		<td  >
			<textarea class = 'form-control' rows='1' cols='100' name='chat' id='chat'></textarea>
		</td>
		<td  id='buttonArea'>   
			<button type='button' class='btn btn-light' onclick="cSubmit(${roomNo}, '${memberNick }')">SEND</button>
		</td>
		</tr>
	</table>
	<span><br></span>
</div>

<script type="text/javascript">
var roomNo = "${roomNo}";
var memberNick = "${memberNick}";
var $chatlog = $("#chatlog");

getChatLog(roomNo, memberNick);
//getChatNewLog();
setInterval(getChatNewLog, 500);

function clearRoom() {
	clearInterval(getChatNewLog, 500);
	 window.location.href="/chat/chatWindow.kh?memberNick="+memberNick+""	
}


// 전송하기
function cSubmit(roomNo, memberNick) {
	var chat = $("#chat").val();
	var sender = memberNick
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
			//	getChatLog(roomNo, memberNick);
			}else{
				alert("chat 등록 실패!");
			}
		},
		error: function() {
			console.log("서버 처리 실패")
		}
	})
}

//채팅방 로그 가져오기(기존 이력)
	function getChatLog(roomNo, memberNick) {
 		$.ajax({
 			url: "/chat/chatLog.kh",
 			data: {roomNo: roomNo},
 			type: "get",
 			success: function(data) {// 여기에 sender 피아식별해서 왼오 가를 수 있도록 세팅
 			for(var i = 0; i < data.length; i++){
	 				if(data[i].sender == memberNick){ //보낸사람이 로그인유저인경우
				 		var $chatOneLog = $("<tr>"); // 하나의 메세지 영역 tr 생성
	 					$chatOneLog.append( "<td align='right'><span id='me'>"+data[i].chat +"<br></span>" + "<span>" +data[i].createDate+ "</span><input type='hidden' id='hiddenNo' value="+data[i].chatNo+"></td>") //tr에 td붙임 
	 				}else{ // 보낸사람이 상대방인경우
				 		var $chatOneLog = $("<tr>"); // 하나의 메세지 영역 tr 생성 
	 					$chatOneLog.append( "<td align='left'><span id='other'>"+data[i].chat +"<br></span>" + "<span>" +data[i].createDate+ "</span><input type='hidden' id='hiddenNo' value="+data[i].chatNo+"></td>") //tr에 td붙임 
	 				}
	 					$chatlog.append($chatOneLog);  //table에 tr 붙임
	 					$("#chat").focus(); // 다시 입력란 포커스
	 					$(document).scrollTop($(document).height()); // 스크롤 아래로
	 				}
	
			},
			error: function() {
				console.log("뭔가 잘못되었다")
			}
 		})
	}


	//채팅방 최신 1개 가져오기(최신 반영)
	function getChatNewLog() {
 		$.ajax({
 			url: "/chat/chatNewOne.kh",
 			data: {roomNo: roomNo},
 			type: "get",
 			success: function(data) {// 여기에 sender 피아식별해서 왼오 가를 수 있도록 세팅
 			//	var hiddenNo = $("#hiddenNo").last().val();
 			var hiddenNo = $("input").last().val();
 				//앞에 붙어있는 메세지의 no가 지금 불러온 애랑 다른경우에 붙임
 				if(data.chatNo != hiddenNo){
	 				if(data.sender == memberNick){ //보낸사람이 로그인유저인경우
				 		var $chatOneLog = $("<tr>"); // 하나의 메세지 영역 tr 생성
	 					$chatOneLog.append( "<td align='right'><span id='me'>"+data.chat +"<br></span>" + "<span>" +data.createDate+ "</span><input type='hidden' id='hiddenNo' value="+data.chatNo+"></td>") //tr에 td붙임 
	 				}else{ // 보낸사람이 상대방인경우
				 		var $chatOneLog = $("<tr>"); // 하나의 메세지 영역 tr 생성 
	 					$chatOneLog.append( "<td align='left'><span id='other'>"+data.chat +"<br></span>" + "<span>" +data.createDate+ "</span><input type='hidden' id='hiddenNo' value="+data.chatNo+"></td>") //tr에 td붙임 
	 				}
	 					$chatlog.append($chatOneLog);  //table에 tr 붙임
	 					$("#chat").focus(); // 다시 입력란 포커스
	 					$(document).scrollTop($(document).height()); // 스크롤 아래로
 				}
	
			},
			error: function() {
				console.log("뭔가 잘못되었다")
			}
 		})
	}

</script>
</body>
</html>