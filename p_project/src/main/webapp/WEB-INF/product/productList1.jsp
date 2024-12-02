<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.myaws.myapp.domain.*" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        window.location.href = '${pageContext.request.contextPath}/product/productContent.aws?product_key=${pv.product_key}';
    }
</script>

<body>
	
	<!-- header -->
	<jsp:include page="/WEB-INF/header/header.jsp" />
	
	<!-- 여백 -->
	<div style="height: 70px;"></div>
	
	<!-- 상품 종류 문구 -->
	<div class="product-option-div">
		<h2 class="product-option-h2" style="font-size: 25px; font-weight: 600; color: #1d1d1f; padding-left: 385px; padding-bottom: 50px;">
			<span class="product-option-span">
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
		<c:forEach items="${plist}" var="pv" varStatus="status">
			<li class="best-product-li">
				<div class="card">
					<a href="${pageContext.request.contextPath}/product/productContent.aws?product_key=${pv.product_key}">
					<img src="${pageContext.request.contextPath}/product//displayFile.aws?fileName=${pv.product_s_img}">
					</a>
				</div>
				<div class="card-content">
			        <a href="${pageContext.request.contextPath}/product/productContent.aws?product_key=${pv.product_key}" style="font-size: 17px; font-weight: bold; color: #424242;">${pv.product_name}</a>
			        <hr style="width: 300px;">
			        <p>${pv.product_price}원</p>
			    </div>
			</li>
		</c:forEach>
	</div>
	
	<c:set var="queryParam" value="keyword=${pm.scri.keyword}&searchType=${pm.scri.searchType}"></c:set>
	<div class="page">
	
		<ul>
		
		<c:if test="${pm.prev==true}">
			<li>
			<a href="${pageContext.request.contextPath}/product/productList1.aws?page=${pm.startPage-1}&${queryParam}">◁</a>
			</li>
		</c:if>
		
		<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
			<li <c:if test="${i == pm.scri.page}">class='on'</c:if> >
			<a href="${pageContext.request.contextPath}/product/productList1.aws?page=${i}&${queryParam}">${i}</a>
			</li>
		</c:forEach>
		
		<c:if test="${pm.next&&pm.endPage>0}">
			<li><a href="${pageContext.request.contextPath}/product/productList1.aws?page=${pm.endPage+1}&${queryParam}">▷</a></li>
		</c:if>
	
		</ul>
		
	</div>
	
	
	<!-- 하단 공간 띄우기 -->
	<div style="height: 300px;"></div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/footer/footer.jsp" />
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>