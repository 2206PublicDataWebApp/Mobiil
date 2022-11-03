<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
</head>
<title>Mobiil Partner</title>

<body id="body">

<jsp:include page="../../views/common/menubar.jsp"></jsp:include>
<body>

<section class="products section">
	<div class="container">
	
	
	
	<c:if test="${!empty pList }">
	<!-- 썸네일 1개당 영역 시작-->
	<c:forEach items='${pList }' var='partner'>
	<div class="col-md-4">
			<div class="product-item">
				<div class="product-thumb" >
					<span class="bage">${partner.area }</span><!-- 필요없으면 떼면 됨 -->
					<img class="img-responsive" src="/resources/images/partner/${partner.profileRename } " alt="파트너 얼굴" /><!-- 이미지 불러올때 경로 잘 설정하기 -->
					<div class="preview-meta">
						<ul>
							<li>
								<span data-toggle="modal" data-target="#product-modal">
									<a href="#" onclick="openChatRoom('${loginUser.memberNick}', '${partner.memberNick }');"><img src="/../../resources/images/chat.png"></a>
								</span>
							</li>
							<li>
								<span data-toggle="modal" data-target="#product-modal">
									<a href="/partner/detail.kh?partnerNo=${partner.partnerNo }"><img src="/../../resources/images/zoomin.png"></a>
								</span>
							</li>
						</ul>
                     </div>
				</div>
			<div class="product-content">
					<h4><a href="/partner/detail.kh?partnerNo=${partner.partnerNo }">${partner.title }</a></h4>
					<p class="price">${partner.memberNick }</p>
					<p class="price">${partner.instrument }</p>
			</div>
			
		</div>
	</div>
	</c:forEach>
	<!-- 썸네일 1개당 영역 끝-->
	</c:if>
	
	<c:if test="${empty pList }">
		<span>검색 결과가 없습니다</span>
	</c:if>
	
	<!-- 페이징 -->
		<table align="center" class="table col-10 table-borderless" width="100%">
		<tr align='center' height="20">
		<td align='center'>
		<ul class="pagination justify-content-center">
			<c:if test="${paging.currentPage != 1 }">
			<li class="page-item"><a class="page-link" href='/partner/${urlVal }.kh?page=${paging.currentPage - 1 }&searchArea=${sp.searchArea }&searchCondition=${sp.searchCondition }&searchValue=${sp.searchValue }'>이전</a>
			</li>
			</c:if>
			
			<c:forEach var='p' begin="${paging.startNavi }" end="${paging.endNavi }">
				<c:if test="${paging.currentPage eq p}">
					<li class="page-item disabled"><a class="page-link" href='#' >${p }</a></li>
				</c:if>
				<c:if test="${paging.currentPage ne p}">
					<li class="page-item"><a class="page-link"  href="/partner/${urlVal }.kh?page=${p }&searchArea=${sp.searchArea }&searchCondition=${sp.searchCondition }&searchValue=${sp.searchValue }">${p }</a>
				</li>
				</c:if>
			</c:forEach>
			
			<c:if test="${paging.currentPage <paging.maxPage }">
			<li class="page-item"><a class="page-link"  href='/partner/${urlVal }.kh?page=${paging.currentPage + 1 }&searchArea=${sp.searchArea }&searchCondition=${sp.searchCondition }&searchValue=${sp.searchValue }'>다음</a>
			</li>
			</c:if>
		</ul>
		</td>
		</tr>
	</table>
	
	<!-- 검색 영역-->
	<div id='search'>
		<form action="/partner/search.kh" method="get" >
			<table align="center" class="table col-10 table-borderless" width="100%">
				<tr align='center' height="20">
					<td>
						<select class="form-select" name="searchCondition" >
							<option <c:if test="${search.searchCondition eq 'all'}">selected</c:if> value="all">전체</option>
							<option <c:if test="${search.searchCondition eq 'title'}">selected</c:if> value="title">제목</option>
							<option <c:if test="${search.searchCondition eq 'contents'}">selected</c:if> value="contents">내용</option>
							<option <c:if test="${search.searchCondition eq 'instrument'}">selected</c:if> value="instrument">악기</option>
						</select>
						<select class="form-select" name="searchArea" >
							<option <c:if test="${search.searchArea eq '서울'}">selected</c:if> value="서울">서울</option>
							<option <c:if test="${search.searchArea eq '강북'}">selected</c:if> value="강북">강북</option>
							<option <c:if test="${search.searchArea eq '강남'}">selected</c:if> value="강남">강남</option>
							<option <c:if test="${search.searchArea eq '강동'}">selected</c:if> value="강동">강동</option>
							<option <c:if test="${search.searchArea eq '강서'}">selected</c:if> value="강서">강서</option>
						</select>
					</td>
					<td>
						<input class='form-control' type="text" name="searchValue" placeholder="검색"  value="${search.searchValue }">
					</td>
					<td>
						<input type="submit" value="검색" class="btn btn-dark">
					</td>
		</tr>
		</table>
		</form>
	</div>
	
	</div>
</section>


<jsp:include page="../../views/common/footer.jsp"></jsp:include>


<script type="text/javascript">
function openChatRoom(createUser, withUser) {
	
	if(confirm("채팅을 시작하시겠습니까?")){
		$.ajax({
			url:"/chat/createChatRoom.kh",
			tyep: "get",
			data: {createUser: createUser,
					withUser:withUser},
			success:
				function(data) {
					if(data == "already"){
						alert("이미 생성된 채팅방입니다");
						window.open('/chat/chatWindow.kh?memberNick='+createUser+'', 'window', 'width=500, height=700, menubar=no, status=no, toolbar=no');
					}else if(data == "success"){
						alert("채팅이 시작됩니다.");
						window.open('/chat/chatWindow.kh?memberNick='+createUser+'', 'window', 'width=500, height=700, menubar=no, status=no, toolbar=no');
					}else if(data == "needRegist"){
						alert("파트너 등록이 필요합니다");
						location.href = "/member/myInfo.kh"
					}else{
						alert("실패")
					}
				},
			error:
				function() {
					alert("에러")
				},
		})
	}
}

</script>
</body>
</html>