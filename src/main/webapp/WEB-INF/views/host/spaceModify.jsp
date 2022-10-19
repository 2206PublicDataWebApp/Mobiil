<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<title>���� ���� ������</title>
<style>
	#td{
		text-align : right;
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
	<h1>���� ���� ����</h1>
	<br><br>
		<form action="/host/spaceModify.mobiil" method="POST">
		<input type="hidden" name="spaceNo" value="${sOne.spaceNo }">
			<div id="div" align="center">
				<table>
					<tr>
						<td id="td">������   :</td>
						<td><input type="text" id="spaceName" name="spaceName" value="${sOne.spaceName }"></td>
					</tr>
					<tr>
						<td id="td">�ּ�   :</td>
						<td><input type="text" id="sample6_postcode">
							<input type="button" onclick="sample6_execDaumPostcode()" value="�����ȣ ã��"><br>
							<input type="text" id="sample6_address"><br>
							<input type="text" id="sample6_detailAddress">
							<input type="text" id="sample6_extraAddress"></td>
					</tr>
					<tr>
						<td id="td">���� �̹���   :</td>
						<td>
							<c:forEach items="${sImg }" var="img">
							<input type="hidden" value="${sImg.spaceImgNo }" name="spaceImgNo">
							<input type="hidden" value="${sImg.spaceFileRename }" name="spaceFileRename">
							<input multiple="multiple" type="file" name="reloadFile">
							</c:forEach>
						</td>
					</tr>
					<tr>
						<td id="td">���� �Ұ�   :</td>
						<td><textarea class="summernote" name=spaceComent></textarea></td>
					</tr>
					<tr>
						<td id="td">����   :</td>
						<td><input type="text" id="spaceArea" name="spaceArea" value="${sOne.spaceArea }"></td>
					</tr>
					<tr>
						<td id="td">�ݾ�   :</td>
						<td><input type="text" id="spacePrice" name="spacePrice" value="${sOne.spacePrice }">
						</td>
					</tr>
					<tr>
						<td><button type="submit">���� ���ε�</button></td>
						<td><button type="reset">���</button></td>
					</tr>
				</table>
			</div>
		</form>
	
<script>
	// ���� �߰�
	function addFile(){
		var number = 2;
		var trTag = $(".fileTr");
		$(trTag).children('td').eq(1).append("<br><input multiple='multiple' type='file' name='uploadFile' />");
		number = number + 1;
	}
	// ���� ����
	function removeFile(){
		var trTag = $(".fileTr");
	 	if($(trTag).children('td').eq(1).children('input').length > 1) {
		 	$(trTag).children('td').eq(1).children('input:last').remove();
		 	$(trTag).children('td').eq(1).children('br:last').remove();
		} 
	}
	// �ּ� �˻�
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
                    if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
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
    
	// ���ӳ�Ʈ
    $(document).ready(function() {
    	$('.summernote').summernote({
    		  height: 300,                 // ������ ����
    		  minHeight: null,             // �ּ� ����
    		  maxHeight: null,             // �ִ� ����
    		  focus: true,                  // ������ �ε��� ��Ŀ���� ������ ����
    		  lang: "ko-KR",					// �ѱ� ����
    		  placeholder: '�ִ� 2048�ڱ��� �� �� �ֽ��ϴ�'	//placeholder ����
              
    	});
    });
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</body>
</html>