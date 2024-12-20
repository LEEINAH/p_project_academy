<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.myaws.myapp.domain.*" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 메세지 출력 -->
<c:set var="msg" value="${msg}" />
<c:if test="${!empty msg}">
    <script>alert('${msg}');</script>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Knit 상품 상세 페이지</title>
<link href="/resources/css/product.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script> 
<!-- jquery CDN 주소 -->
</head>

<script>
    // 장바구니 버튼 클릭 시 실행될 함수
    
    function cartSave() {
    	
    	var fm = document.cartfrm;
    	fm.action = "/cart/cartInsert.aws?product_key=${pv.product_key}"; 
    	// 가상 경로 지정 action은 처리하는 의미
    	fm.method = "post";
    	fm.submit();
    	
    	return;
    }    
    
    $.productReviewList = function () { 
    	
    	let block = $("#block").val();
    	
    	$.ajax({
    		type : "get", // 전송 방식
    		url : "${pageContext.request.contextPath}/qnrBoard/${pv.product_key}/"+block+"/reviewList.aws",
    		// 가상 경로
    		dataType : "json", // json 타입은 문서에서 {"키 값" : "value 값", "키 값 2" : "value 값 2"}
    		success : function	(result) { // 결과가 넘어와서 성공했을 때 받는 영역
    			// alert("productReviewList 전송 성공 테스트");
    			var strTr = "";
    			
    			$(result.qlist).each(function() {
    				let starCount = "";
        		    for (let i = 0; i < this.star; i++) {
        		        starCount += "★"; // 숫자만큼 ★ 추가
        		    }
    				
    				strTr = strTr + "<ul style='border-bottom: 1px solid lightgray; padding-bottom: 15px;'>"
     				+"<li style='list-style: none; font-size: 18px; font-weight: bold;'>"+this.subject+"</li>"
     				+"<li style='list-style: none; font-size: 15px; margin-bottom: 5px;'>"+this.username+"&nbsp&nbsp|&nbsp&nbsp"+this.w_date.substring(0, 10)+"</li>"
     				+"<li style='list-style: none; font-size: 18px; margin-bottom: 10px; color: gold;'>" + starCount + "</li>" 
    				+"<li style='list-style: none; font-size: 18px; margin-bottom: 10px;'>"+this.content+"</li>"
    				+"<li style='list-style: none;'>"+"<img src='${pageContext.request.contextPath}/product//displayFile.aws?fileName="+this.img+"'style='display: inline-block; width: 200px; height: auto; margin:0 auto; padding: 10px 0px 0px 0px'>"+"</li>"
    				+"</ul>";
    			});
    			
    			$("#reviewListView").html(strTr);
    			
    			if (result.moreView == "N") {
    				$("#morebtn").css("display", "none"); // 감춘다			
    			} else {
    				$("#morebtn").css("display", "block"); // 보여준다
    			}
    			
    			$("#block").val(result.nextBlock);
    		},
    		error : function () { // 결과가 넘어와서 실패했을 때 받는 영역
    			alert("productReviewList 전송 실패");
    		}
    	});
    }
    
    $(document).ready(function() {
    	
    	$.productReviewList();
    	
    	$("#moreBtn").click(function() {
    		$.productReviewList();
    	});
    });
</script>

<body>

	<!-- header -->
	<jsp:include page="/WEB-INF/header/header.jsp" />
	
	<!-- 상품 정보 -->
	<ul class="product-content-main">
		<div style="padding-right: 120px;">
		<li>
			<div class="product-img">
				<img src="${pageContext.request.contextPath}/product//displayFile.aws?fileName=${pv.product_img1}">
			</div>
		</li>
		</div>
		<div>
		<li>
			<div class="product-content">
				<!-- 제품 정보와 이미지를 포함하는 컨테이너 -->
				<div class="product-container">
				  <!-- 오른쪽 제품 정보를 담은 영역 -->
				  <div class="product-info">
				    <!-- 제품 제목 -->
				    <h1 class="product-title">${pv.product_name}</h1>
				
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
				      <p><span class="label">판매가&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>${pv.product_price}원</p>
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
				      
				      <ul style="display: flex; padding: 20px 0 0 0">
				      	<form name="cartfrm">
				      	<li style="width: 200px; height: 70px; padding-right: 10px;">
					      	<button style="width: 100%; height: 100%; margin: 0 auto; padding: 10px; background-color: #333;
	   									   color: white; border: none; font-size: 16px; cursor: pointer; margin-bottom: 5px;"
	   								onclick="cartSave()">
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-cart3" viewBox="0 0 16 16">
	  						<path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l.84 4.479 9.144-.459L13.89 4zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
							</svg> 
							</button>
						</li>
						</form>
				      	<li style="width: 400px; height: 70px;">
				      	<button style="width: 100%; height: 100%; margin: 0 auto; padding: 10px; background-color: #333;
				      				   color: white; border: none; font-size: 16px; cursor: pointer; margin-bottom: 5px;">바로 구매</button></li>
				      </ul>
				    </div>
				  </div>
				</div>
			</div>
		</li>
		</div>
	</ul>
	
	<!-- 여백 -->
	<div style="height: 400px;"></div>
	
	<!-- 상품 후기 -->
	<div class="review-main">
		<div style="display: flex; margin: 0 auto; border-bottom: 2px solid #14161a; padding: 16px 0; width: 70%;">
			<span style="font-size: 22px; margin-bottom: 10px; font-weight: bold; color: #1d1d1f; padding-left: 15px;">상품 후기</span>
		</div>
		<div style="display: flex; justify-content: flex-end; margin: 0 auto; border-bottom: 1px solid lightgray; padding: 16px 0; width: 70%; padding-right: 15px;">
			<!-- <select style="padding-right: 15px;">
				<option>최신순</option>
				<option>추천순</option>
			</select> -->
			<button style="width: 150px; height: 100%; padding: 10px; background-color: #333; outline: none;
				      	   color: white; border: none; font-size: 16px; cursor: pointer;"
				    onclick="location.href='<%=request.getContextPath()%>/qnrBoard/reviewWrite.aws?product_key=${pv.product_key}';">리뷰 작성</button>
		</div>
		
		<div id="reviewListView" style="margin: 0 auto; padding: 16px 0; width: 70%;"></div>
		    
    
		
		<input type="hidden" id="block" value="1">
		<div id="morebtn" style="text-align:center; line-height:50px;">
			<button type="button" id="moreBtn" style="line-height: 30px; width: 30px; height: 30px; background-color: lightgray; outline: none;
				      	   color: white; border: none; font-size: 20px;">+</button>
		</div>
		
		<!-- <div style="display: flex; justify-content: flex-end; margin: 0 auto; width: 70%; padding-right: 15px;">
			
		</div> -->
		
	</div>
		
	<!-- 여백 -->
	<div style="height: 400px;"></div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/footer/footer.jsp" />
	
</body>
</html>