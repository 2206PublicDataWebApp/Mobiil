<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

</head>

<body id="body">

<jsp:include page="../../views/common/menubar.jsp"></jsp:include>
<body>

<section class="products section">
	<div class="container">
	<!-- 썸네일 1개당 영역 시작-->
	<c:forEach items='${sList }' var='space'>
	<div class="col-md-4">
			<div class="product-item">
				<a href="/space/spaceDetail?spaceNo=${space.spaceNo }">${space.spaceName }</a>
				${space.spaceImg.spaceFileRename }
				<div class="product-thumb">
					<span class="bage">Sale</span><!-- 필요없으면 떼면 됨 -->
					<img class="img-responsive" src="/resources/images/board/products/product-1.jpg" alt="product-img" /><!-- 이미지 불러올때 경로 잘 설정하기 -->
					<div class="preview-meta">
						<ul>
							<li>
								<span  data-toggle="modal" data-target="#product-modal">
									<i class="tf-ion-ios-search-strong"></i>
								</span>
							</li>
							<li>
		                        <a href="#!" ><i class="tf-ion-ios-heart"></i></a> <!-- 찜하기로 쓰라고 냅둠 -->
							</li>
						</ul>
                     </div>
				</div>
			<div class="product-content">
					<h4><a href="#">공간 이름</a></h4>
					<p class="price">상호명? 필요없음 떼면됨</p>
			</div>
		</div>
	</div>
	</c:forEach>
		<!-- 썸네일 1개당 영역 끝-->
		
		
	</div>
</section>

<jsp:include page="../../views/common/footer.jsp"></jsp:include>

</body>
</html>