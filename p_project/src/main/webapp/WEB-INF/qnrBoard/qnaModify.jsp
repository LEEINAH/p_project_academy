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
<title>QnA 수정 페이지</title>
<link href="/resources/css/qnrboard.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script> 
<!-- jquery CDN 주소 -->
</head>
<body>

<script>

function modifycheck() {
	  
	  // 유효성 검사하기
	  let fm = document.modifyfrm; // 문서 객체 안에 폼 객체
	  
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
		  fm.action = "${pageContext.request.contextPath}/qnrBoard/qnaModifyAction.aws";
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
				문의글 수정
			</span>
		</h2>	
	</div>

	<!-- 리뷰 작성란 -->
	<form name="modifyfrm">
		<input type="hidden" name="qnrboard_key" value="${qv.qnrboard_key}">
		<input type="hidden" name="user_key" value="${qv.user_key}">
		<div class="review-write-main">
			<div class="review-write-div">
				<p>문의 작성란</p>
				<input type="text" id="subject" name="subject" style="height: 50px;" value="${qv.subject}">
				<textarea style="height: 500px;" id="content" name="content">${qv.content}</textarea>
			</div>
			
			<div class="review-picture-div">
				<p>사진 첨부</p>
			</div>
			<input type="file" name="attachfile" style="height: 50px;">
			
			<div class="qna-save-div">
				<button onclick="modifycheck();">저장하기</button>
				<a class="btn aBtn" href="${pageContext.request.contextPath}/qnrBoard/qnaContents.aws?qnrboard_key=${qv.qnrboard_key}" onclick="history.back();">취소</a>
			</div>
		</div>
	</form>
	
	<!-- 여백 -->
	<div style="height: 400px;"></div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/footer/footer.jsp" />
	

</body>
</html>