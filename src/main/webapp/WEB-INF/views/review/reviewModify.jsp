<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
 <style>
         .header {
            text-align: center;
            margin-top: 50px;
        }
     
         .span {
            text-align: center;
            font-size: 15px;
            cursor: pointer;
        }
        
        .tb {
            margin-left:auto;
			margin-right:auto;
        	width: 700px; 
			
        }

		.title {
		     text-align : center;
/*    			 background-color:rgb(241, 234, 248); */
        }

        .input {              
/*           	font-size: 50px; */
        	width: 400px; 
          	border: none;            
        }
	
    </style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
<jsp:include page="../common/menubar.jsp"></jsp:include>
<div class="header">
        <div class="span">
            <span onclick="location.href='/member/myInfo.kh'">My 정보 수정</span> 
            <span> | </span>
            <span onclick="location.href='#'">찜한 공간 보기</span> 
            <span> | </span> 
            <span onclick="location.href='/payment/list.kh'"><b>결제 내역 보기</b></span>
            <span> | </span> 
            <span onclick="location.href='/partner/myPartnerInfo.kh?memberEmail=${loginUser.memberEmail}'">내 파트너 정보</span>
        </div>
</div>
        <br><br><br>
	<form name="review_modify" action="/review/modify.kh" method="post" enctype="multipart/form-data" >
	<input type="hidden" name="reviewImgNo" value="${review.reviewImgNo}">
	<table border="1" class="tb">
		<tr>
			<th class="title" width="100">공간명</th>
			<td><input type="text" class="input" id="" name="spaceName" value="${review.spaceName}" readonly></td>
		</tr>	
		<tr>
			<th class="title" width="">작성자</th>
			<td><input type="text" class="input" id="name" name="reviewWriter" value="${loginUser.memberName}" readonly></td>
		</tr>
		<tr>
			<th class="title" width="">내용</th>
			<td><textarea cols="85" rows="10" style="border:none" name="reviewContents" required>${review.reviewContents}</textarea></td>
		</tr>	
 		<tr class="add">
			<th class="title" width="">사진첨부</th>
			<td>
				<input multiple="multiple" type="file" class="file" name="uploadFile" accept=".jpg, .jpeg, .png">
<!-- 				<a>사진name</a> -->
				<input type="button" value="추가" onclick="addFile();">
				<input type="button" value="삭제" onclick="delFile();">
<!-- 				<img id="preview" style="width:150px; height:150px; display: none;" > -->
			</td>
		</tr>	
		<tr>
			<td colspan="2">
			<div align="right">
				<button type="submit" class="btn btn-info">수정 완료</button>
				<button type="button" onclick="location.href='/payment/list.kh';" class="btn btn-secondary">목록으로</button>
				<button type="button" onclick="location.href='javascript:history.go(-1)';" class="btn btn-danger">이전 페이지로</button>
			</div>
			</td>
		</tr>
	</table>
	</form>
	<script>
 	var maxFile = 1;
 	
	function addFile() {
		if(maxFile >= 5) {
	 	      alert("이미지 업로드 최대 개수는 5개입니다.");
	 	      return;
		}else{ 
			$("input").last().after("<input type = 'file'>");
			 maxFile ++;
		}
	}
	
	function delFile() {
		var inputFile = $("input[type=file]")
		if(inputFile.length > 1) {
			$("input").last().remove();
		}
	} 

	</script>
	<br><br><br>
  <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>