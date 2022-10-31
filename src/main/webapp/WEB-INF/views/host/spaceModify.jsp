<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공간 수정 페이지</title>
<style>

	table {
			width: 750px;
		}
		
	#td{
		text-align : center;
	}
	
	td {
		width: 90px;
	}
	
	form {
		margin: 0px;
		padding: 0px;
	}
	
	.input {
		height: 30px;
		width: 400px;
		font-size: 15px;
		margin: 1px 80px 10px 20px;
		text-align: center;
		font-weight: bolder;
	}
	
	.button1 {
		height: 40px;
		width: 100px;
		background-color: #ecf3fd;
		border-radius: 20px;
		border: none;
		font-size: 20px;
		margin: 1px 1px 10px 50px;
		font-size: 15px;
	}
	
	.button2 {
		height: 40px;
		width: 100px;
		background-color: #f3f3f3;
		border-radius: 20px;
		border: none;
		font-size: 20px;
		margin: 1px 1px 10px 50px;
		font-size: 15px;
	}
</style>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>

<body>
<jsp:include page="../../views/common/menubar.jsp"></jsp:include>
<jsp:include page="../host/menuBar.jsp"></jsp:include>
	<div id="div" align="center">
	<h1>공간 정보 수정</h1>
	<br><br>
		<form action="/host/spaceModify.mobiil" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="spaceNo" value="${sOne.spaceNo }">
			<div id="div" align="center">
				<table>
					<tr>
						<td id="td">공간명</td>
						<td><input type="text" id="spaceName" class="input" name="spaceName" value="${sOne.spaceName }"></td>
					</tr>
					<tr>
						<td id="td">주소</td>
						<td><input type="text" id="sample6_postcode" class="input">
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
							<input type="text" id="sample6_address" class="input" value="${sOne.address }"><br>
							<input type="text" id="sample6_detailAddress"class="input" >
							<input type="text" id="sample6_extraAddress"class="input" ></td>
					</tr>
					<tr>
						<td id="td">공간 이미지</td>
						<td>
							<c:forEach items="${sImg }" var="img">
							<input type="hidden" value="${img.spaceImgNo }" name="spaceImgNo">
							<input type="hidden" value="${img.spaceFileRename }" name="spaceFileRename">
							<input multiple="multiple" type="file" name="reloadFile">
							</c:forEach>
						</td>
					</tr>
					<tr>
						<td id="td">공간 소개</td>
						<td><textarea class="summernote" name=spaceComent></textarea></td>
					</tr>
					<tr>
						<td id="td">지역</td>
						<td><input type="text" id="spaceArea" class="input" name="spaceArea" value="${sOne.spaceArea }"></td>
					</tr>
					<tr>
						<td id="td">금액</td>
						<td><input type="text" id="spacePrice" class="input" name="spacePrice" value="${sOne.spacePrice }">
						</td>
					</tr>
					<tr>
						<td colspan='2' align="center">
						<button class="button1" type="submit">공간 업로드</button>
						<button class="button2" type="reset" onclick="location.href='/host/spaceList.mobiil'">취소</button>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
<script>
	// 주소 검색
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = ''; 
                var extraAddr = ''; 
                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else { 
                    addr = data.jibunAddress;
                }
                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    
	// 서머노트
    $(document).ready(function() {
    	$('.summernote').summernote({
    		  height: 300,                 // 에디터 높이
    		  minHeight: null,             // 최소 높이
    		  maxHeight: null,             // 최대 높이
    		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
    		  lang: "ko-KR",					// 한글 설정
    		  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
    	});
    	$(".summernote").summernote('code',  '${sOne.spaceComent }');
    });
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<jsp:include page="../../views/common/footer.jsp"></jsp:include>
</body>
</html>