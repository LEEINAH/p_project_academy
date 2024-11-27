<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Knit 상품 상세 페이지</title>
<link href="/resources/css/product.css" rel="stylesheet">
</head>
<body>

	<!-- header -->
	<jsp:include page="/WEB-INF/header/header.jsp" />
	
	<!-- 상품 정보 -->
	<ul class="product-content-main">
		<li>
			<div class="product-img">
				<img src="/resources/img/product_detail1.PNG">
			</div>
		</li>
		<li>
			<div class="product-content">
				<!-- 제품 정보와 이미지를 포함하는 컨테이너 -->
				<div class="product-container">
				  <!-- 오른쪽 제품 정보를 담은 영역 -->
				  <div class="product-info">
				    <!-- 제품 제목 -->
				    <h1 class="product-title">메리노 코튼</h1>
				
				    <!-- 제품 설명 -->
				    <p class="product-description">
				      [해외배송 가능상품]
				    </p>
					<hr style="border-bottom: 0px solid lightgray;">
				    <!-- 제품 세부 정보를 담은 영역 -->
				    <div class="product-details">
				      <!-- 미니샵 정보 -->
				      <p><span class="label">미니샵</span><span class="shop-name">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Knit</span></p>
				      <!-- 판매 가격 -->
				      <p><span class="label">판매가</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;9,000원</p>
				      <!-- 브랜드 정보 -->
				      <p><span class="label">브랜드</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Knit</p>
				      <!-- 배송비 정보 -->
				      <p><span class="label">배송비</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3,000원</p>
				      <hr style="border-bottom: 0px solid lightgray;">
				      <!-- 색상 선택 드롭다운 메뉴 -->
				      <p><span class="label" style="font-size: 18px;">색상 (1볼)</span> 
				      	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				        <select>
				          <option>[필수] 옵션을 선택해 주세요</option>
				          <!-- 색상 옵션들이 추가될 부분 -->
				          <option value="white">white</option>
				          <option value="skyblue">skyblue</option>
				          <option value="green">green</option>
				        </select>
				      </p>
				      <hr style="border-bottom: 0px solid lightgray;">
				      
				      <div style="text-align: right; font-weight: 600; font-size: 17px;">TOTAL : 
				      <a style="text-align: right; font-weight: bold; font-size: 25px;">0</a>
				      <a style="font-weight: normal;">(<span>0</span>개)</a>
				      </div>
				      
				      <ul style="display: flex; padding-top: 20px;">
				      	<li style="width: 20%; height: 50px; padding-right: 10px;"><button  style="width: 100%; height: 100%;">장바구니</button></li>
				      	<li style="width: 80%; height: 50px;"><button  style="width: 100%; height: 100%;">바로 구매</button></li>
				      </ul>
				      
				      
				      
				      
				      
				      
				      
				      
				    </div>
				  </div>
				</div>
			</div>
		</li>
	</ul>
	
	
</body>
</html>