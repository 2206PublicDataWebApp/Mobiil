<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
input[type=text] {
	border-width: 1px;
}

.sort {
	text-align: right;
	width: 1080px;
	margin: 0 auto;
}

.aSort {
	margin-left: 15px;
}

.mySpace {
    text-align: center;
    margin-top: 50px;
}
        
.span {
	text-align: center;
	font-size: 15px;
	cursor: pointer;
}
</style>
<meta charset="UTF-8">
<title>찜한 공간</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	<div class="mySpace">
		<div class="span">
		<c:if test="${loginUser.kakaoStatus eq 'N' }">
			<span onclick="location.href='/member/myInfo.kh'">My 정보 수정</span>
		</c:if>
		<c:if test="${loginUser.kakaoStatus eq 'Y' }">
			<span onclick="location.href='/member/myKakaoInfo.kh'">My 정보 수정</span>
		</c:if>		 
            <span> | </span>
            <span onclick="location.href='/member/mySpaceList.kh'"><b>찜한 공간 보기</b></span> 
            <span> | </span> 
            <span onclick="location.href='/payment/list.kh'">결제 내역 보기</span>
            <span> | </span> 
            <span onclick="location.href='/partner/myPartnerInfo.kh?memberEmail=${loginUser.memberEmail}'">내 파트너 정보</span>
		</div>
	<br>
	<br>
	<br>
	<section class="products section">
		<div class="container">
			<!-- 썸네일 1개당 영역 시작-->
			<c:if test="${!empty sList}">
				<c:forEach items="${sList}" var="space" varStatus="i">
					<div class="col-md-4">
						<div class="product-item">
							<div class="product-thumb">
								<img class="img-responsive"
									src="../../../resources/spaceuploadFiles/${space.spaceImg.spaceFileRename}"
									alt="product-img">
								<span class="bage">${i.count} / ${space.spaceArea}</span>
								<div class="preview-meta">
									<ul>
										<li><span data-toggle="modal"
											data-target="#product-modal"> <a
												href="/space/spaceDetail.kh?spaceNo=${space.spaceNo}"><i
													class="tf-ion-ios-search-strong"></i></a>
										</span></li>
									</ul>
								</div>
							</div>
							<div class="product-content">
								<h4>
									<a href="/space/spaceDetail.kh?spaceNo=${space.spaceNo}">${space.spaceName}</a>
								</h4>
								<p class="price">${space.spacePrice}원</p>
							</div>
						</div>
					</div>
				</c:forEach>
				<table align="center" class="table col-10 table-borderless" width="100%">
				<tr align="center" height="20">
					<td><c:if test="${currentPage != 1 }">
							<a href="/member/mySpaceList.kh?page=${currentPage - 1 }"
								class="btn btn-primary"><</a>
						</c:if> <c:forEach var="p" begin="${startNavi }" end="${endNavi }">
							<c:if test="${currentPage eq p }">
								<b class="btn btn-primary">${p }</b>
							</c:if>
							<c:if test="${currentPage ne p }">
								<a href="/member/mySpaceList.kh?page=${p }"
									class="btn btn-light">${p }</a>
							</c:if>
						</c:forEach> <c:if test="${maxPage > currentPage }">
							<a href="/member/mySpaceList.kh?page=${currentPage + 1 }"
								class="btn btn-primary">></a>
						</c:if></td>
				</tr>
				</table>
		</div>
		</c:if>
		<c:if test="${empty sList }">
			<tr>
				<td align="center"><h4><b>찜한 공간이 존재하지 않습니다.</b></h4></td>
			</tr>
		</c:if>
	</section>
	</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>