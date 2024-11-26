<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Knit 회원가입 페이지</title>
<link href="/resources/css/user.css" rel="stylesheet">
</head>
<body>
	
	<!-- header -->
	<jsp:include page="/WEB-INF/header/header.jsp" />
	
	<!-- 여백 -->
	<div style="height: 70px;"></div>
	
	<!-- Login 문구 -->
	<div class="login-main">
		<h2 class="join-h2">
			<span class="join-span">
				회원 가입
			</span>
		</h2>
	</div>
	
	<!-- Login 밑줄 -->
	<div class="join-underline"></div>	
	
	<!-- 회원 가입 입력창 -->
	<form class="signup-form">
		<div class="join-div">
	            <label for="username">아이디</label>
	            <input type="text" id="userid" name="userid" placeholder="아이디를 입력하세요">
		</div>
		<div class="join-div">
	            <label for="email">이메일</label>
	            <input type="email" id="useremail" name="useremail" placeholder="이메일을 입력하세요">
	    </div>
		<div class="join-div">
	            <label for="password">비밀번호</label>
	            <input type="password" id="userpassword" name="userpassword" placeholder="비밀번호를 입력하세요">
		</div>
		<div class="join-div">
	            <label for="confirm-password">비밀번호 확인</label>
	            <input type="password" id="confirm-password" name="confirm-password" placeholder="비밀번호를 다시 입력하세요">
		</div>
		<div class="join-div">
	            <label for="name">이름</label>
	            <input type="text" id="username" name="username" placeholder="이름을 입력하세요">
		</div>
		<div class="join-div">
	            <label for="phone">휴대전화</label>
	            <input type="tel" id="userphone" name="userphone" placeholder="휴대전화 번호를 입력하세요">
		</div>
        <button type="button" onclick="location.href='http://localhost/index.jsp';">회원가입</button>
    </form>
    
    <!-- 여백 -->
	<div style="height: 400px;"></div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/footer/footer.jsp" />
	
</body>
</html>