<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
</head>
<body>
	<div class="footer">
		<img src="<%=request.getContextPath() %>/resources/logo/KnitLogo2.jpg" alt="Knit Logo" class="footer-logo">
		<div class="footer-comment">
			<span style="color: white;">
				@Knit 웹사이트. 모든 권리 보유.
			</span>
		</div>
	</div>
	

</body>
</html>

<style>

.footer {
	background-color: #E5D9F2; 
	text-align: left; 
	padding: 10px; 
	bottom: 0; 
	width: 100%;
}

.footer-logo {
	display: inline-block; 
	width: 200px; 
	height: auto; 
	margin-top: 20px;
}

.footer-comment {
	text-align: right;
}
</style>