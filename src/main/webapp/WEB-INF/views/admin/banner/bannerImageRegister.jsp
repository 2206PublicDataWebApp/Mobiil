<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배너 이미지 변경</title>
</head>
<body>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>


<form action="/admin/banner/updateImage.kh" method="post" enctype="multipart/form-data">
	<table align="center" class="table col-10 mb-3">
		<tr>
			<td width='30%'>
				<img alt="본문이미지" src="/resources/images/slider/${banner.bannerRename }" width = '50%'>
				<br><input type="file" name="uploadFile" id="uploadFile">
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="저장" class="btn btn-primary">
			</td>
		</tr>
	</table>
</form>


</body>
</html>