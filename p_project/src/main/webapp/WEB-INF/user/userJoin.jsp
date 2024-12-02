<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Knit 회원가입 페이지</title>
<link href="/resources/css/user.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script> 
<!-- jquery CDN 주소 -->
</head>

<script>

const email = /[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]$/i;

//버튼을 눌렀을 때 check 함수 작동
function check() {
	
	// alert("check 들어옴");
	
	// 유효성 검사하기	
	var fm = document.frm;
	
	if (fm.userid.value == "") {
		alert("아이디를 입력해주세요.");
		fm.userid.focus();
		return;
	} else if (fm.useremail.value == "") {
		alert("이메일을 입력해주세요.");
		fm.useremail.focus();
		return;
	} else if (email.test(fm.useremail.value) == false) {
		alert("이메일 형식이 올바르지 않습니다.");
		fm.useremail.value = "";
		fm.useremail.focus();
		return;
	} else if (fm.userpwd.value == "") {
		alert("비밀번호를 입력해주세요.");
		fm.userpwd.focus();
		return;
	} else if (fm.confirm_pwd.value == "") {
		alert("비밀번호 확인을 입력해주세요.");
		fm.confirm_pwd.focus();
		return;
	} else if (fm.userpwd.value != fm.confirm_pwd.value) {
		alert("비밀번호가 일치하지 않습니다.");
		fm.confirm_pwd.value = "";
		fm.confirm_pwd.focus();
		return;
	} else if (fm.username.value == "") {
		alert("이름을 입력해주세요.");
		fm.username.focus();
		return;
	} else if (fm.userphone.value == "") {
		alert("연락처를 입력해주세요.");
		fm.userphone.focus();
		return;
	} /* else if (fm.btn.value == "N") {
		alert("아이디 중복 체크를 해주세요.");
		fm.memberid.focus();
		return;
	}  */
	
	var ans = confirm("저장하시겠습니까?");
	
	// html 홈태그 기능을 자바스크립트로 제어 
	if (ans == true) {
		
		// 가상 경로를 사용해서 쓸 예정
		// 가짜 경로 형식 : /기능/세부기능.aws
		fm.action = "<%=request.getContextPath()%>/user/userJoinAction.aws";
		fm.method = "post";
		fm.submit();	
	}	
	return; // 리턴에 값을 안 쓰면 그냥 종료
}
</script>

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
	<form class="signup-form" name="frm">
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
	            <input type="password" id="userpwd" name="userpwd" placeholder="비밀번호를 입력하세요">
		</div>
		<div class="join-div">
	            <label for="confirm-password">비밀번호 확인</label>
	            <input type="password" id="confirm_pwd" name="confirm_pwd" placeholder="비밀번호를 다시 입력하세요">
		</div>
		<div class="join-div">
	            <label for="name">이름</label>
	            <input type="text" id="username" name="username" placeholder="이름을 입력하세요">
		</div>
		<div class="join-div">
	            <label for="phone">휴대전화</label>
	            <input type="tel" id="userphone" name="userphone" placeholder="휴대전화 번호를 입력하세요">
		</div>
        <button type="button" onclick="check();">회원가입</button>
    </form>
    
    <!-- 여백 -->
	<div style="height: 400px;"></div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/footer/footer.jsp" />
	
</body>
</html>