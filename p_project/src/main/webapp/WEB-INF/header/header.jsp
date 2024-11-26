<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Knit</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/mainpage.css" rel="stylesheet">
<title>header</title>
</head>
<body>

	<!-- 네비게이션 바 (mainpage 상단) -->
	<nav class="nav">
		<div style="width: 10%;"></div>
		<a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/user/userLogin.aws">로그인</a>
		<a class="nav-link" href="#">장바구니</a>
		<a class="nav-link" href="#">마이페이지</a>
		<a class="nav-link" href="#">Q&A</a>

	</nav>

	<!-- 상단 로고 -->
	<div class="text-center ">
		<a href="#" style="width: 170px; color: white;">
			<img src="/resources/logo/KnitLogo.jpg" class="rounded" alt="Knit Logo" style="display: inline-block; width: 200px; height: auto; margin:0 auto; padding: 10px 0px 0px 0px">
		</a>
		<div class="btn-group" role="group" aria-label="Basic outlined example">
		  <button type="button" class="btn btn-platform" >스토어</button>
		  <button type="button" class="btn btn-platform" onclick="location.href='<%=request.getContextPath()%>/community/communitymain.aws';">커뮤니티</button>
		</div>
		
		<form class="d-flex" role="search">
	    <input class="form-control-me-2" type="search" placeholder="Search" aria-label="Search">
		    <button class="btn searchbtn" type="submit">
		    	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
					<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
			  	</svg>
	        </button>
    	</form>
	</div>
	

	
	<!-- 메뉴 선택 -->
	<div class="menu-select">
		<ul class="menu-ul">
			<li class="menu-li"><a href="<%=request.getContextPath()%>/product/productList.aws" class="menu-a">뜨개실</a></li>
			<li class="menu-li"><a href="#" class="menu-a">단추/라벨/부자재</a></li>
			<li class="menu-li"><a href="#" class="menu-a">바늘/도구</a></li>
		</ul>
	</div>

</body>
</html>