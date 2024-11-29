<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성 페이지</title>
<link href="/resources/css/qnrboard.css" rel="stylesheet">
</head>
<body>
	
	<!-- header -->
	<jsp:include page="/WEB-INF/header/header.jsp" />
	
	<!-- 상단 문구 -->
	<div class="write-title-div">
		<h2 class="write-title-h2">
			<span>
				리뷰 작성
			</span>
		</h2>	
	</div>
	
	<!-- 리뷰 작성란 -->
	<div class="review-write-main">
		<div class="review-star-div">
			<p>만족도</p>
		</div>
		
			<select style="width: 150px; margin-bottom: 30px;">
				<option>
					★★★★★
				</option>
				<option>
					★★★★☆			
				</option>
				<option>
					★★★☆☆
				</option>
				<option>
					★★☆☆☆
				</option>
				<option>
					★☆☆☆☆
				</option>
			</select>
		
		
		<div class="review-write-div">
			<p>리뷰 작성란</p>
			<input type="text" id="r-subject" name="r-subject" style="height: 50px;" placeholder="리뷰 제목을 입력하세요">
			<textarea id="r-content" name="r-content" placeholder="리뷰 내용을 입력하세요"></textarea>
		</div>
		
		<div class="review-picture-div">
			<p>사진 첨부</p>
		</div>
		<input type="file" id="file" name="file" style="height: 50px;">
		
		<div class="review-save-div">
			<button onclick="location.href='http://localhost/index.jsp';">저장하기</button>
		</div>
	</div>	
	
	<!-- 여백 -->
	<div style="height: 400px;"></div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/footer/footer.jsp" />
	
</body>
</html>