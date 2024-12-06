<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.myaws.myapp.domain.*" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Knit 상품 목록 페이지</title>
<link href="/resources/css/product.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<script>
$('#sortOption').change(function () {
    const sortOption = $(this).val();
    const categoryCode = $('#category_code').val();

    console.log("Ajax 요청 시작"); // 디버깅 메시지

    $.ajax({
        url: '/product/productList.aws',
        type: 'GET',
        data: {
            category_code: categoryCode,
            sortOption: sortOption
        },
        success: function (response) {
            console.log("Ajax 요청 성공:", response); // 서버 응답 출력
            $('#productList').html(response); // 응답 데이터를 리스트에 삽입
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.error("Ajax 요청 실패:", textStatus, errorThrown); // 에러 출력
        }
    });
});
</script>
	
	<!-- header -->
	<jsp:include page="/WEB-INF/header/header.jsp" />
	
	<!-- 여백 -->
	<div style="height: 70px;"></div>
	
	<!-- 상품 종류 문구 -->
	<div class="product-option-div">
		<h2 class="product-option-h2" style="font-size: 25px; font-weight: 600; color: #1d1d1f; padding-left: 385px; padding-bottom: 50px;">
			<span class="product-option-span">
				<c:if test="${category_code == 0}">
					'${pm.scri.keyword}' 의 검색 결과
				</c:if>
				<c:if test="${category_code == 1}">
					뜨개실
				</c:if>
				<c:if test="${category_code == 2}">
					단추/라벨/부자재
				</c:if>
				<c:if test="${category_code == 3}">
					바늘/도구
				</c:if>
			</span>
		</h2>
	</div>
	
	<!-- List -->
	<div class="product-list-main">
		<div class="list-top-rightdiv">
			<strong>${cnt}</strong>
			<span>Items</span>
		</div>
		<div class="list-top-leftdiv">
			<select id="sortOption">
				<option value="option1" selected>신상품 순</option>
				<option value="option2">가격 낮은 순</option>
				<option value="option3">가격 높은 순</option>
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
			<a href="${pageContext.request.contextPath}/product/productList.aws?category_code=${category_code}&page=${pm.startPage-1}&${queryParam}">◁</a>
			</li>
		</c:if>
		
		<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
			<li <c:if test="${i == pm.scri.page}">class='on'</c:if> >
			<a href="${pageContext.request.contextPath}/product/productList.aws?category_code=${category_code}&page=${i}&${queryParam}">${i}</a>
			</li>
		</c:forEach>
		
		<c:if test="${pm.next&&pm.endPage>0}">
			<li><a href="${pageContext.request.contextPath}/product/productList.aws?category_code=${category_code}&page=${pm.endPage+1}&${queryParam}">▷</a></li>
		</c:if>
		
	
		</ul>
		
	</div>
	
	
	<!-- 하단 공간 띄우기 -->
	<div style="height: 300px;"></div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/footer/footer.jsp" />
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>