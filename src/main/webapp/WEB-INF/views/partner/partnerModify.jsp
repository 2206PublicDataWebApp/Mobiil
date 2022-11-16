<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="/resources/images/mobiil.ico">

<meta charset="UTF-8">
<title>파트너 정보 수정</title>
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
				<form action="/partner/modifyPartner.kh" method="post" enctype="multipart/form-data" name='partnerForm'>
	
		<table align="center" class="table col-10">
			<tr>
				<td colspan='4' align='center'><img src = "/resources/images/partner/${myPartnerInfo.profileRename }" width="300px">
				<br><input type = 'button' value='프로필 사진 변경' onclick ='changeImageWindow(${myPartnerInfo.partnerNo})'>
				</td>
			<tr>
			</tr>
			<tr>
			<tr>
			<td  class="col-2" scope="col" align='center'>제목</td>
			<td><input type="text" name="title" class="form-control" id="exampleFormControlInput1" required="required"  value = "${myPartnerInfo.title }"></td>
			<tr>
			<td  class="col-2" scope="col" align='center'>작성자</td>
			<td><input type="text" name="memberNick" class="form-control" id="exampleFormControlInput1" value = "${sessionScope.loginUser.memberNick }" readonly></td>
			</tr>
			<tr>
			<td  class="col-2" scope="col" align='center'>지역</td>
			<td>
				<select  name="area"  required="required">
						<option value="강북" label="강북"></option>
						<option value="강서" label="강서"></option>
						<option value="강남" label="강남"></option>
						<option value="강동" label="강동"></option>
				</select>
			</td>
			</tr>
			<tr>
			<td  class="col-2" scope="col" align='center' >악기</td>
			<td>
				<input type="text" name="instrument" required="required"  class="form-control" id="exampleFormControlInput1" value = "${myPartnerInfo.instrument  }">
			</td>
			</tr>
			<tr>
			<td  class="col-2" scope="col" align='center' >내용</td>
			<td> <textarea class="summernote" name="contents"  required="required" >"${myPartnerInfo.contents  }"</textarea>  </td>
			</tr>
			<tr>
			<td colspan='2' align='right'>
				<input type='hidden' value="${loginUser.memberEmail }" name='memberEmail'>
				<input type='hidden' value="${myPartnerInfo.partnerNo }" name='partnerNo'>
				<input type="button" onclick="modify(${myPartnerInfo.partnerNo})" value="수정" class='btn btn-dark'>
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

function changeImageWindow(partnerNo) {
	window.open('/partner/imageRegister.kh?partnerNo='+partnerNo+'', 'window', 'width=500, height=600, menubar=no, status=no, toolbar=no')
}

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


function modify(partnerNo) {
	if(confirm("수정 시 재승인 심사가 진행됩니다.")){
		return partnerForm.submit();
	}else{
		return false;
	}
}

$('.summernote').summernote({
	height : 300,
	lang : "ko-KR",
});


</script>

</body>
</html>