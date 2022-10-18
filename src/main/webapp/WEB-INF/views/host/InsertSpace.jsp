<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<title>���� ���ε� ������</title>
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
	<form action="" method="get">
		<div id="div" align="center">
			<table>
				<tr>
					<td id="td">������   :</td>
					<td><input type="text" id="name" name="name" placeholder="���� Ÿ��Ʋ�� �Է� ���ּ���." required></td>
				</tr>
				<tr>
					<td id="td">�ּ�   :</td>
					<td><input type="text" id="sample6_postcode" placeholder="�����ȣ" required>
						<input type="button" onclick="sample6_execDaumPostcode()" value="�����ȣ ã��"><br>
						<input type="text" id="sample6_address" placeholder="�ּ�" required><br>
						<input type="text" id="sample6_detailAddress" placeholder="���ּ�" required>
						<input type="text" id="sample6_extraAddress" placeholder="�����׸�"></td>
				</tr>
				<tr>
					<td id="td">���� �̹���   :</td>
					<td><input type="text" id="phone" name="phone" readonly required></td>
				</tr>
				<tr>
					<td id="td">���� �Ұ�   :</td>
					<td><div class="container">
						  <textarea class="summernote" name="editordata"></textarea>    
						</div></td>
				</tr>
				<tr>
					<td id="td">����   :</td>
					<td><input type="text" id="bankName" name="bankName" placeholder="����, ����, ����, ����" required></td>
				</tr>
				<tr>
					<td id="td">�ݾ�   :</td>
					<td><input type="text" id="Email" name="Email" placeholder="�ݾ��� �Է� ���ּ���." required>
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
    
    $(document).ready(function() {
    	//���� �Ʒ� �κ�
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