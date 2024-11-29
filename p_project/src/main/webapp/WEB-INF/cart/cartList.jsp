<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 목록 페이지</title>
<link href="/resources/css/cart.css" rel="stylesheet">
</head>

<script>

// 수량 조절 함수
function changeQuantity(change) {
    const input = document.querySelector(".quantity-input");
    let currentValue = parseInt(input.value, 10);
    const newValue = currentValue + change;

    // 수량이 1 미만으로 내려가지 않게 제한
    if (newValue >= 1) {
        input.value = newValue;
    }
}

</script>

<body>

	<!-- header -->
	<jsp:include page="/WEB-INF/header/header.jsp" />
	
	<!-- 상단 문구 -->
	<div class="cart-title-div">
		<h2 class="cart-title-h2">
			<span>
				장바구니
			</span>
		</h2>
	</div>
	
	<!-- 문의 List -->
	<div class="cart-list-div">
		<table>
			<tr>
				<th class="check">
					<label class="check-container">
	                    <!-- 숨겨진 체크박스 -->
	                    <input type="checkbox">
	                    <!-- 빈 체크 아이콘 -->
	                    <svg style="color: #585858" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="unchecked bi bi-check-circle" viewBox="0 0 16 16">
	                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16" />
	                        <path d="m10.97 4.97-.02.022-3.473 4.425-2.093-2.094a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05" />
	                    </svg>
	                    <!-- 채워진 체크 아이콘 -->
	                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="checked bi bi-check-circle-fill" viewBox="0 0 16 16">
	                        <path style="color:#2E9AFE;" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0m-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
	                    </svg>
	                </label>
				</th>
				<th class="img">이미지</th>
				<th class="product-ifm">상품정보</th>
				<th class="product-cnt">수량</th>
				<th class="price">구매금액</th>
				<th class="d-price">배송비</th>
				<th class="delete">삭제</th>
			</tr>
			
			<tr>
				<td class="check">
					<label class="check-container">
	                    <!-- 숨겨진 체크박스 -->
	                    <input type="checkbox">
	                    <!-- 빈 체크 아이콘 -->
	                    <svg style="color:lightgray;" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="unchecked bi bi-check-circle" viewBox="0 0 16 16">
	                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16" />
	                        <path d="m10.97 4.97-.02.022-3.473 4.425-2.093-2.094a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05" />
	                    </svg>
	                    <!-- 채워진 체크 아이콘 -->
	                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="checked bi bi-check-circle-fill" viewBox="0 0 16 16">
	                        <path style="color:#2E9AFE;" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0m-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
	                    </svg>
	                </label>
				</td>
				<td class="img">
					<img src="/resources/img/cart_sample1.PNG" alt="상품 이미지" onclick="handleImageClick()">
				</td>
				<td class="product-ifm-td">
					<jsp:include page="/WEB-INF/cart/optionModal.jsp" />
				</td>
				<td class="product-cnt">
					<div class="quantity-box">
					    <button class="btn-decrease" onclick="changeQuantity(-1)">-</button>
					    <input type="text" class="quantity-input" value="1" readonly>
					    <button class="btn-increase" onclick="changeQuantity(1)">+</button>
					</div>
				</td>
				<td class="price">7,000원</td>
				<td class="d-price">3,000원</td>
				<td class="delete">
					<svg style="color:lightgray;" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16">
  					<path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"/>
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"/>
					</svg>
				</td>
			</tr>
			
			<tr>
				<td class="check">
					<label class="check-container">
	                    <!-- 숨겨진 체크박스 -->
	                    <input type="checkbox">
	                    <!-- 빈 체크 아이콘 -->
	                    <svg style="color:lightgray;" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="unchecked bi bi-check-circle" viewBox="0 0 16 16">
	                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16" />
	                        <path d="m10.97 4.97-.02.022-3.473 4.425-2.093-2.094a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05" />
	                    </svg>
	                    <!-- 채워진 체크 아이콘 -->
	                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="checked bi bi-check-circle-fill" viewBox="0 0 16 16">
	                        <path style="color:#2E9AFE;" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0m-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
	                    </svg>
	                </label>
				</td>
				<td class="img">
					<img src="/resources/img/cart_sample1.PNG" alt="상품 이미지" onclick="handleImageClick()">
				</td>
				<td class="product-ifm-td">
					<jsp:include page="/WEB-INF/cart/optionModal.jsp" />
				</td>
				<td class="product-cnt">
					<div class="quantity-box">
					    <button class="btn-decrease" onclick="changeQuantity(-1)">-</button>
					    <input type="text" class="quantity-input" value="1" readonly>
					    <button class="btn-increase" onclick="changeQuantity(1)">+</button>
					</div>
				</td>
				<td class="price">7,000원</td>
				<td class="d-price">3,000원</td>
				<td class="delete">
					<svg style="color:lightgray;" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16">
  					<path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"/>
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"/>
					</svg>
				</td>
			</tr>
			
			<tr>
				<td class="check">
					<label class="check-container">
	                    <!-- 숨겨진 체크박스 -->
	                    <input type="checkbox">
	                    <!-- 빈 체크 아이콘 -->
	                    <svg style="color:lightgray;" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="unchecked bi bi-check-circle" viewBox="0 0 16 16">
	                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16" />
	                        <path d="m10.97 4.97-.02.022-3.473 4.425-2.093-2.094a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05" />
	                    </svg>
	                    <!-- 채워진 체크 아이콘 -->
	                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="checked bi bi-check-circle-fill" viewBox="0 0 16 16">
	                        <path style="color:#2E9AFE;" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0m-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
	                    </svg>
	                </label>
				</td>
				<td class="img">
					<img src="/resources/img/cart_sample1.PNG" alt="상품 이미지" onclick="handleImageClick()">
				</td>
				<td class="product-ifm-td">
					<jsp:include page="/WEB-INF/cart/optionModal.jsp" />
				</td>
				<td class="product-cnt">
					<div class="quantity-box">
					    <button class="btn-decrease" onclick="changeQuantity(-1)">-</button>
					    <input type="text" class="quantity-input" value="1" readonly>
					    <button class="btn-increase" onclick="changeQuantity(1)">+</button>
					</div>
				</td>
				<td class="price">7,000원</td>
				<td class="d-price">3,000원</td>
				<td class="delete">
					<svg style="color:lightgray;" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16">
  					<path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"/>
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"/>
					</svg>
				</td>
			</tr>
			
			<tr>
				<td class="check">
					<label class="check-container">
	                    <!-- 숨겨진 체크박스 -->
	                    <input type="checkbox">
	                    <!-- 빈 체크 아이콘 -->
	                    <svg style="color:lightgray;" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="unchecked bi bi-check-circle" viewBox="0 0 16 16">
	                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16" />
	                        <path d="m10.97 4.97-.02.022-3.473 4.425-2.093-2.094a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05" />
	                    </svg>
	                    <!-- 채워진 체크 아이콘 -->
	                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="checked bi bi-check-circle-fill" viewBox="0 0 16 16">
	                        <path style="color:#2E9AFE;" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0m-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
	                    </svg>
	                </label>
				</td>
				<td class="img">
					<img src="/resources/img/cart_sample1.PNG" alt="상품 이미지" onclick="handleImageClick()">
				</td>
				<td class="product-ifm-td">
					<jsp:include page="/WEB-INF/cart/optionModal.jsp" />
				</td>
				<td class="product-cnt">
					<div class="quantity-box">
					    <button class="btn-decrease" onclick="changeQuantity(-1)">-</button>
					    <input type="text" class="quantity-input" value="1" readonly>
					    <button class="btn-increase" onclick="changeQuantity(1)">+</button>
					</div>
				</td>
				<td class="price">7,000원</td>
				<td class="d-price">3,000원</td>
				<td class="delete">
					<svg style="color:lightgray;" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16">
  					<path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"/>
  					<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"/>
					</svg>
				</td>
			</tr>
			
		</table>
	</div>

	<div class="cart-price-div">
		<table>
			<tr>
				<th>총 상품 금액</th>
				<th>배송비</th>
				<th class="total-price">결제 예정 금액</th>
			</tr>
			
			<tr>
				<td>
					<div style="font-weight: 600; font-size: 17px; padding-left: 25px;"> 
				      <a style="font-weight: bold; font-size: 25px;">9,000</a>
				      원
				    </div>
				</td>
				<td>
					<div style="font-weight: 600; font-size: 17px;"> 
					  +
				      <a style="font-weight: bold; font-size: 25px;">3,000</a>
				      원
				    </div>
				</td>
				<td class="total-price">
					<div style="font-weight: 600; font-size: 17px; padding-left: 25px;"> 
					  =
				      <a style="font-weight: bold; font-size: 25px;">12,000</a>
				      원
				    </div>
				</td>
			</tr>
		</table>
	</div>

	<div style="display: flex; justify-content: center; padding-top: 0;">
		<div class="button-group">
			<button class="btn btn-all">전체상품주문</button>
			<button class="btn btn-selected" onclick="location.href='<%=request.getContextPath()%>/order_/order_.aws';">선택상품주문</button>
		</div>
	</div>		
	
	<!-- 여백 -->
	<div style="height: 400px;"></div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/footer/footer.jsp" />
	
	
</body>
</html>