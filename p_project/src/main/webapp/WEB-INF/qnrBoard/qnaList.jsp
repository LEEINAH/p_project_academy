<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			
			<tr>
				<td class="num-td">1</td>
				<td class="title-td">문의사항 있습니다:)</td>
				<td class="writer-td">김아무개</td>
				<td class="w-data-td">2024-11-18</td>
			</tr>
			<tr>
				<td class="num-td">2</td>
				<td class="title-td">문의사항 있습니다:)</td>
				<td class="writer-td">김아무개</td>
				<td class="w-data-td">2024-11-18</td>
			</tr>
			<tr>
				<td class="num-td">3</td>
				<td class="title-td">문의사항 있습니다:)</td>
				<td class="writer-td">김아무개</td>
				<td class="w-data-td">2024-11-18</td>
			</tr>
			<tr>
				<td class="num-td">4</td>
				<td class="title-td">문의사항 있습니다:)</td>
				<td class="writer-td">김아무개</td>
				<td class="w-data-td">2024-11-18</td>
			</tr>
			<tr>
				<td class="num-td">5</td>
				<td class="title-td">문의사항 있습니다:)</td>
				<td class="writer-td">김아무개</td>
				<td class="w-data-td">2024-11-18</td>
			</tr>
			<tr>
				<td class="num-td">6</td>
				<td class="title-td">문의사항 있습니다:)</td>
				<td class="writer-td">김아무개</td>
				<td class="w-data-td">2024-11-18</td>
			</tr>
			<tr>
				<td class="num-td">7</td>
				<td class="title-td">문의사항 있습니다:)</td>
				<td class="writer-td">김아무개</td>
				<td class="w-data-td">2024-11-18</td>
			</tr>
			<tr>
				<td class="num-td">8</td>
				<td class="title-td">문의사항 있습니다:)</td>
				<td class="writer-td">김아무개</td>
				<td class="w-data-td">2024-11-18</td>
			</tr>
			<tr>
				<td class="num-td">9</td>
				<td class="title-td">문의사항 있습니다:)</td>
				<td class="writer-td">김아무개</td>
				<td class="w-data-td">2024-11-18</td>
			</tr>
			<tr>
				<td class="num-td">10</td>
				<td class="title-td">문의사항 있습니다:)</td>
				<td class="writer-td">김아무개</td>
				<td class="w-data-td">2024-11-18</td>
			</tr>
		</table>
	</div>
	
	<div style="display: flex; justify-content: flex-end; margin: 0 auto; padding: 30px; width: 1200px; padding-right: 0;">
			<button style="width: 100px; height: 100%; padding: 10px; background-color: #333; outline: none;
				      	   color: white; border: none; font-size: 16px; cursor: pointer; margin-bottom: 5px;"
				    onclick="location.href='<%=request.getContextPath()%>/qnrBoard/qnaWrite.aws';">문의 작성</button>
	</div>
	
	<!-- 여백 -->
	<div style="height: 400px;"></div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/footer/footer.jsp" />
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>