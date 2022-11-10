<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="/resources/plugins/bootstrap/css/bootstrap.min.css">
  
  <style type="text/css">
 
  </style>
<title>일정 등록</title>
</head>
<body>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<table class='table'>
		<tr>
		<td>제목  </td>
		<td><input type="text" name="title" class="form-control" id="title" required="required"></td>
		</tr>
		<tr>
		<td>시작일  </td>
		<td><input type="date" name="start" class="form-control" id="start" required="required"></td>
		</tr>
		<tr>
		<td>종료일  </td>
		<td><input type="date" name="end" class="form-control" id="end" required="required"></td>
		</tr>
		<tr>
		<td>배경색  </td>
		<td><input type="color" name="backgroundColor" class="form-control" id="backgroundColor" required="required"></td>
		</tr>
		<tr>
		<td>테두리  </td>
		<td><input type="color" name="borderColor" class="form-control" id="borderColor" required="required" ></td>
		</tr>
		<tr>
		<td colspan = '2'><input type='button' value="저장" id="eSubmit" onclick = "eSubmit()" class="form-control"> </td>
		</tr>
	</table>
<script type="text/javascript">
function eSubmit() {
	var title = $("#title").val()
	var start = $("#start").val()
	var end = $("#end").val()
	var backgroundColor = $("#backgroundColor").val()
	var borderColor = $("#borderColor").val()
	if(start > end){
		alert("날짜를 확인해주세요")
	}else{
	     $.ajax({
	         url : "/admin/calendar/registerEvent.kh"
	       , type : "get"
	       , data : {title: title,
		    	   start:start,
		    	   end:end,
		    	   backgroundColor:backgroundColor,
		    	   borderColor:borderColor}
	       , success:function(data) {
	    	   if(data == "success"){
		           alert("등록 성공.");
		           window.open('','_self').close();
		           opener.location.reload();
	    	   }else{
					console.log("실패")    		   
	    	   }
	       }
	       ,error: function() { 
	           alert("등록 실패"); 
	       }
	   })
	}
}



</script>
</body>
</html>


