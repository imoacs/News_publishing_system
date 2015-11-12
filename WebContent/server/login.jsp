<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
	<meta charset="UTF-8" />
	<title>登陆</title>
	<link rel="stylesheet" href="stylesheets/login.css" />
</head>
<body>
<%

String warning = null;
warning = request.getParameter("warning");
if(warning.equals("user")){
%>
	<script>alert("用户名不存在，请重新登录!");</script>
<%
}
else if(warning.equals("pass")){
%>
	<script>alert("密码错误，请重新登录!");</script>
<%
}
%>	
	<div class="container">
		<form class="login" action="index.jsp" method="post">
			<h1>后台管理系统</h1>
			<div class="input-container">
				<label class="hidden" for="username">username</label>
				<input placeholder="用户名" id="username" name="username" type="text" required>
			</div>
			<div class="input-container">
				<label class="hidden" for="password">password</label>
				<input placeholder="密码" id="password" name="password" type="password" required>
			</div>
			<div class="input-container">
				<button type="submit">登录</button>
			</div>
		</form>
	</div>
</body>
</html>