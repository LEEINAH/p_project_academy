<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.myaws.myapp.domain.*" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성 페이지</title>
<link href="/resources/css/qnrboard.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script> 
<!-- jquery CDN 주소 -->
</head>
<body>

<script>
function reviewcheck() {
	  
	  // 유효성 검사하기
	  let fm = document.reviewfrm; // 문서 객체 안에 폼 객체
	  
	  if (fm.subject.value == "") {
		  alert("제목을 입력해주세요");
		  fm.subject.focus();
		  return;
	  } else if (fm.content.value == "") {
		  alert("내용을 입력해주세요");
		  fm.content.focus();
		  return;
	  }
	  
	  let ans = confirm("저장하시겠습니까?"); // 함수의 값을 참과 거짓 true false로 나눈다
	  
	  if (ans == true) {
		  fm.action = "${pageContext.request.contextPath}/qnrBoard/reviewWriteAction.aws?product_key=${product_key}";
		  fm.method="post";
		  fm.enctype="multipart/form-data";
		  fm.submit();
	  }	  
	  
	  return;
}
</script>
	
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
	<form name="reviewfrm">
		<div class="review-write-main">
			<div class="review-star-div">
				<p>만족도</p>
			</div>
			
				<select style="width: 150px; margin-bottom: 30px;" name="star">
					<option value="5">
						★★★★★
					</option>
					<option value="4">
						★★★★☆			
					</option>
					<option value="3">
						★★★☆☆
					</option>
					<option value="2">
						★★☆☆☆
					</option>
					<option value="1">
						★☆☆☆☆
					</option>
				</select>
			
			
			<div class="review-write-div">
				<p>리뷰 작성란</p>
				<input type="text" name="subject" style="height: 50px;" placeholder="리뷰 제목을 입력하세요">
				<textarea name="content" placeholder="리뷰 내용을 입력하세요"></textarea>
			</div>
			
			<div class="review-picture-div">
				<p>사진 첨부</p>
			</div>
			<input type="file" name="attachfile" style="height: 50px;">
			
			<div class="review-save-div">
				<button type="button" class="btn" onclick="reviewcheck();">저장하기</button>
			</div>
		</div>	
	</form>
	
	<!-- 여백 -->
	<div style="height: 400px;"></div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/footer/footer.jsp" />
	
</body>
</html>