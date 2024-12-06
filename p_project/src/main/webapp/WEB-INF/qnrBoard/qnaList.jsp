<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>Q&A List</title>
<link href="/resources/css/qnrboard.css" rel="stylesheet">
</head>
<body>

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
	
	<!-- 문의 List -->
	<div class="qna-list-div">
		<table>
			<tr>
				<th class="num">No</th>
				<th class="title">제목</th>
				<th class="writer">작성자</th>
				<th class="w-data">작성일</th>
			</tr>
			
			<c:forEach items="${qlist}" var="qv" varStatus="status">
			<tr>
				<td class="num-td">${pm.totalCount-(status.index+(pm.scri.page-1)*pm.scri.perPageNum)}</td>
				<td class="title-td">
				<c:forEach var="i" begin="1" end="${qv.level_}" step="1">
					&nbsp;&nbsp;
				<c:if test="${i==qv.level_}">
					ㄴ <a href="${pageContext.request.contextPath}/qnrBoard/qnaContent.aws?qnrboard_key=${qv.qnrboard_key}" 
				   		  style="font-size: 17px; color: #424242;">답변입니다.</a>
				</c:if>
				</c:forEach>
				<c:if test="${0==qv.level_}">
					<a href="${pageContext.request.contextPath}/qnrBoard/qnaContent.aws?qnrboard_key=${qv.qnrboard_key}" 
					   style="font-size: 17px; color: #424242;">${qv.subject}</a>
				</c:if>
				</td>
				<td class="writer-td">${qv.username}</td>
				<td class="w-data-td">${qv.w_date.substring(0, 10)}</td>
			</tr>
			</c:forEach>
		</table>
	</div>
	
	<div style="display: flex; justify-content: flex-end; margin: 0 auto; padding: 30px; width: 1200px; padding-right: 0;">
			<button style="width: 100px; height: 100%; padding: 10px; background-color: #333; outline: none;
				      	   color: white; border: none; font-size: 16px; cursor: pointer; margin-bottom: 5px;"
				    onclick="location.href='<%=request.getContextPath()%>/qnrBoard/qnaWrite.aws';">문의 작성</button>
	</div>
	
	<c:set var="queryParam" value="keyword=${pm.scri.keyword}&searchType=${pm.scri.searchType}"></c:set>
	<div class="page">
		<ul>
			<c:if test="${pm.prev==true}">
				<li>
				<a href="${pageContext.request.contextPath}/qnrBoard/qnaList.aws?page=${pm.startPage-1}&${queryParam}">◁</a>
				</li>
			</c:if>
			
			<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
				<li <c:if test="${i == pm.scri.page}">class='on'</c:if> >
				<a href="${pageContext.request.contextPath}/qnrBoard/qnaList.aws?page=${i}&${queryParam}">${i}</a>
				</li>
			</c:forEach>
			
			<c:if test="${pm.next&&pm.endPage>0}">
				<li><a href="${pageContext.request.contextPath}/qnrBoard/qnaList.aws?page=${pm.endPage+1}&${queryParam}">▷</a></li>
			</c:if>
		</ul>
	</div>
	
	<!-- 여백 -->
	<div style="height: 400px;"></div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/footer/footer.jsp" />
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>