<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공간 업로드 페이지</title>
<style>
	td {
		width: 100px;
	}
	
	form {
		margin: 0px;
		padding: 0px;
	}
	
	#td {
		text-align: center;
	}
	
	.input {
		height: 30px;
		width: 400px;
		font-size: 15px;
		margin: 1px 80px 10px 20px;
		text-align: center;
		font-weight: bolder;
	}
	
	table {
		width: 750px;
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
	
	.btn-upload {
		  width: 150px;
		  height: 30px;
		  background: #fff;
		  border: 1px solid rgb(77,77,77);
		  border-radius: 10px;
		  font-weight: 500;
		  cursor: pointer;
		  display: flex;
		  align-items: center;
		  justify-content: center;
		  &:hover {
		    background: rgb(77,77,77);
		    color: #fff;
  	}
  
	  input[type="checkbox"] {
	  width: 25px; 
	  height: 25px; 
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
	<form action="/host/spaceInsert.mobiil" method="POST" enctype="multipart/form-data">
		<div id="div" align="center" style=" margin-right: 400px;">
		<h2>공간 업로드</h2><br>
		<hr>
			<table >
				<tr>
					<td><input type="hidden" id="hostEmail" class="input" name="hostEmail" value="${loginHost.hostEmail }"></td>
				</tr>
				<tr>
					<td id="td">공간명</td>
					<td><input type="text" id="spaceName" class="input" name="spaceName" placeholder="공간명은 한글, 영문, 숫자로 입력 가능합니다." required></td>
				</tr>
				<tr>
					<td id="td">주소</td>
					
					<td><input type="text" id="sample6_postcode" class="input" name="address1" placeholder="우편번호" required>
						<input type="button" class="btn btn-default"  onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="sample6_address" class="input" name="address2" placeholder="주소" required><br>
						<input type="text" id="sample6_detailAddress" class="input" name="address3" placeholder="상세주소" required>
						<input type="text" id="sample6_extraAddress" class="input" name="address4" placeholder="참고항목"></td>
				</tr>
				<tr class="fileTr">
					<td id="td">공간 이미지   </td>
					<td>
						<button type="button" class="btn btn-default" onclick="addFile();">+</button>
						<button type="button" class="btn btn-default" onclick="removeFile();">-</button>
						<input multiple="multiple" type="file" id="uploadFile" name="uploadFile">
					</td>
				</tr>
				<tr>
					<td id="td">공간 소개   </td>
					<td><textarea class="summernote" id="spaceComent" name=spaceComent></textarea></td>
				</tr>
				<tr>
					<td id="td">지역</td>
					<!-- <td>
					<label><input type="checkbox" name="spaceArea"  id="spaceArea1" value="강북" >강북</label>
					<label><input type="checkbox" name="spaceArea"  id="spaceArea2" value="강남" >강남</label>
					<label><input type="checkbox" name="spaceArea"  id="spaceArea3" value="강서" >강서</label>
					<label><input type="checkbox" name="spaceArea"  id="spaceArea4" value="강동" >강동</label>
					</td> -->
					<td>
						<select id="spaceArea" name="spaceArea" style="width: 400px; height: 45px; margin-left: 20px; text-align: center;" required>
							<option value="강북">강북</option>
							<option value="강남">강남</option>
							<option value="강서">강서</option>
							<option value="강동">강동</option>
						</select>
					</td>
				</tr>
				<tr>
					<td id="td">금액   </td>
					<td><input type="text" id="spacePrice" class="input" name="spacePrice" placeholder="금액은 숫자만 입력 가능합니다." required>
					</td>
				</tr>
				<tr>
					<td colspan='2' align="center">
					<button class="button1" type="submit">공간 업로드</button>
					<button class="button2" type="reset">취소</button>
					</td>
				</tr>
			</table>
		</div>
	</form>
	
<script>
	$(document).on('click', "input[type='checkbox']", function(){
	    if(this.checked) {
	        const checkboxes = $("input[type='checkbox']");
	        for(let i = 0; i < checkboxes.length; i++){
	            checkboxes[i].checked = false;
	        }
	        this.checked = true;
	    } else {
	        this.checked = false;
	    }
	});

	$("#spaceName").blur(function() {
		var spaceName = document.getElementById("spaceName");
		var reg = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\s]+$/;
			if(!reg.test(spaceName.value)){
				alert("공간명은 한글, 영문, 숫자로 입력 가능합니다.");
				spaceName.value = "";
				return false;
			}
	});
	
	$("#spacePrice").blur(function() {
		var spacePrice = document.getElementById("spacePrice");
		var reg = /^[0-9]+$/;
			if(!reg.test(spacePrice.value)){
				alert("금액은 숫자만 입력 가능합니다.");
				spacePrice.value = "";
				return false;
			}
	});

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
<br><br><br><br><br><br><br>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<jsp:include page="../../views/common/footer.jsp"></jsp:include>
</body>
</html>