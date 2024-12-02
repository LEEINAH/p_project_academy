<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String msg = "";
if (request.getAttribute("msg") != null) {
	msg = (String)request.getAttribute("msg");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Knit 로그인 페이지</title>
<link href="/resources/css/user.css" rel="stylesheet">
</head>

<script>
<%
if (msg != "") {
	out.println("alert('"+msg+"')");
}
%>
// 아이디 비밀번호 유효성 검사
function check() {
	// 이름으로 객체 찾기
	let userid = document.getElementsByName("userid");
	let userpwd = document.getElementsByName("userpwd");
	// alert(memberid[0].value);
	// alert(memberpwd[0].value);
	
	if (userid[0].value == "") {
		alert("아이디를 입력해주세요.");
		userid[0].focus();
		return;
	} else if (userpwd[0].value == "") {
		alert("비밀번호를 입력해주세요.");
		userpwd[0].focus();
		return;
	}
	
	var fm = document.frm;
	fm.action = "<%=request.getContextPath()%>/user/userLoginAction.aws"; 
	// 가상 경로 지정 action은 처리하는 의미
	fm.method = "post";
	fm.submit();
	
	return;
}

</script>

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
	
	<form name="frm">
	<!-- Login 입력창 -->
	 <div class="container">
	        <div class="login-box">
	            <form action="/main" method="post">
	                <input type="text" name="userid" placeholder="아이디"  >
	                <input type="password" name="userpwd" placeholder="비밀번호">
	            </form>
	            
	        <div class="links">
                <button type="button" name="btn" value="로그인" onclick="check();">로그인</button>
                <button type="button" onclick="location.href='<%=request.getContextPath()%>/user/userJoin.aws';">회원가입</button>
            </div>
	            
            </div>
     </div>
    </form>

	<!-- 여백 -->
	<div style="height: 400px;"></div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/footer/footer.jsp" />
	
	
</body>
</html>