<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Mobbil Space</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<style type="text/css">

input[type=text]{
	border-width:1px;
}
.sort{
	display:flex;
	justify-content: space-between;
	text-align:right;
	width:1140px;
	margin: 0 auto;
	margin-top:50px;
	margin-bottom:30px;
}
.aSort{
	margin-left: 15px;
}
.img-responsive{
	width:100%;
	height:100%;
}
</style>
</head>

<body id="body">
<jsp:include page="../../views/common/menubar.jsp"></jsp:include>
<div class="sort">
<form action="/space/spacePrice.kh" method="get" style='padding-top:15px;'>
<input type="text" class="searchText" name="minNum" value="${minNum }" style="height:24px;width:70px;">원 ~ 
<input type="text" class="searchText" name="maxNum" value="${maxNum }" style="height:24px;width:70px;">원
<input type="submit" value="검색"  class='btn' style='padding:2px;'>
</form>
<form action="/space/spaceArea.kh" method="get" style=''>
	<input type="submit" name="searchArea" value="전체" class='btn'>
	<input type="submit" name="searchArea" value="강동" class='btn'>
	<input type="submit" name="searchArea" value="강서" class='btn'>
	<input type="submit" name="searchArea" value="강남" class='btn'>
	<input type="submit" name="searchArea" value="강북" class='btn'>
</form>
<div style='margin-right: left;padding-top:15px;'>
<a class='aSort' style='cursor: pointer; text-align:left;' onclick='asc()'>최신순</a>
<a class='aSort' style='cursor: pointer; text-align:left;' onclick='heart()'>찜많은순</a>
<a class='aSort' style='cursor: pointer; text-align:left;' onclick='review()'>리뷰많은순</a>
</div>
</div>
<section class="products section" style='padding-top:30px;'>
	<div class="container">
	<!-- 썸네일 1개당 영역 시작-->
	<c:forEach items='${sList }' var='space'>
	<div class="col-md-4">
			<div class="product-item">
				<div class="product-thumb">
					<img class="img-responsive" src="../../../resources/spaceuploadFiles/${space.spaceImg.spaceFileRename }" alt="product-img">
					<span class="bage">${space.spaceArea }</span>
					<div class="preview-meta">
						<ul>
							<li>
								<span  data-toggle="modal" data-target="#product-modal">
									<a href="/space/spaceDetail.kh?spaceNo=${space.spaceNo }" ><i class="tf-ion-ios-search-strong"></i></a>
								</span>
							</li>
						</ul>
                     </div>
				</div>
			<div class="product-content">
					<h4><a href="/space/spaceDetail.kh?spaceNo=${space.spaceNo }">${space.spaceName }</a></h4>
					<p class="price">${space.spacePrice }원</p>

			</div>
		</div>
	</div>
	</c:forEach>
		<!-- 썸네일 1개당 영역 끝-->
	<!-- 페이징 -->
		<table align="center" class="table col-10 table-borderless" width="100%">
		<tr align='center' height="20">
		<td align='center'>
		<ul class="pagination justify-content-center">
			<c:if test="${paging.currentPage != 1 }">
			<li class="page-item"><a class="page-link" href='/space/${urlVal }.kh?page=${paging.currentPage - 1 }&searchArea=${searchArea }&searchValue=${searchValue }&minNum=${maxNum}&maxNum=${maxNum}'>이전</a>
			</li>
			</c:if>
			<c:forEach var='p' begin="${paging.startNavi }" end="${paging.endNavi }">
				<c:if test="${paging.currentPage eq p}">
				<li class="page-item disabled"><a class="page-link" href='#' >${p }</a></li>
				</c:if>
				<c:if test="${paging.currentPage ne p}">
				<li class="page-item"><a class="page-link"  href="/space/${urlVal }.kh?page=${p }&searchArea=${searchArea }&searchValue=${searchValue }&minNum=${minNum}&maxNum=${maxNum}">${p }</a>
				</li>
				</c:if>
			</c:forEach>
			
			<c:if test="${paging.currentPage <paging.maxPage }">
			<li class="page-item"><a class="page-link"  href='/space/${urlVal }.kh?page=${paging.currentPage + 1 }&searchArea=${searchArea }&searchValue=${searchValue }&minNum=${minNum}&maxNum=${maxNum}'>다음</a>
			</li>
			</c:if>
		</ul>
		</td>
		</tr>
	</table>
	</div>
	<div id='search' style='text-align:center;'>
	<form action="/space/spaceSearch.kh" method="get">
	<select name="searchArea" >
		<option value="전체" <c:if test="${searchArea eq '전체'}">selected</c:if>>전체</option>
		<option value="강북" <c:if test="${searchArea eq '강북'}">selected</c:if>>강북</option>
		<option value="강남" <c:if test="${searchArea eq '강남'}">selected</c:if>>강남</option>
		<option value="강동" <c:if test="${searchArea eq '강동'}">selected</c:if>>강동</option>
		<option value="강서" <c:if test="${searchArea eq '강서'}">selected</c:if>>강서</option>
	</select>
	<input type="text" name="searchValue" class="searchText" value="${searchValue }" style="height:24px;">
	<input type="submit" value="검색" class="btn">
</form>
</div>
</section>

<jsp:include page="../../views/common/footer.jsp"></jsp:include>
<script type="text/javascript">
	function heart(){
		$.ajax({
			url: '/space/heartDesc.kh',
			type: 'get',
			data: {"page":"${p }"},
			success: function(){
				location.href='/space/heartDesc.kh?page=${p }&searchArea=${searchArea }&searchValue=${searchValue }&minNum=${minNum}&maxNum=${maxNum}';
			}
			
		})
	}
	
	function review(){
		$.ajax({
			url: '/space/reviewDesc.kh',
			type: 'get',
			data: {"page":"${p }"},
			success: function(){
				location.href='/space/reviewDesc.kh?page=${p }&searchArea=${searchArea }&searchValue=${searchValue }&minNum=${minNum}&maxNum=${maxNum}';
			}
			
		})
	}
	
	function asc(){
		var area = '${searchArea}';
		var minNum = '${minNum}';
		var maxNum = '${maxNum}';
		if(area != '' && minNum == '' && maxNum == ''){
			location.href='/space/spaceArea.kh?searchArea='+area;			
		}
		if(area == '' && minNum != '' || maxNum != ''){
			location.href='/space/spaceArea.kh?searchArea='+area;	
		}
		
	}
</script>
</body>
</html>