<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 상세 페이지</title>
<link href="/resources/css/qnrboard.css" rel="stylesheet">
</head>
<body>

<script> 

function deleteCheck() {
	  
	  let fm = document.deletefrm;
	
	  let ans = confirm("삭제하시겠습니까?");
	  
	  if (ans == true) {
		  fm.action="${pageContext.request.contextPath}/qnrBoard/qnaDeleteAction.aws?qnrboard_key=${qv.qnrboard_key}";
		  fm.method="post";
		  fm.submit();
	  }	  
	  
	  return;
}

</script>

	<!-- header -->
	<jsp:include page="/WEB-INF/header/header.jsp" />
	
	<!-- 상단 문구 -->
	<div class="qna-title-div">
		<h2 class="qna-title-h2">
			<span>
				Q&A
			</span>
		</h2>
	</div>
	<hr class="qnacontent-hr">
	<article class="detailContents">
		<p class="contentTitle">제목<span style="margin-left: 150px; font-size:18px; font-weight: 400; color: #424242;">${qv.subject}</span></p>
		<p class="write">작성자<span style="margin-left: 133px; font-size:18px; font-weight: 400; color: #424242;">${qv.username}</span></p>
		<hr class="qnacontent-hr">
		<div class="detailcontent-main">
			<div class="content">
				<span style="color: #424242;">${qv.content}</span>
			</div>
			<div class="w_date">
				<div>작성일<span style="margin-left: 10px; font-size:15px; font-weight: 400; color: #424242;">${qv.w_date.substring(0,10)}</span></div>
			</div>
		</div>
		<c:if test="${!empty qv.img}">
			<img style="width: 400px; height: 300px;" src="${pageContext.request.contextPath}/qnrBoard//displayFile.aws?fileName=${qv.img}">
		</c:if>	

	</article>
	<hr class="qnacontent-hr">
	<div class="qna-btnBox-main">	
	    <div class="qna-btnBox1">
	        <a class="btn aBtn" href="${pageContext.request.contextPath}/qnrBoard/qnaList.aws">목록</a>
	    </div>
	    <div class="qna-btnBox2">
	        <a class="btn aBtn" href="${pageContext.request.contextPath}/qnrBoard/qnaModify.aws?qnrboard_key=${qv.qnrboard_key}">수정</a>
	        <form name="deletefrm">
	        	<button type="button" class="btn aBtn" onclick="deleteCheck();">삭제</button>
	        </form>
	        <a class="btn aBtn" href="${pageContext.request.contextPath}/qnrBoard/qnaReply.aws?qnrboard_key=${qv.qnrboard_key}">답변</a>
	    </div>
	</div>
	
	<!-- 여백 -->
	<div style="height: 400px;"></div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/footer/footer.jsp" />
	
</body>
</html>