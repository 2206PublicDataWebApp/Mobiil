<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세</title>
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
            <span onclick="location.href='/payment/list.kh'"><b>결제 내역 보기</b></span>
            <span> | </span> 
            <span onclick="location.href='/partner/myPartnerInfo.kh?memberEmail=${loginUser.memberEmail}'">내 파트너 정보</span>
        </div>
</div>
<br><br><br>

<div class="container">
<div class="table-responsive">
	<input type="hidden" name="reviewNo" value="${reviewNo}">
	<table align="center" width="500" border="1" class="table table-bordered">
		${reservation.reservationNo},${reservationNo},${reviewNo},${spaceNo}
		<tr>
			<td id="cl" align="center" width="150">공간명</td>
			<td>${review.spaceName}</td>
		</tr>
		<tr>
			<td id="cl" align="center" width="150">작성자</td>
			<td>${review.reviewWriter}</td>
		</tr>
		<tr>
			<td id="cl" align="center" width="150">내용</td>
			<td>${review.reviewContents}</td>
		</tr>
		<tr>
			<td id="cl" align="center" width="150">첨부파일</td>
			<td>
		 		<img alt="본문이미지1" src="/resources/reviewFiles/${rList[0].reviewFileRename }" width="200" height="200">
		 		<img alt="본문이미지2" src="/resources/reviewFiles/${rList[1].reviewFileRename }" width="200" height="200">
				<img alt="본문이미지3" src="/resources/reviewFiles/${rList[2].reviewFileRename }" width="200" height="200">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button onclick="" class="btn btn-info">공간 페이지의 리뷰 보러가기</button>
				<button onclick="location.href='/review/modifyView.kh?reviewNo=${review.reviewNo }&page=${page}';" class="btn btn-info">수정</button>
				<button onclick="location.href='/review/remove.kh?reviewNo=${review.reviewNo}';" class="btn btn-danger" >삭제</button>
		</tr>
	</table>
</div>
</div>	
<script>
// 		function reviewRemove(page) {
// 			event.preventDefault(); // 하이퍼링크 이동 방지
// 			if(confirm("작성하신 리뷰를 정말 삭제하시겠습니까?")) {
// 				location.href="/review/remove.kh";
// 			}
// 		}
</script>
	<br><br><br>
  <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>