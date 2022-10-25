<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공간 업로드 페이지</title>
<style>
	#td{
		text-align : center;
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
	<jsp:include page="../host/menuBar.jsp"></jsp:include>
	<form action="/host/spaceInsert.mobiil" method="POST" enctype="multipart/form-data">
		<div id="div" align="center">
		<h2>공간 업로드</h2><br>
		<hr>
			<table>
				<tr>
					<td id="td">공간명   </td>
					<td><input type="text" id="spaceName" name="spaceName" placeholder="공간 타이틀을 입력 해주세요." required></td>
				</tr>
				<tr>
					<td id="td">주소   </td>
					<td><input type="text" id="sample6_postcode" placeholder="우편번호" required>
						<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="sample6_address" name="address" placeholder="주소" required><br>
						<input type="text" id="sample6_detailAddress" placeholder="상세주소" required>
						<input type="text" id="sample6_extraAddress" placeholder="참고항목"></td>
				</tr>
				<tr class="fileTr">
					<td id="td">공간 이미지   </td>
					<td>
						<button type="button" onclick="addFile();">+</button>
						<button type="button" onclick="removeFile();">-</button>
						<input multiple="multiple" type="file" name="uploadFile">
					</td>
				</tr>
				<tr>
					<td id="td">공간 소개   </td>
					<td><textarea class="summernote" id="spaceComent" name=spaceComent></textarea></td>
				</tr>
				<tr>
					<td id="td">지역   </td>
					<td><input type="text" id="spaceArea" name="spaceArea" placeholder="강북, 강남, 강서, 강동" required></td>
				</tr>
				<tr>
					<td id="td">금액   </td>
					<td><input type="text" id="spacePrice" name="spacePrice" placeholder="금액을 입력 해주세요." required>
					</td>
				</tr>
				<tr>
					<td><button type="submit">공간 업로드</button></td>
					<td><button type="reset">취소</button></td>
				</tr>
			</table>
		</div>
	</form>
	
<script>
	// 사진 추가
	function addFile(){
		var number = 2;
		var trTag = $(".fileTr");
		$(trTag).children('td').eq(1).append("<br><input multiple='multiple' type='file' name='uploadFile' />");
		number = number + 1;
	}
	// 사진 삭제
	function removeFile(){
		var trTag = $(".fileTr");
	 	if($(trTag).children('td').eq(1).children('input').length > 1) {
		 	$(trTag).children('td').eq(1).children('input:last').remove();
		 	$(trTag).children('td').eq(1).children('br:last').remove();
		} 
	}
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
    });
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</body>
</html>