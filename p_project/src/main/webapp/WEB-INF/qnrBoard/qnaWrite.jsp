<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 작성 페이지</title>
<link href="/resources/css/qnrboard.css" rel="stylesheet">
</head>
<body>

	<!-- header -->
	<jsp:include page="/WEB-INF/header/header.jsp" />
	
	<!-- 상단 문구 -->
	<div class="write-title-div">
		<h2 class="write-title-h2">
			<span>
				문의 작성
			</span>
		</h2>	
	</div>

	<!-- 리뷰 작성란 -->
	<div class="review-write-main">
		<div class="review-write-div">
			<input type="text" id="r-subject" name="r-subject" style="height: 50px;" placeholder="제목을 입력하세요">
			<textarea style="height: 500px;" id="r-content" name="r-content" placeholder="문의 내용을 입력하세요"></textarea>
		</div>
		
		<div class="qna-save-div">
			<button onclick="location.href='http://localhost/index.jsp';">저장하기</button>
		</div>
	</div>
	
	<!-- 여백 -->
	<div style="height: 400px;"></div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/footer/footer.jsp" />
	

</body>
</html>