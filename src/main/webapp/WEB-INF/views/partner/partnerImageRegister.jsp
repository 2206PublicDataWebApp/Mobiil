<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파트너 프로필 사진 변경</title>
  <link rel="stylesheet" href="/resources/plugins/bootstrap/css/bootstrap.min.css">
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>


	<table align="center" class="table col-10 mb-3 borderless" >
		<tr>
			<td width='100px'>변경 전 </td>
			<td>
			   <img alt="본문이미지" src="/resources/images/partner/${partner.profileRename } " width = '50%'>
			 </td>
		<tr>
			<td width='100px' >변경 후 </td>
			<td>  <img id="preview" width='150px'/></td>
		</tr>
		<tr>	
			<td colspan='3'> <input type="file" name="uploadFile" id="uploadFile" onchange="readURL(this);" required="required"></td>
		</tr>
		<tr>	
			<input type='hidden' name="partnerNo" id="partnerNo" value = "${partner.partnerNo }">
			<td colspan='3' align='right'> <input  type="button" value="저장" class="btn btn-primary" id="iSubmit" onclick = "iSubmit()"></td>
		</tr>
				
				
	</table>

<script type="text/javascript">
function iSubmit() {
 if(confirm("수정 후에는 재심사가 진행됩니다. 수정하시겠습니까?")){
	var form = new FormData();
    form.append( "uploadFile", $("#uploadFile")[0].files[0] );
    form.append("partnerNo", $("#partnerNo").val());
    
     jQuery.ajax({
         url : "/partner/updateImage.kh"
       , type : "POST"
       , processData : false
       , contentType : false
       , data : form
       , success:function(data) {
    	   if(data == "success"){
	           alert("성공하였습니다.");
	           window.open('','_self').close();
	           opener.location.reload();
    	   }else{
				console.log("실패")    		   
    	   }
       }
       ,error: function() { 
           alert("이미지를 업로드하세요!"); 
       }
   });
 }	
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



</script>

</body>
</html>