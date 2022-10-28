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

</head>
<body>
<jsp:include page="../common/menubar.jsp"></jsp:include>
<div class="header">
        <div class="span">
            <span onclick="location.href='/member/myInfo.kh'">My 정보 수정</span> 
            <span> | </span>
            <span onclick="location.href='#'">찜한 공간 보기</span> 
            <span> | </span> 
            <span onclick="location.href='/review/writeView.kh'"><b>리뷰 작성</b></span>
            <span> | </span> 
            <span onclick="location.href='/partner/myPartnerInfo.kh?memberEmail=${loginUser.memberEmail}'">내 파트너 정보</span>
        </div>
</div>
        <br><br><br>
	<form name="review_form" action="/review/register.kh" method="post" enctype="multipart/form-data" >
	<input type="hidden" name="memberEmail" value="${loginUser.memberEmail}">
<%-- 	<input type="hidden" name="spaceNo" value="${}"> --%>
	<table border="1" class="tb">
		<tr>
			<th class="title" width="100">공간명</th>
			<td><input type="text" class="input" id="" name="spaceName" value="" readonly></td>
		</tr>	
		<tr>
			<th class="title" width="">작성자</th>
			<td><input type="text" class="input" id="name" name="reviewWriter" value="${loginUser.memberName}" readonly></td>
		</tr>
		<tr>
			<th class="title" width="">내용</th>
			<td><textarea cols="85" rows="10" style="border:none" name="reviewContents" placeholder="리뷰를 입력하세요" required></textarea></td>
		</tr>	
 		<tr>
			<th class="title" width="">사진첨부</th>
			<td><input type="file" class="input" id="" name="uploadFile" value="" readonly></td>
		</tr>	
		<tr>
			<td colspan="2">
			<div align="right">
				<button type="submit" class="btn btn-info">등록</button>
				<button type="reset" class="btn btn-danger">초기화</button>
				<button type="button" onclick="location.href='javascript:history.go(-1)';" class="btn btn-secondary">이전 페이지로</button>
			</div>
			</td>
		</tr>
	</table>
	</form>
	<br><br><br>
  <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>