<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Knit</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/mainpage.css" rel="stylesheet">
</head>
<body>
	
	<!-- header -->
	<jsp:include page="/WEB-INF/header/header.jsp" />
	
	<!-- 중앙 배너 -->
	<div id="carouselExampleIndicators" class="carousel slide">
		<div class="carousel-indicators">
		  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
		  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
		  <div class="carousel-item active">
		    <img src="/resources/img/banner1.jpg" class="d-block w-100" alt="...">
		  </div>
		  <div class="carousel-item">
		    <img src="/resources/img/banner2.jpg" class="d-block w-100" alt="...">
		  </div>
		  <div class="carousel-item">
		    <img src="/resources/img/banner3.jpg" class="d-block w-100" alt="...">
		  </div>
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
		  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		  <span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
		  <span class="carousel-control-next-icon" aria-hidden="true"></span>
		  <span class="visually-hidden">Next</span>
		</button>
	</div>
	
	<div style="height: 70px;"></div>
	
	<!-- BEST 상품 -->
	<div class="best-product-main">
		<h2>
			<span class="best-product-span">
				BEST 한눈에 보기
				<p></p>
			</span>
		</h2>
	</div>
	
	<div class="card-container">
		<li class="best-product-li">
			<div class="card">
				<img src="/resources/img/best_sample1.jpg" alt="상품 이미지">
			</div>
			<div class="card-content">
		        <h3 style="font-size: 17px; font-weight: bold; color: #424242;">베이비 알파카 실크모헤어</h3>
		        <hr style="width: 300px;">
		        <p>12,000원</p>
		    </div>
		</li>
		<li class="best-product-li">
			<div class="card">
				<img src="/resources/img/best_sample2.jpg" alt="상품 이미지">
			</div>
			<div class="card-content">
		        <h3 style="font-size: 17px; font-weight: bold; color: #424242;">밀라노 키드 모헤어</h3>
		        <hr style="width: 300px;">
		        <p>10,000원</p>
		    </div>
		</li>
		<li class="best-product-li">
			<div class="card">
				<img src="/resources/img/best_sample3.jpg" alt="상품 이미지">
			</div>
			<div class="card-content">
		        <h3 style="font-size: 17px; font-weight: bold; color: #424242;">몬디알 키드 모헤어</h3>
		        <hr style="width: 300px;">
		        <p>9,000원</p>
		    </div>
		</li>
		<li class="best-product-li">
			<div class="card">
				<img src="/resources/img/best_sample4.jpg" alt="상품 이미지">
			</div>
			<div class="card-content">
		        <h3 style="font-size: 17px; font-weight: bold; color: #424242;">버니</h3>
		        <hr style="width: 300px;">
		        <p>15,000원</p>
		    </div>
		</li>
	</div>
	
	<!-- 하단 공간 띄우기 -->
	<div style="height: 300px;"></div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/footer/footer.jsp" />
	
</body>
</html>