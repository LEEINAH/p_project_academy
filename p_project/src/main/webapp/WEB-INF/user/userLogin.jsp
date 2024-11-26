<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Knit 로그인 페이지</title>
<link href="/resources/css/user.css" rel="stylesheet">
</head>
<body>
	
	<!-- header -->
	<jsp:include page="/WEB-INF/header/header.jsp" />
	
	<!-- 여백 -->
	<div style="height: 70px;"></div>
	
	<!-- Login 문구 -->
	<div class="login-main">
		<h2 class="login-h2">
			<span class="login-span">
				LOGIN
			</span>
		</h2>
	</div>
	
	<!-- Login 밑줄 -->
	<div class="login-underline"></div>	
	
	<!-- Login 입력창 -->
	 <div class="container">
	        <div class="login-box">
	            <form action="/main" method="post">
	                <input type="text" name="userid" placeholder="아이디"  >
	                <input type="password" name="userpwd" placeholder="비밀번호">
	            </form>
	            
	        <div class="links">
                <button type="button" onclick="location.href='http://localhost/index.jsp';">로그인</button>
                <button type="button" onclick="location.href='<%=request.getContextPath()%>/user/userJoin.aws';">회원가입</button>
            </div>
	            
            </div>
     </div>

	<!-- 여백 -->
	<div style="height: 400px;"></div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/footer/footer.jsp" />
	
	
</body>
</html>