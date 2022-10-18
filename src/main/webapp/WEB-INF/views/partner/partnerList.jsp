<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<div class="col-md-4">
			<div class="product-item">
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
		                        <a href="#!" ><i class="tf-ion-ios-heart"></i></a>
							</li>
						</ul>
                     </div>
				</div>
			<div class="product-content">
					<h4><a href="#">콘텐츠 제목</a></h4>
					<p class="price">파트너 이름</p>
			</div>
		</div>
	</div>
		<!-- 썸네일 1개당 영역 끝-->
		
		
	</div>
</section>

<jsp:include page="../../views/common/footer.jsp"></jsp:include>

</body>
</html>