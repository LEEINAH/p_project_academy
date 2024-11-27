<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Knit 상품 목록 페이지</title>
<link href="/resources/css/product.css" rel="stylesheet">
</head>

<script>
    function handleImageClick() {
        // JavaScript 동작 정의
        window.location.href = '<%=request.getContextPath()%>/product/productContent.aws';
    }
</script>





<body>
	
	<!-- header -->
	<jsp:include page="/WEB-INF/header/header.jsp" />
	
	<!-- 여백 -->
	<div style="height: 70px;"></div>
	
	<!-- 상품 종류 문구 -->
	<div class="product-option1-div">
		<h2 class="product-option1-h2">
			<span class="product-option1-span">
				뜨개실
			</span>
		</h2>
	</div>
	
	<!-- List -->
	<div class="product-list-main">
		<div class="list-top-rightdiv">
			<strong>150</strong>
			<span>Items</span>
		</div>
		<div class="list-top-leftdiv">
			<select>
				<option value="option1" selected>신상품 순</option>
				<option value="option2">가격 낮은순</option>
				<option value="option3">가격 높은순</option>
				<option value="option4">후기 많은순</option>
			</select>
		</div>
	</div>
	
	<div class="card-container" style="padding-bottom: 30px;">
		<li class="best-product-li">
			<div class="card">
				<img src="/resources/img/best_sample1.jpg" alt="상품 이미지" onclick="handleImageClick()">
			</div>
			<div class="card-content">
		        <h3 style="font-size: 17px; font-weight: bold; color: #424242;" onclick="handleImageClick()">베이비 알파카 실크모헤어</h3>
		        <hr style="width: 300px;">
		        <p>12,000원</p>
		    </div>
		</li>
		<li class="best-product-li">
			<div class="card">
				<img src="/resources/img/best_sample2.jpg" alt="상품 이미지" onclick="handleImageClick()">
			</div>
			<div class="card-content">
		        <h3 style="font-size: 17px; font-weight: bold; color: #424242;" onclick="handleImageClick()">밀라노 키드 모헤어</h3>
		        <hr style="width: 300px;">
		        <p>10,000원</p>
		    </div>
		</li>
		<li class="best-product-li">
			<div class="card">
				<img src="/resources/img/best_sample3.jpg" alt="상품 이미지" onclick="handleImageClick()">
			</div>
			<div class="card-content">
		        <h3 style="font-size: 17px; font-weight: bold; color: #424242;" onclick="handleImageClick()">몬디알 키드 모헤어</h3>
		        <hr style="width: 300px;">
		        <p>9,000원</p>
		    </div>
		</li>
		<li class="best-product-li">
			<div class="card">
				<img src="/resources/img/best_sample4.jpg" alt="상품 이미지" onclick="handleImageClick()">
			</div>
			<div class="card-content">
		        <h3 style="font-size: 17px; font-weight: bold; color: #424242;" onclick="handleImageClick()">버니</h3>
		        <hr style="width: 300px;">
		        <p>15,000원</p>
		    </div>
		</li>
	</div>
	
	<div class="card-container">
		<li class="best-product-li">
			<div class="card">
				<img src="/resources/img/best_sample1.jpg" alt="상품 이미지" onclick="handleImageClick()">
			</div>
			<div class="card-content">
		        <h3 style="font-size: 17px; font-weight: bold; color: #424242;" onclick="handleImageClick()">베이비 알파카 실크모헤어</h3>
		        <hr style="width: 300px;">
		        <p>12,000원</p>
		    </div>
		</li>
		<li class="best-product-li">
			<div class="card">
				<img src="/resources/img/best_sample2.jpg" alt="상품 이미지" onclick="handleImageClick()">
			</div>
			<div class="card-content">
		        <h3 style="font-size: 17px; font-weight: bold; color: #424242;" onclick="handleImageClick()">밀라노 키드 모헤어</h3>
		        <hr style="width: 300px;">
		        <p>10,000원</p>
		    </div>
		</li>
		<li class="best-product-li">
			<div class="card">
				<img src="/resources/img/best_sample3.jpg" alt="상품 이미지" onclick="handleImageClick()">
			</div>
			<div class="card-content">
		        <h3 style="font-size: 17px; font-weight: bold; color: #424242;" onclick="handleImageClick()">몬디알 키드 모헤어</h3>
		        <hr style="width: 300px;">
		        <p>9,000원</p>
		    </div>
		</li>
		<li class="best-product-li">
			<div class="card">
				<img src="/resources/img/best_sample4.jpg" alt="상품 이미지" onclick="handleImageClick()">
			</div>
			<div class="card-content">
		        <h3 style="font-size: 17px; font-weight: bold; color: #424242;" onclick="handleImageClick()">버니</h3>
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