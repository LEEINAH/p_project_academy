<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Knit</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/mainpage.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>

	<!-- 네비게이션 바 (mainpage 상단) -->
	<nav class="nav">
		<div style="width: 10%;"></div>
		<a class="nav-link active" aria-current="page" href="#">로그인</a>
		<a class="nav-link" href="#">장바구니</a>
		<a class="nav-link" href="#">마이페이지</a>
		<a class="nav-link" href="#">Q&A</a>

	</nav>

	<!-- 상단 로고 -->
	<div class="text-center ">
		<a href="#" style="width: 170px; color: white;">
			<img src="/resources/logo/KnitLogo.jpg" class="rounded" alt="Knit Logo" style="display: inline-block; width: 200px; height: auto; margin:0 auto; padding: 10px 0px 0px 0px">
		</a>
		<div class="btn-group" role="group" aria-label="Basic outlined example">
		  <button type="button" class="btn btn-platform" onclick="location.href='http://localhost/index.jsp';">스토어</button>
		  <button type="button" class="btn btn-platform">커뮤니티</button>
		</div>
		
		<form class="d-flex" role="search">
	    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
		    <button class="btn searchbtn" type="submit">
		    	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
					<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
			  	</svg>
	        </button>
    	</form>
	</div>
	

	
	<!-- 메뉴 선택 -->
	<div class="menu-select">
		<ul class="menu-ul">
			<li class="menu-li"><a href="#" class="menu-a">자유게시판</a></li>
			<li class="menu-li"><a href="#" class="menu-a">뜨개 자랑 게시판</a></li>
		</ul>
	</div>
	
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
				BEST 뜨개 자랑
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