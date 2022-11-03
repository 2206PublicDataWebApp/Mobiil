<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>

  <!-- 서머노트를 위해 추가해야할 부분 -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="/resources/js/summernote-lite.js"></script>
  <script src="/resources/js/summernote/lang/summernote-ko-KR.js"></script>
  <link rel="stylesheet" href="/resources/css/summernote-lite.css">

<meta charset="UTF-8">
<title>파트너 등록</title>
</head>
<body>
	<body id="body">

	<jsp:include page="../../views/common/menubar.jsp"></jsp:include>
	<body>
<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">파트너 등록</h1>
				</div>
			</div>
		</div>
	</div>
</section>
		<section class="products section">
			<div class="container">
				<form action="/party/register.kh" method="post" enctype="multipart/form-data" name='partnerForm'>
	
		<table align="center" class="table col-10">
			<tr>
			
			<td col = '1' align='center'>썸네일 등록</td>
			<td colspan='2'><input type="file" name="uploadFile" onchange="readURL(this);" required="required"></td>
			<td col='1' rowspan='4'align='center'> <img id="preview" height='150px'/></td>
			</tr>
			<tr>
			<tr>
			<td  colspan='1' align='center'>제목</td>
			<td colspan='2'  ><input type="text" name="title" class="form-control" id="exampleFormControlInput1" required="required"></td>
			<tr>
			<td  colspan='1' align='center'>작성자</td>
			<td colspan='2' ><input type="text" name="memberNick" class="form-control" id="exampleFormControlInput1" value = "${sessionScope.loginUser.memberNick }" readonly></td>
			</tr>
			<tr>
			<td align='center'>지역</td>
			<td colspan='1' >
				<select  name="area"  required="required">
						<option value="강북" label="강북"></option>
						<option value="강서" label="강서"></option>
						<option value="강남" label="강남"></option>
						<option value="강동" label="강동"></option>
				</select>
			</td>
			<td  colspan='1'  align='center' >악기</td>
			<td colspan='1' >
				<input type="text" name="instrument" required="required"  class="form-control" id="exampleFormControlInput1">
			</td>
			</tr>
			<tr>
			<td  align='center' required="required">>내용</td>
			<td colspan = '3'> <textarea class="summernote" name="contents"></textarea>  </td>
			</tr>
			<tr>
			<td colspan='4' align='right'>
				<input type='hidden' value="${loginUser.memberEmail }" name='memberEmail'>
				<input  type="button" value="등록" class='btn btn-dark' onclick="pSubmit('${loginUser.memberEmail }')">
				<input type="reset" value="취소" class='btn btn-dark'>
				<button type="button" onclick="history.back()" class='btn btn-dark'>이전으로</button> 
			</td>
			</tr>
		</table>
	</form>
	</div>
	</section>
	
<jsp:include page="../../views/common/footer.jsp"></jsp:include>



<script type="text/javascript">

function readURL(input) { // 파일 미리보기
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
	}


$('.summernote').summernote({
	height : 300,
	lang : "ko-KR",
});

function pSubmit(memberEmail) {
	if(confirm("저장하시겠습니까?")){
		alert("심사 후 리스트에 노출됩니다.");
		return partnerForm.submit();
	}
}
function formCheck() { // null 체크
	if(partnerForm.title.value=="") { // document 를 생략해도 됨
        alert("제목을 입력하세요!");
        partnerForm.title.focus();
    	return false;
    }else if(partnerForm.title.value==""){
        alert("내용을 입력하세요");
        partnerForm.title.focus();
        return false;
    }
	return partnerForm.submit();
 }

</script>

</body>
</html>