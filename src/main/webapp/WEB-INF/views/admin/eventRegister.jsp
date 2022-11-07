<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 등록</title>
</head>
<body>
	<table>
		<tr>
		<td>제목</td>
		<td><input type="text" name="eventTitle" class="form-control" id="eventTitle" required="required"></td>
		</tr>
		<tr>
		<td>시작일</td>
		<td><input type="text" name="eventStart" class="form-control" id="eventStart" required="required" placeholder="YYYY-MM-DD 형식으로 작성하세요"></td>
		</tr>
		<tr>
		<td>종료일</td>
		<td><input type="text" name="eventEnd" class="form-control" id="eventEnd" required="required" placeholder="YYYY-MM-DD 형식으로 작성하세요"></td>
		</tr>
		<tr>
		<td>배경색</td>
		<td><input type="color" name="backgroundColor" class="form-control" id="backgroundColor" required="required"></td>
		</tr>
		<tr>
		<td>테두리</td>
		<td><input type="color" name="borderColor" class="form-control" id="borderColor" required="required" ></td>
		</tr>
		<tr>
		<td>공개/비공개</td>
		<td><input type="radio" name="status" class="form-control" id="status" required="required" value = 'Y'>공개 
			<input type="radio" name="status" class="form-control" id="status" required="required" value = 'N'>비공개</td>
		</tr>
		
	</table>
</body>
</html>